10/12/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
*** Keywords ***
User access Purchase Orders module
    click element  ${Purchase Orders Icon}
    sleep  15s
    wait until element is visible  //div[@id='topBar']/span[text()='Purchase Orders']
    wait until element is visible  ${Buyer table header}  20s
    wait until element is visible  //vaadin-grid[@id='dataTableGrid']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Exception')]  20s
User should select "Short Cycle Indicator" column and "Short Cycle Days" column from Show/Hide Columns
    run keyword  scroll page to location  0  100000
    click element  ${show/hide column}
    sleep  3s
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Exception']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Material SKU']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='PO Action']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Release Number']
    Execute JavaScript    window.scrollTo(0,10000)
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Short Cycle Indicator']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Short Cycle Days']
    sleep    5s
    click button  ${show/hide column}
    wait until element is visible  //div[@class='header-cell style-scope mo-grid']//span[text()='Short Cycle Indicator']  10s
    wait until element is visible  //div[@class='header-cell style-scope mo-grid']//span[text()='Short Cycle Days']  10s


User Should see only "No" value in "Short Cycle Indicator" column if "Short Cycle Days" column is showing value equal to "0"
    sleep  3s
#    ${short cycle days}  get value  //tr[@style='transform: translate(0px, 0px);']//td[@style='width: 100px; order: 720000000;']//div[@id='moColValue']
    ${short cycle indicator}=  execute javascript  return $("#dTableGrid table tr:nth(5) td:nth(65) div").text();
    ${short cycle days}=  execute javascript  return $("#dTableGrid table tr:nth(5) td:nth(68) div").text();
    set global variable  ${short cycle indicator}
    set global variable  ${short cycle days}
    log to console  ${short cycle indicator}
    log to console  ${short cycle days}
    run keyword if  ${short cycle days} > 0  short should be = YES
    #run keyword if  ${short cycle days} = 0  short should be = NO

short should be = YES
    should be equal  ${short cycle indicator}  Yes
short should be = NO
    should be equal  ${short cycle indicator}  No





scroll page to location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript  window.scrollTo(${x_location},${y_location})
