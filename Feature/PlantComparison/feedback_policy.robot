11/7/2017
212595411

*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PlantComparison/feedback_policy_step.robot
Documentation    This suite is testing feedback button and Pricacy Policy link

*** Test Cases ***
User should see ContactUs button and be able to access feedback survey
    Given User access Plant Comparison module
    And User should see ContactUs button
    When User click ContactUs button
    Then User should see Log An Issue link
    Then User should see Yammer link
    Then User should see Feedback link
    Then User should see New Ideas link
    #Then User should see "Please provide your feedback here. Include details that help us understand the situation as much as possible."

User should see Privacy Policy link and be able to access content of it
    Given User should see Privacy Policy link
    When User click Privacy Policy link
    Then User should see "Web Privacy Policy"