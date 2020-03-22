*** Settings ***
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot
Resource         ../../StepDefinition/Admin/notification_steps.robot
Resource  ../../StepDefinition/PurchaseRequisition/show_hide_column_list_step.robot
#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***
Verify notification navigation
    [Documentation]  This test verifies the navigation and the url to notification module.
    [Tags]  Regression
    When User click Admin icon
    And User click notification icon
    Then User should see notification page

Verify notification label and dropdown
    [Documentation]  This test verifies all the intended labels in the notifications module page.
    [Tags]  Regression
    When User click Admin icon
    #And User click notification icon
    Then User should see notification page
    And Verify notification label dropdown items

Verify notification grid columns
    [Documentation]  This test verifies the default column names for the  notifications grid.
    [Tags]  Regression
    When User click admin icon
    #And User click notification icon
    Then User should see notification page
    And Verify Notification grid column labels

Verify notification create button
    [Documentation]  This test verifies the functionality of create button and then validates the notification form.
    [Tags]  Regression
    When User click admin icon
    #And User click notification icon
    Then User should see notification page
    And User clicks on create button
    Then User should see notification creation form

Verify create general notification
    [Documentation]  This test verifies the general notification creation flow and checks whether the notification comes up in the grid.
    [Tags]  Regression
    When User click admin icon
    #And User click notification icon
    Then User should see notification page
    And Create general notification
    Then User should see the created notification in grid

Verify notifications. module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"





