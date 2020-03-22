*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/lead_time_variables.robot

*** Keywords ***
User should be able to see Lead Time Analytics module icon and click on Lead Time Analytics icon
    wait until element is not visible  ${Page Spinner}  10s
    click element  ${Lead Time Analytics Icon}
    sleep  25s
    wait until element is visible  ${Lead Time Analytics Title}  10s

User should be able to see columns:"${column1}","${column2}","${column3}","${column4}","${column5}","${column6}","${column7}","${column8}","${column9}","${column10}","${column11}","${column12}","${column13}","${column14}","${column15}","${column16}","${column17}","${column18}","${column19}","${column20}" with data
    wait until element is not visible  ${Page Spinner}  10s
    element should be visible  xpath=//table/thead//th//span[text()='${column1}']
    element should be visible  xpath=//table/thead//th//span[text()='${column2}']
    element should be visible  xpath=//table/thead//th//span[text()='${column3}']
    element should be visible  xpath=//table/thead//th//span[text()='${column4}']
    element should be visible  xpath=//table/thead//th//span[text()='${column5}']
    element should be visible  xpath=//table/thead//th//span[text()='${column6}']
    #Scroll grid horizontaly 700px
    scroll page to location  0  100000000
    element should be visible  xpath=//table/thead//th//span[text()='${column7}']
    element should be visible  xpath=//table/thead//th//span[text()='${column8}']
    element should be visible  xpath=//table/thead//th//span[text()='${column9}']
    element should be visible  xpath=//table/thead//th//span[text()='${column10}']
    element should be visible  xpath=//table/thead//th//span[text()='${column11}']
    element should be visible  xpath=//table/thead//th//span[text()='${column12}']
    element should be visible  xpath=//table/thead//th//span[text()='${column13}']
    element should be visible  xpath=//table/thead//th//span[text()='${column14}']
    element should be visible  xpath=//table/thead//th//span[text()='${column15}']
    element should be visible  xpath=//table/thead//th//span[text()='${column16}']
    element should be visible  xpath=//table/thead//th//span[text()='${column17}']
    element should be visible  xpath=//table/thead//th//span[text()='${column18}']
    element should be visible  xpath=//table/thead//th//span[text()='${column19}']
    element should be visible  xpath=//table/thead//th//span[text()='${column20}']

User should be able to see Show/Hide Columns and Export to Excel button
    wait until element is not visible  ${Page Spinner}  10s
    run keyword  scroll page to location  0  1000000
    sleep  6s
    element should be visible  ${show/hide column}
    element should be visible  //mo-grid/div[1]/div[2]/mo-export-excel/a

Scroll grid horizontaly ${left}px
    execute javascript    $("vaadin-grid > div > div").get(1).scrollLeft=${left}

click show/hide column button and user should see list of columns in show/hide columns on details view
    wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${lead_time_details_view_show/hide_list}
     Log    ${TextFileContent}
     click element  ${show/hide column}
     should be equal  ${list}  ${TextFileContent}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})
#      click element  ${test_scroll_bar}
      #drag and drop by offset  ${test_scroll_bar}  0  1000

user should see aggregated tab and click on it and click show/hide column button and user should see list of columns in show/hide columns for Aggregated view
#     run keyword  scroll page to location  0  1000000
     sleep  3s
     click element  ${aggregated_btn}
     sleep  20s
     click element  //mo-lead-time/div/mo-grid[2]/div/div[4]/mo-show-hide/div/button
     sleep  10s
     ${col1}  get text  //*[@id="gridContainer"]/ul/li[1]
     should be equal  ${col1}  Source/Vendor
     ${col2}  get text  //*[@id="gridContainer"]/ul/li[2]
     should be equal  ${col2}  Material SKU
     ${col3}  get text  //*[@id="gridContainer"]/ul/li[3]
     should be equal  ${col3}  Material Description
     ${col4}  get text  //*[@id="gridContainer"]/ul/li[4]
     should be equal  ${col4}  PO Total Amount
     ${col5}  get text  //*[@id="gridContainer"]/ul/li[5]
     should be equal  ${col5}  Actual LT
     ${col6}  get text  //*[@id="gridContainer"]/ul/li[6]
     should be equal  ${col6}  Weighted Average
     click element  //mo-lead-time/div/mo-grid[2]/div/div[4]/mo-show-hide/div/button

User should see Aggregated tab and grid should show columns "${column1..}","${column2..}","${column3..}","${column4..}"," ${column5..}","${column6..}"
    element should be visible  xpath=//mo-grid[2]/div[2]//table/thead//tr//th//span[text()='${column1..}']
    element should be visible  xpath=//mo-grid[2]/div[2]//table/thead//tr//th[2]//span[text()='${column2..}']
    element should be visible  xpath=//mo-grid[2]/div[2]//table/thead//tr//th[3]//span[text()='Material Description']
    element should be visible  xpath=//mo-grid[2]/div[2]//table/thead//tr//th[4]//span[text()='${column4..}']
    element should be visible  xpath=//mo-grid[2]/div[2]//table/thead//tr//th[5]//span[text()='${column5..}']
    element should be visible  xpath=//mo-grid[2]/div[2]//table/thead//tr//th[6]//span[text()='${column6..}']

user enters module and scroll page down
     sleep  3s
     RUN KEYWORD  scroll page to location  0  1000000

User should see "© 2017 General Electric" changed to "© 2018 General Electric"
    ${Copyright text}  get text  //div[2]/footer/mo-footer/footer/span/span
    log  ${Copyright text}
    should be equal  ${Copyright text}  © 2018 General Electric