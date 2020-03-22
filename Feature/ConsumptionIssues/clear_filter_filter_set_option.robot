*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ConsumptionIssues/consumption_issues_step.robot
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot
Resource  ../../StepDefinition/ConsumptionIssues/clear_filter_option_step.robot

*** Test Cases ***
Verify newly added feature "Clear filter" option
    When User click Consumption issues module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    #When User click Consumption issues module
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify consumption issues. module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"