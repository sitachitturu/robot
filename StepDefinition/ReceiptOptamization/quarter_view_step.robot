6/28/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/receipt_optamization_variables.robot
*** Keywords ***
User access "${link}" module
    wait until element is not visible  ${Page Spinner}  15s
    click link   ${link}
     sleep  15s
User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1

User should see "OPPORTUNITIES BY" text
    element should be visible  xpath=//div[@id='rtitle']//span[contains(normalize-space(), 'OPPORTUNITIES BY')]

User click at drop down with value "Month"
    click element  xpath=//div[@id='dropcell']//span[contains(normalize-space(), 'Month')]

User should be able to select "Quarter" value from drop down
    click element  xpath=//ul[@id='list']//li[contains(normalize-space(), 'Quarter')]

second drop down with month name value should change to "2017"
    element should be visible  xpath=//div[@id='dropcell']//span[contains(normalize-space(), '2018')]

User see "Quarter" dropdown
    element should be visible  xpath=//div[@id='dropcell']//span[contains(normalize-space(), 'Quarter')]

User should see 2017 , 2018 in next drop down
    click element  xpath=//div[@id='dropcell']//span[contains(normalize-space(), '2018')]
#    element should be visible  xpath=//ul[@id='list']//li[contains(normalize-space(), '2018')]

User select Quarter and 2017 year from drop down
    element should be visible  xpath=//div[@id='dropcell']//span[contains(normalize-space(), '2018')]
    element should be visible  xpath=//div[@id='dropcell']//span[contains(normalize-space(), 'Quarter')]

User should see columns "${column1}","${column2}","${column3}","${column4}","${column5}","${column6}","${column7}","${column8}","${column9}","${column10}"
    wait until element is visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column1}')]  10s
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column2}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column3}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column4}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column5}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column6}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column7}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column8}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column9}')]
    element should be visible  xpath=//mo-grid[@id='receiptQuarterDataTable']//span[contains(normalize-space(), '${column10}')]

User should not see Show/hide columns button
    element should not be visible  xpath=//button[@id='showHide']

User should see Export Excel button
    wait until element is visible  ${Export to Excel Quarter Data Table}  10s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

User click Quarter and 2017 year from drop down
    wait until element is visible  xpath = //div[@id='dropcell']//span[contains(normalize-space(), '2018')]
    click element  xpath = //div[@id='dropcell']//span[contains(normalize-space(), '2018')]

User click Show/hide columns button

    wait until element is visible  ${show/hide column for quarter view}  15s
    click element  ${show/hide column for quarter view}
    sleep  2s

User should see all columns
    ${col_list} =  get text  ${show/hide column list}
    log  ${col_list}

    [Tags]  test text
    ${TextFileContent}  get file  ${receipt_opt_quarter_show/hide_list}
    Log    ${TextFileContent}
    should be equal  ${col_list}  ${TextFileContent}

user should see numbers for month should be less than quarter view
    ${no_of_opportunities_spine_value}  get text  //px-spine/div/div/div/div[2]/div/div/span[2]/span
    log  ${no_of_opportunities_spine_value}
    wait until element is visible  //px-dropdown/div/px-dropdown-text/span   20s
    click element  //px-dropdown/div/px-dropdown-text/span
    wait until element is visible  //px-dropdown/div[2]/px-dropdown-content/div/ul/li[2]   10s
    click element  //px-dropdown/div[2]/px-dropdown-content/div/ul/li[2]
    sleep  4s
    ${no_of_opportunities_quarter_view}  get text  //px-spine/div/div/div/div[2]/div/div/span[2]/span
    log  ${no_of_opportunities_quarter_view}
    evaluate  ${no_of_opportunities_spine_value}<${no_of_opportunities_quarter_view}

user should see numbers for month should be less than quarter view by selecting plant by plant
    wait until element is visible  plant  20s
    click element  plant
    sleep  5s
    ${plant_file}  get file  ${receipt_opt_plant_filter_data}
    @{plant_array}  split to lines  ${plant_file}
    :FOR  ${item}  IN  @{plant_array}
    \  log  ${item}
    \  click element  product-${item}
    \  wait until element is visible  ApplyBtn  20s
    \  click element  ApplyBtn
    \  sleep  8s
    \  ${no_of_opportunities_spine_value}  get text  //px-spine/div/div/div/div[2]/div/div/span[2]/span
    \  log  ${no_of_opportunities_spine_value}
    \  wait until element is visible  //px-dropdown/div/px-dropdown-text/span   20s
    \  click element  //px-dropdown/div/px-dropdown-text/span
    \  wait until element is visible  //px-dropdown/div[2]/px-dropdown-content/div/ul/li[2]   10s
    \  click element  //px-dropdown/div[2]/px-dropdown-content/div/ul/li[2]
    \  sleep  4s
    \  ${no_of_opportunities_quarter_view}  get text  //px-spine/div/div/div/div[2]/div/div/span[2]/span
    \  log  ${no_of_opportunities_quarter_view}
    \  evaluate  ${no_of_opportunities_spine_value}<${no_of_opportunities_quarter_view}
    \  click element  //div[2]/px-dropdown/div/px-dropdown-text
    \  sleep  3s
    \  click element  //px-dropdown/div[2]/px-dropdown-content/div/ul/li
    \  sleep  5s
    \  click element  plant
    \  wait until element is visible  search-input  10s
    \  click element  product-${item}