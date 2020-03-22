*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  10s
User should see "Plant" filter
    wait until element is visible  plant  20s

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

User check check box with "Buyer / Purch. Group" name
    wait until element is visible  ${Buyer/Purch.Group filter}   10s
    click element  ${Buyer/Purch.Group filter}

User check check box with "Planner / MRP Contr." name
    wait until element is visible  ${planner/Mrp Controller filter}   10s
    click element  ${planner/Mrp Controller filter}

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

User should be able to see Buyer / Purch. Group Filter
    wait until element is visible  ${Buyer / Purch. Group filter button}  10s

User should be able to see Planner / MRP Contr. Filter
    wait until element is visible  ${Planner / MRP Contr. filter button}  10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    wait until element is visible  ${first_plant}  20s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']

    mm-verify filter total  region
    mm-verify filter total  business
    mm-verify filter total  sub_business
    mm-verify filter total for lazy loading  pgroup
    mm-verify filter total for lazy loading  mrpc

User should see "Business" & "Subbusiness" & "Plant Region" as default filters
        element should be visible  business
        element should be visible  sub_business
        element should be visible  region

user should see "clear filter" option
        element should be visible  clearFilterBtn  20s
        ${text1}  get text  clearFilterBtn
        should be equal  ${text1}  Clear Filter

set filter set and select filters and click on "clear filter" option
        click element  plant
        sleep  3s
        click element  //mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
        wait until element is visible  ApplyBtn  20s
        click element  ApplyBtn
        sleep  3s
        wait until element is visible  title  20s
        click element  title
        sleep  3s
        click element  expand
        input text  nameInput  2342q
        click element  ApplySetBtn
        sleep  2s
        ${text2}  get text  title
        should be equal  ${text2}  2342q

User should see all filters unselcted and filter set text should be "apply/create filter set"
       click element  clearFilterBtn
       element should not be visible  //mm-filter/px-filter/div/div/button/iron-icon
       ${text3}  get text  title
       should be equal  ${text3}  Apply/Create Filter Set

delete the existing fileld from filter set
      click element  title
      sleep  3s
      mouse over  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div
      sleep  4s
      double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div/i
      ${text3}  get text  title
      should be equal  ${text3}  Apply/Create Filter Set

User should see ""Business" & "Subbusiness" & "Plant Region" & "Buyer / Purch. Group" & "Planner/Mrp Controller" in edit filters list
      @{Expected labels for edit filter checkboxes}=  create list  Plant Business  Sub Business  Plant Region  Plant   Buyer / Purch. Group  Planner / MRP Contr.
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