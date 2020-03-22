*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
      click link  ${link}
      sleep  20s
    # wait until element is visible  ${show/hide column}  10s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

User prompt to use user profile
        wait until element is visible  //body/div[2]/mo-header/header/div/mo-user/div/div  10s
        click element  //*[@id="profile-modal"]/div/div[5]/a/button
        sleep  3s

click on clear filters
        wait until element is visible  clearFilterBtn  10s
        click element  clearFilterBtn
        sleep  5s

Delete All Bookmarks
        [Arguments]  ${link}
    #      wait until element is visible  ${Apply filter}  10s
    #      ${status}  run keyword and return status  element should be visible  clearspan
    #      run keyword if  ${status} == False  click element  ${Apply filter}
        log to console  ${Product Name unique value}
        log to console  ${Product Name unique value1}
        sleep  5s
        click element  ${Apply filter}
        wait until element is visible  //*[@id="clearSpan"]  10s
        click element  //*[@id="clearSpan"]
        #wait until element is visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]  15s
        run keyword and ignore error  mouse over  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]
        #wait until element is visible  //*[@id='filterSetItems']//*//div[@class='operations style-scope mo-filter-set-item']//div[@class='delete style-scope mo-filter-set-item']  9s
        run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
        click element  ${Apply filter}
        run keyword and ignore error  mouse over  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value1}')]
        sleep  3s
        run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
        element should not be visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]  5s
        element should not be visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value1}')]  5s

User select business "Renewables" from user profile
        click element  //div[2]/mo-header/header/div/mo-user/a/img
        sleep  3s
        element should be visible  module_title
        ${title_text}  get text  module_title
        should be equal  ${title_text}  Settings
        run keyword and ignore error  click element  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div/mo-settings-item-list/div/ul/li/div/i
        sleep  2s
        click element  ${business from settings}
        sleep  3s
        click element  //vaadin-grid-table/table/tbody/tr[5]/td/vaadin-grid-cell-content/paper-checkbox
        ${business name}  get text  //vaadin-grid-table/table/tbody/tr[5]/td/vaadin-grid-cell-content/paper-checkbox
        should be equal  ${business name}  Renewables
        click element  //*[@id="save"]
        sleep  3s
        click element  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button[2]
        sleep  3s
        element should be disabled  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button[2]

user should see business filter got selected in "${link}" module and business in filter got selected
        click link  ${link}
        sleep  28s
        click element  business
        ${menu_amount}=  get text  //mm-filter[@id='business']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
        wait until element is visible  //*[@id="business"]//span[@id="showSelected"]  10s
        click element  //*[@id="business"]//span[@id="showSelected"]
        ${businesstext from business filter}  get text  //*[@id="business"]//div[@id="selectedFiltersList"]
        log  ${businesstext from business filter}
        ${businesstext from business filter..}  execute javascript  var str=`${businesstext from business filter}`;return str.match(/Renewables/g)[0];
        log  ${businesstext from business filter..}
        should be equal as strings  Renewables  ${businesstext from business filter..}
        click element  business
        sleep  5s
        element should be visible  //*[@id="business"]//*[@id="filterBtn"]/iron-icon[1]

user should see business filter got selected in "${link}" module and business in filter got selected in receipt
        click link  ${link}
        sleep  28s
        click element  addFilterBtn
        click element  //*[@id='filterlist']//input[@value='business']
        click element  continue
        sleep  3s
        click element  business
        ${menu_amount}=  get text  //mm-filter[@id='business']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
        wait until element is visible  //*[@id="business"]//span[@id="showSelected"]  10s
        click element  //*[@id="business"]//span[@id="showSelected"]
        ${businesstext from business filter}  get text  //*[@id="business"]//div[@id="selectedFiltersList"]
        log  ${businesstext from business filter}
        ${businesstext from business filter..}  execute javascript  var str=`${businesstext from business filter}`;return str.match(/Renewables/g)[0];
        log  ${businesstext from business filter..}
        should be equal as strings  Renewables  ${businesstext from business filter..}
        click element  business
        sleep  5s
        element should be visible  //*[@id="business"]//*[@id="filterBtn"]/iron-icon[1]

User select region "Hydro" from user profile
        click element  //div[2]/mo-header/header/div/mo-user/a/img
        sleep  2s
        element should be visible  module_title
        ${title_text}  get text  module_title
        should be equal  ${title_text}  Settings
        run keyword and ignore error  click element  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div/mo-settings-item-list[4]/div/ul/li/div/i
        sleep  2s
        click element  ${region from settings}
        sleep  3s
        click element  //vaadin-grid-table/table/tbody/tr[5]/td/vaadin-grid-cell-content/paper-checkbox
        ${business name}  get text  //vaadin-grid-table/table/tbody/tr[5]/td/vaadin-grid-cell-content/paper-checkbox
        should be equal  ${business name}  Renewables
        click element  //*[@id="next-button"]
        wait until element is visible  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button  10s
        click element  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button
        wait until element is visible  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button  10s
        element should be disabled  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button

click on profile image and click on save button for business
        click element  //div[2]/mo-header/header/div/mo-user/a/img
        wait until element is visible  module_title  10s
        element should be visible  module_title
        ${title_text}  get text  module_title
        should be equal  ${title_text}  Settings

delete selected items from user profile
        click element  //div[2]/mo-header/header/div/mo-user/a/img
        sleep  3s
        element should be visible  module_title
        ${title_text}  get text  module_title
        should be equal  ${title_text}  Settings
        run keyword and ignore error  click element  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div/mo-settings-item-list/div/ul/li/div/i
        sleep  2s
        click element  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button[2]
        sleep  3s
        element should be disabled  //mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div[2]/button[2]
