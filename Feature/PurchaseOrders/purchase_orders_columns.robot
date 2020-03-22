*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseOrders/purchase_orders_columns_step.robot
*** Test Cases ***
Purchase Orders smoke test
    When User click Purchase Orders icon
    Then User should see "Purchase Orders"

Verify sorting function for heatmap in purchase orders module for COUNT for buyer
    When User select plant business from plant business
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for buyer

Verify sorting function for heatmap in purchase orders module for COUNT for vendor
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for vendor

Verify sorting function for heatmap in purchase orders module for COUNT for planner
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for planner

Verify sorting function for heatmap in purchase orders module for COUNT for material
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for Material

Verify sorting function for heatmap in purchase orders module for Value($) for Vendor view
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for vendor for value view

Verify sorting function for heatmap in purchase orders module for Value($) for planner view
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for planner for value view

Verify sorting function for heatmap in purchase orders module for Value($) for Material view
    Then user see heatmap with sorting icon and able to do sorting for the Exception message columns for Material for value view