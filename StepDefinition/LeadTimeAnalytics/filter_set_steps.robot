*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  35s

User should see "Apply/Create Filter Set" button
    wait until element is visible  ${Apply filter}  10s
    click element  ${Apply filter}
    SLEEP  2s
    wait until element is visible  clearSpan  5s
    click element  clearSpan
    SLEEP  2s
    click element  ${Apply filter}

    ${title}  get text  ${Apply filter}
    log  ${title}
    should be equal  ${title}  Apply/Create Custom View
    [Return]  ${title}

User click at "Apply/Create Filter Set"
    wait until element is visible  ${Apply filter}  10s
    click element  ${Apply filter}
    SLEEP  2s

User should see "Clear All Filters","Save Current Filter Selections","Cancel" and "Save" buttons
    click element  clearSpan
    SLEEP  3s
    wait until element is visible  //mo-filter-sets/div/div[2]/div[4]/button   10s
    ${save filters}  get text  //mo-filter-sets/div/div[2]/div[4]/button
    log  ${save filters}
    should be equal  ${save filters}  Save Current Custom View
    [Return]  ${save filters}

click on "Save Current Filter Selections" option and enter the filterset name "765" and click on save button
    run keyword  User click at "Apply/Create Filter Set"
    wait until element is visible  //mo-filter-sets/div/div[2]/div[4]/button   5s
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    input text  nameInput  773o3
    wait until element is visible  autoCheckbox  15s
    click element  autoCheckbox
    wait until element is visible  ApplySetBtn  40s
    click element  ApplySetBtn
    sleep  2s

enter existing filterset name user should see message "This will update an existing view." with upadte button and able to click on update button
    run keyword  User click at "Apply/Create Filter Set"
    sleep  5s
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    sleep  2s
    input text  nameInput  773o3
    wait until page contains  This will update an existing view.  20s
    ${update text}  get text  //*[@id="inputWarning"]
    log  ${update text}
    wait until element is visible  ApplySetBtn  30s
    click button  ApplySetBtn
    sleep  5s

mouse over on updated filterset and delete that filterset and click on 'apply/create filter set'
    click element  ${Apply filter}
    :FOR  ${item}  IN RANGE  1  5
        \  Log    ${item}
        \  mouse over  //*[@id="filterSetItemContainer"]/div[1]
        \  sleep  1s
        \  log  ${item}
        \  double click element  ${delete}
        \  sleep  1s
    ${title}  get text  ${Apply filter}
    log  ${title}
    ${title1}  should be equal  ${title}  Apply/Create Filter Set

    #cleare the filter set for future testing
    click element  ${Apply filter}
    wait until element is visible  clearSpan  5s
    click element  clearSpan
    click element  ${Apply filter}

Edit filter set title and observe udpated title
    clear all filter set
    sleep  10s
    wait until element is visible  ${Apply filter}  15s
    click element  ${Apply filter}
    wait until element is visible  //*[@id="filterSetItemContainer"]/div[1]   15s
    click element  //*[@id="filterSetItemContainer"]/div[1]
    sleep  5s
    wait until element is visible  //*[@id="filterSetItemContainer"]/div[1]  15s
    mouse over  //*[@id="filterSetItemContainer"]/div[1]
    wait until element is visible  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[3]/i   10s
    double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[3]/i
    sleep  2s

    ${date&time}  get time
    ${Product Name unique value3}=  catenate  ${bookmark_name1}  ${date&time}
    input text  nameInput2  ${Product Name unique value3}
    sleep  3s
    click element  submitBtn
    sleep  2s
    click element  ${Apply filter}

    ${text_after_edit}=  get text  ${Apply filter}
    should be equal as strings  ${Product Name unique value3}  ${text_after_edit}

click on "Save Current Filter Selections" option and enter the filterset name "date and time" and click on save button
    run keyword  User click at "Apply/Create Filter Set"
    sleep  5s
    click element  expandIcon
    ${date&time}  get time
    ${Product Name unique value2}=  catenate  ${bookmark_name}  ${date&time}?
    log to console  ${Product Name unique value2}
    input text  nameInput  ${Product Name unique value2}
    set global variable  ${Product Name unique value2}
    sleep  4s
    click element  autoCheckbox
    wait until element is visible  ApplySetBtn  40s
    click element  ApplySetBtn
    sleep  2s

User Verify Default Filterset "${link}"
    wait until element is visible  ${Apply filter}  15s
    click element  ${Apply filter}
    sleep  3s
    wait until element is visible  //mo-filter-sets/div/div[2]/div[4]/button  5s
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    sleep  2s
    ${date&time}  get time
    ${Product Name unique value1}=  catenate  ${bookmark_name}  ${date&time}test
    input text  nameInput  ${Product Name unique value1}
    set global variable  ${Product Name unique value1}
    sleep  2s
    click element  checkboxLabel
    click element  ApplySetBtn
    sleep  2s
    wait until element does not contain  ${Apply filter}  Apply/Create Custom View  12s
    ${title_before_refresh}  get text  ${Apply filter}
    click link   ${link}
    wait until element is visible  ${Apply filter}  40s
    wait until element does not contain  ${Apply filter}  Apply/Create Custom View  8s
    ${title_after_refresh}   get text  ${Apply filter}
    should be equal  ${title_before_refresh}  ${title_after_refresh}

    #clears the default filter set so it doesnt interfere with future testing
    wait until element is visible  ${Apply filter}  10s
    click element  ${Apply filter}
    wait until element is visible  //*[@id="clearSpan"]  5s
    click element  //*[@id="clearSpan"]
    click element  ${Apply filter}

