*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot

*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  27s

User should see "Plant" filter
    wait until element is visible  ${Plant filter button}  20s

User should see "Final Exception Message" filter
    wait until element is visible  ${Final Exception Message filter button}  20s

User should see "Exception Requires Action" filter
    wait until element is visible  ${Exception Requires Action filter button}  20s

User should see "Planner / MRP Contr." filter
    wait until element is visible  ${Planner / MRP Contr. filter button scheduling}  20s

User should see "Buyer / Purch. Group" filter
    wait until element is visible  ${Buyer / Purch. Group filter button}  20s

User should see "Order Type" filter
    wait until element is visible  ${order_type_filter_button}  20s

click "Edit Filter(s)"
    wait until element is not visible  ${Page Spinner}  10s
    wait until element is visible  addFilterBtn  10s
    click button  addFilterBtn

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

User check check box with "Procurement Type" name
    wait until element is visible  ${Procurement Type filter}  10s
    click element  ${Procurement Type filter}

User check check box with "Material Description" name
    wait until element is visible  ${Material Description filter}  10s
    click element  ${Material Description filter}

User check check box with "Order Status" name
    wait until element is visible  ${Order Status filter}  10s
    click element  ${Order Status filter}

User check check box with "Storage Location" name
    wait until element is visible  ${Storage Location filter}  10s
    click element  ${Storage Location filter}

User check check box with "Current Finish Date" name
    wait until element is visible  ${Current Finish Date filter}  10s
    click element  ${Current Finish Date filter}

User check check box with "Ideal Finish Date" name
    wait until element is visible  ${Ideal Finish Date filter}  10s
    click element  ${Ideal Finish Date filter}

User check check box with "Profit Center" name
    wait until element is visible  ${Profit Center filter}  10s
    click element  ${Profit Center filter}

User check check box with "Project Name" name
    wait until element is visible  ${project_name_filter}  10s
    click element  ${project_name_filter}

User check check box with "Project Code" name
    wait until element is visible  ${project_code_filter}  10s
    click element  ${project_code_filter}

User check check box with "WBS Element" name
    wait until element is visible  ${wbs_filter}  10s
    click element  ${wbs_filter}

User check check box with "Account Assign. Category" name
    wait until element is visible  ${acct_assign_cat_filter_Sched}  10s
    click element  ${acct_assign_cat_filter_Sched}

User check check box with "Sub Business" name
    wait until element is visible  ${sub_business_filter}  10s
    click element  ${sub_business_filter}

#User check check box with "Buyer / Purch. Group" name
#    wait until element is visible  ${Buyer/Purch.Group filter}   10s
#    click element  ${Buyer/Purch.Group filter}

User check check box with "Special Procurement" name
    wait until element is visible  ${Special Procurement filter}   10s
    click element  ${Special Procurement filter}

