*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/StockPolicy/filters_stock_policy_step.robot

*** Test Cases ***
Check Filters on Stock Policy
    Given User access "/secure/stock-policy-dashboard" module
    And click element  clearFilterBtn
    Then User should see "Plant" filter
    And User should see "Business" & "Subbusiness" & "Plant Region" as default filters
    And click "Edit Filter(s)"
    Then User should see ""Business" & "Subbusiness" & "Plant Region" & "Buyer / Purch. Group" & "Planner/Mrp Controller" in edit filters list
    When User check check box with "Buyer / Purch. Group" name
    When User check check box with "Planner / MRP Contr." name
    And click "Continue"
    Then User should be able to see Buyer / Purch. Group Filter
    Then User should be able to see Planner / MRP Contr. Filter
    Then Count sums of all filters should equal the sum of records for corresponding plant

Verify newly added feature "Clear filter" option
    Given User access "/secure/stock-policy-dashboard" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    Given User access "/secure/stock-policy-dashboard" module
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set
