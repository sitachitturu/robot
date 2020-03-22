*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/consumption_issues_variables.robot

*** Keywords ***
User access "${link}" module
        go to  ${WELCOME.URL}/secure/lead-time-details
        click element  //mo-app-nav/px-app-nav/nav/button
        sleep  4s
        click element  //*[@id="nav-item-13"]
        sleep  14s
        element should be visible  //*[@id="navitemlist"]/li[14]/ul/li[8]
        ${module text under admin}  get text  //*[@id="navitemlist"]/li[14]/ul/li[8]
        should be equal  ${module text under admin}  Lead Time Recommendations

User should see "Lead Time Recommendations"
        element should be visible  //*[@id='mo-tool-bar']//span[contains(normalize-space(), 'Lead Time Recommendations')]
        ${page title text}  get text  //*[@id='mo-tool-bar']//span[contains(normalize-space(), 'Lead Time Recommendations')]
        should be equal  ${page title text}  Lead Time Recommendations

User click on Edit Filters
        click element  addFilterBtn
        sleep  2s

User should see list of filters in edit filters
         @{Expected labels for edit filter checkboxes}=  create list  Plant Business  Sub Business  Plant Region  Plant  Source/Vendor  Material SKU  Buyer / Purch. Group
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

user should see "Plant Business" "Sub Business" "Plant Region" "Plant" "Source/vendor" as default filters
         element should be visible  business
         element should be visible  sub_business
         element should be visible  region
         element should be visible  plant
         element should be visible  source_vendor

User should see all static labels
        [Arguments]  ${mo-header}  ${privacy_policy}
        ${Extracted mo header}  get text  ${mo header}
        should contain  ${Extracted mo header}  ${mo-header}
        Execute JavaScript  window.scrollTo(15000, 0)
        element should be visible  ${predix image}
        ${Copyright text}  get text  //div[2]/footer/mo-footer/footer/span/span
        log  ${Copyright text}
        should be equal  ${Copyright text}  © 2018 General Electric
        ${privacy_policy_text}  get text  //*[@id="privacy"]
        should be equal  ${privacy_policy_text}  ${privacy_policy}

user see "clear filter" option and beheviour of clear filter
        element should be visible  clearFilterBtn  20s
        ${text1}  get text  clearFilterBtn
        should be equal  ${text1}  Clear Filter

set filter set and select filters and click on "clear filter" option
        wait until element is visible  plant  30s
        click element  plant
        sleep  3s
        click element  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
        #wait until element is visible  ApplyBtn  20s
        click element  ${plant_filter}
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
       element should not be visible  //mm-global-filter/mm-filter[4]/px-filter/div/div/button/iron-icon[2]
       ${text3}  get text  filterSetBtn
       should be equal  ${text3}  Apply/Create Custom View

delete the existing fileld from filter set
      click element  filterSetBtn
      sleep  3s
      run keyword and ignore error  mouse over  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div
      sleep  4s
      run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
      run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
      run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
      ${text3}  get text  filterSetBtn
      should be equal  ${text3}  Apply/Create Custom View
      click element  filterSetBtn

