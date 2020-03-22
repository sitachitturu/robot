*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Library/generic_library.robot

*** Keywords ***
User access "${link}" module
        click link   ${link}
        sleep  30s

User should see "Plant" filter
        wait until element is visible  ${Plant filter button}  20s

User should see "Plant Business" filter
        wait until element is visible  business  20s

User should see "Order Type" filter
        element should be visible  order_type

User should see "Buyer / Purchasing Group" filter
       element should be visible  buyer

User should see "Material SKU" filter
       element should be visible  sku

User should see "Planner / MRP Controller" filter
       element should be visible  mrpc

click "Edit Filter(s)"
        wait until element is not visible  ${Page Spinner}  10s
        wait until element is visible  addFilterBtn  10s
        click button  addFilterBtn

User should see "Plant Business" "Plant" "order Type" and "Buyer" and "sku" and "mrpc" and "profit_center" filters in edit filters list
        @{Expected labels for edit filter checkboxes}=  create list   Plant Business  Sub Business  Plant  Order Type  Buyer  Material SKU   Planner / MRP Controller   Profit Center
        @{labels from edit filter checkboxes}=  get webelements  ${Edit filters checkbox labels}
        ${Edit filters checkbox strings}  create list

        ${i}  set variable  0
        :FOR  ${i}  IN  @{labels from edit filter checkboxes}
        \   ${str}=  get text  ${i}
        \   log to console  ${str}
        \   append to list  ${Edit filters checkbox strings}  ${str}

        ${j}  set variable  0
        :FOR  ${j}  IN  @{Expected labels for edit filter checkboxes}
        \   should contain  ${Edit filters checkbox strings}  ${j}

User click on profit_center filter in edit filter user should see profit_center filter in UI
        click element  ${profit_center filter}
        click element  continue
        wait until element is visible  profit_center  10s

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

select all filters from edit filters
      ${opp_total}  get text  //*[@id="totalOppVal"]
      log  ${opp_total}
      ${opp_totall}  Evaluate  '${opp_total}'.replace(',','')
      set global variable  ${opp_totall}
      ${grid_row_value for default view}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
      log  ${grid_row_value for default view}
      ${grid_row_value for default view1}  Evaluate  '${grid_row_value for default view}'.replace(',','')
      set global variable  ${grid_row_value for default view1}
      click element  addFilterBtn
      click element  ${Buyer filter}
      wait until element is visible  continue  10s
      click button  continue

select data from all filters and click clearFilterBtn
      click element  business
      sleep  2s
      click element  ${plant_business_filter_transp_checkbox}
      click element  ${business_Apply_Button}
      sleep  2s
      click element  plant
      sleep  2s
      click element  //mm-filter[@id='plant']//paper-checkbox
      click element  ${plant_Apply_Button}
      sleep  2s
      click element  order_type
      click element  //mm-filter[@id='order_type']//paper-checkbox
      click element  ${ordertype_apply_button}
      sleep  2s
      click element  buyer
      click element  //mm-filter[@id='buyer']//paper-checkbox
      click element  ${buyer_apply_button}
      sleep  2s
      click element  clearFilterBtn
      sleep  4s

User should not see any filters except default filters 'Plant'"plant business""order type"
      element should not be visible  buyer
      element should be visible  plant
      element should be visible  order_type
      element should be visible  business
      ${opp_total..}  get text  //*[@id="totalOppVal"]
      log  ${opp_total..}
      ${opp_total...}  Evaluate  '${opp_total..}'.replace(',','')
      set global variable  ${opp_total...}
      ${grid_row_value for default view..}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
      log  ${grid_row_value for default view..}
      ${grid_row_value for default view...}  Evaluate  '${grid_row_value for default view..}'.replace(',','')
      set global variable  ${grid_row_value for default view...}
      should be equal as numbers  ${spine_total...}  ${spine_totall}
      should be equal as numbers  ${grid_row_value for default view...}  ${grid_row_value for default view1}