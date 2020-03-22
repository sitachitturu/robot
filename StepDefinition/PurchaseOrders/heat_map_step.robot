8/28/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Library/filter_library.robot
*** Keywords ***

verify column header with drop down selection
    [Arguments]  ${id}
    Wait Until Element Is Visible  ${purchase_order_items_by_dropdown}  10s
    click element  ${purchase_order_items_by_dropdown}
    Wait Until Element Is Visible  //ul[@id='list']//li[contains(normalize-space(),'${id}')]  10s
    Click Element  //ul[@id='list']//li[contains(normalize-space(),'${id}')]
    sleep  15s
    #Wait Until Element Is Visible  //mo-grid[@id='purchaseOrdsHeatMap']//*//div[@class='header-cell style-scope mo-grid'], 30s
    ${column_header}  Get Text  //mo-grid[@id='purchaseOrdsHeatMap']//*//div[@class='header-cell style-scope mo-grid']
    should be equal as strings  ${column_header}  ${id}

verify column data with filter drop down data for
    [Arguments]  ${MenuID}
    :FOR  ${i}  IN RANGE  1  9
    \  ${buyer/vendor/planner/plant name from heatmap}  Execute Javascript  return $("#purchaseOrdsHeatMap table tr:nth(${i}) td:nth(0) div").text();
    \  Click Element  ${MenuID}
    \  Input Text  xpath=//mm-filter[@id='${MenuID}']//div[@id='filterContent']//input[@id='search-input']  ${buyer/vendor/planner/plant name from heatmap}
    \  click element  //*[@id='${MenuID}']//a[@id='searchAction']
    \  sleep  2s
    \  element should be visible  //mm-filter[@id='${MenuID}']//div[@id='filterContent']//input[@id='search-input']  ${buyer/vendor/planner/plant name from heatmap}
    \   Click Element  ${MenuID}

verify column data with filter drop down data
    [Arguments]  ${MenuID}
    :FOR  ${i}  IN RANGE  1  9
    \  ${buyer/vendor/planner/plant name from heatmap}  Execute Javascript  return $("#purchaseOrdsHeatMap table tr:nth(${i}) td:nth(0) div").text();
    \  Click Element  ${MenuID}
    \  sleep  6s
    \  Input Text  xpath=//mm-filter[@id='${MenuID}']//div[@id='filterContent']//input[@id='search-input']  ${buyer/vendor/planner/plant name from heatmap}
    \  sleep  2s
    \  element should be visible  //mm-filter[@id='${MenuID}']//div[@id='filterContent']//input[@id='search-input']  ${buyer/vendor/planner/plant name from heatmap}
    \  Click Element  ${MenuID}

User select Plant from plant filter
#    User select Age Classification
    wait until element is visible  ${Age Classification button}  20s
