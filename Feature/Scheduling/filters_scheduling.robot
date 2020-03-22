*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/filters_scheduling_step.robot
*** Test Cases ***
Check Filters on Scheduling
     Given User access "/secure/scheduling" module
     #And click element  clearFilterBtn
    Then User should see "Plant" filter
    Then User should see "Final Exception Message" filter
    Then User should see "Exception Requires Action" filter
    Then User should see "Planner / MRP Contr." filter
    Then User should see "Buyer / Purch. Group" filter
    Then User should see "Order Type" filter
    And click "Edit Filter(s)"
    When User check check box with "Plant Category" name
    When User check check box with "Plant Region" name
    When User check check box with "Plant Business" name
    When User check check box with "Sub Business" name
    When User check check box with "Product Hierarchy" name
    When User check check box with "Procurement Type" name
    When User check check box with "Material Description" name
    When User check check box with "Order Status" name
    When User check check box with "Storage Location" name
    When User check check box with "Current Finish Date" name
    When User check check box with "Ideal Finish Date" name
    When User check check box with "Profit Center" name
    When User check check box with "Project Name" name
    When User check check box with "Project Code" name
    When User check check box with "Account Assign. Category" name
    When User check check box with "Special Procurement" name
    When User check check box with "Material Type / Item Type"


    And click "Continue"
    Then User should be able to see Plant Business Filter
    Then User should be able to see Plant Category Filter
    Then User should be able to see Plant Region Filter
    Then User should be able to see Product Hierarchy Filter
    Then User should be able to see Procurement Type Filter
    Then User should be able to see Material Description Filter
    Then User should be able to see Order Status Filter
    Then User should be able to see Storage Location Filter
    Then User should be able to see Current Finish Date Filter
    Then User should be able to see Ideal Finish Date Filter
    Then User should be able to see Profit Center Filter
    Then User should be able to see Project Name Filter
    Then User should be able to see Project Code filter
    Then User should be able to see account_cat Filter
    Then User should be able to see sub_business Filter
    Then User should be able to see Special Procurement Filter
    Then User should be able to see "Material Type / Item Type"
    Then Count sums of all filters should equal the sum of records for corresponding plant

Verify newly added feature "Clear filter" option
    Given User access "/secure/scheduling" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    #Given User access "/secure/scheduling" module
    And delete the existing fileld from filter set
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify plant filter and Data Base plant " IFM - Alstom Firenze Manufacturing " should not be visible for transportation business
    Given User access "/secure/scheduling" module
    And click element  clearFilterBtn
    And select transportation business from business filter and hit apply button.
    When user open plant filter and give plant name in search box "IFM - Alstom Firenze Manufacturing" should not be visible.
    And verify in db by executing query

Verify for races plants "DE1,DE2,DE3,DE4,DE5,PNS" Planner/mrp controller name should mapped to Planner Code.
    Given User access "/secure/scheduling" module
    And click element  clearFilterBtn
    When User selects plants DE1,DE2,DE3,DE4,DE5,PNS from plant filter
    Then open planner/mrp controller filter and user should see codes for that selected races plants

#Verify grid and export to excel by selecting data from newly added filters in products view
#    Given User access "/secure/scheduling" module
#    When user select project code and project name filters from edit filters and select data and hit aply button
#    Then user should see same data in project name and project code columns for product view

#Verify grid and export to excel by selecting data from newly added filters in project view
#    When user select project code and project name filters from edit filters and select data and hit aply button
#    Then user should see same data in project name and project code columns for project view
