*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseOrders/comment_purchase_order_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***
#
Verify the "Add Comment - action_icon" is present
    when User click Purchase Orders icon
    then User should see "Purchase Orders"
    Then Validate the Action-icon comment present

Verify the presence of comment column in the data grid
    when User click Purchase Orders icon
    then User should see "Purchase Orders"
    then Validate the comment column in the data grid

Verify modal box for comments
    when User click Purchase Orders icon
    then User should see "Purchase Orders"
    then User click plant filter
    then User enter plant code in search filter  1008 - PAMPA
    then User click a value in plant filter  1008 - PAMPA
    then User should click on comment icon at first row
    then Verify the opened modal box
    then Close the Modal box

Verify the contents of modal box
    when User click Purchase Orders icon
    then User should see "Purchase Orders"
    then User click plant filter
    then User enter plant code in search filter  1008 - PAMPA
    then User click a value in plant filter  1008 - PAMPA
    then User should click on comment icon at first row
    then Verify the opened modal box
    then Verify the options present on the modal box
    then Close the Modal box

Verify the user to post comment in Modal box
    when User click Purchase Orders icon
    then User should see "Purchase Orders"
    then User click plant filter
    then User enter plant code in search filter  1008 - PAMPA
    then User click a value in plant filter  1008 - PAMPA
    then User should click on comment icon at first row
    then User should enter the comment and verify the the comment under the record  Test comment


