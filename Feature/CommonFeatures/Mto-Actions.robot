*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/Mto-Actions_steps.robot

*** Test Cases ***
#Actions column should be visible and under action column dropdown with dropdown list should be visible in scheduling module
#     Given User access "/secure/scheduling" module
#     And scroll page to location  0  1000000
#     And User should see Action column with dropdown
#     Then click on action dropdown and user should see list of actions in action dropdown
#
#Actions column should be visible and under action column dropdown with dropdown list should be visible in Purchase order module
#     Given User access "/secure/purchase-orders" module
#     And scroll page to location  0  1000000
#     And element should be visible  ${PO ACTION col}
#     And element should be visible  //*[@id="columnValuesList"]
#     Then click on action dropdown and user should see list of actions in action dropdown in purchase orders module

#Actions column should be visible and under action column dropdown with dropdown list should be visible in Material Transfer module in waiting for action tab for selling grid
#     Given User access "/secure/material-transfer" module
#     And element should be visible  ${decision col}
#     And element should be visible  //*[@id="columnValuesList"]
#     And click element  //*[@id="columnValuesList"]
#     Then click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in waiting for action tab for seller grid
#
#Actions column should be visible and under action column dropdown with dropdown list should be visible in Material Transfer module in In Process tab for selling grid
#     And element should be visible  ${decision col}
#     And element should be visible  //*[@id="columnValuesList"]
#     And click element  ${in process tab}
#     And click element  //*[@id="columnValuesList"]
#     Then click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in In Process tab
#
#Actions column should be visible and under action column dropdown with dropdown list should be visible in Material Transfer module in Accepted Tab tab for selling grid
#     And element should be visible  ${decision col}
#     And element should be visible  //*[@id="columnValuesList"]
#     And click element  ${Accepted tab}
#     And sleep  5s
#     And click element  //*[@id="columnValuesList"]
#     And Verify the text of the selected Accepted tab
#     Then click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in Accepted Tab/rejected for seller grid
     #And sleep  5s

Actions column should be visible and under action column dropdown with dropdown list should be visible in Material Transfer module in Rejected Tab tab for selling grid
     Given User access "/secure/material-transfer" module
     And click element  ${Rejected tab}
     And sleep  6s
     And click element  //mo-drop-down/div/select[@id='columnValuesList']
     And sleep  4s
     And Verify the text of the selected Rejected tab
     Then click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in Accepted Tab/rejected for seller grid



#Actions column should be visible and under action column dropdown with dropdown list should be visible in Material Transfer module in waiting for action tab for buyer grid
#     And scroll page to location  0  100000
#     And element should be visible  ${buying grid decision col}
#     And element should be visible  //*[@id="columnValuesList"]
#     And click element  ${buyer grid column value list}
#     And sleep  5s
#     Then click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in waiting for action tab for buyer grid
#
#Actions column should be visible and under action column dropdown with dropdown list should be visible in Material Transfer module in In Process tab for buyer grid
#     And element should be visible  ${buying grid decision col}
#     And click element  ${in process tab in buyer grid}
#     And click element  ${buyer grid column value list}
#     Then click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in In Process tab