*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/LeadTimeAnalytics/lead_time_step.robot
*** Test Cases ***
Lead Time Analytics Smoke Test
    When User click Lead Time Analytics icon
    Then User should see "Lead Time Analytics"