*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Library  DatabaseLibrary
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
      click link   ${link}
      sleep  18s
      wait until page contains  addFilterBtn  10s

User should see "Requisitions (incl. Planned)"
      wait until element is visible  ${Purchase Requisition title}  10s
      ${title}  get text  ${Purchase Requisition title}
      log  ${title}
      should be equal  ${title}  Requisitions (incl. Planned)
      [Return]  ${title}

User should see "PURCHASE REQUISITION ITEMS BY"
      wait until element is visible  ${purchase_req_items_by}  10s
      ${title}  get text  ${purchase_req_items_by}
      log  ${title}
      should be equal  ${title}  PURCHASE REQUISITION ITEMS BY
      [Return]  ${title}

User should see dropdown box having name Buyer on it
       wait until element is visible  //*[@id="dropcell"]  10s
       ${title}  get text  //*[@id="dropcell"]
       log  ${title}
       should be equal  ${title}  Buyer
       [Return]  ${title}

User should able to select and Verify the list(vendor,planner,material,plant,buyer)on Buyer dropdown box
        wait until element is visible  ${buyer dropdown}  10s
        click element  ${buyer dropdown}
        ${list}  get text  ${Buyer List}
        log  ${list}
        ${foundItem}  Run Keyword And Return Status  should contain  ${list}  Buyer
        ${foundItem}  Run Keyword And Return Status  should contain  ${list}  Vendor
        ${foundItem}  Run Keyword And Return Status  should contain  ${list}  Planner
        ${foundItem}  Run Keyword And Return Status  should contain  ${list}  Material
        ${foundItem}  Run Keyword And Return Status  should contain  ${list}  Plant

User should see Show/Hide Columns button
        wait until element is visible  ${show/hide column}  10s
        ${title}  get text  ${show/hide column}
        log  ${title}
        should be equal  ${title}  Show/Hide Columns
        [Return]  ${title}

User should see following column "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column "${test8}" column
        wait until element is visible  xpath=//table/thead//th//span[text()='${test}']  30s
        element should be visible  xpath=//table/thead//th//span[text()='${test2}']
        element should be visible  xpath=//table/thead//th//span[text()='${test3}']
        wait until element is visible  xpath=//table/thead//th//span[text()='${test4}']  10s
        element should be visible  xpath=//table/thead//th//span[text()='${test4}']
        element should be visible  xpath=//table/thead//th//span[text()='${test5}']
        element should be visible  xpath=//table/thead//th//span[text()='${test6}']
        element should be visible  xpath=//table/thead//th//span[text()='${test7}']
        #element should be visible  xpath=//table/thead//th//span[text()='${test8}']

User see Excel to Export option on Purchase requisitions landing page
        wait until element is visible  ${Export to Excel}  10s
        ${title}  get text  ${Export to Excel}
        log  ${title}
        should be equal  ${title}  Export to Excel

select plant from plant filter and hit apply button
        click element  plant
        click element  product-0010 - Charlottesville
        wait until element is visible  ${Apply Button}  10s
        click button  ${Apply Button}
        sleep  5s

sub_business "altais-erp" from sub_business filter and change view to plant
         wait until element is visible  addFilterBtn  20s
         click element  addFilterBtn
         wait until element is visible  ${sub_business_filter}   20s
         click element  ${sub_business_filter}
         wait until element is visible  continue  20s
         click element  continue
         wait until element is visible  sub_business  20s
         click element  sub_business
         sleep  2s
         click element  product-GS
         click element  product-GS-AIS
         click element  product-GS-GA
         click element  product-GS-GIS
         click element  product-GS-PTR
         click element  product-GS-RPC
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         click element  ${buyer_dropdown}
         click element  ${select_plant_from_buyerdropdown}
         sleep  16s

unselect altais -erp plants from sub_business filter
         click element  sub_business
         click element  product-GS
         click element  product-GS-AIS
         click element  product-GS-GA
         click element  product-GS-GIS
         click element  product-GS-PTR
         click element  product-GS-RPC
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  15s

