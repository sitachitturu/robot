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
Resource  ../../Feature/PurchaseOrders/final_exception_msg_calculations.robot
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

Click edit filters and select final exception message filter
        wait until element is visible  ${Edit filter button}  20s
        click element  ${Edit filter button}
        wait until element is visible  ${Final Exception Message}  20s
        click element  ${Final Exception Message}
        click element  ${Continue button}
        sleep  3s

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

select business "${business}" from business filter
           wait until element is visible  business  10s
           click element  business
           wait until element is visible  product-${business}  20s
           click element  product-${business}
           wait until element is visible  ${plant_business_apply_button}  20s
           click element  ${plant_business_apply_button}
           sleep  14s

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


Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "${business}" for "${MODULE}" and "${api_module_name}"
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

               #####below code will get excel record count form export to excel option
               run keyword  Remove old excel file  ${MODULE}.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               sleep  280s
               run keyword  open excel file  ${MODULE}.xlsx
               run keyword  Remove old excel file  ${MODULE}.xlsx
               log to console  Total row count from excel for business "${business}_${MODULE}":[${total_no.ofrows_excel}]

               ###below code will do api to get grid count from ui for products
               ${token}  run  ${api_token}
                    log  ${token}
                    ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                    ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                    ${AccessToken}  catenate  Bearer   ${AccessToken}
                    log  Got Access Token: ${AccessToken}
                    Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                    ${headers}  Create Dictionary  Authorization=${AccessToken}
                    ${resp}  Get Request  MySession  /secure/api/v1/get${api_module_name}Data?offset=100&limit=100&business=%5B%22${business}%22%5D  headers=${headers}
                    log  ${resp}
                    log  Response------ ${resp.text}
                    ${json}=  evaluate  json.loads('''${resp.text}''')  json
                    log  ${json}
                    log  ${json["count"]}
                    ${grid_count_product}  set variable  ${json["count"]}
    #                run keyword  project api
    #                ${total count of records from grid}  evaluate  ${grid_count_project}+${grid_count_product}
                    log to console  Total count of record from grid "${business}": [${grid_count_product}]

open excel file for opportuinities grid
                 [Arguments]   ${excel_file_name}
                 ${status}=  run keyword and return status  log  %{HOME}
                 ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
                 log  ${path}
                 ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
                 [Return]  ${excel_file}
                 ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
                 log  ${total_no.ofrows_excel}
                  ${total_no.ofrows_excel for opportunities..}  convert to string  ${total_no.ofrows_excel}
                  set global variable  ${total_no.ofrows_excel for opportunities..}

User click "Export to Excel" for transfer for buying rejected grid
                 ##[Arguments]  ${export to excel for rejected for buyer}
                 wait until element is visible  ${rejected tab for buying}  10s
                 click element  ${rejected tab for buying}
                 sleep  20s
                 #wait until element is visible  ${export to excel for rejected for buyer}  10s
                 click element  ${export to excel for rejected for buyer}
                 sleep  25s

User click "Export to Excel" for transfer opportunities grid
                [Arguments]  ${export_excel_btn for opp}
                wait until element is visible  ${export_excel_btn for opp}   10s
                click element  ${export_excel_btn for opp}
                sleep  2s
                click element  ${export all button from excel}
                click element  ${export_button_inside_export to excel}
                sleep  10s

User click "Export to Excel" for transfer selling rejected grid
                 [Arguments]  ${export to excel for rejected for seller}
                 wait until element is visible  ${rejected tab for seller}  10s
                 click element  ${rejected tab for seller}
                 sleep  5s
                 wait until element is visible  ${export to excel for rejected for seller}   10s
                 click element  ${export to excel for rejected for seller}
                 sleep  15s
