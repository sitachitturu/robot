*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Library  DatabaseLibrary
Library	 HttpLibrary.HTTP
Library	 RequestsLibrary
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
     click link  ${link}
     wait until element is visible  ${show/hide column}  10s

click show/hide column button and user should see list of columns in show/hide columns
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     #wait until element is visible  ${first_show/hide_element}   15s
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${purchase_requi_show/hide_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

execute database query for planner/mrp controller and buyer/purchasing group and create list of planner names,Buyer names and Planner names should not be same as buyer names
      connect to database  dbConfigFile=${dbfile}
      ${queryResults}  QUERY  SELECT CASE WHEN mrp_controller_name IS NOT NULL THEN mrp_controller_name ELSE 'NULL' END AS "mrp_controller_name" FROM "purchase_reqs_v" AS "purchase_reqs" where plant_business = 'Renewables' GROUP BY "mrp_controller_name" ORDER BY "purchase_reqs"."mrp_controller_name" ASC;
      log  ${queryResults}
      ${aaa}  convert to string  ${queryResults}
      ${queryResults1}  replace string using regexp  ${aaa}  \\[|\,  ${EMPTY}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\]|\,  ${EMPTY}
      ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\'|\,  ${EMPTY}
      ${queryResults.}  replace string using regexp  ${queryResults1..}  \\'|\,  ${EMPTY}
      ${queryResults..1}  Evaluate  '${queryResults.}'.replace('(','')
      ${queryResultsa}  Evaluate  '${queryResults..1}'.replace(')','')
      log  ${queryResultsa}
      ${planner_filter_list}  create list  ${queryResultsa}
      log  ${planner_filter_list}
      connect to database  dbConfigFile=${dbfile}
      ${queryResults22}  QUERY  SELECT CASE WHEN purchasing_group_name_buyer_name IS NOT NULL THEN purchasing_group_name_buyer_name ELSE 'NULL' END AS "purchasing_group_name_buyer_name" FROM "purchase_reqs_v" AS "purchase_reqs" where plant_business = 'Renewables' GROUP BY "purchasing_group_name_buyer_name" ORDER BY "purchase_reqs"."purchasing_group_name_buyer_name" ASC;
      log  ${queryResults22}
      ${aab}  convert to string  ${queryResults22}
      ${queryResults2}  replace string using regexp  ${aab}  \\[|\,  ${EMPTY}
      ${queryResults2.}  replace string using regexp  ${queryResults2}  \\]|\,  ${EMPTY}
      ${queryResults2..}  replace string using regexp  ${queryResults2.}  \\'|\,  ${EMPTY}
      ${queryResults.2}  replace string using regexp  ${queryResults2..}  \\'|\,  ${EMPTY}
      ${queryResults..2}  Evaluate  '${queryResults.2}'.replace('(','')
      ${queryResultsb}  Evaluate  '${queryResults..2}'.replace(')','')
      log  ${queryResultsb}
      ${Buyer_filter_list}  create list  ${queryResultsb}
      log  ${Buyer_filter_list}
      should not be equal  ${planner_filter_list}  ${Buyer_filter_list}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

user enters module and scroll page down
     sleep  3s
     RUN KEYWORD  scroll page to location  0  1000000

User should see "© 2017 General Electric" changed to "© 2018 General Electric"
    ${Copyright text}  get text  //div[2]/mo-footer/footer/span/span
    log  ${Copyright text}
    should be equal  ${Copyright text}  © 2018 General Electric

User selects races plants from purchase requisition module
     click element  plant
     sleep  6s
     input text  search-input  DE1
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  DE1 - IO Manufacturing Germany
     input text  search-input  DE2
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  DE2 - IO Field Services Germany
     input text  search-input  DE3
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  DE3 - IO Repair Shop Germany
     input text  search-input  DE4
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  DE4 - IO Central Warehouse Germany
     input text  search-input  DE5
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  DE5 - IO Central Warehouse Germany (CM&U & Top Issues)
     input text  search-input  PNS
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  PNS - IO Pensacola (Factory LLC)
     input text  search-input  GNA
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  GNA - GERNA Project
     input text  search-input  GEI
     click element  ${lazy_loading_search_icon_filter}
     sleep  2s
     run keyword and continue on failure  click element  GEI - GEII Projects
     wait until element is visible  ApplyBtn  20s
     click element  ApplyBtn
     sleep  10s

select created by column from show/hide list
     run keyword  scroll page to location  0  100000
     sleep  5   s
     wait until element is visible  ${show/hide column}  10s
     click button  ${show/hide column}
     sleep  7s
     click element  ${order type from show/hide}
     click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Age (Bucket)']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Delivery Date']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Material SKU']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Value (USD)']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Requisition Date']
     click element  ${created by column from show/hide}
     click element  ${processing_status col from show/hide}
     sleep  4s
     click element  ${show/hide column}

