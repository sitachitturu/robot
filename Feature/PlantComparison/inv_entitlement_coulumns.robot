8/14/2017
212590906
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PlantComparison/inve_entitlement_coulumns_step.robot

*** Test Cases ***
Verify 12-month SMI column and sorting function for 12-month smi coulumn on ui
    Given User access "/secure/plant-comparison" module
    Then User should see data grid with "12-month SMI" and "Variation to Entitlement" coulumns on UI
    And verify sorting option for the columns "12-month SMI"

Verify "Variation to Entitlement" column and sorting function for "Variation to Entitlement" coulumn on ui
    Given User access "/secure/plant-comparison" module
    Then verify sorting option for the columns "Variation to Entitlement"

Verify calculations for "12-month SMI" and "Variation to Entitlement" by selecting plant by plant from plant filter
    Given User access "/secure/plant-comparison" module
    When User selects one by one plant from plant filter and Then verify calculations for "12-month SMI" column and "Variation to Entitlement" column

Verify columns "12-month SMI" and "Variation to Entitlement" should direct to inventory entitlement module when user click on that columns
    Given User access "/secure/plant-comparison" module
    When User clicks on "12-month SMI" row then user should direct to inventory entitlement module and user should see "Inventory Entitlement" title in page
    And User clicks on "Variation to Entitlement" row then user should direct to inventory entitlement module and user should see "Inventory Entitlement" title in page
