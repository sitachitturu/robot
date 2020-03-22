6/30/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Library/filter_library.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
     sleep  35s

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

User check check box with "Sub Business" name
    wait until element is visible  ${sub_business_filter}  10s
    click element  ${sub_business_filter}


#User check check box with "Buyer / Purch. Group" name
#    wait until element is visible  ${Buyer/Purch.Group filter}   10s
#    click element  ${Buyer/Purch.Group filter}

#User check check box with "Vendor Name" name
#    wait until element is visible  ${Source/Vendor filter}   10s
#    click element  ${Source/Vendor filter}

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

User should be able to see Vendor Name Filter
    wait until element is visible  ${Source/Vendor filter}  10s

User should be able to see sub_business Filter
    wait until element is visible  ${sub_business filter button}   10s

Count sums of all filters should equal the sum of records for corresponding plant
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    sleep  3s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  3s

    mm-verify filter total for receipt  pcat
    mm-verify filter total for receipt  region
    mm-verify filter total for receipt  business
    mm-verify filter total for lazy loading for receipt  pgroup
    mm-verify filter total for lazy loading for receipt  source

#NAME of the first element in the given filter
#$x("//mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='name style-scope px-filter']")
#NUMBER of the first element in the given filter
#$x("//mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']")
#CHECKBOX
#xpath=//mm-filter[@id='region']//div[@id='filterContent']//div[@id='checkboxContainer']

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
       sleep  2s
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
      should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn

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
