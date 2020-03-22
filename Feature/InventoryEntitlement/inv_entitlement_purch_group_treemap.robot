*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/InventoryEntitlement/inv_entitlement_purch_group_treemap_step.robot

*** Test Cases ***
Inventory Entitlement smoke test
    When User follow "/secure/inventory-entitlement"
    Then User should see "Inventory Entitlement"

Verify purchasing group on the inventory entitlement landing page and able to click on that
    When User follow "/secure/inventory-entitlement"
    And User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
    Then User should be able to treemap with title Purchasing Group with I icon

Verify tree title "Purchasing Group" with I icon and verify information on I icon
    When User follow "/secure/inventory-entitlement"
    And User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
    Then User should be able to treemap with title purchasing group with I icon
    And User click on I icon then user should see information on it

Verify Inventory-entitlement page should contain tree-map with purchasing group names for selected plants
    When User follow "/secure/inventory-entitlement"
    And User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
    Then Inventory-entitlement page should display Tree-Map with purchasing group with names on it(smoke test)

##Verify Tree Map by selecting plants german plants 3247,5453,HL01
##     When User Follow "/secure/inventory-entitlement"
##     And User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
##     And click on plant filter and select GERMAN plants (3247,5453,HL01) and click apply button
##     Then User should be able to see the selected plants purchasing group codes should display on tree map with hover(with data)

Verify Purchasing Group treemap by selecting which were not releted to germany(5352,539A,539B)
     When User Follow "/secure/inventory-entitlement"
     And User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
     And click on plant filter and select plants (5352,539A,539B) which are not related to Germany and click apply button
     Then User should be able to see the selected plants purchasing group codes should display on tree map with hover(with data)

##Verify Purchasing Group treemap by selecting germany plants and othber plants (3247,3273)
##    When User Follow "/secure/inventory-entitlement"
##    And User should see "Purchasing Group" on the landing page and should be able to click on "Purchasing Group" title
##     And click on plant filter and select germany plants (3247,3273) and other plants and click apply button
##     Then User should be able to see the selected plants purchasing group codes should display on tree map with hover(with data)
