*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/inventory_entitlement_variables.robot

*** Keywords ***
User follow "${link}"
    click link   ${link}
     sleep  10s
User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1

User should see tree title "plant" with I icon
    wait until element is visible  tree-title  20s
    ${text}  get text  tree-title
    log  ${text}
    ${text1}  should be equal  ${text}  Plant
    log  ${text1}

User click on I icon then user should see information on it
    wait until element is visible  tree-title  20s
    mouse over  tree-info
    focus  tree-info
    sleep  2s
    ${title}  get text  ${tree map title toltip}
    log  ${title}
    should be equal  ${title}  SIZE AND COLOR
    ${title2}  get text  ${tool tip message for title}
    log  ${title2}
    ${title3}  get text  ${tol tip equation for title}
    log  ${title3}
    should be equal  ${title3}  Larger/Darker = Greater Difference

Inventory Entitlement landing page should display Tree-Map with plant codes on it(smoke test)
     wait until element is visible  tree-title  20s
     page should contain element  treemap_panel
     [Return]  status
     ${list}  get text  treemap
     log  ${list}

click on plant filter and select plants (3247,3273,3145) and click apply button
      wait until element is visible  plant  20s
      click element  plant
      input text  search-input  874W
      wait until element is visible  product-874W - PC Parts UK  10s
      click element  product-874W - PC Parts UK
      wait until element is visible  search-input  10s
      input text  search-input  Cham
      wait until element is visible  product-CHAM - PC France Nancy  10s
      click element  product-CHAM - PC France Nancy
      wait until element is visible  search-input  10s
      input text  search-input  p84B
      wait until element is visible  product-P84B - PC Berlin Services  10s
      click element  product-P84B - PC Berlin Services
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      sleep  2s

User should be able to see the selected plants should display on tree map with hover(with data)
      wait until element is visible  treemap  20s
      ${list}  get text  treemap
      log  ${list}
      element should contain  treemap  874W
      [Return]  status

