*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseOrders/purchase_orders_step.robot
*** Test Cases ***
Purchase Orders smoke test
    When User click Purchase Orders icon
    Then User should see "Purchase Orders"