Run quesry in db and get po number from ui and compare the result
       :FOR  ${i}  IN RANGE  1  9
      \  ${pr_number}  execute javascript  return $("#productionOrderGrid table tr:nth(1) td:nth(0) div").text();
      \  log  ${pr_number}
      \  ${created_by result in ui}  execute javascript  return $("#productionOrderGrid table tr:nth(1) td:nth(3) div").text();
      \  log  ${created_by result in ui}
      \  ${created_by result in ui..}  replace string using regexp  ${created_by result in ui}  \\,|\,  ${EMPTY}
      \  log  ${created_by result in ui..}
      \  connect to database  dbConfigFile=${dbfile}
      \  ${queryResults}  QUERY  select distinct created_by from public.purchase_reqs_v where purchase_req_num='${pr_number}' limit 1;
      \  log  ${queryResults}
      \  ${aaa}  convert to string  ${queryResults}
      \  ${queryResults1}  replace string using regexp  ${aaa}  \\[|\,  ${EMPTY}
      \  ${queryResults1.}  replace string using regexp  ${queryResults1}  \\]|\,  ${EMPTY}
      \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\'|\,  ${EMPTY}
      \  ${queryResults.}  replace string using regexp  ${queryResults1..}  \\'|\,  ${EMPTY}
      \  ${queryResults..1}  Evaluate  '${queryResults.}'.replace('(','')
      \  ${queryResultsa}  Evaluate  '${queryResults..1}'.replace(')','')
      \  log  ${queryResultsa}
      \  should be equal  ${queryResultsa}  ${created_by result in ui..}

User selects power business from purchase requisition module and select processing from show/hide
         wait until element is visible  addFilterBtn  20s
         click element  addFilterBtn
         click element  ${plant Business filter}
         wait until element is visible  continue  10s
         click element  continue
         sleep  2s
         click element  business
         wait until element is visible  product-Power  20s
         click element  product-Power
         wait until element is visible  ${business_Apply_Button}  10s
         click element  ${business_Apply_Button}
         sleep  4s
         run keyword  select created by column from show/hide list

Run quesry in db and get Processing Status from ui and compare the result
         :FOR  ${i}  IN RANGE  1  9
      \  ${pr_number}  execute javascript  return $("#productionOrderGrid table tr:nth(1) td:nth(0) div").text();
      \  log  ${pr_number}
      \  ${Processing Status result in ui}  execute javascript  return $("#productionOrderGrid table tr:nth(1) td:nth(4) div").text();
      \  log  ${Processing Status result in ui}
      \  ${Processing Status result in ui..}  replace string using regexp  ${Processing Status result in ui}  \\,|\,  ${EMPTY}
      \  log  ${Processing Status result in ui..}
      \  connect to database  dbConfigFile=${dbfile}
      \  ${queryResults}  QUERY  select processing_status from public.purchase_reqs_v where purchase_req_num='${pr_number}' limit 1;
      \  log  ${queryResults}
      \  ${aaa}  convert to string  ${queryResults}
      \  ${queryResults1}  replace string using regexp  ${aaa}  \\[|\,  ${EMPTY}
      \  ${queryResults1.}  replace string using regexp  ${queryResults1}  \\]|\,  ${EMPTY}
      \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\'|\,  ${EMPTY}
      \  ${queryResults.}  replace string using regexp  ${queryResults1..}  \\'|\,  ${EMPTY}
      \  ${queryResults..1}  Evaluate  '${queryResults.}'.replace('(','')
      \  ${queryResultsa}  Evaluate  '${queryResults..1}'.replace(')','')
      \  log  ${queryResultsa}
      \  should be equal  ${queryResultsa}  ${Processing Status result in ui..}