Trimming unnecessary brackets etc from the db output
                  ${queryResults1.}  replace string using regexp  ${queryResults1..}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${queryResults2..}
                   set global variable  ${queryResults2..}

Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "${business}" for "${MODULE}" and "${api_module_name}" for sellling grid
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

                   #####below code will get excel record count form export to excel option
                   run keyword  Remove old excel file  ${MODULE}.xlsx
                   run keyword  User click "Export to Excel" for transfer opportunities grid  ${export_excel_btn for buying opp}
                   sleep  60s
                   run keyword  open excel file  ${MODULE}.xlsx
                   run keyword  Remove old excel file  ${MODULE}.xlsx
                   run keyword  User click "Export to Excel" for transfer for buying rejected grid  ${export to excel for rejected for buyer}
                   run keyword  open excel file  ${MODULE}.xlsx
                   ${total no of rows both oppo&rej}  evaluate  ${total_no.ofrows_excel for opportunities..}+${total_no.ofrows_rejected_excel..}
                   log to console  Total row count from excel for business "${business}_${MODULE}":[${total no of rows both oppo&rej}]

                   ###below code will do api to get grid count from ui for products
                   ${token}  run  ${api_token}
                        log  ${token}
                        ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                        ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                        ${AccessToken}  catenate  Bearer   ${AccessToken}
                        log  Got Access Token: ${AccessToken}
                        Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                        ${headers}  Create Dictionary  Authorization=${AccessToken}
                        ${resp}  Get Request  MySession  /secure/api/v1/get${api_module_name}Data?offset=100&limit=100&business=%5B%22${business}%22%5D  headers=${headers}
                        log  ${resp}
                        log  Response------ ${resp.text}
                        ${json}=  evaluate  json.loads('''${resp.text}''')  json
                        log  ${json}
                        log  ${json["count"]}
                        ${grid_count_product}  set variable  ${json["count"]}
        #                run keyword  project api
        #                ${total count of records from grid}  evaluate  ${grid_count_project}+${grid_count_product}
                        log to console  Total count of record from grid "${business}": [${grid_count_product}]


##########==================================================================================================================================================================================================================

Select Exception message from age classification dropdown and click value tab
                    wait until element is visible  //paper-tab[@role='tab']//div[contains(normalize-space(), 'Value ($)')]  10s
                    click element  //paper-tab[@role='tab']//div[contains(normalize-space(), 'Value ($)')]
                    click element  ${Button Age Classification}
                    sleep  4s
                    click element  ${Exception Message}
                    sleep  50s
                    wait until element is visible  //vaadin-grid[@id='dataTableGrid']//span[contains(normalize-space(), 'Cancellation')]  20s

Get Exception message value for cancellation for selected business for "${business}" for "PurchaseOrders" from heatmap
                    run keyword  scroll page to location  1000000  0
                    click element  exp
                    sleep  2s
                    run keyword  User select cancel process
                    run keyword  Gets cancellation total from heatmap for "${business}"


Get Exception message count for cancellation for selected business for "${business}" for "PurchaseOrders" from heatmap
                    run keyword  scroll page to location  1000000  0
                    click element  exp
                    sleep  8s
                    run keyword  User select cancel process
                    run keyword  Get count for cancellation from heatmap for count for "${business}"
                    #click element  exp

Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "${business}" and view "${MODULE}"
                    connect to database  dbConfigFile=${dbfile}
                    ${queryResults}  QUERY  SELECT SUM(net_open_value_usd) AS opp FROM ${MODULE} where final_exception_message = 'Cancel process' and plant_business='${business}';
                    log  ${queryResults}
                    ${queryResults..}  convert to string  ${queryResults}
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
                    ${cancellation sum from db_grid}  convert to string  ${queryResults1..}
                    set global variable  ${cancellation sum from db_grid}
                    log to console  Sum of net open value(usd) for "Cancel process" from grid "${business}_${MODULE}":[${cancellation sum from db_grid}]

Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "${business}" and view "${MODULE}"
                      connect to database  dbConfigFile=${dbfile}
                      ${queryResults}  QUERY  SELECT SUM(net_open_value_usd) AS opp FROM ${MODULE} where final_exception_message = 'Reschedule in' and plant_business='${business}';
                      log  ${queryResults}
                      ${queryResults..}  convert to string  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
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
                      ${reschedule in sum from db_grid}  convert to string  ${queryResults1..}
                      set global variable  ${reschedule in sum from db_grid}
                      log to console  Sum of net open value(usd) for "Reschedule in" from grid "${business}_${MODULE}":[${reschedule in sum from db_grid}]

