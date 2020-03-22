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

User click "Export to Excel" for pr module
    [Arguments]  ${excel_button}
    wait until element is visible  ${excel_button}   10s
    sleep  5s
    click element  ${excel_button}
    sleep  250s

select business "${business}" from business filter
           wait until element is visible  business  10s
           click element  business
           wait until element is visible  product-${business}  20s
           click element  product-${business}
           wait until element is visible  ${plant_business_apply_button}  20s
           click element  ${plant_business_apply_button}
           sleep  14s

Verify filter count and grid no. of rows from api and excel no. of rows and DB record count, heatmap count for "${business}" for "${MODULE}" and "${api_module_name}"
               click element  business
               sleep  5s
               click element  ${plant_business_show/selected}
               ${filter_business_record_count}  get text  ${count_business_filter_recods}
               log  ${filter_business_record_count}
               ${menu_amount}  replace string  ${filter_business_record_count}  (  ${EMPTY}
               ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
               ${filter_business_record_count..}  replace string  ${menu_amount}  ,  ${EMPTY}
               ${filter_business_record_count1..}  convert to string  ${filter_business_record_count..}
               log to console   Total count of record from filter "${business}": [${filter_business_record_count1..}]
               log  ${filter_business_record_count1..}
               set global variable  ${filter_business_record_count1..}

               #####below code will get excel record count form export to excel option
               run keyword  Remove old excel file  ${MODULE}.xlsx
               run keyword  User click "Export to Excel" for pr module  ${export_excel_btn}
               sleep  580s
               run keyword  open excel file  ${MODULE}.xlsx
               run keyword  Remove old excel file  ${MODULE}.xlsx
               log to console  Total row count from excel for business "${business}_${MODULE}":[${total_no.ofrows_excel}]
               set global variable  ${total_no.ofrows_excel}

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
                    ${grid_count_product..}  set variable  ${json["count"]}
                    ${grid_count_product}  convert to string  ${grid_count_product..}

    #                run keyword  project api
    #                ${total count of records from grid}  evaluate  ${grid_count_project}+${grid_count_product}
                    log to console  Total count of record from grid "${business}": [${grid_count_product}]
                    set global variable  ${grid_count_product}

                    connect to database  dbConfigFile=${dbfile}
              ${queryResults}  QUERY  select count(*) as count from public.purchase_reqs_v where plant_business='${business}';
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
              ${record count from db_grid}  convert to string  ${queryResults1..}
              set global variable  ${record count from db_grid}
              log to console  Total count of records from grid from DB"${business}_${MODULE}":[${record count from db_grid}]

                      ${Total_from_heatmap_count}  get text  ${heatmap total value}
        ${Total_from_heatmap_count..}=  execute javascript  var string = "${Total_from_heatmap_count}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${Total_from_heatmap_count..}
     ${queryResults1}  convert to string  ${Total_from_heatmap_count..}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${Total_from_heatmap_count1}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${Total_from_heatmap_count1}
    set global variable  ${Total_from_heatmap_count1}
        log to console  total count from Heatmap for "${business}":[${Total_from_heatmap_count1}]


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

Filter ,excel, api,database record count should be equal
                 run keyword and continue on failure  should be equal  ${grid_count_product}  ${record count from db_grid}
                 run keyword and continue on failure  should be equal  ${total_no.ofrows_excel}  ${filter_business_record_count1..}
                 run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${total_no.ofrows_excel}

Click edit filters and select Aging buckets filter
           wait until element is visible  ${Edit filter button}  20s
           click element  ${Edit filter button}
           wait until element is visible  ${Aging Bucket filter}  20s
           click element  ${Aging Bucket filter}
           click element  ${Continue button}
           sleep  3s

select "${aging}" from aging bucket filter
          click element  age_bucket
          wait until element is visible  product-${aging}  30s
          click element  product-${aging}
          click element  ${Aging Bucket filter_apply_button}
          sleep  7s

Get "${aging}" total value from "+5 days overdue" coulumn value from heatmap for business "${business}"
           ${5+Total_from_heatmap_count}  get text  ${5+heatmap total value}
        ${5+Total_from_heatmap_count..}=  execute javascript  var string = "${5+Total_from_heatmap_count}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${5+Total_from_heatmap_count..}
     ${queryResults1}  convert to string  ${5+Total_from_heatmap_count..}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${1-2Total_from_heatmap_count1}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${1-2Total_from_heatmap_count1}
    set global variable  ${1-2Total_from_heatmap_count1}
        log to console  total count from Heatmap for "${business}_${aging}":[${5+Total_from_heatmap_count1}]

get the total column total value for "${aging}" column from hatmap for business "${business}"
        ${Total_from_heatmap_count}  get text  ${heatmap total value}
        ${Total_from_heatmap_count..}=  execute javascript  var string = "${Total_from_heatmap_count}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${Total_from_heatmap_count..}
     ${queryResults1}  convert to string  ${Total_from_heatmap_count..}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${Total_from_heatmap_count1}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${Total_from_heatmap_count1}
    set global variable  ${Total_from_heatmap_count1}
        log to console  total count from Heatmap for "${business}":[${Total_from_heatmap_count1}]

Total value of "5+" should be equal to "total col" value
        run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${5+Total_from_heatmap_count1}

get sum of value(usd) column where aging is "${aging}" from excel for business "${business}"
             run keyword  User click "Export to Excel"  ${export_excel_btn}
            ${status}=  run keyword and return status  log  %{HOME}
            ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

           ${aging sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseReqs.xlsx  Value (USD)
           [Return]  ${aging sum from excel}
           ${tup1}  set variable  ${aging sum from excel}
           ${aging sum from excel.}  execute javascript  if(${tup1} == 0 || ${tup1} == undefined || ${tup1} == null ){return 0;}var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; }
           log  ${aging sum from excel.}
           ${aging sum from excel..}  convert to string  ${aging sum from excel.}
           set global variable  ${aging sum from excel..}
           log to console  Sum for "${aging}" from Excel for "${business}":[${aging sum from excel..}]

Total of "5+" should be equal to total sum of value(usd) from excel
            run keyword and continue on failure  should be equal  ${5+Total_from_heatmap_count1}  ${aging sum from excel..}

Get sum of value (usd) where Aging is "${aging}" from Database query(as grid is getting data from databse) for business "${business}" and view "${module}"
           connect to database  dbConfigFile=${dbfile}
              ${queryResults}  QUERY  select sum(${aging}) from public.purchase_reqs_v where plant_business='${business}'
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
              ${record count from db_grid}  convert to string  ${queryResults1..}
              set global variable  ${record count from db_grid}
              log to console  Total count of records from grid from DB"${business}_${module}":[${record count from db_grid}]

Total value of "${aging}" freom excel should be equal to "sum" value from db
              run keyword and continue on failure  should be equal  ${aging sum from excel..}  ${record count from db_grid}

Get "${aging}" total value from "1-2 days overdue" coulumn value from heatmap for business "${business}"
             ${1-2Total_from_heatmap_count}  get text  ${1-2heatmap total value}
             ${1-2Total_from_heatmap_count..}=  execute javascript  var string = "${1-2Total_from_heatmap_count}"; var returnStr = string.split(" ",1); return returnStr;
             [Return]  ${1-2Total_from_heatmap_count..}
              ${queryResults1}  convert to string  ${1-2Total_from_heatmap_count..}
              ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${1-2Total_from_heatmap_count1}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${1-2Total_from_heatmap_count1}
    set global variable  ${1-2Total_from_heatmap_count1}
        log to console  total count from Heatmap for "${business}_${aging}":[${1-2Total_from_heatmap_count1}]

Total value of "1-2 days overdue" should be equal to "total col" value
            run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${1-2Total_from_heatmap_count1}

Total of "1-2 days overdue" should be equal to total sum of value(usd) from excel
           run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${aging sum from excel..}

Get "${aging}" total value from "3-4 days overdue" coulumn value from heatmap for business "${business}"
       ${3-4Total_from_heatmap_count}  get text  ${3-4heatmap total value}
             ${3-4Total_from_heatmap_count..}=  execute javascript  var string = "${3-4Total_from_heatmap_count}"; var returnStr = string.split(" ",1); return returnStr;
             [Return]  ${3-4Total_from_heatmap_count..}
              ${queryResults1}  convert to string  ${3-4Total_from_heatmap_count..}
              ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${3-4Total_from_heatmap_count1}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${3-4Total_from_heatmap_count1}
    set global variable  ${3-4Total_from_heatmap_count1}
        log to console  total count from Heatmap for "${business}_${aging}":[${3-4Total_from_heatmap_count1}]

Total value of "3-4 days overdue" should be equal to "total col" value
       run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${3-4Total_from_heatmap_count1}

Total of "3-4 days overdue" should be equal to total sum of value(usd) from excel
       run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${aging sum from excel..}

Get "${aging}" total value from "<0 days overdue" coulumn value from heatmap for business "${business}"
              ${<0Total_from_heatmap_count}  get text  ${<0heatmap total value}
             ${<0Total_from_heatmap_count..}=  execute javascript  var string = "${<0Total_from_heatmap_count}"; var returnStr = string.split(" ",1); return returnStr;
             [Return]  ${<0Total_from_heatmap_count..}
              ${queryResults1}  convert to string  ${<0Total_from_heatmap_count..}
              ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${<0Total_from_heatmap_count1}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${<0Total_from_heatmap_count1}
    set global variable  ${<0Total_from_heatmap_count1}
        log to console  total count from Heatmap for "${business}_${aging}":[${<0Total_from_heatmap_count1}]

Total value of "<0 days overdue" should be equal to "total col" value
         run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${<0Total_from_heatmap_count1}

Total of "<0 days overdue" should be equal to total sum of value(usd) from excel
        run keyword and continue on failure  should be equal  ${Total_from_heatmap_count1}  ${aging sum from excel..}
