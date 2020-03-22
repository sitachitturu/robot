*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  RequestsLibrary
Library  Process
Library  Collections
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Library   ../../Utilities/utility.py
Library  ../../Suits/excel_library.py
Library  robot.utils.asserts
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Library/filter_library.robot

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  50s
       wait until page contains  addFilterBtn  10s

click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
          wait until element is not visible  ${Page Spinner}  20s
          wait until element is visible  addFilterBtn  10s
          click button  addFilterBtn
          run keyword and ignore error  click element  ${plant Business filter}
          click button  continue
          sleep  2s

select business "${business}" from business filter
           wait until element is visible  business  10s
           click element  business
           wait until element is visible  product-${business}  20s
           click element  product-${business}
           wait until element is visible  ${plant_business_apply_button}  20s
           click element  ${plant_business_apply_button}
           sleep  14s

select Action Required from exception requires action filter
            wait until element is visible  exp_action  10s
            click element  exp_action
            sleep  2s
            click element  product-Action Required
            click element  ${Exception Requires Action filter_apply_button}
            sleep  3s

project api for ${business}

                 #### below code will do api to get grid count from ui for projects
            ${token}  run  ${api_token}
            log  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${resp}  Get Request  MySession  /secure/api/v1/getOrderDataProjects?offset=0&limit=100&business=%5B%22${business}%22%5D  headers=${headers}
            log  ${resp}
            log  Response------ ${resp.text}
            ${response..}  convert to string  ${resp.text}
            ${response}  Evaluate  ${response..}.replace('null"', '')
            ${response.}  Evaluate  ${response}.replace('\\"', '')
            ${json}  evaluate  json.loads(unicode(${response.}))  json
            #${json}=  evaluate  json.loads('''${response}''')  json
            log  ${json}
            log  ${json["count"]}
            ${grid_count_project}  set variable  ${json["count"]}
            set global variable  ${grid_count_project}

Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "${business}" for scheduling for api ${business..}
               click element  business
               click element  ${plant_business_show/selected}
               ${filter_business_record_count}  get text  ${count_business_filter_recods}
               log  ${filter_business_record_count}
               ${menu_amount}  replace string  ${filter_business_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_business_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_business_record_count1..}  convert to string  ${filter_business_record_count..}
               log to console   Total count of record from filter "${business}": [${filter_business_record_count1..}]
               log  ${filter_business_record_count1..}
               click element  business

           #####below code will get excel record count form export to excel option
               run keyword  Remove old excel file  ProductionOrders.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               sleep  150s
               run keyword  open excel file for product grid  ProductionOrders.xlsx
               run keyword  Remove old excel file  ProductionOrders.xlsx
               click element  ${projects}
               sleep  3s
               run keyword  Remove old excel file  ProjectActivity.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               run keyword  open excel file for project grid  ProjectActivity.xlsx
               ${total row count from excel}  evaluate  ${total_no.ofrows_excel for projects}+${total_no.ofrows_excel for products}
               log  ${total row count from excel}
               log to console  Total row count from excel for business "power":[${total row count from excel}]

           ###below code will do api to get grid count from ui for products
               ${token}  run  ${api_token}
                log  ${token}
                ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                ${AccessToken}  catenate  Bearer   ${AccessToken}
                log  Got Access Token: ${AccessToken}
                Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                ${headers}  Create Dictionary  Authorization=${AccessToken}
                ${resp}  Get Request  MySession  /secure/api/v1/getOrderDataProducts?offset=100&limit=100&business=%5B%22${business..}%22%5D  headers=${headers}
                log  ${resp}
                log  Response------ ${resp.text}
                ${json}=  evaluate  json.loads('''${resp.text}''')  json
                log  ${json}
                log  ${json["count"]}
                ${grid_count_product}  set variable  ${json["count"]}
                run keyword  project api
                ${total count of records from grid}  evaluate  ${grid_count_project}+${grid_count_product}
                log to console  Total count of record from grid "${business}": [${grid_count_product}]

select exception "${exception}" from final exception message
                wait until element is visible  exp  20s
                click element  exp
                wait until element is visible  product-${exception}  10s
                click element  product-${exception}
                click element  ${final_exception_filter_applybutton}
                sleep  16s

