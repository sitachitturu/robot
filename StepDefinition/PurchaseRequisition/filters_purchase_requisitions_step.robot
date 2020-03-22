*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot

*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  20s
User should see "Plant" filter
    wait until element is visible  ${Plant filter button}  20s

User should see "Buyer / Purch. Group" filter
    wait until element is visible  ${Buyer / Purch. Group filter button}  20s

click "Edit Filter(s)"
    wait until element is visible  addFilterBtn  10s
    click button  addFilterBtn

User check check box with "Source/Vendor" name
    wait until element is visible  ${Source/Vendor filter}  10s
    click element  ${Source/Vendor filter}

User check check box with "Material SKU" name
    wait until element is visible  ${Material SKU filter}  10s
    click element  ${Material SKU filter}

User check check box with "Planner / MRP Contr." name
    wait until element is visible  ${planner/Mrp Controller filter}  10s
    click element  ${planner/Mrp Controller filter}

User check check box with "Plant Business" name
    wait until element is visible  ${plant Business filter}  10s
    click element  ${plant Business filter}

User check check box with "Plant Category" name
    wait until element is visible  ${plant catagory filter}  20s
    click element  ${plant catagory filter}

User check check box with "Plant Region" name
    wait until element is visible  ${plant Region filter}  10s
    click element  ${plant Region filter}

User check check box with "Product Hierarchy" name
    wait until element is visible  ${Product Hierarchy filter}  10s
    click element  ${Product Hierarchy filter}

User check check box with "Short Cycle" name
    wait until element is visible  ${Short Cycle filter}  10s
    click element  ${Short Cycle filter}

User check check box with "Procurement Type" name
    wait until element is visible  ${Procurement Type filter}  10s
    click element  ${Procurement Type filter}

User check check box with "Profit Center" name
    wait until element is visible  ${Profit Center filter}  10s
    click element  ${Profit Center filter}

User check check box with "Aging Buckets" name
    wait until element is visible  ${Aging Bucket filter}  10s
    click element  ${Aging Bucket filter}

User check check box with "Purchase Org Code" name
    wait until element is visible  ${porg_code_filter}  10s
    click element  ${porg_code_filter}

User check check box with "Purchase Org Name" name
    wait until element is visible  ${porg_name_filter}  10s
    click element  ${porg_name_filter}

User check check box with "WBS Element" name
    wait until element is visible  ${wbs_filter}  10s
    click element  ${wbs_filter}

User check check box with "Account Assign. Category" name
    wait until element is visible  ${acct_assign_cat_filter}  10s
    click element  ${acct_assign_cat_filter}

User check check box with "Sub Business" name
    wait until element is visible  ${sub_business_filter}  10s
    click element  ${sub_business_filter}

