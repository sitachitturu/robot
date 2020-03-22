*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Library/generic_library.robot

*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  30s

User should see "Plant" filter
    wait until element is visible  ${Plant filter button}  20s

User should see "Buyer / Purch. Group" filter
    wait until element is visible  ${Buyer / Purch. Group filter button}  20s

click "Edit Filter(s)"
    wait until element is not visible  ${Page Spinner}  10s
    wait until element is visible  addFilterBtn  10s
    click button  addFilterBtn

User check check box with "PO Created By Username" name
    wait until element is visible  ${PO Created By Username filter}  10s
    click element  ${PO Created By Username filter}

User check check box with "Source/Vendor" name
    wait until element is visible  ${Source/Vendor filter}  10s
    click element  ${Source/Vendor filter}

User check check box with "Final Exception Message" name
    wait until element is visible  ${Final Exception Message filter}  10s
    click element  ${Final Exception Message filter}

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

User check check box with "Exception Requires Action" name
    wait until element is visible  ${Exception Requires Action filter}  10s
    click element  ${Exception Requires Action filter}

User check check box with "Short Cycle" name
    wait until element is visible  ${Short Cycle filter}  10s
    click element  ${Short Cycle filter}

User check check box with "Procurement Type" name
    wait until element is visible  ${Procurement Type filter}  10s
    click element  ${Procurement Type filter}

User check check box with "Ideal Finish Date" name
    wait until element is visible  ${PO Ideal Finish Date filter}  10s
    click element  ${PO Ideal Finish Date filter}

User check check box with "Profit Center" name
    wait until element is visible  ${Profit Center filter}  10s
    click element  ${Profit Center filter}

User check check box with "Purchase Org Code" name
    wait until element is visible  ${porg_code_filter}  10s
    click element  ${porg_code_filter}

User check check box with "Purchase Org Name" name
    wait until element is visible  ${porg_name_filter}  10s
    click element  ${porg_name_filter}

User check check box with "Project Code" name
    wait until element is visible  ${project_code_filter}  10s
    click element  ${project_code_filter}

User check check box with "Project Name" name
    wait until element is visible  ${project_name_filter}  10s
    click element  ${project_name_filter}

User check check box with "Buyer / Purch. Group Code" name
    wait until element is visible  ${pgroup_code_filter}  10s
    click element  ${pgroup_code_filter}

User check check box with "Sub Business" name
    wait until element is visible  ${sub_business_filter}  10s
    click element  ${sub_business_filter}

User check check box with "Aging Buckets" name
    wait until element is visible  ${Aging Bucket filter PO}  10s
    click element  ${Aging Bucket filter PO}

User check check box with "WBS Element" name
    wait until element is visible  ${wbs_filter_PO}   10s
    click element  ${wbs_filter_PO}

User check check box with "Account Assign. Category" name
    wait until element is visible  ${acct_assign_cat_filter_PO}  10s
    click element  ${acct_assign_cat_filter_PO}

User check check box with "Purchasing Document Type" name
    wait until element is visible  ${Purchasing Document Type filter}  10s
    click element  ${Purchasing Document Type filter}

User check check box with "PO Type" name
    wait until element is visible  ${po_type_filter}  10s
    click element  ${po_type_filter}

