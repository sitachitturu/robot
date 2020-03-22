11/7/2017
212595411

*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/feedback_policy_step.robot
Documentation    This suite is testing feedback button and Pricacy Policy link

*** Test Cases ***
User should see ContactUs button and be able to access feedback survey
    Given User access Scheduling module
    And User should see ContactUs button
    When User click ContactUs button
    Then User should see Log An Issue link
    Then User should see Yammer link
    Then User should see Feedback link
    Then User should see New Ideas link

### Testing the Log An Issue Page#####
    Then User should redirect to service now page And User should see page Title "Enter a Service Now Ticket"
    sleep  10s
    And Input box with title "Please list Plant(s), Module(s), and/or ERP(s) impacted *"
    And Input box with title "Please enter description of the issue *"
    And Drop down box with title "Business "
    And Drop down with title "Urgency"
    Then User should switch the focus to MOS

### Testing the Feedback Page#####
    Then User should click Feedback link
    Then User should see all the contents on the feedback on GE survey page
    Then User should switch the focus to MOS

### Testing the Yammer Page#####
    Then User should click Yammer link
    #Then User should see the MOS Yammer page
    Then User should switch the focus to MOS
    Then User click ContactUs button

User should see Privacy Policy link and be able to access content of it
    And scroll page to location  1000000000  0
    Given User should see Privacy Policy link
    When User click Privacy Policy link
    And scroll page to location  1000000000  0
    Then User should see "Web Privacy Policy"