open excel file for product grid
         [Arguments]   ${excel_file_name}
         ${status}=  run keyword and return status  log  %{HOME}
         ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
         log  ${path}
         ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
         [Return]  ${excel_file}
         ${total_no.ofrows_excel for products}  evaluate  ${excel_file}-1
         log  ${total_no.ofrows_excel for products}
         set global variable  ${total_no.ofrows_excel for products}

open excel file for project grid
         [Arguments]   ${excel_file_name}
         ${status}=  run keyword and return status  log  %{HOME}
         ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
         log  ${path}
         ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
         [Return]  ${excel_file}
         ${total_no.ofrows_excel for projects}  evaluate  ${excel_file}-1
         log  ${total_no.ofrows_excel for projects}
         set global variable  ${total_no.ofrows_excel for projects}


get "${exception}" exception count for product and projects and sum of product cancel and sum project cancel for api "${text1}""${text2}" for "${business}" for schdeling
               click element  business
               click element  ${plant_business_show/selected}
               ${filter_business_record_count}  get text  ${count_business_filter_recods}
               log  ${filter_business_record_count}
               ${menu_amount}  replace string  ${filter_business_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_business_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_business_record_count1..}  convert to string  ${filter_business_record_count..}
               log to console   Total count of record from filter business "${business}": [${filter_business_record_count1..}]
               log  ${filter_business_record_count1..}
               click element  business

               click element  exp
               click element  ${final_exception_filter_show/selected}
               sleep  2s
               ${filter_exp_record_count}  get text  ${count_exp_filter_recods}
               log  ${filter_exp_record_count}
               ${menu_amount}  replace string  ${filter_exp_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_exp_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_exp_record_count2..}  convert to string  ${filter_business_record_count..}
               log to console   Total count of record from filter final_exception_filter "${business}": [${filter_exp_record_count2..}]
               log  ${filter_exp_record_count2..}
               click element  exp


               click element  exp_action
               sleep  4s
               click element  ${exception_riquires_filter_show/selected}
               sleep  2s
               ${filter_exp_requires_record_count}  get text  ${count_exp_action_filter_recods}
               log  ${filter_exp_requires_record_count}
               ${menu_amount}  replace string  ${filter_exp_requires_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_exp_requires_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_exp_requires_record_count2..}  convert to string  ${filter_exp_requires_record_count..}
               log to console   Total count of record from filter exp_requires_action "${business}": [${filter_exp_requires_record_count2..}]
               log  ${filter_exp_requires_record_count2..}
               click element  exp_action

           #####below code will get excel record count form export to excel option
               run keyword  Remove old excel file  ProductionOrders.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               sleep  150s
               run keyword  open excel file for product grid  ProductionOrders.xlsx
               run keyword  Remove old excel file  ProductionOrders.xlsx
               click element  ${projects}
               sleep  3s
               run keyword  Remove old excel file  ProjectActivity.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               run keyword  open excel file for project grid  ProjectActivity.xlsx
               ${total row count from excel}  evaluate  ${total_no.ofrows_excel for projects}+${total_no.ofrows_excel for products}
               log  ${total row count from excel}
               set global variable  ${total row count from excel}
               log to console  Total row count from excel for business "power":[${total row count from excel}]

               ###below code will do db query to get grid count from ui for products
                connect to database  dbConfigFile=${dbfile}
                    ${Product_exception}  QUERY  select count(final_exception_message) from public.production_ords_v where final_exception_message='${exception}' and plant_business='${business}' and exception_requires_action='Action Required';
                    log  ${Product_exception}
                    ${queryResults..}  convert to string  ${Product_exception}
                        ${queryResults1.}  replace string using regexp  ${queryResults..}  \\[|\,  ${EMPTY}
                      ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                      ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                      ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                      ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                      ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                      ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                      log  ${queryResultLength}
                      ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                       log  ${queryResults2..}
                   ${tup1}  set variable  ${queryResults2..}
                   ${queryResults1..}  execute javascript  if(${tup1} == 0 || ${tup1} == undefined || ${tup1} == null ){return 0;}var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; }
                   log  ${queryResults1..}
                    ${exception sum from db for prodcut}  convert to string  ${queryResults1..}
                    set global variable  ${exception sum from db for prodcut}
                    #log to console  count for "Cancel process" from grid for products "${business}_scheduling_${exception}":[${exception sum from db for prodcut}]

                     ${project_exception}  QUERY  select count(final_exception_message) from public.project_activity_v where final_exception_message='${exception}' and plant_business='${business}' and exception_requires_action='Action Required';
                    log  ${project_exception}
                    ${project_exception..}  convert to string  ${project_exception}
                        ${project_exception1.}  replace string using regexp  ${project_exception..}  \\[|\,  ${EMPTY}
                      ${project_exception1.}  replace string using regexp  ${project_exception1.}  \\]|\,  ${EMPTY}
                      ${queryResults..}   replace string using regexp  ${project_exception1.}  \\(|\,  ${EMPTY}
                      ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                      ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                      ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                      ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                      log  ${queryResultLength}
                      ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                       log  ${queryResults3..}
                   ${tup2}  set variable  ${queryResults3..}
                   ${queryResults31..}  execute javascript  if(${tup2} == 0 || ${tup2} == undefined || ${tup2} == null ){return 0;}var num = 0; if(${tup2} > 0 ){ num  = Math.round(${tup2}); return num; } else { return num; }
                   log  ${queryResults31..}
                    ${exception sum from db for project}  convert to string  ${queryResults31..}
                    set global variable  ${exception sum from db for project}
                    #log to console  count for "Cancel process" from grid for project "${business}_scheduling_${exception}":[${exception sum from db for project}]

                    ${sum_of_productdb_and_projectdb}  execute javascript  var x = `${exception sum from db for prodcut}`;var y = `${exception sum from db for project}`;var z =Number(x) + Number(y); return z
                    log  ${sum_of_productdb_and_projectdb}
                    set global variable  ${sum_of_productdb_and_projectdb}
                    log to console  count for "Cancel process" from db for products&project "${business}_scheduling_${exception}":[${sum_of_productdb_and_projectdb}]


           ###below code will do api to get grid count from ui for products
               ${token}  run  ${api_token}
                log  ${token}
                ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                ${AccessToken}  catenate  Bearer   ${AccessToken}
                log  Got Access Token: ${AccessToken}
                Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                ${headers}  Create Dictionary  Authorization=${AccessToken}
                ${resp}  Get Request  MySession  /secure/api/v1/getOrderDataProducts?offset=100&limit=100&exp_action=%5B%22Action%20Required%22%5D&exp=%5B%22${text1}%20${text2}%22%5D&business=%5B%22${business}%22%5D  headers=${headers}
                log  ${resp}
                log  Response------ ${resp.text}
                ${json}=  evaluate  json.loads('''${resp.text}''')  json
                log  ${json}
                log  ${json["count"]}
                ${grid_count_product}  set variable  ${json["count"]}

                ${token}  run  ${api_token}
                log  ${token}
                ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                ${AccessToken}  catenate  Bearer   ${AccessToken}
                log  Got Access Token: ${AccessToken}
                Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                ${headers}  Create Dictionary  Authorization=${AccessToken}
                ${resp}  Get Request  MySession  /secure/api/v1/getOrderDataProjects?offset=100&limit=100&exp_action=%5B%22Action%20Required%22%5D&exp=%5B%22${text1}%20${text2}%22%5D&business=%5B%22${business}%22%5D  headers=${headers}
                log  ${resp}
                log  Response------ ${resp.text}
                ${response..}  convert to string  ${resp.text}
                ${response}  run keyword and continue on failure  Evaluate  ${response..}.replace('null"', '')
                ${response.}  run keyword and continue on failure  Evaluate  ${response}.replace('\\"', '')
                ${json}  run keyword and continue on failure  evaluate  json.loads(unicode(${response.}))  json
                #${json}=  evaluate  json.loads('''${response}''')  json
                run keyword and continue on failure  log  ${json}
                run keyword and continue on failure  log  ${json["count"]}
                ${grid_count_project}  run keyword and continue on failure  set variable  ${json["count"]}
                run keyword and continue on failure  set global variable  ${grid_count_project}

                ${total count of records from grid}  run keyword and continue on failure  evaluate  ${grid_count_project}+${grid_count_product}
                set global variable  ${total count of records from grid}
                run keyword and continue on failure  log to console  Total count of record from grid "${business}": [${total count of records from grid}]


get count for exceptions for both product and project for "Cancel process"
                click element  ${products_tab}
                wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
                ${cance1_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div
                log  ${cance1_text}
                should be equal  ${cance1_text}  Cancel Process
                ${cancel_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p
                ${cancel_process_count}  execute javascript  var string = "${cancel_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                log  ${cancel_process_count}
                ${cancel_process_count1}  Evaluate  '${cancel_process_count}'.replace('(','')
                ${cancel_process_count..}  Evaluate  '${cancel_process_count1}'.replace(')','')
                ${product_cancel_process_count1..}  Evaluate  '${cancel_process_count..}'.replace(',','')
                log  ${product_cancel_process_count1..}
                click element  ${projects}
                sleep  3s
                ${cancel_value_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p
                ${cancel_process_count_projects1}  execute javascript  var string = "${cancel_value_text_projects}"; var returnStr = string.split(' ')[1]; return returnStr;
                log  ${cancel_process_count_projects1}
                ${cancel_process_count11}  Evaluate  '${cancel_process_count_projects1}'.replace('(','')
                ${cancel_process_count1..}  Evaluate  '${cancel_process_count11}'.replace(')','')
                ${project_cancel_process_count11..}  Evaluate  '${cancel_process_count1..}'.replace(',','')
                log  ${project_cancel_process_count11..}
                ${sum_of_productandproject_cancel}  execute javascript  var x = `${project_cancel_process_count11..}`;var y = `${product_cancel_process_count1..}`;var z =Number(x) + Number(y); return z
                log  ${sum_of_productandproject_cancel}
                ${sum_of_productandproject_cancel..}  convert to string  ${sum_of_productandproject_cancel}
                set global variable  ${sum_of_productandproject_cancel}
                click element  ${products_tab}

get count for exceptions for both product and project for "Overdue"
                click element  ${products_tab}
                wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
                ${Overdue_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[4]
                log  ${Overdue_text}
                should be equal  ${Overdue_text}  Overdue
                ${overdue_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[4]
                ${overdue_process_count}  execute javascript  var string = "${overdue_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                log  ${overdue_process_count}
                ${overdue_process_count1}  Evaluate  '${overdue_process_count}'.replace('(','')
                ${overdue_process_count..}  Evaluate  '${overdue_process_count1}'.replace(')','')
                ${product_overdue_process_count1..}  Evaluate  '${overdue_process_count..}'.replace(',','')
                log  ${product_overdue_process_count1..}
                click element  ${projects}
                sleep  3s
                ${overdue_value_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[4]
                ${overdue_process_count_projects1}  execute javascript  var string = "${overdue_value_text_projects}"; var returnStr = string.split(' ')[1]; return returnStr;
                log  ${overdue_process_count_projects1}
                ${overdue_process_count11}  Evaluate  '${overdue_process_count_projects1}'.replace('(','')
                ${overdue_process_count1..}  Evaluate  '${overdue_process_count11}'.replace(')','')
                ${project_overdue_process_count11..}  Evaluate  '${overdue_process_count1..}'.replace(',','')
                log  ${project_overdue_process_count11..}
                ${sum_of_productandproject_overdue}  execute javascript  var x = `${project_overdue_process_count11..}`;var y = `${product_overdue_process_count1..}`;var z =Number(x) + Number(y); return z
                log  ${sum_of_productandproject_overdue}
                ${sum_of_productandproject_overdue..}  convert to string  ${sum_of_productandproject_overdue}
                set global variable  ${sum_of_productandproject_overdue}
                click element  ${products_tab}

get count for exceptions for both product and project for "Reschedule in"
                click element  ${products_tab}
                wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
                ${Reschedule_In_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[2]
                log  ${Reschedule_In_text}
                should be equal  ${Reschedule_In_text}  Reschedule In
                ${Reschedule_In_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[2]
                ${Reschedule_In_process_count}  execute javascript  var string = "${Reschedule_In_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                log  ${Reschedule_In_process_count}
                ${Reschedule_In_process_count1}  Evaluate  '${Reschedule_In_process_count}'.replace('(','')
                ${Reschedule_In_process_count..}  Evaluate  '${Reschedule_In_process_count1}'.replace(')','')
                ${product_Reschedule_In_process_count1..}  Evaluate  '${Reschedule_In_process_count..}'.replace(',','')
                log  ${product_Reschedule_In_process_count1..}
                click element  ${projects}
                sleep  3s
                ${Reschedule_In_value_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[2]
                ${Reschedule_In_process_count_projects1}  execute javascript  var string = "${Reschedule_In_value_text_projects}"; var returnStr = string.split(' ')[1]; return returnStr;
                log  ${Reschedule_In_process_count_projects1}
                ${Reschedule_In_process_count11}  Evaluate  '${Reschedule_In_process_count_projects1}'.replace('(','')
                ${Reschedule_In_process_count1..}  Evaluate  '${Reschedule_In_process_count11}'.replace(')','')
                ${project_Reschedule_In_process_count11..}  Evaluate  '${Reschedule_In_process_count1..}'.replace(',','')
                log  ${project_Reschedule_In_process_count11..}
                ${sum_of_productandproject_Reschedule_In}  execute javascript  var x = `${project_Reschedule_In_process_count11..}`;var y = `${product_Reschedule_In_process_count1..}`;var z =Number(x) + Number(y); return z
                log  ${sum_of_productandproject_Reschedule_In}
                ${sum_of_productandproject_Reschedule_In..}  convert to string  ${sum_of_productandproject_Reschedule_In}
                set global variable  ${sum_of_productandproject_Reschedule_In}
                click element  ${products_tab}

get count for exceptions for both product and project for "Reschedule_out"
               click element  ${products_tab}
                wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
                ${Reschedule_out_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[3]
                log  ${Reschedule_out_text}
                should be equal  ${Reschedule_out_text}  Reschedule Out
                ${Reschedule_out_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[3]
                ${Reschedule_out_process_count}  execute javascript  var stroutg = "${Reschedule_out_value_text}"; var returnStr = stroutg.split(' ')[1]; return returnStr;
                log  ${Reschedule_out_process_count}
                ${Reschedule_out_process_count1}  Evaluate  '${Reschedule_out_process_count}'.replace('(','')
                ${Reschedule_out_process_count..}  Evaluate  '${Reschedule_out_process_count1}'.replace(')','')
                ${product_Reschedule_out_process_count1..}  Evaluate  '${Reschedule_out_process_count..}'.replace(',','')
                log  ${product_Reschedule_out_process_count1..}
                click element  ${projects}
                sleep  3s
                ${Reschedule_out_value_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[3]
                ${Reschedule_out_process_count_projects1}  execute javascript  var stroutg = "${Reschedule_out_value_text_projects}"; var returnStr = stroutg.split(' ')[1]; return returnStr;
                log  ${Reschedule_out_process_count_projects1}
                ${Reschedule_out_process_count11}  Evaluate  '${Reschedule_out_process_count_projects1}'.replace('(','')
                ${Reschedule_out_process_count1..}  Evaluate  '${Reschedule_out_process_count11}'.replace(')','')
                ${project_Reschedule_out_process_count11..}  Evaluate  '${Reschedule_out_process_count1..}'.replace(',','')
                log  ${project_Reschedule_out_process_count11..}
                ${sum_of_productandproject_Reschedule_out}  execute javascript  var x = `${project_Reschedule_out_process_count11..}`;var y = `${product_Reschedule_out_process_count1..}`;var z =Number(x) + Number(y); return z
                log  ${sum_of_productandproject_Reschedule_out}
                ${sum_of_productandproject_Reschedule_out..}  convert to string  ${sum_of_productandproject_Reschedule_out}
                set global variable  ${sum_of_productandproject_Reschedule_out}
                click element  ${products_tab}
                  
Excel,api,filters, exceptions and db should be equal for cancel process
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${filter_exp_record_count2..}
               run keyword and continue on failure  should be equal  ${sum_of_productandproject_cancel}  ${filter_business_record_count1..}
               run keyword and continue on failure  should be equal  ${sum_of_productandproject_cancel}  ${sum_of_productdb_and_projectdb}
               run keyword and continue on failure  should be equal  ${sum_of_productdb_and_projectdb}  ${total count of records from grid}
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${total row count from excel}


Excel,api,filters, exceptions and db should be equal for Overdue
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${filter_exp_record_count2..}
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${sum_of_productandproject_overdue}
               run keyword and continue on failure  should be equal  ${sum_of_productandproject_cancel}  ${sum_of_productdb_and_projectdb}
               run keyword and continue on failure  should be equal  ${sum_of_productdb_and_projectdb}  ${total count of records from grid}
               run keyword and continue on failure  should be equal  ${total row count from excel}  ${filter_business_record_count1..}

Excel,api,filters, exceptions and db should be equal for Reschedule in
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${filter_exp_record_count2..}
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${sum_of_productandproject_Reschedule_In}
               run keyword and continue on failure  should be equal  ${sum_of_productandproject_cancel}  ${sum_of_productdb_and_projectdb}
               run keyword and continue on failure  should be equal  ${sum_of_productdb_and_projectdb}  ${total count of records from grid}
               run keyword and continue on failure  should be equal  ${total row count from excel}  ${filter_business_record_count1..}

Excel,api,filters, exceptions and db should be equal for Reschedule out
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${filter_exp_record_count2..}
               run keyword and continue on failure  should be equal  ${filter_business_record_count1..}  ${sum_of_productandproject_Reschedule_out}
               run keyword and continue on failure  should be equal  ${sum_of_productandproject_cancel}  ${sum_of_productdb_and_projectdb}
               run keyword and continue on failure  should be equal  ${sum_of_productdb_and_projectdb}  ${total count of records from grid}
               run keyword and continue on failure  should be equal  ${total row count from excel}  ${filter_business_record_count1..}

get "${exception}" exception count for product and projects and sum of product cancel and sum project cancel for api "${text1}" for "${business}"
               click element  business
               click element  ${plant_business_show/selected}
               ${filter_business_record_count}  get text  ${count_business_filter_recods}
               log  ${filter_business_record_count}
               ${menu_amount}  replace string  ${filter_business_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_business_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_business_record_count1..}  convert to string  ${filter_business_record_count..}
               log to console   Total count of record from filter business "${business}": [${filter_business_record_count1..}]
               log  ${filter_business_record_count1..}
               click element  business

               click element  exp
               click element  ${final_exception_filter_show/selected}
               sleep  2s
               ${filter_exp_record_count}  get text  ${count_exp_filter_recods}
               log  ${filter_exp_record_count}
               ${menu_amount}  replace string  ${filter_exp_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_exp_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_exp_record_count2..}  convert to string  ${filter_business_record_count..}
               log to console   Total count of record from filter final_exception_filter "${business}": [${filter_exp_record_count2..}]
               log  ${filter_exp_record_count2..}
               click element  exp


               click element  exp_action
               click element  ${exception_riquires_filter_show/selected}
               sleep  2s
               ${filter_exp_requires_record_count}  get text  ${count_exp_action_filter_recods}
               log  ${filter_exp_requires_record_count}
               ${menu_amount}  replace string  ${filter_exp_requires_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_exp_requires_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_exp_requires_record_count2..}  convert to string  ${filter_exp_requires_record_count..}
               log to console   Total count of record from filter exp_requires_action "${business}": [${filter_exp_requires_record_count2..}]
               log  ${filter_exp_requires_record_count2..}
               click element  exp_action

           #####below code will get excel record count form export to excel option
               run keyword  Remove old excel file  ProductionOrders.xlsx
               run keyword  scroll page to location  0  100000
               sleep  3s
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               sleep  150s
               run keyword  open excel file for product grid  ProductionOrders.xlsx
               run keyword  Remove old excel file  ProductionOrders.xlsx
               click element  ${projects}
               sleep  13s
               run keyword  Remove old excel file  ProjectActivity.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               run keyword  open excel file for project grid  ProjectActivity.xlsx
               ${total row count from excel}  evaluate  ${total_no.ofrows_excel for projects}+${total_no.ofrows_excel for products}
               log  ${total row count from excel}
               set global variable  ${total row count from excel}
               log to console  Total row count from excel for business "power":[${total row count from excel}]

               ###below code will do db query to get grid count from ui for products
                connect to database  dbConfigFile=${dbfile}
                    ${Product_exception}  QUERY  select count(final_exception_message) from public.production_ords_v where final_exception_message='${exception}' and plant_business='${business}' and exception_requires_action='Action Required';
                    log  ${Product_exception}
                    ${queryResults..}  convert to string  ${Product_exception}
                        ${queryResults1.}  replace string using regexp  ${queryResults..}  \\[|\,  ${EMPTY}
                      ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                      ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                      ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                      ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                      ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                      ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                      log  ${queryResultLength}
                      ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                       log  ${queryResults2..}
                   ${tup1}  set variable  ${queryResults2..}
                   ${queryResults1..}  execute javascript  if(${tup1} == 0 || ${tup1} == undefined || ${tup1} == null ){return 0;}var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; }
                   log  ${queryResults1..}
                    ${exception sum from db for prodcut}  convert to string  ${queryResults1..}
                    set global variable  ${exception sum from db for prodcut}
                    #log to console  count for "Cancel process" from grid for products "${business}_scheduling_${exception}":[${exception sum from db for prodcut}]

                     ${project_exception}  QUERY  select count(final_exception_message) from public.project_activity_v where final_exception_message='${exception}' and plant_business='${business}' and exception_requires_action='Action Required';
                    log  ${project_exception}
                    ${project_exception..}  convert to string  ${project_exception}
                        ${project_exception1.}  replace string using regexp  ${project_exception..}  \\[|\,  ${EMPTY}
                      ${project_exception1.}  replace string using regexp  ${project_exception1.}  \\]|\,  ${EMPTY}
                      ${queryResults..}   replace string using regexp  ${project_exception1.}  \\(|\,  ${EMPTY}
                      ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                      ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                      ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                      ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                      log  ${queryResultLength}
                      ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                       log  ${queryResults3..}
                   ${tup2}  set variable  ${queryResults3..}
                   ${queryResults31..}  execute javascript  if(${tup2} == 0 || ${tup2} == undefined || ${tup2} == null ){return 0;}var num = 0; if(${tup2} > 0 ){ num  = Math.round(${tup2}); return num; } else { return num; }
                   log  ${queryResults31..}
                    ${exception sum from db for project}  convert to string  ${queryResults31..}
                    set global variable  ${exception sum from db for project}
                    #log to console  count for "Cancel process" from grid for project "${business}_scheduling_${exception}":[${exception sum from db for project}]

                    ${sum_of_productdb_and_projectdb}  execute javascript  var x = `${exception sum from db for prodcut}`;var y = `${exception sum from db for project}`;var z =Number(x) + Number(y); return z
                    log  ${sum_of_productdb_and_projectdb}
                    set global variable  ${sum_of_productdb_and_projectdb}
                    log to console  count for "Cancel process" from db for products&project "${business}_scheduling_${exception}":[${sum_of_productdb_and_projectdb}]


           ###below code will do api to get grid count from ui for products
               ${token}  run  ${api_token}
                log  ${token}
                ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                ${AccessToken}  catenate  Bearer   ${AccessToken}
                log  Got Access Token: ${AccessToken}
                Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                ${headers}  Create Dictionary  Authorization=${AccessToken}
                ${resp}  Get Request  MySession  /secure/api/v1/getOrderDataProducts?offset=100&limit=100&exp_action=%5B%22Action%20Required%22%5D&exp=%5B%22${text1}%20${text2}%22%5D&business=%5B%22${business}%22%5D  headers=${headers}
                log  ${resp}
                log  Response------ ${resp.text}
                ${json}=  evaluate  json.loads('''${resp.text}''')  json
                log  ${json}
                log  ${json["count"]}
                ${grid_count_product}  set variable  ${json["count"]}

                ${token}  run  ${api_token}
                log  ${token}
                ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                ${AccessToken}  catenate  Bearer   ${AccessToken}
                log  Got Access Token: ${AccessToken}
                Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                ${headers}  Create Dictionary  Authorization=${AccessToken}
                ${resp}  Get Request  MySession  /secure/api/v1/getOrderDataProjects?offset=100&limit=100&exp_action=%5B%22Action%20Required%22%5D&exp=%5B%22${text1}%20${text2}%22%5D&business=%5B%22${business}%22%5D  headers=${headers}
                log  ${resp}
                log  Response------ ${resp.text}
                ${response..}  convert to string  ${resp.text}
                ${response}  run keyword and continue on failure  Evaluate  ${response..}.replace('null"', '')
                ${response.}  run keyword and continue on failure  Evaluate  ${response}.replace('\\"', '')
                ${json}  run keyword and continue on failure  evaluate  json.loads(unicode(${response.}))  json
                #${json}=  evaluate  json.loads('''${response}''')  json
                run keyword and continue on failure  log  ${json}
                run keyword and continue on failure  log  ${json["count"]}
                ${grid_count_project}  run keyword and continue on failure  set variable  ${json["count"]}
                run keyword and continue on failure  set global variable  ${grid_count_project}

                ${total count of records from grid}  run keyword and continue on failure  evaluate  ${grid_count_project}+${grid_count_product}
                set global variable  ${total count of records from grid}
                run keyword and continue on failure  log to console  Total count of record from grid "${business}": [${total count of records from grid}]