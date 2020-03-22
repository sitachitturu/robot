*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/inventory_entitlement_variables.robot

*** Keywords ***
User click Inventory Entitlement icon
    click element  ${Inventory Entitlement icon}

User should see "Inventory Entitlement"
    element should be visible  ${Inventory Entitlement Page Title}
    ${title}  get text  ${Inventory Entitlement Page Title}
    log  ${title}
    should be equal  ${title}  Inventory Entitlement
