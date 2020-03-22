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

User should see "Material SKU" on the landing page and should be able to click on "Material SKU" title
     page should contain  Material SKU
     ${text}  get text  //*[@id="treeTab3"]
     log  ${text}
     should be equal  ${text}  Material SKU
     click element  //*[@id="treeTab3"]
     sleep  5s

User should be able to treemap with title Material SKU with I icon
     wait until element is visible  ${Material SKU Title}  20s
     ${text}  get text  ${Material SKU Title}
     log  ${text}
     ${text1}  should be equal  ${text}  Material SKU
     log  ${text1}

User click on I icon then user should see information on it
     wait until element is visible  ${Material SKU Title}  20s
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

inventory-entitlement page should display Tree-Map with Material Sku codes on it(smoke test)
     wait until element is visible  ${Material SKU Title}  20s
     page should contain element  treemap_panel
     [Return]  status
     ${list}  get text  treemap
     log  ${list}

click on plant filter and select plants (3145,3273) and click apply button
      wait until element is visible  plant  20s
      click element  plant
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

User should be able to see the selected plants material sku should display on tree map with hover(with data)
       wait until element is visible  treemap  30s
      ${list}  get text  treemap
      log  ${list}

click on plant filter and select plants (3135,326d) and click apply button
      wait until element is visible  plant  20s
      click element  plant
      input text  search-input  IN20
      wait until element is visible  product-IN20 - PC Chennai  10s
      click element  product-IN20 - PC Chennai
      wait until element is visible  search-input  10s
      input text  search-input  IN10
      wait until element is visible  product-IN10 - PC India Chennai  10s
      click element  product-IN10 - PC India Chennai
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      sleep  5s

User should see "-" symbol with hover message saying "no data to display" on it
      wait until element is visible  treemap  20s
      element should contain  treemap  -
      ${list}  get text  treemap
      log  ${list}