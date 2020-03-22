*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
*** Keywords ***
User click Requisitions (incl. Planned) icon
    click element  ${Requisitions (incl. Planned) icon}

User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1
