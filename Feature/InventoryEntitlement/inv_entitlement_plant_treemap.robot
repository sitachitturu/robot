*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/InventoryEntitlement/inv_entitlement_plant_treemap_step.robot

*** Test Cases ***
Stock Policy smoke test
    When User follow "/secure/inventory-entitlement"
    Then User should see "Inventory Entitlement"

Verify tree title "Plant" with I icon and verify information on Ii icon
    When User follow "/secure/inventory-entitlement"
    Then User should see tree title "plant" with I icon
    And User click on I icon then user should see information on it

Verify Inventory Entitlement landing page should contain tree-map with plant codes
    When User follow "/secure/inventory-entitlement"
    Then Inventory Entitlement landing page should display Tree-Map with plant codes on it(smoke test)

Verify Tree Map by selecting plants 3247,3273,3145
     When User Follow "/secure/inventory-entitlement"
     And click on plant filter and select plants (3247,3273,3145) and click apply button
     Then User should be able to see the selected plants should display on tree map with hover(with data)