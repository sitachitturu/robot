*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot
Resource  ../../Variables/consumption_issues_variables.robot

*** Keywords ***
User click Consumption issues module
    sleep  3s
    click element  //mo-app-nav/px-app-nav/nav/ul/li[14]/a/iron-icon

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