Verify cancel button
    wait until element is visible  ${Apply filter}  15s
    click element  ${Apply filter}
    sleep  2s
    wait until element is visible  //mo-filter-sets/div/div[2]/div[4]/button  5s
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    wait until element is visible  nameInput  5s
    input text  nameInput  bookmark1
    sleep  2s
    wait until page contains  This will update an existing view.  20s
    sleep  3s
    click button  cancelSetBtn

    click element  ${Apply filter}
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    element should not contain  filterSetContent  This will update an existing view.
    click element  ${Apply filter}

User should see apply/create filter set name on ui,when open again user should see filter set with no meesages saying "This will update an existing filter set."
    run keyword  User click at "Apply/Create Filter Set"
    sleep  2s
    element should contain  filterSetContent  This will update an existing view.
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    sleep  3s
    capture page screenshot  filterSetContent
    :FOR  ${item}  IN RANGE  1  5
        \  Log    ${item}
        \  mouse over  //*[@id="filterSetItemContainer"]/div[1]
        \  sleep  3s
        \  log  ${item}
        \  double click element  ${delete}
        \  sleep  3s
    click element  ${Apply filter}
    ${title}  get text  ${Apply filter}
    log  ${title}
    ${title1}  should be equal  ${title}  Apply/Create Filter Set
    click element  ${Apply filter}

User click Cancel to hide pop-up
    wait until element is visible  cancelSetBtn  10s
    click button  cancelSetBtn

clear all filter set
    wait until element is visible  ${Apply filter}  10s
    click element  ${Apply filter}
    wait until element is visible  //*[@id="clearSpan"]  5s
    click element  //*[@id="clearSpan"]
    click element  ${Apply filter}

click on palnt filter and select plants and click apply in scheduling module
    wait until element is visible  plant  20s
    click element  plant
    wait until element is visible  search-input  10s
    input text  search-input  0010
    click element  product-0010 - Charlottesville
    input text  search-input  3271
    wait until element is visible  product-3271 - HVM Padappaï  10s
    click element  product-3018 - PCO Leonding
    input text  search-input  348c
    wait until element is visible  product-348C - USC Charleroi  10s
    click element  product-348C - USC Charleroi
    click element  ${Apply Button}
    sleep  10s


Verify Update Option
    wait until element is visible  ${Apply filter}  10s
    click element  ${Apply filter}
    wait until element is visible  //mo-filter-sets/div/div[2]/div[4]/button   5s
    click element  //mo-filter-sets/div/div[2]/div[4]/button

    ${date&time}  get time
    ${Product Name unique value}=  catenate  ${bookmark_name}  ${date&time}!
    input text  nameInput  ${Product Name unique value}
    wait until element is visible  checkboxLabel  5s
    click element  checkboxLabel
    wait until element is visible  checkboxLabel  5s
    click element  ApplySetBtn

    click element  ${Apply filter}
    wait until element is visible  //mo-filter-sets/div/div[2]/div[4]/button   5s
    click element  //mo-filter-sets/div/div[2]/div[4]/button
    input text  nameInput  ${Product Name unique value}
    wait until page contains  This will update an existing view.  20s
    click element  ApplySetBtn

Delete All Bookmarks
      [Arguments]  ${link}
#      wait until element is visible  ${Apply filter}  10s
#      ${status}  run keyword and return status  element should be visible  clearspan
#      run keyword if  ${status} == False  click element  ${Apply filter}
    log to console  ${Product Name unique value}
    #log to console  ${Product Name unique value1}
    sleep  5s
    click element  ${Apply filter}
    wait until element is visible  //*[@id="clearSpan"]  10s
    click element  //*[@id="clearSpan"]
    #wait until element is visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]  15s
    run keyword and ignore error  mouse over  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]
    #wait until element is visible  //*[@id='filterSetItems']//*//div[@class='operations style-scope mo-filter-set-item']//div[@class='delete style-scope mo-filter-set-item']  9s
    run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
#    click element  ${Apply filter}
#    run keyword and ignore error  mouse over  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value1}')]
#    sleep  3s
#    run keyword and ignore error  double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div[2]/i
    run keyword and ignore error  element should not be visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]  5s
    #element should not be visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value1}')]  5s

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
        wait until element is visible  ${Apply filter}  20s
        click element  ${Apply filter}
        sleep  3s
        click element  //mo-filter-sets/div/div[2]/div[4]/button
        input text  nameInput  2342q
        click element  ApplySetBtn
        sleep  2s
        ${text2}  get text  ${Apply filter}
        should be equal  ${text2}  2342q

User should see all filters unselcted and filter set text should be "apply/create filter set"
       click element  clearFilterBtn
       element should not be visible  //mm-filter/px-filter/div/div/button/iron-icon
       ${text3}  get text  ${Apply filter}
       should be equal  ${text3}  Apply/Create Custom View

delete the existing fileld from filter set
      click element  ${Apply filter}
      sleep  3s
      mouse over  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div
      sleep  4s
      double click element  //mo-filter-sets/div/div[2]/div[2]/div/mo-filter-set-item/div/div[2]/div/i
      ${text3}  get text  ${Apply filter}
      should be equal  ${text3}  Apply/Create Custom View