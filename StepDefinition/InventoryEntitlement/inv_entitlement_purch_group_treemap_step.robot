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

User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
        page should contain  Purchasing Group
        ${text}  get text  //*[@id="treeTab2"]
        log  ${text}
        should be equal  ${text}  Purchasing Group
        click element  //*[@id="treeTab2"]
        sleep  2s

User should be able to treemap with title Purchasing Group with I icon
        page should contain element  ${purchasing group title}
        ${text}  get text  ${purchasing group title}
        log  ${text}
        ${text1}  should be equal  ${text}  Purchasing Group
        log  ${text1}

User click on I icon then user should see information on it
        wait until element is visible  ${purchasing group title}  20s
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

Inventory-entitlement page should display Tree-Map with purchasing group with names on it(smoke test)
         wait until element is visible  ${purchasing group title}  20s
         page should contain element  treemap_panel
         [Return]  status
          ${list}  get text  treemap
          log  ${list}

click on plant filter and select GERMAN plants (3247,5453,HL01) and click apply button
          wait until element is visible  plant  20s
          click element  plant
          input text  search-input  3247
          wait until element is visible  product-3247 - AGM Mönchengladbach  10s
          click element  product-3247 - AGM Mönchengladbach
          wait until element is visible  search-input  10s
          input text  search-input  5453
          wait until element is visible  product-5453 - RML Ludwigslust  10s
          click element  product-5453 - RML Ludwigslust
          wait until element is visible  search-input  10s
          input text  search-input  HL01
          wait until element is visible  product-HL01 - AGK Kassel  10s
          click element  product-HL01 - AGK Kassel
          wait until element is visible  ${Apply Button}  10s
          click button  ${Apply Button}
          sleep  5s

User should be able to see the selected plants purchasing group codes should display on tree map with hover(with data)
          wait until element is visible  treemap  30s
          ${list}  get text  treemap
          log  ${list}

click on plant filter and select plants (5352,539A,539B) which are not related to Germany and click apply button
           wait until element is visible  plant  20s
           click element  plant
           input text  search-input  874w
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
           sleep  5s

click on plant filter and select germany plants (3247,3273) and other plants and click apply button
          wait until element is visible  plant  20s
          click element  plant
          input text  search-input  3247
          wait until element is visible  product-3247 - AGM Mönchengladbach  10s
          click element  product-3247 - AGM Mönchengladbach
          wait until element is visible  search-input  10s
          input text  search-input  3273
          wait until element is visible  product-3273 - PTI Naini  10s
          click element  product-3273 - PTI Naini
          wait until element is visible  ${Apply Button}  10s
          click button  ${Apply Button}
          sleep  5s