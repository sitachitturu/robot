*** Settings ***
Library           Selenium2Library
Resource          ../../StepDefinition/Scheduling/scheduling_exceptions_step.robot

*** Test Cases ***
Scheduling
        When User click Scheduling icon
        Then User should see "Scheduling"

Verify exceptions "Cancel Process" ,"Reschedule In", "Reschedule Out", "Overdue" for defeult page
        When User click Scheduling icon
        And sleep  3s
        And click element  clearFilterBtn
        and sleep  2s
        And select action required from expection requires action filter
        And sleep  3s
        Then User should see rights numbers in exceptions for "Cancel process" for default view with out selecting any plant
        And sleep  3s
        And User should see rights numbers in exceptions for "Reschedule In" for default view with out selecting any plant
        And sleep  3s
        And User should see rights numbers in exceptions for "Reschedule Out" for default view with out selecting any plant
        And sleep  3s
        And User should see rights numbers in exceptions for "Overdue" for default view with out selecting any plant