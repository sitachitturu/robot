*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/LeadTimeAnalytics/no_access_lead_time_step.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Test Cases ***
Scenario: Verify User Activity module with SSO's which are not security enabled DL sso's
#    Given User enter SSO which is not in DL
    Then User should not be able to see User Activity module icon
Scenario: When User without access enter the link "/secure/activity" he should see Forbidden
    Given User acces URL "${WELCOME.URL}/secure/activity"
    Then User should see "Forbidden"