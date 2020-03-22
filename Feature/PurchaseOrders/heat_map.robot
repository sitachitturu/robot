8/28/2017
212613237
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseOrders/heat_map_step.robot
Resource  ../../StepDefinition/PurchaseOrders/filters_purchase_orders_step.robot
*** Test Cases ***
Verify "Purchase Order Items By" Drop Down Menu and Heatmap Data - Buyer Tab
    Given User access "/secure/purchase-orders" module
    When click "Edit Filter(s)"
    When User check check box with "Planner / MRP Contr." name
    When click "Continue"

    When verify column header with drop down selection  Buyer
    sleep  15s
    Then verify column data with filter drop down data for  pgroup

Verify "Purchase Order Items By" Drop Down Menu and Heatmap Data - Planner Tab
    When verify column header with drop down selection  Planner
    #sleep to let the new data load before grabbing the text from grid. otherwise it will grabb ''.
    sleep  15s
    Then verify column data with filter drop down data  mrpc

Verify "Purchase Order Items By" Drop Down Menu and Heatmap Data - Plant Tab
    When verify column header with drop down selection  Plant
    #sleep to let the new data load before grabbing the text from grid. otherwise it will grabb ''.
    sleep  15s
    Then verify column data with filter drop down data  plant

Verify "Purchase Order Items By" Drop Down Menu and Heatmap Data - Vendor Tab
    When click "Edit Filter(s)"
    When User check check box with "Source/Vendor" name
    When click "Continue"

    When verify column header with drop down selection  Vendor
    #sleep to let the new data load before grabbing the text from grid. otherwise it will grabb ''.
    sleep  15s
    Then verify column data with filter drop down data for  source

Verify AGE CLASSIFICATION and EXEPTION MESSAGE Count(#) view in Heat map in Purchase Orders for Races
    Given User access "/secure/purchase-orders" module
    And User select Plant from plant filter
