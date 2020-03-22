*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
     sleep  15s
User should see "Plant" filter
    wait until element is visible  ${Plant filter button}  20s

click "Edit Filter(s)"
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

User check check box with "Material Type" name
    wait until element is visible  ${plant Material Type}  10s
    click element  ${plant Material Type}

User check check box with "Sub Business" name
    wait until element is visible  ${sub_business_filter}  10s
    click element  ${sub_business_filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see Plant Business Filter
    wait until element is visible  ${Plant Business filter button}  10s

User should be able to see Plan Category Filter
    wait until element is visible  ${Plant Category filter button}  10s

User should be able to see Plant Region Filter
    wait until element is visible  ${Plant Region filter button}  10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

User should see proper option labels in edit filters
     @{Expected labels for edit filter checkboxes}=  create list  Plant Category  Plant Region  Plant Business  Sub Business  Material Type  Plant Sp Matl Status
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

User click on edit filter cancel
     wait until element is visible  ${Edit filter cancel button}  10s
    click button  ${Edit filter cancel button}

Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    sleep  3s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']

    mm-verify filter total  pcat
    mm-verify filter total  region
    mm-verify filter total  business
    mm-verify filter total  material_type

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
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      click element  filterSetBtn
      click element  filterSetBtn
      sleep  3s
      run keyword and ignore error  double click element  //*[@id="filterSetItemContainer"]/div[2]/div[2]/i
      ${text3}  get text  filterSetBtn
      should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn

select all filters from edit filters
      ${spine_total}  get text  //mo-master-data/div/mo-md-spine/div/div/div/div/div[3]/div[3]/div
      log  ${spine_total}
      ${spine_totall}  Evaluate  '${spine_total}'.replace(',','')
      set global variable  ${spine_totall}
      ${grid_row_value for default view}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row/div/div[4]/mo-master-data-quantity-cell/span
      log  ${grid_row_value for default view}
      ${grid_row_value for default view1}  Evaluate  '${grid_row_value for default view}'.replace(',','')
      set global variable  ${grid_row_value for default view1}
      click element  addFilterBtn
      click element  ${plant Business filter}
      click element  ${plant catagory filter}
      click element  ${plant Region filter}
      click element  ${plant Material Type}
      click element  ${sub_business_filter}
      click element  ${Plant Sp Matl Status filter}
      wait until element is visible  continue  10s
      click button  continue

select data from all filters and click clearFilterBtn
      click element  business
      sleep  2s
      click element  ${plant_business_filter_transp_checkbox}
      click element  ${business_Apply_Button}
      sleep  2s
      click element  pcat
      sleep  2s
      click element  ${plant_category_filter_checkbox}
      click element  ${pcat_Apply Button}
      sleep  3s
      click element  region
      sleep  2s
      click element  ${region_filter_checkbox}
      click element  ${region_Apply_Button}
      sleep  2s
      click element  plant
      sleep  2s
      run keyword and ignore error  click element  ${plant_filter_checkbox}
      wait until element is visible  ApplyBtn  20s
      click element  ApplyBtn
      sleep  3s
      click element  material_type
      sleep  2s
      run keyword and ignore error  click element  ${material_type_filter_checkbox}
      click element  ${material_type_filter_apply_cutton}
      sleep  2s
      click element  clearFilterBtn
      sleep  4s
User should not see any filters except default filters 'Plant'
      element should not be visible  material_type
      element should not be visible  pcat
      element should not be visible  region
      element should not be visible  business
      element should not be visible  sub_business
      element should not be visible  psms
      element should be visible  plant
      ${spine_total..}  get text  //mo-master-data/div/mo-md-spine/div/div/div/div/div[3]/div[3]/div
      log  ${spine_total..}
      ${spine_total...}  Evaluate  '${spine_total..}'.replace(',','')
      set global variable  ${spine_total...}
      ${grid_row_value for default view..}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row/div/div[4]/mo-master-data-quantity-cell/span
      log  ${grid_row_value for default view..}
      ${grid_row_value for default view...}  Evaluate  '${grid_row_value for default view..}'.replace(',','')
      set global variable  ${grid_row_value for default view...}
      should be equal as numbers  ${spine_total...}  ${spine_totall}
      should be equal as numbers  ${grid_row_value for default view...}  ${grid_row_value for default view1}

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
