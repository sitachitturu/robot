*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/Scheduling/scheduling_module_url_step.robot
*** Test Cases ***
Scheduling
    When User click Scheduling icon
    Then User should see "Scheduling"