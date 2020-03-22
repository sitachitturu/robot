11/7/2017
212595411

*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/StockPolicy/feedback_policy_step.robot
Documentation    This suite is testing feedback button and Pricacy Policy link

*** Test Cases ***
User should see Fedback button and be able to access feedback survey
    Given User access Stock Policy module
    And User should see Feedback button
    When User click feedback button
    #Then User should see "Please provide your feedback here. Include details that help us understand the situation as much as possible."

User should see Privacy Policy link and be able to access content of it
    Given User should see Privacy Policy link
    When User click Privacy Policy link
    Then User should see "Web Privacy Policy"