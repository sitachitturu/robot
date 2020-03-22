*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/storage_location_filter_step.robot

*** Test Cases ***
In order to see Storage Location Filter user should be able to select Storage Location Filter from Filters list at Scheduling page
    Given scroll page to location  1000000  0
    When User access "/secure/scheduling" module
    And click "Edit Filter(s)"
    When User check check box with "Storage Location" name
    And click "Continue"
    Then User should be able to see Storage Location Filter
