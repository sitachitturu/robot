*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/InventoryEntitlement/inv_entitlement_grid_step.robot

*** Test Cases ***
Verify stock title of the Inventory Entitlement landing page
    Given User access "/secure/inventory-entitlement" module
    Then User should be able to see Stock Title "INVENTORY POSITION" on the Inventory Entitlement landing page

Verify columns Default View of the Inventory Entitlement landing page
    Given User access "/secure/inventory-entitlement" module
    Then User should see defaults columns in the landing page of inventory entitlement

Verify Export To excel button on the Inventory Entitlement Landing Page
    Given User access "/secure/inventory-entitlement" module
    Then User should see Export To Excel option and able to export the grid

Verify Grid by selecting Value($) in Inventory Entitlement Landing page
    Given User access "/secure/inventory-entitlement" module
    When User select Value($) option on grid
    Then User should see $ sign in the grid
