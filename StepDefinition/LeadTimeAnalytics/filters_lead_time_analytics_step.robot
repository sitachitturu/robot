*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Library/filter_library.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  45s
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
#User check check box with "Source/Vendor" name
#    wait until element is visible  ${Source/Vendor filter2}  10s
#    click element  ${Source/Vendor filter2}

User check check box with "Sub Business" name
    wait until element is visible  ${sub_business_filter}  10s
    click element  ${sub_business_filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue
    sleep  5s

User should be able to see Plant Business Filter
    wait until element is visible  ${Plant Business filter button}  10s

User should be able to see Plan Category Filter
    wait until element is visible  ${Plant Category filter button}  10s

User should be able to see Plant Region Filter
    wait until element is visible  ${Plant Region filter button}  10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  15s

    mm-verify filter total for inventory  pcat
    mm-verify filter total for inventory  region
    mm-verify filter total for inventory  business

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
        sleep  10s
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
      sleep  3s
      ${text3}  get text  filterSetBtn
      run keyword and continue on failure  should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn


User should see default filters "plant","Source/Vendor","Material Sku" and Outliers" and with restricted icon
      element should be visible  plant
      element should be visible  sku
      element should be visible  source_vendor
      element should be visible  outlier

verify the performance of restricted icon by selecting plant and data from other filters
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  ${3rd checkbox}  15s
      click element  ${3rd checkbox}
      wait until element is visible  ApplyBtn  20s
      click element  ApplyBtn
      element should not be visible  ${outlier restricted icon}
      click element  clearFilterBtn
      element should be visible  ${outlier restricted icon}

select col on heatmap and verify filters whether except source/vendor the other filters are restricted or not
     double click element  //vaadin-grid-table/table/tbody/tr/td/vaadin-grid-cell-content/mo-column/div
     wait until element is not visible  //mm-filter[@id='source_vendor']//div[@id='filterHeader']//button[@style='display: none;']  15s
     element should be visible  ${outlier restricted icon}