Get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "${business}" and view "${MODULE}"
                  connect to database  dbConfigFile=${dbfile}
                  ${queryResults}  QUERY  SELECT SUM(net_open_value_usd) AS opp FROM ${MODULE} where final_exception_message = 'Reschedule out' and plant_business='${business}';
                  log  ${queryResults}
                  ${queryResults..}  convert to string  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
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
                  ${reschedule out sum from db_grid}  convert to string  ${queryResults1..}
                  set global variable  ${reschedule out sum from db_grid}
                  log to console  Sum of net open value(usd) for "Reschedule out" from grid "${business}_${MODULE}":[${reschedule out sum from db_grid}]

Get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "${business}" and view "${MODULE}"
              connect to database  dbConfigFile=${dbfile}
              ${queryResults}  QUERY  SELECT SUM(net_open_value_usd) AS opp FROM ${MODULE} where final_exception_message = 'Overdue' and plant_business='${business}';
              log  ${queryResults}
             ${queryResults..}  convert to string  ${queryResults}
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
              ${overdue sum from db_grid}  convert to string  ${queryResults1..}
              set global variable  ${overdue sum from db_grid}
              log to console  Sum of net open value(usd) for "Overdue" from grid "${business}_${MODULE}":[${overdue sum from db_grid}]

Get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "${business}" and view "${MODULE}"
              connect to database  dbConfigFile=${dbfile}
              ${queryResults}  QUERY  SELECT SUM(net_open_value_usd) AS opp FROM ${MODULE} where final_exception_message = 'No Exception' and plant_business='${business}';
              log  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
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
              ${No exception sum from db_grid}  convert to string  ${queryResults1..}
              set global variable  ${No exception sum from db_grid}
              log to console  Sum of net open value(usd) for "No Exception" from grid FROM db"${business}_${MODULE}":[${No exception sum from db_grid}]

Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "${business}"
           run keyword  User click "Export to Excel"  ${export_excel_btn}
           run keyword  Gets the cancellation total from excel for "${business}"

Get Exception message value for Reschedule in for selected business for "${business}" for "PurchaseOrders" from heatmap
           click element  exp
           sleep  2s
           run keyword  User select cancel process
           sleep  4s
           click element  exp
           run keyword  User select reschedule-in filter option
           run keyword  Gets reschedule-in total from heatmap for "${business}"

Get Exception message count for Reschedule in for selected business for "${business}" for "PurchaseOrders" from heatmap
           #click element  exp
           sleep  2s
           run keyword  User select cancel process
           sleep  4s
           click element  exp
           run keyword  User select reschedule-in filter option
           run keyword  Gets reschedule-in total from heatmap for "${business}" for count

Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "${business}"
           run keyword  User click "Export to Excel"  ${export_excel_btn}
           run keyword  Gets the reschedule-in total from excel for "${business}"

Get Exception message value for Reschedule Out for selected business for "${business}" for "PurchaseOrders" from heatmap
           click element  exp
           sleep  2s
           run keyword  User select reschedule-in filter option
           sleep  4s
           click element  exp
           run keyword  User select reschedule-out filter option
           run keyword  Gets reschedule-out total from heatmap for "${business}"

Get Exception message count for Reschedule Out for selected business for "${business}" for "PurchaseOrders" from heatmap
           #click element  exp
           sleep  12s
           run keyword  User select reschedule-in filter option
           sleep  4s
           click element  exp
           run keyword  User select reschedule-out filter option
           run keyword  Gets reschedule-out total from heatmap for "${business}" for count

Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "${business}"
           run keyword  User click "Export to Excel"  ${export_excel_btn}
           run keyword  Gets reschedule-out total from excel for "${business}"