User check check box with "PR Type" name
    wait until element is visible  ${pr_type_filter}  10s
    click element  ${pr_type_filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see Source/Vendor Filter
    wait until element is visible  ${Source/Vendor filter button}  10s

User should be able to see Planner / MRP Contr. Filter
    wait until element is visible  ${Planner / MRP Contr. Filter filter button}  10s

User should be able to see Plant Business Filter
    wait until element is visible  ${Plant Business filter button}  10s

User should be able to see Plant Category Filter
    wait until element is visible  ${Plant Category filter button}  10s

User should be able to see Plant Region Filter
    wait until element is visible  ${Plant Region filter button}  10s

User should be able to see Short Cycle Filter
    wait until element is visible  ${Short Cycle filter button}  10s

User should be able to see Procurement Type Filter
    wait until element is visible  ${Procurement Type filter button}  10s

User should be able to see Profit Center Filter
    wait until element is visible  ${Profit Center filter button}  10s

User should be able to see Material SKU Filter
    wait until element is visible  ${Material SKU filter button}  10s

User should be able to see Aging Buckets Filter
    wait until element is visible  ${Aging Bucket filter button}  10s

User should be able to see porg_code Filter
    wait until element is visible  ${porg_code filter button}  10s

User should be able to see porg_name Filter
    wait until element is visible  ${porg_name filter button}  10s

User should be able to see wbs Filter
    wait until element is visible  ${wbs filter button}  10s

User should be able to see account_cat Filter
    wait until element is visible  ${account_cat filter button}   10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

User should be able to see Order Type Filter
    wait until element is visible  ${Plant filter button}  20s

User should be able to see PR type filter
    wait until element is visible  ${pr_type filter}  20s
Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list for lazy loading  plant
    click element  plant

    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']

    mm-verify filter total  pcat
    mm-verify filter total  region
    mm-verify filter total  business
    mm-verify filter total for lazy loading  pgroup
    mm-verify filter total for lazy loading  source
    mm-verify filter total  sc
    mm-verify filter total  ptype
    mm-verify filter total for lazy loading  profit_center
    mm-verify filter total  age_bucket

    mm-verify filter total  porg_code
    mm-verify filter total  porg_name
    mm-verify filter total  account_cat
    mm-verify filter total  order_type

user should see "clear filter" option
        element should be visible  clearFilterBtn  20s
        ${text1}  get text  clearFilterBtn
        should be equal  ${text1}  Clear Filter

set filter set and select filters and click on "clear filter" option
        wait until element is visible  plant  30s
        click element  plant
        sleep  3s
        click element  //mm-global-filter/mm-filter/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[20]/paper-checkbox/div[2]/span[1]
        wait until element is visible  ApplyBtn  20s
        click element  ApplyBtn
        sleep  3s
        wait until element is visible  filterSetBtn  20s
        click element  filterSetBtn
        sleep  3s
        click button  //mo-filter-sets/div/div[2]/div[4]/button
        input text  nameInput  2342q
        click element  ApplySetBtn
        sleep  2s
        ${text2}  get text  filterSetBtn
        should be equal  ${text2}  2342q

User should see all filters unselcted and filter set text should be "apply/create filter set"
       click element  clearFilterBtn
       element should not be visible  //mm-filter/px-filter/div/div/button/iron-icon
       ${text3}  get text  filterSetBtn
       should be equal  ${text3}  Apply/Create Custom View

delete the existing fileld from filter set
      click element  filterSetBtn
      sleep  3s
      run keyword and ignore error  mouse over  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div
      sleep  4s
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      ${text3}  get text  filterSetBtn
      run keyword and ignore error  should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn


User selects plants DE1,DE2,DE3,DE4,DE5,PNS from plant filter
      wait until element is visible  plant  20s
      click element  plant
      sleep  2s
      wait until element is visible  search-input  10s
    input text  search-input  de1
    double click element  ${lazy_loading_search_icon_filter}
    sleep  4s
      click element  DE1 - IO Manufacturing Germany
      wait until element is visible  search-input  10s
    input text  search-input  de3
    double click element  ${lazy_loading_search_icon_filter}
    sleep  4s
      click element  DE3 - IO Repair Shop Germany
      wait until element is visible  search-input  10s
    input text  search-input  de4
    double click element  ${lazy_loading_search_icon_filter}
    sleep  4s
      click element  DE4 - IO Central Warehouse Germany
      wait until element is visible  search-input  10s
    input text  search-input  PNS
    double click element  ${lazy_loading_search_icon_filter}
    sleep  4s
      click element  PNS - IO Pensacola (Factory LLC)
      wait until element is visible  ApplyBtn  20s
      click element  ApplyBtn
      sleep  10s
      click element  addFilterBtn
      wait until element is visible  //*[@id='filterlist']//input[@value='mrpc']   20s
      click element  //*[@id='filterlist']//input[@value='mrpc']
      wait until element is visible  continue  20s
      click element  continue
      sleep  12s

open planner/mrp controller filter and user should see codes for that selected races plants
      #wait until element is visible  mrpc  20s
      click element  mrpc
      sleep  2s
      :FOR  ${i}  IN RANGE  2  20
        \  ${planner_code1}  mouse over  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[${i}]/paper-checkbox/div[2]/span
        \  sleep  2s
        \  ${code1}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[${i}]/paper-checkbox/div[2]/span
        \  log  ${code1}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${planner_filter_DB_value}  QUERY  SELECT CASE WHEN mrp_controller_name IS NOT NULL THEN mrp_controller_name ELSE 'NULL' END AS "mrp_controller_name" FROM "purchase_reqs_v" where plant_code IN ('DE1','PNS','DE3','DE4') GROUP BY "mrp_controller_name" ORDER BY "mrp_controller_name" ASC;
        \  log  ${planner_filter_DB_value}
        \  ${convert}  convert to string  ${planner_filter_DB_value}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults}   replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
        \  ${queryResults1}   replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
        \  log  ${queryResults1}
        \  should contain  ${queryResults1}  ${code1}

