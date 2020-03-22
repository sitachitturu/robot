*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/InventoryEntitlement/inv_entitlement_material_sku_treemap_step.robot

*** Test Cases ***
Inventory Entitlement smoke test
    When User follow "/secure/inventory-entitlement"
    Then User should see "Inventory Entitlement"

Verify Material SKU on the Inventory Entitlement landimg page and able to click on that
    When User follow "/secure/inventory-entitlement"
    And User should see "Material SKU" on the landing page and should be able to click on "Material SKU" title
    Then User should be able to treemap with title Material SKU with I icon

Verify tree title "Material SKU" with I icon and verify information on I icon
    When User follow "/secure/inventory-entitlement"
    And User should see "Material SKU" on the landing page and should be able to click on "Material SKU" title
    Then User should be able to treemap with title Material SKU with I icon
    And User click on I icon then user should see information on it

Verify Inventory Entitlement page should contain tree-map with Material SKU codes
    When User follow "/secure/inventory-entitlement"
    And User should see "Material SKU" on the landing page and should be able to click on "Material SKU" title
    Then inventory-entitlement page should display Tree-Map with Material Sku codes on it(smoke test)

Verify Tree Map by selecting plants 3145,uk31
     When User Follow "/secure/inventory-entitlement"
     And User should see "Material SKU" on the landing page and should be able to click on "Material SKU" title
     And click on plant filter and select plants (3145,3273) and click apply button
     Then User should be able to see the selected plants material sku should display on tree map with hover(with data)



