9/13/2017
212595411
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/Alerts/alerts_steps.robot

Documentation    As a user, I want to be able to access preferences for alerts, so that I can configure the way alerts behave.

*** Test Cases ***
Verify "Alerts & Recommendations"
    [Tags]    regression
    Given User click at Alerts icon
    Then User should see "Alerts & Recommendations" header
    And User should see gear icon
    And User should see message "No alerts to show"

Verify "Configure Alerts Preferences?"
    Given User click gear icon
    Then User should see "Configure Alerts Preferences?" header
    And User should see mesaage "Our alerts feature allows users to receive key insights catered to their needs. Would you like to get started?"
    And User should see "Opt out", "Later", "Let's go" button

Verify "Alerts Preferences"
    Given User click Let's go button
    Then User should see "Alerts Preferences" header
    And User should see "Interest", "Criteria" and "Frequency" tab
    And User should see message "Content Coming Soon"
    And User should see "Alerts on" switch
    And User should see "Save" and "Apply button"
    And User should see "Close" icon

Verify Alerts switch
    Given User should see "Alerts on" switch
    When User click "Alerts on" switch
    Then User should see "Alerts Off"
    And User Should see "Apply button"
    When User click "Apply button"
    Then "Alerts Preferences" should not be visible

Verify "Are you sure?"
    Given User access "Alerts Preferences"
    When User click close icon
    Then User should see "Are you sure?" header
    And User should see message "If you exit now, you're changes won't be saved. To turn off alerts, use the slider at the bottom of this modal."
    When User click "Cancel Button"
    Then User should see "Alerts Preferences"
    When User click "Exit"
    Then User should not see "Are you sure?" or "Alerts Preferences"