User check check box with "Material Type / Item Type"
    wait until element is visible  ${Material Type / Item Type filter}   10s
    click element  ${Material Type / Item Type filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see Plant Business Filter
    wait until element is visible  ${Plant Business filter button}  10s

User should be able to see Plant Category Filter
    wait until element is visible  ${Plant Category filter button}  10s

User should be able to see Plant Region Filter
    wait until element is visible  ${Plant Region filter button}  10s

User should be able to see Product Hierarchy Filter
    wait until element is visible  ${Product Hierarchy filter button}  10s

User should be able to see Procurement Type Filter
    wait until element is visible  ${Procurement Type filter button}  10s

User should be able to see Material Description Filter
    wait until element is visible  ${Material Description filter button}  10s

User should be able to see Order Status Filter
    wait until element is visible  ${Order Status filter button}  10s

User should be able to see Storage Location Filter
    wait until element is visible  ${Storage Location filter button}  10s

User should be able to see Current Finish Date Filter
    wait until element is visible  ${Current Finish Date filter button}  10s

User should be able to see Ideal Finish Date Filter
    wait until element is visible  ${Ideal Finish Date filter button}  10s

User should be able to see Profit Center Filter
    wait until element is visible  ${Profit Center filter button}  10s

User should be able to see Project Name Filter
    wait until element is visible  ${project_name filter button}  10s

User should be able to see Project Code Filter
    wait until element is visible  ${project_Code filter button}  10s

User should be able to see wbs Filter
    wait until element is visible  ${wbs filter button}  10s

User should be able to see account_cat Filter
    wait until element is visible  ${account_cat filter button}   10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

User should be able to see Special Procurement Filter
    wait until element is visible  ${special procurement filter button}   10s

User should be able to see "Material Type / Item Type"
    wait until element is visible  ${Material Type / Item Type button}  10s

Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    sleep  4s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  4s
    run keyword and continue on failure  mm-verify filter total for inventory  pcat
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  region
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  business
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  exp
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  exp_action
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  ptype
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  profit_center
    sleep  2s
    ##run keyword and continue on failure  mm-verify filter total  status
    run keyword and continue on failure  mm-verify filter total for inventory  acct_assign_cat
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  sub_business
    sleep  2s
    ##run keyword and continue on failure  mm-verify filter total  pgroup
    run keyword and continue on failure  mm-verify filter total for inventory  record_type
    sleep  2s
    run keyword and continue on failure  mm-verify filter total for inventory  special_procurement
    sleep  2s
    ##run keyword and continue on failure  mm-verify filter total  material_type

Count sums of all filters should equal the sum of records for corresponding plant for lazyloading filters
    mm-verify filter total  mrpc
    mm-verify filter total  material_descr
    mm-verify filter total  project_name
    mm-verify filter total  hierarchy



#name of the first element in the given filter
#$x("//mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='name style-scope px-filter']")
#number of the first element in the given filter
#$x("//mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']")
#

user should see "clear filter" option
        element should be visible  clearFilterBtn  20s
        ${text1}  get text  clearFilterBtn
        should be equal  ${text1}  Clear Filter

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
       double click element  clearFilterBtn
       sleep  3s
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
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      ${text3}  get text  filterSetBtn
      should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn

select transportation business from business filter and hit apply button.
      wait until element is visible  addFilterBtn  20s
      click element  addFilterBtn
      sleep  2s
      click element  ${plant Business filter}
      wait until element is visible  continue  20s
      click element  continue
      click element  business
      sleep  12s
      wait until element is visible  ${plant_business_textbox}   20s
      input text  ${plant_business_textbox}  Transportation
      click element  product-Transportation  #${plant_business_filter_transp_checkbox}
      click element  ${business_apply_button}
      sleep  3s

user open plant filter and give plant name in search box "IFM - Alstom Firenze Manufacturing" should not be visible.
      wait until element is visible  plant  20s
      click element  plant
      sleep  3s
      wait until element is visible  //mm-filter/px-filter/div/div[2]/div[2]/input  20s
      input text  //mm-filter/px-filter/div/div[2]/div[2]/input  IFM - Alstom Firenze Manufacturing
      element should not be visible  product-IFM - Alstom Firenze Manufacturing

verify in db by executing query
      connect to database  dbConfigFile=${dbfile}
      ${cancel_process_DB_value}  QUERY  select * from public.production_ords_v where plant_code_plant_short_name='IFM - Alstom Firenze Manufacturing';
      log  ${cancel_process_DB_value}
      ${convert}  convert to string  ${cancel_process_DB_value}
      ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
      ${cancel_process_queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
      log  ${cancel_process_queryResults}
      ${queryResultLength}  execute javascript  return String(${cancel_process_queryResults}).length;
      log  ${queryResultLength}
      ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${cancel_process_queryResults}};
      log  ${queryResults3..}

User selects plants DE1,DE2,DE3,DE4,DE5,PNS from plant filter
      wait until element is visible  plant  20s
      click element  plant
      sleep  2s
      input text  search-input  DE1
      click element  product-DE1 - IO Manufacturing Germany
      input text  search-input  PNS
      click element  product-PNS - IO Pensacola (Factory LLC)
      wait until element is visible  ApplyBtn  20s
      click element  ApplyBtn
      sleep  3s

open planner/mrp controller filter and user should see codes for that selected races plants
      wait until element is visible  mrpc  20s
      click element  mrpc
      sleep  6s
      ${code1}  get text  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div/paper-checkbox/div[2]/span
      log  ${code1}
      ${code2}  get text  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[3]/paper-checkbox/div[2]/span
      log  ${code2}
      connect to database  dbConfigFile=${dbfile}
      ${planner_filter_DB_value}  QUERY  SELECT CASE WHEN mrp_controller IS NOT NULL THEN mrp_controller ELSE 'NULL' END AS "mrp_controller" FROM "production_ords_v" where plant_code IN ('DE1','PNS') GROUP BY "mrp_controller" ORDER BY "mrp_controller" ASC;
      log  ${planner_filter_DB_value}
      ${convert}  convert to string  ${planner_filter_DB_value}
      ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
      ${queryResults}   replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
      ${queryResults1}   replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
      log  ${queryResults1}
      should contain  ${queryResults1}  ${code1}
      should contain  ${queryResults1}  ${code2}


user select project code and project name filters from edit filters and select data and hit aply button
      run keyword  click "Edit Filter(s)"
      run keyword  User check check box with "Project Name" name
      run keyword  User check check box with "Project Code" name
      run keyword  User check check box with "Plant Business" name
      run keyword  click "Continue"
      click element  plant
      sleep  2s
      click element  product-2490 - GE Wind France SAS - St. Nazaire
      click element  ${Apply Button}
      sleep  5s
      click element  project_code
      sleep  10s
      click element  ${checkbox_for_project code filter}
      click element  //mm-global-filter/mm-filter[7]/px-filter/div/div[2]/div[2]/div/span
      ${text of selected plant code}  get text  //mm-global-filter/mm-filter[7]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
      log  ${text of selected plant code}
      set global variable  ${text of selected plant code}
      click element  ${project_code apply button}
      sleep  4s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

user should see same data in project name and project code columns for product view
      run keyword  scroll page to location  0  1000000000
      sleep  13s
      click element  ${show/hide column}
      sleep  4s
      click element  ${Material Description col from show/hide}
      click element  ${Production / Work Order col from show/hide}
      click element  ${Open Reservation Value col from show/hide}
      click element  ${project code col from show/hide}
      click element  ${project name col from show/hide}
      click element  ${show/hide column}
      sleep  4s
      element should be visible  xpath=//*[@id='content']/div/span[text()='Project Code']
      element should be visible  xpath=//*[@id='content']/div/span[text()='Project Name']
      ${project code col text}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(51) div").text();
      log  ${project code col text}
      should be equal  ${project code col text}  ${text of selected plant code}


user should see same data in project name and project code columns for project view
      wait until element is visible  //div[2]/div/div/mo-filter-context/cascade-scheduler/div/div/div/paper-tabs/div/div/paper-tab[2]/div  10s
      click element  //div[2]/div/div/mo-filter-context/cascade-scheduler/div/div/div/paper-tabs/div/div/paper-tab[2]/div
      sleep  5s
      run keyword  scroll page to location  0  1000000000
      sleep  13s
      click element  ${show/hide column}
      sleep  4s
      run keyword  scroll page to location  0  1000000000
      click element  ${Material Description col from show/hide}
      click element  ${Production / Work Order col from show/hide}
      click element  ${Open Reservation Value col from show/hide}
      click element  ${project name col from show/hide}
      sleep  13s
      click element  ${show/hide column}
      sleep  4s
      element should be visible  xpath=//*[@id='content']/div/span[text()='Project Code']
      element should be visible  xpath=//*[@id='content']/div/span[text()='Project Name']
      ${project code col text}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(51) div").text();
      log  ${project code col text}
      run keyword and ignore error  should be equal  ${project code col text}  ${text of selected plant code}
