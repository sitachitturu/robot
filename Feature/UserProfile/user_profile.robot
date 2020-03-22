1/2/2018
212595411
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/UserProfile/user_profile_step.robot
Documentation    This test will validate User Profile page
*** Test Cases ***
Validate User Profile page
    [Tags]    DEBUG
    Given User access "/secure/user-profile" module and User should see "Settings" title
    Then User should see correct email and SSO
    And User should see "My organization" title
    And User should see "Select options below to indicate which data you would like to see in Material Optimization."
    And User should see "My Business"
    And User should see "Select Business"
    And User should see "My Sub-Business"
    And User should see "Select Sub-business"
    And User should see "Save" and "Cancel" button

Validate Selecting Business
    Given User click "Select Business" link
    And User should see "Which Businesses do you want to focus on?"
    And User should see "Select Business" in Select Business pop up window
    And User should see search box
    And User should see Healthcare, MMF, O&G, Power, Renewables and Transportation business names
#    And User should see "Save" and "Cancel" button in pop-up window
#    When User type Healthcare in search box
#    And check checkbox for Healtcare
    And click Save button
    Then User Should see Healthcare business selected in My business section
#
Validate Selecting Sub-Business
    Given User click "Select Sub-business" link
    And User should see "Which Sub-businesses do you want to focus on?"
    And User should see "Select Sub-business" in Select Sub-business pop up window
    And User should see search box Select Sub-business pop up window
    And User should see list Sub-business names
#    And User should see "Save" and "Cancel" button Select Sub-business pop up window
#    When User type Drilling in search box
#    And check checkbox for Drilling
    And click Save button in Select Sub-business pop up window
    Then User Should see Drilling sub-business selected in My sub-business section
#
Validate Selecting Plant
    Given User click "Select Plant" link
    And User should see "Which Plants do you want to focus on?"
    And User should see "Select Plant" in Select Plant pop up window
    And User should see search box Select Plant pop up window
    And User should see list Plants names
#    And User should see "Save" and "Cancel" button Select Plant pop up window
#    When User type 0010 in search box
#    And check checkbox for 0010
    And click Save button in Select Plant pop up window
    Then User Should see Plant 0010 - Charlottesville selected in My Plant section
#
Validate Selecting Region
    Given User click "Select Region" link
    And User should see "Which Regions do you want to focus on?"
    And User should see "Select Region" in Select Region pop up window
    And User should see search box Select Region pop up window
    And User should see list Region names
#    And User should see "Save" and "Cancel" button Select Region pop up window
#    When User type ASIA in search box
#    And check checkbox for ASIA
    And click Save button in Select Region pop up window
    Then User Should see ASIA region selected in My Region section
    And click Save
    And remove all selections for business
    And remove all selections for subbusiness
    And remove all selections for plant
    And remove all selections for region
    And click Save






