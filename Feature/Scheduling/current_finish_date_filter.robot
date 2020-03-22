*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/current_finish_date_filter_step.robot


*** Test Cases ***
In order to see Current Finish Date Filter user should be able to select Product Hierarchy Filter from Filters list at Scheduling page
    Given User access "/secure/scheduling" module
    And click "Edit Filter(s)"
    When User check check box with "Current Finish Date" name
    And click "Continue"
    Then User should be able to see Current Finish Date Filter
