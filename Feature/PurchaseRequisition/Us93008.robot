*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseRequisition/Us93008_step.robot

*** Test Cases ***
Verify the title "PURCHASE REQUISITION ITEMS BY" in purchase requisitions module
     Given User access "/secure/purchasing" module
     Then User should see "Requisitions (incl. Planned)"

Verify C47-SMW Somersworth plant to be removed from plant filter
     #Given User access "/secure/purchasing" module
     When User click on plant filter and enter plant code on search box
     Then plant filter should display blank page

Verify C81-CWC ClearWater should change to C81-SMW Somersworth in plant filter
     Given User access "/secure/purchasing" module
     When User click on plant filter and enter plant code c81 in search box
     Then User should see c81-'ITI Instrument Transformers' plant on plant filter and select that plant and click apply

Verify newly added plant 2490 in plant filter
    Given User access "/secure/purchasing" module
    When User click on plant filter and enter plant code 2490 in search box
    Then User should be able to see Manufacturing in plant catagory filter
    And User should see "EUROPE" in plant region filter
    And User should see "HYDRO" in plant business filter
    And click on clear filter to unselect the filter selection

Verify newly added plant 56MM in plant filter
    Given User access "/secure/purchasing" module
    When User click on plant filter and enter plant code 56MM in search box
    Then User should be able to see Manufacturing in plant catagory filter
    And User should see "LATAM" in plant region filter
    And User should see "HYDRO" in plant business filter
    And click on clear filter to unselect the filter selection

Verify newly added plant 560N in plant filter
    Given User access "/secure/purchasing" module
    When User click on plant filter and enter plant code 560N in search box
    Then User should be able to see Manufacturing in plant catagory filter
    And User should see "LATAM" in plant region filter
    And User should see "HYDRO" in plant business filter
    And click on clear filter to unselect the filter selection

Verify newly added plant 5602 in plant filter
    Given User access "/secure/purchasing" module
    When User click on plant filter and enter plant code 5602 in search box
    Then User should be able to see Manufacturing in plant catagory filter
    And User should see "LATAM" in plant region filter
    And User should see "HYDRO" in plant business filter
    And click on clear filter to unselect the filter selection
