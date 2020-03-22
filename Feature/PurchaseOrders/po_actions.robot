*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseOrders/purchase_orders_step.robot
Resource         ../../StepDefinition/PurchaseOrders/po_actions_steps.robot
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot

Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
Suite Teardown   Close browser

*** Test Cases ***
Validate po actions dropdown options
    When User click Purchase Orders icon
    Then User should see "Purchase Orders"
    When User click on first po action dropdown
    Then Validate po actions