#    User select Count (#)
    wait until element is visible  ${Count(#)}  20s
    connect to database  dbConfigFile=${dbfile}
    ${count}  ROW COUNT  SELECT distinct(plant_code_plant_short_name) FROM public.purchase_ords_v where erp_schema = 'gem_bravo_ascp' FETCH FIRST 10 ROWS ONLY
    ${queryResults}  QUERY  SELECT distinct(plant_code_plant_short_name) FROM public.purchase_ords_v where erp_schema = 'gem_bravo_ascp' FETCH FIRST 10 ROWS ONLY
    log to console  ${count}


    : FOR    ${INDEX}    IN RANGE    1    ${count}
#    User select Plant from plant filter
    \  log to console  ${queryResults[${INDEX}][0]}
    \  click element  plant
    \  wait until element is visible  ${search input}  10s
    \  input text  ${search input}  ${queryResults[${INDEX}][0]}
    \  ${plant_count}  get text  //*[@id="product-${queryResults[${INDEX}][0]}"]/*/*[@class="count style-scope px-filter"]
    \  log  ${plant_count}
    \  ${aa}  replace string  ${plant_count}  (  ${EMPTY}
    \  ${bb}  replace string  ${aa}  )  ${EMPTY}
    \  ${cc}  replace string  ${bb}  ,  ${EMPTY}
    \  ${plant_count..}  convert to string  ${cc}
    \  set global variable  ${plant_count..}
    \  log to console  ${plant_count..}
    \  wait until element is visible  ${plant filter check box}  20s
    \  click element  ${plant filter check box}
    \  wait until element is visible  ApplyBtn  10s
    \  click button  ApplyBtn
#    Count(#) Buyer TOTAL count should match plant total number of records
    \  sleep  15s
    \  click element  ${Second dropdown button}
    \  click element  ${Age Classification}
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Buyer}  20s
    \  click element  ${Buyer}
    \  wait until element is visible  ${Buyer table header}  20s
    \  run keyword  Count view for Age Clasification
    \  run keyword  validate sum of all columns total in heatmap for Age Classification view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Vendor}  30s
    \  click element  ${Vendor}
    \  wait until element is visible  ${Vendor table header}  40s
    \  run keyword  Count view for Age Clasification
    \  run keyword  validate sum of all columns total in heatmap for Age Classification view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Planner}  20s
    \  click element  ${Planner}
    \  wait until element is visible  ${Planner table header}  20s
    \  run keyword  Count view for Age Clasification
    \  run keyword  validate sum of all columns total in heatmap for Age Classification view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Material}  20s
    \  click element  ${Material}
    \  wait until element is visible  ${Material table header}  20s
    \  run keyword  Count view for Age Clasification
    \  run keyword  validate sum of all columns total in heatmap for Age Classification view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Plant}  20s
    \  click element  ${Plant}
    \  wait until element is visible  ${Plant table header}  20s
    \  run keyword  Count view for Age Clasification
    \  run keyword  validate sum of all columns total in heatmap for Age Classification view
    \  log to console  Validating Exception Message view
    \  click element  ${Second dropdown button}
    \  click element  ${Exception Message}
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Buyer}  20s
    \  click element  ${Buyer}
    \  wait until element is visible  ${Buyer table header}  20s
    \  run keyword  validate sum of all columns total in heatmap for Exeption Message view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Vendor}  30s
    \  click element  ${Vendor}
    \  wait until element is visible  ${Vendor table header}  40s
    \  run keyword  validate sum of all columns total in heatmap for Exeption Message view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Planner}  20s
    \  click element  ${Planner}
    \  wait until element is visible  ${Planner table header}  20s
    \  run keyword  validate sum of all columns total in heatmap for Exeption Message view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Material}  20s
    \  click element  ${Material}
    \  wait until element is visible  ${Material table header}  20s
    \  run keyword  validate sum of all columns total in heatmap for Exeption Message view
    \  click element  ${First dropdown button}
    \  wait until element is visible  ${Plant}  20s
    \  click element  ${Plant}
    \  wait until element is visible  ${Plant table header}  20s
    \  run keyword  validate sum of all columns total in heatmap for Exeption Message view
    \  click button  clearFilterBtn

Count view for Age Clasification
    ${total_col_total}  get text  //table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
    ${TempString4}  replace string  ${total_col_total}  |  ${EMPTY}
    ${TempString4..}  replace string  ${TempString4}  ,  ${EMPTY}
    log  ${TempString4..}
    ${text4..}  execute javascript  var string = "${TempString4..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
    ${total_col_total}  convert to string  ${text4..}
    ${aa}  replace string using regexp  ${total_col_total}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Total_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log  ${Total_col_value}
    should be equal  ${Total_col_value}  ${plant_count..}

