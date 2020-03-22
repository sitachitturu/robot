9/19/2017
212595411
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ReceiptOptamization/push_days_step.robot

*** Test Cases ***
Verify if Push days column is visible and have correct values in Month view
    Given User access "/secure/receipt-optimization" module
    Then User should see "Push Days" column
    And User should see Push Days column values are less or equal 10 in Month view <10 days
    And User should see Push Days column values are less or equal 20 in Month view <20 days
    And User should see Push Days column values are less or equal 30 in Month view <30 days
    And User should see Push Days column values are less or equal 105 in Month view +30 days

#Verify if Push days column is visible and have correct values in Quarter view
#    Given User access "/secure/receipt-optimization" module
#    Then User should see Push Days column values are less or equal 10 in Quarter view <10 days
#    And User should see Push Days column values are less or equal 20 in Quarter view <20 days
#    And User should see Push Days column values are less or equal 30 in Quarter view <30 days
#    And User should see Push Days column values are less or equal 105 in Quarter view +30 days


Verify: Value in Push days column should be less or equal than 105
    Given "push_days" column should be in database
    Then all values in column should be less or equal than 105

