*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/inventory_entitlement_variables.robot

*** Keywords ***
User access "${link}" module
            click link   ${link}
            sleep  10s
            wait until element is visible  ${show/hide column}  10s

User should be able to see Stock Title "INVENTORY POSITION" on the Inventory Entitlement landing page
             wait until element is visible  addFilterBtn  30s
             page should contain element  inventory_title
             ${text}  get text  inventory_title
             log  ${text}
             should be equal  ${text}  INVENTORY POSITION

scroll page to location
             [Arguments]    ${x_location}    ${y_location}
             Execute JavaScript    window.scrollTo(${x_location},${y_location})

User should see defaults columns in the landing page of inventory entitlement
            sleep  2s
            run keyword  scroll page to location  0  100000
            wait until element is visible  ${PLANT COLUMN}  40s
            wait until element is visible  ${On Hand Column}  30s
            element should be visible  ${On Hand Column}
            wait until element is visible  ${Standard Inventory Column}  20s
            element should be visible  ${Slow Moving Inv column}
            wait until element is visible  ${Active Inv column}  20s
            element should be visible  ${Entitlement Inv column}
            element should be visible  ${- Var to Entitlement Column}
            #scrolls the horizontal scroll bar of the table so other columns are visible
            #Execute JavaScript  window.document.getElementsByClassName('vaadin-grid style-scope vaadin-grid-scroller vaadin-grid style-scope vaadin-grid-scroller-horizontal')[0].scrollLeft += 10000
            element should be visible  ${Entitlement Variation column}
            element should be visible  ${Total Outputs column}
            element should be visible  ${Firm Inputs column}
            sleep  2s

User should see Export To Excel option and able to export the grid
            wait until element is visible  ${Export to Excel}  10s
            ${title}  get text  ${Export to Excel}
            log  ${title}
            should be equal  ${title}  Export to Excel
            [Return]  status

User select Value($) option on grid
            run keyword  scroll page to location  0  1000000
            wait until element is visible  ${Value ($)}  20s
            click element  ${Value ($)}
            sleep  30s

User should see $ sign in the grid
           run keyword  scroll page to location  0  1000000
           :FOR  ${i}  IN RANGE  1  15
            \  log  ${i}
            \  ${on hand column}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-column/div
            \  should contain  ${on hand column}  $
            \  ${standard_inv}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-column/div
            \  should contain  ${standard_inv}  $
            \  ${diffrence_std}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[7]/vaadin-grid-cell-content/mo-column/div
            \  should contain  ${diffrence_std}  $
            \  ${slow_moving_inv}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[9]/vaadin-grid-cell-content/mo-column/div
            \  should contain  ${slow_moving_inv}  $
            \  ${active_inv}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[11]/vaadin-grid-cell-content/mo-column/div
            \  should contain  ${active_inv}  $