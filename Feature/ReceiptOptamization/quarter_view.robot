6/28/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ReceiptOptamization/quarter_view_step.robot

*** Test Cases ***
User access Receipt Optimization module
    Given User access "/secure/receipt-optimization" module
    Then User should see "Receipt Optimization"

Drop down
    Given User should see "OPPORTUNITIES BY" text
    When User click at drop down with value "Month"
    Then User should be able to select "Quarter" value from drop down
    And second drop down with month name value should change to "2017"

Year drop down
    Given User should see "Receipt Optimization"
    And User see "Quarter" dropdown
    Then User should see 2017 , 2018 in next drop down

Data grid
    Given User should see "Receipt Optimization"
    And User select Quarter and 2017 year from drop down
    Then User should see columns "Buyer Name","Source/Vendor","Q1 Recommended Date","Q1 Opportunity","Q2 Recommended Date","Q2 Opportunity","Q3 Recommended Date","Q3 Opportunity","Q4 Recommended Date","Q4 Opportunity"

Export Exel and Show/hide
    Given User should see "Receipt Optimization"
    When User select Quarter and 2017 year from drop down
    Then User should not see Show/hide columns button
    And User should see Export Excel button

Verify Show/Hide Columns
    Given User should see "Receipt Optimization"
    And User select Quarter and 2017 year from drop down
    And User click Quarter and 2017 year from drop down
    And User click Show/hide columns button
    Then User should see all columns

Verify Number of opportunities for month and quarter where quarter should be greater than month for default view
    Given User should see "Receipt Optimization"
    And user should see numbers for month should be less than quarter view

Verify Number of opportunities for month and quarter where quarter should be greater than month by selecting plant by plant
    Given User should see "Receipt Optimization"
    And user should see numbers for month should be less than quarter view by selecting plant by plant