Get Exception message value for Overdue for selected business for "${business}" for "PurchaseOrders" from heatmap
           click element  exp
           sleep  12s
           run keyword  User select reschedule-out filter option
           sleep  4s
           click element  exp
           run keyword  User select overdue filter option
           run keyword  Gets overdue total from heatmap for "${business}"

Get Exception message count for Overdue for selected business for "${business}" for "PurchaseOrders" from heatmap
           #click element  exp
           sleep  12s
           run keyword  User select reschedule-out filter option
           sleep  4s
           click element  exp
           run keyword  User select overdue filter option
           run keyword  Gets overdue total from heatmap for "${business}" for count

Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "${business}"
           run keyword  User click "Export to Excel"  ${export_excel_btn}
           sleep  20s
           run keyword  Gets overdue total from excel for "${business}"

Get Exception message value for No Exception for selected business for "${business}" for "PurchaseOrders" from heatmap
           click element  exp
           sleep  2s
           run keyword  User select overdue filter option
           click element  exp
           run keyword  User select no exception filter option
           run keyword  Gets no exception total from heatmap for "${business}"

Get Exception message count for No Exception for selected business for "${business}" for "PurchaseOrders" from heatmap
          # click element  exp
           sleep  2s
           run keyword  User select overdue filter option
           click element  exp
           run keyword  User select no exception filter option
           run keyword  Gets no exception total from heatmap for "${business}" for count

Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "${business}"
           run keyword  User click "Export to Excel"  ${export_excel_btn}
           sleep  40s
           run keyword  Gets no exception total from excel for "${business}"

compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between HeatmapValues,grid column sum(using db) and excel
           run keyword and continue on failure  should be equal  ${cancellation sum from heatmap}  ${cancellation sum from excel..}
           run keyword and continue on failure  should be equal  ${cancellation sum from db_grid}  ${cancellation sum from heatmap}
           run keyword and continue on failure  should be equal  ${cancellation sum from db_grid}  ${cancellation sum from excel..}

           run keyword and continue on failure  should be equal  ${reschedule-in sum from heatmap}  ${reschedule-in sum from excel..}
           run keyword and continue on failure  should be equal  ${reschedule-in sum from heatmap}  ${reschedule in sum from db_grid}
           run keyword and continue on failure  should be equal  ${reschedule in sum from db_grid}  ${reschedule-in sum from excel..}

           run keyword and continue on failure  should be equal  ${reschedule-out sum from heatmap}  ${reschedule-out sum from excel..}
           run keyword and continue on failure  should be equal  ${reschedule-out sum from heatmap}  ${reschedule out sum from db_grid}
           run keyword and continue on failure  should be equal  ${reschedule out sum from db_grid}  ${reschedule-out sum from excel..}

           run keyword and continue on failure  should be equal  ${no exception sum from heatmap}  ${no exception sum from excel..}
           run keyword and continue on failure  should be equal  ${no exception sum from heatmap}  ${No exception sum from db_grid}
           run keyword and continue on failure  should be equal  ${No exception sum from db_grid}  ${no exception sum from excel..}

           run keyword and continue on failure  should be equal  ${overdue sum from heatmap}  ${overdue sum from excel..}
           run keyword and continue on failure  should be equal  ${overdue sum from heatmap}  ${overdue sum from db_grid}
           run keyword and continue on failure  should be equal  ${overdue sum from db_grid}  ${overdue sum from excel..}

Get count for exception meassage "${exception}" from excel for business "${business}" for "${MODULE}"
          run keyword  Remove old excel file  ${MODULE}.xlsx
               run keyword  User click "Export to Excel"  ${export_excel_btn}
               sleep  90s
               run keyword  open excel file  ${MODULE}.xlsx
               run keyword  Remove old excel file  ${MODULE}.xlsx
               log to console  Total row count from excel for business "${business}_${MODULE}":[${total_no.ofrows_excel}]
               log  ${total_no.ofrows_excel}

