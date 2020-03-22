*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/UserActivity/log_user_activity_step.robot
Resource  ../../StepDefinition/PurchaseRequisition/show_hide_column_list_step.robot

*** Test Cases ***
Scenario: Verify User Activity module
    Given User should be able to see User Activity module icon and click on User Activity icon
    Then User should be able to see columns:"Timestamp","Event Type","URL","User Name (SSO)","E-Mail","User Agent (Browser)" with data
    And User should be able to see Show/Hide Columns and Export to Excel button

Verify uaer activity module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"
