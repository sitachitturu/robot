*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/UserActivity/user_activity_step.robot
*** Test Cases ***
User Activity Smoke Test
    When User click User Activity icon
    Then User should see "User Activity"