Get count for exception meassage for api "${exception1}""${exception2}" from api for business "${business}" for "${MODULE}" and "${api_module_name}"
           ${token}  run  ${api_token}
                    log  ${token}
                    ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                    ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                    ${AccessToken}  catenate  Bearer   ${AccessToken}
                    log  Got Access Token: ${AccessToken}
                    Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                    ${headers}  Create Dictionary  Authorization=${AccessToken}
                    ${resp}  Get Request  MySession  secure/api/v1/get${api_module_name}Data?offset=100&limit=100&business=%5B%22${business}%22%5D&exp=%5B%22${exception1}%20${exception2}%22%5D  headers=${headers}
                    log  ${resp}
                    log  Response------ ${resp.text}
                    ${json}=  evaluate  json.loads('''${resp.text}''')  json
                    log  ${json}
                    log  ${json["count"]}
                    ${api_grid_count..}  set variable  ${json["count"]}
                    ${api_grid_count}  convert to string  ${api_grid_count..}
                    log to console  Total count of records from grid FROM API"${business}": [${api_grid_count}]
                    log  ${api_grid_count}
                    set global variable  ${api_grid_count}

Get count for exception meassage "${exception}" from Database query for business "${business}" and view "${MODULE}"
              connect to database  dbConfigFile=${dbfile}
              ${queryResults}  QUERY  SELECT count(final_exception_message) AS no FROM ${MODULE} where final_exception_message = '${exception}' and plant_business='${business}';
              log  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
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
              ${exception count from db_grid}  convert to string  ${queryResults1..}
              set global variable  ${exception count from db_grid}
              log to console  Total count of records from grid from DB"${business}_${MODULE}_${exception}":[${exception count from db_grid}]

Get count for exception meassage "${exception}" from final exception meassage filter for business "${business}"
               click element  exp
               sleep  3s
               click element  ${final_exception_filter_show/selected}
               ${filter_record_count}  get text  ${count_final_exception_filter_recods}
               log  ${filter_record_count}
               ${menu_amount}  replace string  ${filter_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_record_count1..}  convert to string  ${filter_record_count..}
               log to console   Total count of record from filter "${business}": [${filter_record_count1..}]
               log  ${filter_record_count1..}
               set global variable  ${filter_record_count1..}

Get count for exception meassage for api "${EXCEPTION}" from api for business "${business}" for "${MODULE}" and "${api_module_name}" for "${MODULE}"
           ${token}  run  ${api_token}
                    log  ${token}
                    ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                    ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                    ${AccessToken}  catenate  Bearer   ${AccessToken}
                    log  Got Access Token: ${AccessToken}
                    Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                    ${headers}  Create Dictionary  Authorization=${AccessToken}
                    ${resp}  Get Request  MySession  secure/api/v1/get${api_module_name}Data?offset=100&limit=100&business=%5B%22${business}%22%5D&exp=%5B%22${EXCEPTION}%22%5D  headers=${headers}
                    log  ${resp}
                    log  Response------ ${resp.text}
                    ${json}=  evaluate  json.loads('''${resp.text}''')  json
                    log  ${json}
                    log  ${json["count"]}
                    ${api_grid_count..}  set variable  ${json["count"]}
                    log  ${api_grid_count..}
                    ${api_grid_count1}  convert to string  ${api_grid_count..}
                    set global variable  ${api_grid_count1}
                    log to console  Total count of records from grid FROM API "${business}": [${api_grid_count1}]