unselect bravo -erp plants from sub_business filter
         click element  sub_business
         run keyword and continue on failure  click element  product-GS
         run keyword and continue on failure  click element  product-GS-GA
         run keyword and continue on failure  click element  product-AC
         run keyword and continue on failure  click element  product-GS-RPC
         run keyword and continue on failure  click element  product-GS-AIS
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  13s

Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module
        :FOR  ${i}  IN RANGE  1  14  2
        \  ${plant_name_col1}  mouse over  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${plant_name_col1_text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${plant_name_col1_text}
        \  ${significant_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${significant_col_value}
        \  ${significan_col_value..}  replace string   ${significant_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(significant) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${queryResults3..}  convert to string  ${queryResults2..}
        \  run keyword and continue on failure  should be equal  ${significan_col_value..}  ${queryResults3..}
        \  ${future_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${future_col_value}
        \  ${future_col_value..}  replace string  ${future_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(future) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2...}
        \  ${queryResults3...}  convert to string  ${queryResults2...}
        \  run keyword and continue on failure  should be equal  ${future_col_value..}  ${queryResults3...}
        \  ${moderate_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${moderate_col_value}
        \  ${moderate_col_value..}  replace string  ${moderate_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(moderate) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults1..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults1...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1..}};
        \  log  ${queryResults1...}
        \  ${queryResults1....}  convert to string  ${queryResults1...}
        \  run keyword and continue on failure  should be equal  ${moderate_col_value..}  ${queryResults1....}
        \  ${acceptable_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${acceptable_col_value}
        \  ${acceptable_col_value..}  replace string  ${acceptable_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(acceptable) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults4..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults4..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults4..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults4..}};
        \  log  ${queryResults4..}
        \  ${queryResults4...}  convert to string  ${queryResults4..}
        \  run keyword and continue on failure  should be equal  ${acceptable_col_value..}  ${queryResults4...}
        \  ${avg_aging_days_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[7]/vaadin-grid-cell-content/mo-column/div
        \  log  ${avg_aging_days_col_value}
        \  ${avg_aging_days_col_value..}  Evaluate  '${avg_aging_days_col_value}'.replace(',','')
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select AVG(CASE WHEN age_bucket='<0' THEN NULL ELSE net_days_for_age_bucket END) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}';
        \  log  ${queryResults}
        \  ${convert}  convert to string  ${queryResults}
        \  ${queryResults00}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults0.}  replace string using regexp  ${queryResults00}  \\)|\,  ${EMPTY}
        \  ${queryResults0}  replace string using regexp  ${queryResults0.}  \\[|\,  ${EMPTY}
        \  ${queryResults0..}  replace string using regexp  ${queryResults0}  \\]|\,  ${EMPTY}
        \  ${queryResults0...}  replace string using regexp  ${queryResults0..}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResults01...}  replace string  ${queryResults0...}  '  ${EMPTY}
        \  ${queryResults01..}  replace string  ${queryResults01...}  '  ${EMPTY}
        \  log  ${queryResults01..}
        \  ${tup1}  set variable  ${queryResults01..}
        \  ${DB_value}  execute javascript  var num = 0; if(Number(${queryResults01..}).toFixed(1) %1 === 0) {return Number(Number(${queryResults01..}).toFixed(1)).valueOf()} else { num  = Number(${queryResults01..}).toFixed(1); return num;};
        \  ${queryResults7...}  convert to string  ${DB_value}
        \  run keyword and continue on failure  should be equal  ${avg_aging_days_col_value..}  ${queryResults7...}

Verify numbers in heatmap by selecting sub_business "bravo" and select plant from items by dropdown and verify all column values for count view in PR module
        click element  sub_business
        sleep  3s
        run keyword and continue on failure  click element  product-GS-GA
        run keyword and continue on failure  click element  product-AC
        run keyword and continue on failure  click element  product-GS-RPC
        run keyword and continue on failure  click element  product-GS-AIS
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  20s
        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module

unselect 12-pack_powermax -erp plants from sub_business filter
         click element  sub_business
         click element  product-Onshore Wind
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  13s

Verify numbers in heatmap by selecting sub_business "12-pack_powermax" and select plant from items by dropdown and verify all column values for count view in PR module
        click element  sub_business
        sleep  3s
        click element  product-Onshore Wind
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  16s
        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module

##==============================================================================================================================================================================================
##uselect "get_cas-transportation" plants from plant sub_business
##         click element  sub_business
##         wait until element is visible  ${plant_search_input}   10s
##         ${text1}  input text  ${plant_search_input}   Transportation
##        click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div[2]/span
##       wait until element is visible  ${sub_business_apply_button}  20s
##         click element  ${sub_business_apply_button}
##         sleep  6s
##
##Verify numbers in heatmap by selecting sub_business "get_cas-transportation" and select plant from items by dropdown and verify all column values for count view in PR module
##        click element  sub_business
##        sleep  3s
##        wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/input   10s
##        ${text1}  input text  //mm-filter[3]/px-filter/div/div[2]/div[2]/input   Transportation
##        click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div[2]/span
##        wait until element is visible  ${sub_business_apply_button}  10s
##        click button  ${sub_business_apply_button}
##        sleep  17s
##        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module

#uselect "gog_ofs" plants from plant sub_business
#         click element  sub_business
#         click element  product-DTS
#         click element  product-Production Solutions
#         click element  product-Power Transmission
#         wait until element is visible  ${sub_business_apply_button}  20s
#         click element  ${sub_business_apply_button}
#         sleep  3s
#
#Verify numbers in heatmap by selecting sub_business "gog_ofs" and select plant from items by dropdown and verify all column values for count view in PR module
#        click element  sub_business
#        sleep  3s
#        click element  product-DTS
#        click element  product-Production Solutions
#        click element  product-Power Transmission
#        wait until element is visible  ${sub_business_apply_button}  10s
#        click button  ${sub_business_apply_button}
#        sleep  15s
#        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module
###========================================================================================================================================================================================================
uselect "pascal" plants from plant sub_business
         click element  sub_business
         run keyword and continue on failure  click element  product-Pressure Control
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting sub_business "pascal" and select plant from items by dropdown and verify all column values for count view in PR module
         click element  sub_business
         sleep  3s
         run keyword and continue on failure  click element  product-Pressure Control
         wait until element is visible  ${sub_business_apply_button}  10s
         click button  ${sub_business_apply_button}
         sleep  15s
        :FOR  ${i}  IN RANGE  1  2
        \  ${plant_name_col1}  mouse over  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${plant_name_col1_text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${plant_name_col1_text}
        \  ${significant_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${significant_col_value}
        \  ${significan_col_value..}  replace string   ${significant_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(significant) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${queryResults3..}  convert to string  ${queryResults2..}
        \  run keyword and continue on failure  should be equal  ${significan_col_value..}  ${queryResults3..}
        \  ${future_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${future_col_value}
        \  ${future_col_value..}  replace string  ${future_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(future) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2...}
        \  ${queryResults3...}  convert to string  ${queryResults2...}
        \  run keyword and continue on failure  should be equal  ${future_col_value..}  ${queryResults3...}
        \  ${moderate_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${moderate_col_value}
        \  ${moderate_col_value..}  replace string  ${moderate_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(moderate) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults1..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults1...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1..}};
        \  log  ${queryResults1...}
        \  ${queryResults1....}  convert to string  ${queryResults1...}
        \  run keyword and continue on failure  should be equal  ${moderate_col_value..}  ${queryResults1....}
        \  ${acceptable_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${acceptable_col_value}
        \  ${acceptable_col_value..}  replace string  ${acceptable_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(acceptable) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults4..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults4..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults4..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults4..}};
        \  log  ${queryResults4..}
        \  ${queryResults4...}  convert to string  ${queryResults4..}
        \  run keyword and continue on failure  should be equal  ${acceptable_col_value..}  ${queryResults4...}
        \  ${avg_aging_days_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[7]/vaadin-grid-cell-content/mo-column/div
        \  log  ${avg_aging_days_col_value}
        \  ${avg_aging_days_col_value..}  Evaluate  '${avg_aging_days_col_value}'.replace(',','')
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select AVG(CASE WHEN age_bucket='<0' THEN NULL ELSE net_days_for_age_bucket END) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}';
        \  log  ${queryResults}
        \  ${convert}  convert to string  ${queryResults}
        \  ${queryResults00}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults0.}  replace string using regexp  ${queryResults00}  \\)|\,  ${EMPTY}
        \  ${queryResults0}  replace string using regexp  ${queryResults0.}  \\[|\,  ${EMPTY}
        \  ${queryResults0..}  replace string using regexp  ${queryResults0}  \\]|\,  ${EMPTY}
        \  ${queryResults0...}  replace string using regexp  ${queryResults0..}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResults01...}  replace string  ${queryResults0...}  '  ${EMPTY}
        \  ${queryResults01..}  replace string  ${queryResults01...}  '  ${EMPTY}
        \  log  ${queryResults01..}
        \  ${tup1}  set variable  ${queryResults01..}
        \  ${DB_value}  execute javascript  var num = 0; if(Number(${queryResults01..}).toFixed(1) %1 === 0) {return Number(Number(${queryResults01..}).toFixed(1)).valueOf()} else { num  = Number(${queryResults01..}).toFixed(1); return num;};
        \  ${queryResults7...}  convert to string  ${DB_value}
        \  run keyword and continue on failure  should be equal  ${avg_aging_days_col_value..}  ${queryResults7...}

uselect "zeal" plants from plant sub_business
         click element  sub_business
         click element  product-Hydro
         click element  product-Gas Power Systems
         #click element  product-Wind
         click element  product-Assembly COE
         click element  product-Assembly-Thermal COE
         click element  product-Assembly-Transportation COE
         click element  product-Fabrication-Machining-Assembly COE
         click element  product-N/A
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting sub_business "zeal" and select plant from items by dropdown and verify all column values for count view in PR module
        click element  sub_business
        sleep  4s
        click element  product-Hydro
        click element  product-Gas Power Systems
        click element  product-Assembly COE
        click element  product-Assembly-Thermal COE
        click element  product-Assembly-Transportation COE
        click element  product-Fabrication-Machining-Assembly COE
        click element  product-N/A
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  16s
        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module

uselect "hc_glprod_healthcare" plants from plant sub_business
         click element  sub_business
         click element  product-Healthcare
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting sub_business "hc_glprod_healthcare" and select plant from items by dropdown and verify all column values for count view in PR module
        click element  sub_business
        sleep  2s
        click element  product-Healthcare
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  16s
        :FOR  ${i}  IN RANGE  1  5
        \  ${plant_name_col1}  mouse over  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${plant_name_col1_text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${plant_name_col1_text}
        \  ${significant_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${significant_col_value}
        \  ${significan_col_value..}  replace string   ${significant_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(significant) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${queryResults3..}  convert to string  ${queryResults2..}
        \  run keyword and continue on failure  should be equal  ${significan_col_value..}  ${queryResults3..}
        \  ${future_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${future_col_value}
        \  ${future_col_value..}  replace string  ${future_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(future) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2...}
        \  ${queryResults3...}  convert to string  ${queryResults2...}
        \  run keyword and continue on failure  should be equal  ${future_col_value..}  ${queryResults3...}
        \  ${moderate_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${moderate_col_value}
        \  ${moderate_col_value..}  replace string  ${moderate_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(moderate) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults1..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults1...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1..}};
        \  log  ${queryResults1...}
        \  ${queryResults1....}  convert to string  ${queryResults1...}
        \  run keyword and continue on failure  should be equal  ${moderate_col_value..}  ${queryResults1....}
        \  ${acceptable_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${acceptable_col_value}
        \  ${acceptable_col_value..}  replace string  ${acceptable_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(acceptable) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults4..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults4..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults4..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults4..}};
        \  log  ${queryResults4..}
        \  ${queryResults4...}  convert to string  ${queryResults4..}
        \  run keyword and continue on failure  should be equal  ${acceptable_col_value..}  ${queryResults4...}
        \  ${avg_aging_days_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[7]/vaadin-grid-cell-content/mo-column/div
        \  log  ${avg_aging_days_col_value}
        \  ${avg_aging_days_col_value..}  Evaluate  '${avg_aging_days_col_value}'.replace(',','')
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select AVG(CASE WHEN age_bucket='<0' THEN NULL ELSE net_days_for_age_bucket END) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}';
        \  log  ${queryResults}
        \  ${convert}  convert to string  ${queryResults}
        \  ${queryResults00}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults0.}  replace string using regexp  ${queryResults00}  \\)|\,  ${EMPTY}
        \  ${queryResults0}  replace string using regexp  ${queryResults0.}  \\[|\,  ${EMPTY}
        \  ${queryResults0..}  replace string using regexp  ${queryResults0}  \\]|\,  ${EMPTY}
        \  ${queryResults0...}  replace string using regexp  ${queryResults0..}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResults01...}  replace string  ${queryResults0...}  '  ${EMPTY}
        \  ${queryResults01..}  replace string  ${queryResults01...}  '  ${EMPTY}
        \  log  ${queryResults01..}
        \  ${tup1}  set variable  ${queryResults01..}
        \  ${DB_value}  execute javascript  var num = 0; if(Number(${queryResults01..}).toFixed(1) %1 === 0) {return Number(Number(${queryResults01..}).toFixed(1)).valueOf()} else { num  = Number(${queryResults01..}).toFixed(1); return num;};
        \  ${queryResults7...}  convert to string  ${DB_value}
        \  run keyword and continue on failure  should be equal  ${avg_aging_days_col_value..}  ${queryResults7...}

uselect "powermax" plants from plant sub_business
         click element  sub_business
         click element  product-Gas Power Systems
         click element  product-Hydro
         click element  product-Onshore
         click element  product-Onshore Wind
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting sub_business "powermax" and select plant from items by dropdown and verify all column values for count view in PR module
        click element  sub_business
        sleep  3s
        click element  product-Gas Power Systems
        click element  product-Hydro
        #click element  product-Onshore
        click element  product-Onshore Wind
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  16s
        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module

uselect "alpha" plants from plant sub_business
         click element  sub_business
         sleep  2s
         click element  product-Gas Power Systems
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting sub_business "alpha" and select plant from items by dropdown and verify all column values for count view in PR module
         click element  sub_business
         sleep  4s
         click element  product-Gas Power Systems
         wait until element is visible  ${sub_business_apply_button}  10s
         click button  ${sub_business_apply_button}
         sleep  16s
        :FOR  ${i}  IN RANGE  1  8  2
        \  ${plant_name_col1}  mouse over  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        #\  sleep  2s
        \  ${plant_name_col1_text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${plant_name_col1_text}
        \  ${significant_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${significant_col_value}
        \  ${significan_col_value..}  replace string   ${significant_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(significant) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${queryResults3..}  convert to string  ${queryResults2..}
        \  run keyword and continue on failure  should be equal  ${significan_col_value..}  ${queryResults3..}
        \  ${future_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${future_col_value}
        \  ${future_col_value..}  replace string  ${future_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(future) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2...}
        \  ${queryResults3...}  convert to string  ${queryResults2...}
        \  run keyword and continue on failure  should be equal  ${future_col_value..}  ${queryResults3...}
        \  ${moderate_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${moderate_col_value}
        \  ${moderate_col_value..}  replace string  ${moderate_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(moderate) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults1..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults1...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1..}};
        \  log  ${queryResults1...}
        \  ${queryResults1....}  convert to string  ${queryResults1...}
        \  run keyword and continue on failure  should be equal  ${moderate_col_value..}  ${queryResults1....}
        \  ${acceptable_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${acceptable_col_value}
        \  ${acceptable_col_value..}  replace string  ${acceptable_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(acceptable) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults4..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults4..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults4..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults4..}};
        \  log  ${queryResults4..}
        \  ${queryResults4...}  convert to string  ${queryResults4..}
        \  run keyword and continue on failure  should be equal  ${acceptable_col_value..}  ${queryResults4...}
        \  ${avg_aging_days_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[7]/vaadin-grid-cell-content/mo-column/div
        \  log  ${avg_aging_days_col_value}
        \  ${avg_aging_days_col_value..}  Evaluate  '${avg_aging_days_col_value}'.replace(',','')
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select AVG(CASE WHEN age_bucket='<0' THEN NULL ELSE net_days_for_age_bucket END) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}';
        \  log  ${queryResults}
        \  ${convert}  convert to string  ${queryResults}
        \  ${queryResults00}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults0.}  replace string using regexp  ${queryResults00}  \\)|\,  ${EMPTY}
        \  ${queryResults0}  replace string using regexp  ${queryResults0.}  \\[|\,  ${EMPTY}
        \  ${queryResults0..}  replace string using regexp  ${queryResults0}  \\]|\,  ${EMPTY}
        \  ${queryResults0...}  replace string using regexp  ${queryResults0..}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResults01...}  replace string  ${queryResults0...}  '  ${EMPTY}
        \  ${queryResults01..}  replace string  ${queryResults01...}  '  ${EMPTY}
        \  log  ${queryResults01..}
        \  ${tup1}  set variable  ${queryResults01..}
        \  ${DB_value}  execute javascript  var num = 0; if(Number(${queryResults01..}).toFixed(1) %1 === 0) {return Number(Number(${queryResults01..}).toFixed(1)).valueOf()} else { num  = Number(${queryResults01..}).toFixed(1); return num;};
        \  ${queryResults7...}  convert to string  ${DB_value}
        \  run keyword and continue on failure  should be equal  ${avg_aging_days_col_value..}  ${queryResults7...}

uselect "racesbi_ods-onshorewind" plants from plant sub_business
         click element  sub_business
         click element  product-Onshore Wind
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting plant "racesbi_ods-onshorewind" and planner by planner and verify all column values for count view in PR module
        click element  sub_business
        sleep  2s
        click element  product-Onshore Wind
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  16s
        :FOR  ${i}  IN RANGE  1  4
        \  ${plant_name_col1}  mouse over  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${plant_name_col1_text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${plant_name_col1_text}
        \  ${significant_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${significant_col_value}
        \  ${significan_col_value..}  replace string   ${significant_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(significant) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${queryResults3..}  convert to string  ${queryResults2..}
        \  run keyword and continue on failure  should be equal  ${significan_col_value..}  ${queryResults3..}
        \  ${future_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${future_col_value}
        \  ${future_col_value..}  replace string  ${future_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(future) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2...}
        \  ${queryResults3...}  convert to string  ${queryResults2...}
        \  run keyword and continue on failure  should be equal  ${future_col_value..}  ${queryResults3...}
        \  ${moderate_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${moderate_col_value}
        \  ${moderate_col_value..}  replace string  ${moderate_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(moderate) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults1..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults1...}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1..}};
        \  log  ${queryResults1...}
        \  ${queryResults1....}  convert to string  ${queryResults1...}
        \  run keyword and continue on failure  should be equal  ${moderate_col_value..}  ${queryResults1....}
        \  ${acceptable_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${acceptable_col_value}
        \  ${acceptable_col_value..}  replace string  ${acceptable_col_value}  ,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select sum(acceptable) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}' group by plant_code_plant_short_name;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults4..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults4..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults4..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults4..}};
        \  log  ${queryResults4..}
        \  ${queryResults4...}  convert to string  ${queryResults4..}
        \  run keyword and continue on failure  should be equal  ${acceptable_col_value..}  ${queryResults4...}
        \  ${avg_aging_days_col_value}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[7]/vaadin-grid-cell-content/mo-column/div
        \  log  ${avg_aging_days_col_value}
        \  ${avg_aging_days_col_value..}  Evaluate  '${avg_aging_days_col_value}'.replace(',','')
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select AVG(CASE WHEN age_bucket='<0' THEN NULL ELSE net_days_for_age_bucket END) from public.purchase_reqs_v where plant_code_plant_short_name='${plant_name_col1_text}';
        \  log  ${queryResults}
        \  ${convert}  convert to string  ${queryResults}
        \  ${queryResults00}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults0.}  replace string using regexp  ${queryResults00}  \\)|\,  ${EMPTY}
        \  ${queryResults0}  replace string using regexp  ${queryResults0.}  \\[|\,  ${EMPTY}
        \  ${queryResults0..}  replace string using regexp  ${queryResults0}  \\]|\,  ${EMPTY}
        \  ${queryResults0...}  replace string using regexp  ${queryResults0..}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResults01...}  replace string  ${queryResults0...}  '  ${EMPTY}
        \  ${queryResults01..}  replace string  ${queryResults01...}  '  ${EMPTY}
        \  log  ${queryResults01..}
        \  ${tup1}  set variable  ${queryResults01..}
        \  ${DB_value}  execute javascript  var num = 0; if(Number(${queryResults01..}).toFixed(1) %1 === 0) {return Number(Number(${queryResults01..}).toFixed(1)).valueOf()} else { num  = Number(${queryResults01..}).toFixed(1); return num;};
        \  ${queryResults7...}  convert to string  ${DB_value}
        \  run keyword and continue on failure  should be equal  ${avg_aging_days_col_value..}  ${queryResults7...}

uselect "sap-apcis"" plants from plant sub_business
         click element  sub_business
         click element  product-PC-PE
         click element  product-PC
         click element  product-PC-RM
         wait until element is visible  ${sub_business_apply_button}  20s
         click element  ${sub_business_apply_button}
         sleep  3s

Verify numbers in heatmap by selecting plant ""sap-apcis"" and planner by planner and verify all column values for count view in PR module
        click element  sub_business
        sleep  3s
        click element  product-PC-PE
        click element  product-PC
        click element  product-PC-RM
        wait until element is visible  ${sub_business_apply_button}  10s
        click button  ${sub_business_apply_button}
        sleep  16s
        run keyword  Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module
