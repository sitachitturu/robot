*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/Admin/validation_step.robot
Resource  ../../StepDefinition/PurchaseRequisition/show_hide_column_list_step.robot
*** Test Cases ***

Verify Plants from plant filter in validation module with critical plants list
      Given User access "/secure/validation" module
      Then select plant from plant filter and compare with critical plants list

Verify Plants from plant filter in validation module from plant lookup table from database
      Given User access "/secure/validation" module
      Then select plant from plant lookup table from database and verify plants are visible and those available plants have data or not

Verify data validation. module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"