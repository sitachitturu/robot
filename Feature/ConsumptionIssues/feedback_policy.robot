11/7/2017
212595411

*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ConsumptionIssues/feedback_policy_step.robot
Documentation    This suite is testing feedback button and Pricacy Policy link

*** Test Cases ***
User should see ContactUs button and be able to access feedback survey
    Given User access Consumption Issues module
    And User should see ContactUs button
    When User click ContactUs button
    Then User should see Log An Issue link
    Then User should see Yammer link
    Then User should see Feedback link
    Then User should see New Ideas link
#    Then User should redirect to service now page And User should see page Title "Material Optimization Suite"
#    And Input box with title "Which areas of the application does this concern?"
#    And Input box with title "Please provide your role (examples: Planner, Buyer, Plant Manager, Executive, etc.)"
#    And choose file option with title"(Optional) If you like, you can share a screenshot, email, or anything else that is helpful to attach so we can better understand this situation."
#    And User should see submit and cancel button

User should see Privacy Policy link and be able to access content of it
    Given User should see Privacy Policy link
    When User click Privacy Policy link
    sleep  5s
    Then User should see "Web Privacy Policy"