*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
*** Keywords ***
User click Purchase Orders icon
    click element  ${Purchase Orders Icon}
    sleep  10s

User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1


