*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/filters_executive_summary_step.robot

*** Test Cases ***
Check Filters on Executive Summary
    Given User access "/secure/executive-summary" module
    Then User should see "Plant" filter
    And click "Edit Filter(s)"
    When User check check box with "Plant Category" name
    When User check check box with "Plant Business" name
    When User check check box with "Plant Region" name
    When User check check box with "Sub Business" name

    And click "Continue"
    Then User should be able to see Plant Business Filter
    Then User should be able to see Plan Category Filter
    Then User should be able to see Plant Region Filter
    Then User should be able to see sub_business Filter
    Then Count sums of all filters should equal the sum of records for corresponding plant

Verify newly added feature "Clear filter" option
    Given User access "/secure/executive-summary" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    #Given User access "/secure/scheduling" module
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify Executive summary module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"