User check check box with "PO line status" name
    wait until element is visible  ${PO_line_status_filter}  10s
    click element  ${PO_line_status_filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see PO Created By Username Filter
        wait until element is visible  ${PO Created By Username filter button}  10s

User should be able to see Source/Vendor Filter
    wait until element is visible  ${Source/Vendor filter button}  10s

User should be able to see Final Exception Message
    wait until element is visible  ${Final Exception Message filter button}  10s

User should be able to see Planner / MRP Contr. Filter
    wait until element is visible  ${Planner / MRP Controller filter button}  10s

User should be able to see Plant Business Filter
    wait until element is visible  ${Plant Business filter button}  10s

User should be able to see Plant Category Filter
    wait until element is visible  ${Plant Category filter button}  10s

User should be able to see Plant Region Filter
    wait until element is visible  ${Plant Region filter button}  10s

User should be able to see Exception Requires Action Filter
    wait until element is visible  ${Plant Region filter button}  10s

User should be able to see Short Cycle Filter
    wait until element is visible  ${Short Cycle filter button}  10s

User should be able to see Procurement Type Filter
    wait until element is visible  ${Procurement Type filter button}  10s

User should be able to see Ideal Finish Date
    wait until element is visible  ${PO Ideal Finish Date filter button}  10s

User should be able to see Profit Center Filter
    wait until element is visible  ${Profit Center filter button}  10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

User should be able to see Purchase Org Code Filter
    wait until element is visible  ${porg_code filter button}  10s

User should be able to see Purchase Org Name Filter
    wait until element is visible  ${porg_name filter button}  10s

User should be able to see Project Code Filter
    wait until element is visible  ${project_code filter button}  10s

User should be able to see Project Name Filter
    wait until element is visible  ${project_name filter button}  10s

User should be able to see Buyer / Purch. Group Code Filter
    wait until element is visible  ${pgroup_code filter button}  10s

User should be able to see Purchasing Document Type Filter
    wait until element is visible  ${Purchasing Document Type filter button}  10s

User should be able to see Aging Buckets Filter
    wait until element is visible  ${Aging Bucket filter button}  10s

User should be able to see WBS Element Filter
    wait until element is visible  ${wbs filter button}  10s

User should be able to see Account Assign. Category Filter
    wait until element is visible  ${account_cat filter button}  10s

User should be able to see PO Type filter
    wait until element is visible  ${PO_TYPE filter button}

User should be able to see PO Line status filter
    wait until element is visible  ${PO_line_status filter button}

Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list  plant
    wait until element is visible  plant  10s
    click element  plant
    sleep  5s
    wait until element is visible  ${first_plant}  10s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  6s
    #NOTE: PO is running very slowly, so this test would always fail and behave weird, even with long wait times.
    #      Because of this, we have commented out the filter total checking on most of the filters. Just check a few. - Dominic

    run keyword and continue on failure  mm-verify filter total  exp
    run keyword and continue on failure  mm-verify filter total  mrpc

    run keyword and continue on failure  mm-verify filter total  pcat
    run keyword and continue on failure  mm-verify filter total  region
    run keyword and continue on failure  mm-verify filter total  business
    run keyword and continue on failure  mm-verify filter total  sub_business
    run keyword and continue on failure  mm-verify filter total  exp_action

    run keyword and continue on failure  mm-verify filter total  sc
    run keyword and continue on failure  mm-verify filter total  ptype
    run keyword and continue on failure  mm-verify filter total  profit_center
    run keyword and continue on failure  mm-verify filter total  ovd_days_range

    run keyword and continue on failure  mm-verify filter total  porg_code
    run keyword and continue on failure  mm-verify filter total  porg_name
    run keyword and continue on failure  mm-verify filter total  project_name

    run keyword and continue on failure  mm-verify filter total  po_wbs
    run keyword and continue on failure  mm-verify filter total  account_assign_cat
    run keyword and continue on failure  mm-verify filter total  code

set filter set and select filters and click on "clear filter" option
        wait until element is visible  plant  30s
        click element  plant
        sleep  3s
        click element  //mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
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
      run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
      ${text3}  get text  filterSetBtn
      should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn
      
user should see "clear filter" option
        element should be visible  clearFilterBtn  20s
        ${text1}  get text  clearFilterBtn
        should be equal  ${text1}  Clear Filter

User selects plants DE1,DE2,DE3,DE4,DE5,PNS from plant filter
      wait until element is visible  plant  20s
      click element  plant
      sleep  2s
      wait until element is visible  product-DE1 - IO Manufacturing Germany  10s
      click element  product-DE1 - IO Manufacturing Germany
      click element  product-DE4 - IO Central Warehouse Germany
      click element  product-PNS - IO Pensacola (Factory LLC)
      wait until element is visible  ApplyBtn  20s
      click element  ApplyBtn
      sleep  10s
      click element  addFilterBtn
      wait until element is visible  //*[@id='filterlist']//input[@value='mrpc']   20s
      click element  //*[@id='filterlist']//input[@value='mrpc']
      wait until element is visible  continue  20s
      click element  continue
      sleep  2s

open planner/mrp controller filter and user should see codes for that selected races plants
      connect to database  dbConfigFile=${dbfile}
      ${planner_filter_DB_value}  QUERY  SELECT CASE WHEN mrp_controller_name IS NOT NULL THEN mrp_controller_name ELSE 'NULL' END AS "mrp_controller_name" FROM "purchase_ords_v" where plant_code IN ('DE1','PNS','DE4') GROUP BY "mrp_controller_name" ORDER BY "mrp_controller_name" ASC;
      log  ${planner_filter_DB_value}
      ${convert}  convert to string  ${planner_filter_DB_value}
      ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
      ${queryResults}   replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
      ${queryResults1}   replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
      log  ${queryResults1}

      wait until element is visible  mrpc  20s
      click element  mrpc
      sleep  2s

      :FOR  ${i}  IN RANGE  1  18
        \  wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[${i}]/div[2]/span  10s
        \  sleep  2s
        \  ${code1}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[${i}]/div[2]/span
        \  ${code1}  fetch from left  ${code1}  -
        \  log  ${code1}
        \  run keyword and continue on failure  should contain  ${queryResults1}  ${code1}

User select Aging bucket filter from edit filters
        wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        click element  ${Aging Bucket filter PO}
        wait until element is visible  continue  20s
        click element  continue
        wait until element is visible  ovd_days_range  20s

User select <30,30+,60+,on hold value from aging bucket filter
        wait until element is visible  ovd_days_range  20s
        click element  ovd_days_range
        sleep  3s
        click element  product-30+
        click element  product-60+
        click element  product-<30
        click element  product-On Hold
        wait until element is visible  ${aging_bucket_apply button}  20s
        click element  ${aging_bucket_apply button}
        sleep  5s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

User can not see a defect : Grid is not loading
#      run keyword  scroll page to location  0  100000000
      wait until element is not visible  spinner  20s
      capture page screenshot

User select PO Created By UserName filter and business filter from edit filters
      wait until element is visible  addFilterBtn  20s
      click element  addFilterBtn
      click element  //*[@id='filterlist']//input[@value='po_created_by_username']
      click element  ${plant Business filter}
      wait until element is visible  continue  20s
      click element  continue
      wait until element is visible  business  10s

select business "Renewables" from business filter and select username from "po crated by username" filter
      wait until element is visible  business  10s
      click element  business
      sleep  2s
      click element  product-Renewables
      wait until element is visible  ${business_Apply_Button}  10s
      click element  ${business_Apply_Button}
      sleep  4s
      click element  po_created_by_username
      sleep  3s
      click element  ${po_user_filter_checkbox}
      wait until element is visible  ${po_created_username_apply_button}  20s
      click element  ${po_created_username_apply_button}
      sleep  6s

scroll page down and select PO Created By Username col from show/hide
      #run keyword  scroll page to location  0  100000
      sleep  3s
      click element  ${show/hide column}
      sleep  2s
      click element  ${po_created_username_col_show/hide}
      click element  ${show/hide column}

User should see selected buyername in the po username column
      click element  po_created_by_username
      sleep  3s
      wait until element is visible  ${po_created_show_selected_only}  10s
      click element  ${po_created_show_selected_only}
      ${uesrname1}  get text  ${po_created_selected_text}
      log  ${uesrname1}
      ${username_from_col}  get text  ${text_from_po_username_col}
      log  ${username_from_col}
      should be equal  ${uesrname1}  ${username_from_col}

User should see matching username record count with total in heatmap for buyer,vendor,planner,material,plant
      ${TempValue}  Get Text  xpath=//mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span[2]
      ${TempString}  replace string  ${TempValue}  (  ${EMPTY}
      ${TempString}  replace string  ${TempString}  )  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString}

      ${buyer_total}  get text  //mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
      ${buyer_total..}  execute javascript  var string = "${buyer_total}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${buyer_total..}
      ${buyer_total,}  trim all unnecesary brackets  ${buyer_total..}
      log  ${buyer_total,}
      should be equal  ${TempString}  ${buyer_total,}

      click element  ${buyer_dropdown}
      wait until element is visible  ${vendor_from_buyer_dropdown}  20s
      click element  ${vendor_from_buyer_dropdown}
      wait until element is not visible  spinner  20s
      ${vendor_total}  get text  //mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
      ${vendor_total..}  execute javascript  var string = "${vendor_total}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${vendor_total..}
      ${vendor_total,}  trim all unnecesary brackets  ${vendor_total..}
      log  ${vendor_total,}
      should be equal  ${TempString}  ${vendor_total,}

      click element  ${buyer_dropdown}
      wait until element is visible  ${planner_from_buyer_dropdown}  20s
      click element  ${planner_from_buyer_dropdown}
      wait until element is not visible  spinner  20s
      ${planner_total}  get text  //mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
      ${planner_total..}  execute javascript  var string = "${planner_total}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${planner_total..}
      ${planner_total,}  trim all unnecesary brackets  ${planner_total..}
      log  ${planner_total,}
      should be equal  ${TempString}  ${planner_total,}

      click element  ${buyer_dropdown}
      wait until element is visible  ${material_from_buyer_dropdown}  20s
      click element  ${material_from_buyer_dropdown}
      wait until element is not visible  spinner  20s
      ${material_total}  get text  //mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
      ${material_total..}  execute javascript  var string = "${material_total}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${planner_total..}
      ${material_total,}  trim all unnecesary brackets  ${material_total..}
      log  ${material_total,}
      should be equal  ${TempString}  ${material_total,}

      click element  ${buyer_dropdown}
      wait until element is visible  ${Plant}  20s
      click element  ${Plant}
      wait until element is not visible  spinner  20s
      ${Plant_total}  get text  //mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
      ${Plant_total..}  execute javascript  var string = "${Plant_total}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${Plant_total..}
      ${Plant_total,}  trim all unnecesary brackets  ${Plant_total..}
      log  ${Plant_total,}
      should be equal  ${TempString}  ${Plant_total,}