Grid and excel and filter and database count should match and equal for cancel process
            run keyword and continue on failure  should be equal  ${api_grid_count}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${exception count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${exception count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${cancellation sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for reschedule in
            run keyword and continue on failure  should be equal  ${api_grid_count}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${exception count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${exception count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${reschedule-in sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for reschedule out
            run keyword and continue on failure  should be equal  ${api_grid_count}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${exception count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${exception count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${reschedule-out sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for overdue
            run keyword and continue on failure  should be equal  ${api_grid_count1}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${exception count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${exception count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${overdue sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for no exception
            run keyword and continue on failure  should be equal  ${api_grid_count}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${exception count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${exception count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${no exception sum from heatmap for count..}

Click edit filters and select Aging buckets filter
           wait until element is visible  ${Edit filter button}  20s
           click element  ${Edit filter button}
           wait until element is visible  ${Aging Bucket filter PO}  20s
           click element  ${Aging Bucket filter PO}
           click element  ${Continue button}
           sleep  3s

select "${aging}" from aging bucket filter
          click element  ovd_days_range
          wait until element is visible  product-${aging}  30s
          click element  product-${aging}
          click element  ${aging bucket filter apply button_po}
          sleep  7s

Get Age classification value for 60+ old for selected business for "${business}" for "PurchaseOrders" from heatmap
        ${60+raw}  get text  ${60+days heatmap total value}
        ${60+raw sum from heatmap for count}=  execute javascript  var string = "${60+raw}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${60+raw sum from heatmap for count}
     ${queryResults1}  convert to string  ${60+raw sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${60+raw sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${60+raw sum from heatmap for count..}
    set global variable  ${60+raw sum from heatmap for count..}
        log to console  Sum for "60+raw" from Heatmap for "${business}":[${60+raw sum from heatmap for count..}]

Get Age classification value for 30+ old for selected business for "${business}" for "PurchaseOrders" from heatmap
        ${30+raw}  get text  ${30+days heatmap total value}
        ${30+raw sum from heatmap for count}=  execute javascript  var string = "${30+raw}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${30+raw sum from heatmap for count}
     ${queryResults1}  convert to string  ${30+raw sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${30+raw sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${30+raw sum from heatmap for count..}
    set global variable  ${30+raw sum from heatmap for count..}
        log to console  Sum for "30+raw" from Heatmap for "${business}":[${30+raw sum from heatmap for count..}]

Get Age classification value for <30days old for selected business for "${business}" for "PurchaseOrders" from heatmap
         ${<30raw}  get text  ${<30days heatmap total value}
        ${<30raw sum from heatmap for count}=  execute javascript  var string = "${<30raw}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${<30raw sum from heatmap for count}
     ${queryResults1}  convert to string  ${<30raw sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${<30raw sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${<30raw sum from heatmap for count..}
    set global variable  ${<30raw sum from heatmap for count..}
        log to console  Sum for "<30raw" from Heatmap for "${business}":[${<30raw sum from heatmap for count..}]

Get Age classification value for Future for selected business for "${business}" for "PurchaseOrders" from heatmap
          ${Futureraw}  get text  ${Futureraw heatmap total value}
        ${Futureraw sum from heatmap for count}=  execute javascript  var string = "${Futureraw}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${Futureraw sum from heatmap for count}
     ${queryResults1}  convert to string  ${Futureraw sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${Futureraw sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${Futureraw sum from heatmap for count..}
    set global variable  ${Futureraw sum from heatmap for count..}
        log to console  Sum for "Futureraw" from Heatmap for "${business}":[${Futureraw sum from heatmap for count..}]

Get Age classification value for On Hold for selected business for "${business}" for "PurchaseOrders" from heatmap
          ${onhold_raw}  get text  ${onhold_raw heatmap total value}
        ${onhold_raw sum from heatmap for count}=  execute javascript  var string = "${onhold_raw}"; var returnStr = string.split(" ",1); return returnStr;
        [Return]  ${onhold_raw sum from heatmap for count}
        ${queryResults1}  convert to string  ${onhold_raw sum from heatmap for count}
         ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${onhold_raw sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${onhold_raw sum from heatmap for count..}
    set global variable  ${onhold_raw sum from heatmap for count..}
        log to console  Sum for "onhold_raw" from Heatmap for "${business}":[${onhold_raw sum from heatmap for count..}]

get sum of Net open usd value(usd) column where age classification is "${aging}" from excel for business "${business}"
            run keyword  User click "Export to Excel"  ${export_excel_btn}
            ${status}=  run keyword and return status  log  %{HOME}
            ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

           ${aging sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseOrders.xlsx  Net Open Value (USD)
           [Return]  ${aging sum from excel}
           ${tup1}  set variable  ${aging sum from excel}
           ${aging sum from excel.}  execute javascript  if(${tup1} == 0 || ${tup1} == undefined || ${tup1} == null ){return 0;}var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; }
           log  ${aging sum from excel.}
           ${aging sum from excel..}  convert to string  ${aging sum from excel.}
           set global variable  ${aging sum from excel..}
           log to console  Sum for "${aging}" from Excel for "${business}":[${aging sum from excel..}]

Get sum of net open value (usd) where Age classification is "${aging}" from Database query(as grid is getting data from databse) for business "${business}" and view "${module}"
            connect to database  dbConfigFile=${dbfile}
                      ${queryResults}  QUERY  SELECT SUM(${aging}) AS opp FROM ${module} where plant_business='${business}';
                      log  ${queryResults}
                      ${queryResults..}  convert to string  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
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
                      ${aging sum from db_grid}  convert to string  ${queryResults1..}
                      set global variable  ${aging sum from db_grid}
                      log to console  Sum of net open value(usd) for "${aging}" from grid "${business}_${MODULE}":[${aging sum from db_grid}]

compare values of age classification value for "60+days" in between Heatmapvalues,grid column sum(using db) and excel
                      run keyword and continue on failure  should be equal  ${aging sum from db_grid}  ${aging sum from excel..}
                      run keyword and continue on failure  should be equal  ${60+raw sum from heatmap..}  ${aging sum from db_grid}

compare values of age classification value for "30+days" in between Heatmapvalues,grid column sum(using db) and excel
                     run keyword and continue on failure  should be equal  ${aging sum from db_grid}  ${aging sum from excel..}
                      run keyword and continue on failure  should be equal  ${30+raw sum from heatmap..}  ${aging sum from db_grid}

compare values of age classification value for "<30days" in between Heatmapvalues,grid column sum(using db) and excel
                      run keyword and continue on failure  should be equal  ${aging sum from db_grid}  ${aging sum from excel..}
                      run keyword and continue on failure  should be equal  ${<30raw sum from heatmap..}  ${aging sum from db_grid}

compare values of age classification value for "future" in between Heatmapvalues,grid column sum(using db) and excel
                      run keyword and continue on failure  should be equal  ${aging sum from db_grid}  ${aging sum from excel..}
                      run keyword and continue on failure  should be equal  ${Futureraw sum from heatmap..}  ${aging sum from db_grid}

compare values of age classification value for "On Hold" in between Heatmapvalues,grid column sum(using db) and excel
                      run keyword and continue on failure  should be equal  ${aging sum from db_grid}  ${aging sum from excel..}
                      run keyword and continue on failure  should be equal  ${onhold_raw sum from heatmap..}  ${aging sum from db_grid}

Get count for Age_Classification for api "${EXCEPTION}" from api for business "${business}" for "PurchaseOrders" and "${api_module_name}"
                  ${token}  run  ${api_token}
                    log  ${token}
                    ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                    ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                    ${AccessToken}  catenate  Bearer   ${AccessToken}
                    log  Got Access Token: ${AccessToken}
                    Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                    ${headers}  Create Dictionary  Authorization=${AccessToken}
                    ${resp}  Get Request  MySession  secure/api/v1/get${api_module_name}Data?offset=100&limit=100&business=%5B%22${business}%22%5D&ovd_days_range=%5B%22${EXCEPTION}%2B%22%5D  headers=${headers}
                    log  ${resp}
                    log  Response------ ${resp.text}
                    ${json}=  evaluate  json.loads('''${resp.text}''')  json
                    log  ${json}
                    log  ${json["count"]}
                    ${api_grid_count..}  set variable  ${json["count"]}
                    log  ${api_grid_count..}
                    ${api_grid_count}  convert to string  ${api_grid_count..}
                    set global variable  ${api_grid_count}
                    log to console  Total count of records from grid FROM API "${business}": [${api_grid_count}]

Get count for Age_Classification for api <30 from api for business "${business}" for "PurchaseOrders" and "${api_module_name}"
                    ${token}  run  ${api_token}
                    log  ${token}
                    ${AccessToken1}  fetch from right  ${token}  {"access_token":"
                    ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
                    ${AccessToken}  catenate  Bearer   ${AccessToken}
                    log  Got Access Token: ${AccessToken}
                    Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
                    ${headers}  Create Dictionary  Authorization=${AccessToken}
                    ${resp}  Get Request  MySession  secure/api/v1/get${api_module_name}Data?offset=100&limit=100&business=%5B%22${business}%22%5D&ovd_days_range=%5B%22%3C30%22%5D  headers=${headers}
                    log  ${resp}
                    log  Response------ ${resp.text}
                    ${json}=  evaluate  json.loads('''${resp.text}''')  json
                    log  ${json}
                    log  ${json["count"]}
                    ${api_grid_count..}  set variable  ${json["count"]}
                    log  ${api_grid_count..}
                    ${api_grid_count1 for <30}  convert to string  ${api_grid_count..}
                    set global variable  ${api_grid_count1 for <30}
                    log to console  Total count of records from grid FROM API "${business}": [${api_grid_count1 for <30}]

Get count for Age_Classification "${aging}" from Database query for business "${business}" and view "${MODULE}"
                    connect to database  dbConfigFile=${dbfile}
              ${queryResults}  QUERY  SELECT SUM("${aging}") AS "${aging}" FROM ${MODULE} where plant_business='${business}';
              log  ${queryResults}
              ${queryResults..}  convert to string  ${queryResults}
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
              ${age_clasiification count from db_grid}  convert to string  ${queryResults1..}
              set global variable  ${age_clasiification count from db_grid}
              log to console  Total count of records from grid from DB"${business}_${MODULE}_${aging}":[${age_clasiification count from db_grid}]

Get count for Age_Classification "${aging}" from aging bucket filter for business "${business}"
              click element  ovd_days_range
               sleep  3s
               click element  ${ovd_days_range_filter_show/selected}
               ${filter_record_count}  get text  ${count_ovd_days_range_filter_recods}
               log  ${filter_record_count}
               ${menu_amount}  replace string  ${filter_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_record_count1..}  convert to string  ${filter_record_count..}
               log to console   Total count of record from filter "${business}": [${filter_record_count1..}]
               log  ${filter_record_count1..}
               set global variable  ${filter_record_count1..}

Grid and excel and filter and database count should match and equal for 60+ days
            run keyword and continue on failure  should be equal  ${api_grid_count}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${age_clasiification count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${age_clasiification count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${60+raw sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for 30+ days
            run keyword and continue on failure  should be equal  ${api_grid_count}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${age_clasiification count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${age_clasiification count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${30+raw sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for <30 days
            run keyword and continue on failure  should be equal  ${api_grid_count1 for <30}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${age_clasiification count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${age_clasiification count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${<30raw sum from heatmap for count..}

Grid and excel and filter and database count should match and equal for Future days
           run keyword and continue on failure  should be equal  ${api_grid_count1}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${age_clasiification count from db_grid}  ${total_no.ofrows_excel}
            run keyword and continue on failure  should be equal  ${filter_record_count1..}  ${age_clasiification count from db_grid}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_record_count1..}
            run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${Futureraw sum from heatmap for count..}