user should see Requisition Date filter in edit filters and able to select filter and should see in UI
       wait until element is visible  addFilterBtn  20s
       click element  addFilterBtn
       click element  ${requistion_date_filter}
       sleep  4s
       wait until element is visible  continue  10s
       click element  continue
       element should be visible  requisition_created_date
       ${UI_date_filter_text}  get text  requisition_created_date
       should be equal  ${UI_date_filter_text}  Requisition Date

User should be able to editable the year/month/date
       click element  requisition_created_date
       wait until element is visible  //*[@id="cell0"]  10s
       double click element  //*[@id="cell0"]
       ${original_text}  Get Text  //*[@id="cell0"]
       Execute Javascript  $("#dtEntry").val($("#dtEntry").val() + " 2016");
       capture page screenshot
       sleep  5s
       click element  ${requisition_date_filter_apply_button}
       sleep  10s

scroll page to location
       [Arguments]    ${x_location}    ${y_location}
       Execute JavaScript    window.scrollTo(${x_location},${y_location})

based on date change in flter:grid and heatmap and other filters should respond
       ${heatmap_total_after_changing_year}  get text  ${total_col_total_value}
       log  ${heatmap_total_after_changing_year}
       ${heatmap_total_after_changing_year..}  execute javascript  var string = "${heatmap_total_after_changing_year}"; var returnStr = string.split(" ",2); return returnStr;
       log  ${heatmap_total_after_changing_year..}
       ${convert}  convert to string  ${heatmap_total_after_changing_year..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${Total_col_value_after_cahnging_year}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
       log  ${Total_col_value_after_cahnging_year}
       set global variable  ${Total_col_value_after_cahnging_year}
       run keyword  scroll page to location  0  10000000
       click element  //mo-grid/div[2]//table/thead//tr//th[6]//span[text()='Requisition Date']
       sleep  6s
       ${selected_start_date}  get text  ${text_in_requisition_date}
       log  ${selected_start_date}
       #click element  //mo-grid/div[2]//table/thead//tr//th[6]//span[text()='Requisition Date']
       #sleep  5s
       ${end_date_text_incol}  get text  ${text_in_requisition_date}
       log  ${end_date_text_incol}
       click element  requisition_created_date
       ${filter_from_date}  get text  fromfield
       log  ${filter_from_date}
       set global variable  ${filter_from_date}
       ${filter_end_date}  get text  tofield
       log  ${filter_end_date}
#       should be equal  ${selected_start_date}  ${filter_from_date}
#       should be equal  ${end_date_text_incol}  ${filter_end_date}

Date filter should set to default data if user click on clear filter
      run keyword  scroll page to location  100000000  0
      wait until element is visible  clearFilterBtn  20s
      click element  clearFilterBtn
      sleep  8s
      element should not be visible  requisition_created_date
      click element  addFilterBtn
      click element  ${requistion_date_filter}
      wait until element is visible  continue  10s
      click element  continue
      click element  requisition_created_date
      ${default_from_date_infilter}  get text  fromfield
      log  ${default_from_date_infilter}
      should not be equal  ${default_from_date_infilter}  ${filter_from_date}
      ${heatmap_total_value_for_defaulyt_view}  get text  ${total_col_total_value}
      log  ${heatmap_total_value_for_defaulyt_view}
      ${heatmap_total_value_for_defaulyt_view..}  execute javascript  var string = "${heatmap_total_value_for_defaulyt_view}"; var returnStr = string.split(" ",2); return returnStr;
       log  ${heatmap_total_value_for_defaulyt_view..}
       ${convert}  convert to string  ${heatmap_total_value_for_defaulyt_view..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${heatmap_total_value_for_defaulyt_page}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
       log  ${heatmap_total_value_for_defaulyt_page}
       should not be equal  ${heatmap_total_value_for_defaulyt_page}  ${Total_col_value_after_cahnging_year}
