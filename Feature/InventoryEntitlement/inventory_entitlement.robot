*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/InventoryEntitlement/inventory_enetitlement_step.robot

*** Test Cases ***
Inventory Entitlement
    When User click Inventory Entitlement icon
    Then User should see "Inventory Entitlement"
