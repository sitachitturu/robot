10/12/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
*** Keywords ***
User access Requisitions (incl. Planned) module
#    click element  ${Requisitions (incl. Planned) icon}
#    wait until element is visible  //div[@id='topBar']/span[text()='Requisitions (incl. Planned']
    wait until element is visible  //vaadin-grid[@id='dataTableGrid']//span[contains(normalize-space(), 'Buyer')]  20s
    wait until element is visible  //vaadin-grid[@id='dataTableGrid']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Age (Bucket)')]  20s
User should select "Short Cycle Indicator" column and "Short Cycle Days" column from Show/Hide Columns
    wait until element is visible  ${show/hide column}  10s
    click element  ${show/hide column}
    sleep  3s
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Age (Bucket)']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Delivery Date']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Material SKU']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Value (USD)']
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Requisition Date']
    Execute JavaScript    window.scrollTo(0,10000)
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Short Cycle Days']
    sleep    5s
    click button  ${show/hide column}
    wait until element is visible  //div[@class='header-cell style-scope mo-grid-lite']//span[text()='Short Cycle']  10s
    wait until element is visible  //div[@class='header-cell style-scope mo-grid-lite']//span[text()='Short Cycle Days']  10s


User Should see only "No" value in "Short Cycle Indicator" column if "Short Cycle Days" column is showing value equal to "0"
    sleep  3s
#    ${short cycle days}  get value  //tr[@style='transform: translate(0px, 0px);']//td[@style='width: 100px; order: 720000000;']//div[@id='moColValue']
      click element  //div[@class='header-cell style-scope mo-grid-lite']//span[text()='Short Cycle Days']
      sleep  5s
    ${short cycle}=  execute javascript  return $("#productionOrderGrid table tr:nth(1) td:nth(1) div").text();
    ${short cycle days}=  execute javascript  return $("#productionOrderGrid table tr:nth(1) td:nth(4) div").text();
    set global variable  ${short cycle}
    set global variable  ${short cycle days}
    log  ${short cycle}
    log  ${short cycle days}
    run keyword if  ${short cycle days} > 0  short should be = YES
    run keyword if  ${short cycle days} == 0  short should be = NO

short should be = YES
    should be equal  ${short cycle}  Yes
short should be = NO
    should be equal  ${short cycle}  No

scroll page to location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript  window.scrollTo(${x_location},${y_location})