validate sum of all columns total in heatmap for Age Classification view
    ${60+days_old}  get text  //table/tfoot/tr/td[2]/vaadin-grid-cell-content/mo-column/div
    ${TempString3}  replace string  ${60+days_old}  |  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${60+days_old.}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${60+days_old.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${60+days_old_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${30+days_old_col_total}  get text  //table/tfoot/tr/td[3]/vaadin-grid-cell-content/mo-column/div
    ${TempString}  replace string  ${30+days_old_col_total}  |  ${EMPTY}
    ${TempString..}  replace string  ${TempString}  ,  ${EMPTY}
    log  ${TempString..}
    ${text..}  execute javascript  var string = "${TempString..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text..}
    ${30+days_old_col_total.}  convert to string  ${text..}
    ${aa}  replace string using regexp  ${30+days_old_col_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${30+days_old_col_total...}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${<30days_old_col_total}  get text  //table/tfoot/tr/td[4]/vaadin-grid-cell-content/mo-column/div
    ${TempString1}  replace string  ${<30days_old_col_total}  |  ${EMPTY}
    ${TempString1..}  replace string  ${TempString1}  ,  ${EMPTY}
    log  ${TempString1..}
    ${text1..}  execute javascript  var string = "${TempString1..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text1..}
    ${<30days_old_col_total.}  convert to string  ${text1..}
    ${aa}  replace string using regexp  ${<30days_old_col_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${<30days_old_col_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${on_hold_col_total}  get text  //table/tfoot/tr/td[5]/vaadin-grid-cell-content/mo-column/div
    ${TempString2}  replace string  ${on_hold_col_total}  |  ${EMPTY}
    ${TempString2..}  replace string  ${TempString2}  ,  ${EMPTY}
    log  ${TempString2..}
    ${text2..}  execute javascript  var string = "${TempString2..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text2..}
    ${on_hold_col_total.}  convert to string  ${text2..}
    ${aa}  replace string using regexp  ${on_hold_col_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${on_hold_col_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${future_col_total}  get text  //table/tfoot/tr/td[6]/vaadin-grid-cell-content/mo-column/div
    ${TempString2}  replace string  ${future_col_total}  |  ${EMPTY}
    ${TempString2..}  replace string  ${TempString2}  ,  ${EMPTY}
    log  ${TempString2..}
    ${text2..}  execute javascript  var string = "${TempString2..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text2..}
    ${future_col_total.}  convert to string  ${text2..}
    ${aa}  replace string using regexp  ${future_col_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${future_col_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${adding_all cols}  evaluate  ${60+days_old_total..}+${30+days_old_col_total...}+${<30days_old_col_total..}+${on_hold_col_total..}+${future_col_total..}
    log  ${adding_all cols}
    ${adding_all cols..}  convert to string  ${adding_all cols}
    ${total_col_total}  get text  //table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
    ${TempString4}  replace string  ${total_col_total}  |  ${EMPTY}
    ${TempString4..}  replace string  ${TempString4}  ,  ${EMPTY}
    log  ${TempString4..}
    ${text4..}  execute javascript  var string = "${TempString4..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
    ${total_col_total}  convert to string  ${text4..}
    ${aa}  replace string using regexp  ${total_col_total}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Total_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log  ${Total_col_value}
    should be equal  ${Total_col_value}  ${adding_all cols..}

validate sum of all columns total in heatmap for Exeption Message view
    ${cancellation_total}  get text  //table/tfoot/tr/td[3]/vaadin-grid-cell-content/mo-column/div
    ${TempString3}  replace string  ${cancellation_total}  |  ${EMPTY}
    ${TempString3.}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3.}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${cancellation_total.}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${cancellation_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${cancellation_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${Reschedule_in_total}  get text  //table/tfoot/tr/td[4]/vaadin-grid-cell-content/mo-column/div
    ${TempString3}  replace string  ${Reschedule_in_total}  |  ${EMPTY}
    ${TempString3.}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3.}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${Reschedule_in_total.}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${Reschedule_in_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Reschedule_in_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${Reschedule_out_total}  get text  //table/tfoot/tr/td[5]/vaadin-grid-cell-content/mo-column/div
    ${TempString3}  replace string  ${Reschedule_out_total}  |  ${EMPTY}
    ${TempString3.}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3.}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${Reschedule_out_total.}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${Reschedule_out_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Reschedule_out_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${NoException_total}  get text  //table/tfoot/tr/td[6]/vaadin-grid-cell-content/mo-column/div
    ${TempString3}  replace string  ${NoException_total}  |  ${EMPTY}
    ${TempString3.}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3.}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${NoException_total.}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${NoException_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${NoException_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${Overdue_total}  get text  //table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
    ${TempString3}  replace string  ${Overdue_total}  |  ${EMPTY}
    ${TempString3.}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3.}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${Overdue_total.}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${Overdue_total.}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Overdue_total..}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    ${adding_all cols}  evaluate  ${cancellation_total..}+${Reschedule_in_total..}+${Reschedule_out_total..} +${Overdue_total..}+${NoException_total..}
    log  ${adding_all cols}
#                         ${tup1}  set variable  ${adding_all cols}
#                         ${round_adding_all}  execute javascript  var num = 0; num  = Number(${tup1}).toFixed(1); return num;
#                         log  ${round_adding_all}
    ${adding_all cols..}  convert to string  ${adding_all cols}
    should be equal  ${adding_all cols..}  ${plant_count..}
