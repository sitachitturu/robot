12/7/2017
212595411
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/inventory_scorecard_step.robot
Documentation    This test is verifing "Inventory" score card visible at Executive Summary Module

*** Test Cases ***
User Should be able to see all elements in Inventory scorecard
    Given User access Executive summary module
    Then User should see "Variation Entitlement title"
    And User should see "12-month SMI" title
    And User should see Variation Entitlement performance indicator
    And User should see 12-month SMI performance indicator
    And User should see hover over message for Inventory scorecard

User Should be able to see corect values for Variation Entitlement
    Given User access Executive summary module
    And User can see "Variation Entitlement"
    And User can see "12-month SMI" title
    When User access Inventory Entitlement module
    Then User should see matching values for "12-month SMI" and "Variation Entitlement"
