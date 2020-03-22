*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ExecutiveSummary/executive_summary_step.robot
*** Test Cases ***
Executive_summary
    When User click Executive Summary icon
    Then User should see "Executive Summary"