*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/ideal_finish_date_filter_step.robot


*** Test Cases ***
In order to see Ideal Finish Date Filter user should be able to select Product Hierarchy Filter from Filters list at Scheduling page
    Given User access "/secure/scheduling" module
    And click "Edit Filter(s)"
    When User check check box with "Ideal Finish Date" name
    And click "Continue"
    Then User should be able to see Ideal Finish Date Filter
