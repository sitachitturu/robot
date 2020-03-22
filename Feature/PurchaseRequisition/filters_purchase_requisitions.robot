*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseRequisition/filters_purchase_requisitions_step.robot

*** Test Cases ***
Check Filters on Purchase Requisitions
    Given User access "/secure/purchasing" module
    Then User should see "Plant" filter
    Then User should see "Buyer / Purch. Group" filter
    And click "Edit Filter(s)"
    And sleep  3s
    When User check check box with "Source/Vendor" name
    When User check check box with "Planner / MRP Contr." name
    When User check check box with "Plant Category" name
    When User check check box with "Plant Region" name
    When User check check box with "Plant Business" name
    When User check check box with "Short Cycle" name
    When User check check box with "Procurement Type" name
    When User check check box with "Profit Center" name
    When User check check box with "Material SKU" name
    When User check check box with "Aging Buckets" name
    When User check check box with "Purchase Org Code" name
    When User check check box with "Purchase Org Name" name
    When User check check box with "WBS Element" name
    When User check check box with "Account Assign. Category" name
    When User check check box with "Sub Business" name

    And click "Continue"
    And sleep  5s
    Then User should be able to see Source/Vendor Filter
    Then User should be able to see Planner / MRP Contr. Filter
    Then User should be able to see Plant Category Filter
    Then User should be able to see Plant Region Filter
    Then User should be able to see Plant Business Filter
    Then User should be able to see Short Cycle Filter
    Then User should be able to see Procurement Type Filter
    Then User should be able to see Profit Center Filter
    Then User should be able to see Material SKU Filter
    Then User should be able to see Aging Buckets Filter
    Then User should be able to see porg_code filter
    Then User should be able to see porg_name filter
    Then User should be able to see wbs filter
    Then User should be able to see account_cat filter
    Then User should be able to see sub_business Filter
    Then User should be able to see Order Type Filter
    Then Count sums of all filters should equal the sum of records for corresponding plant

Verify for races plants "DE1,DE2,DE3,DE4,DE5,PNS" Planner/mrp controller name should mapped to Planner Code. for purchase req module
    #Given User access "/secure/purchasing" module
    When User selects plants DE1,DE2,DE3,DE4,DE5,PNS from plant filter
    Then open planner/mrp controller filter and user should see codes for that selected races plants

Verify newly added feature "Clear filter" option
    Given User access "/secure/purchasing" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    #Given User access "/secure/purchasing" module
    And delete the existing fileld from filter set
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify Requisition date filter in purchase req.module
    Given User access "/secure/purchasing" module
    When user should see Requisition Date filter in edit filters and able to select filter and should see in UI
    Then User should be able to editable the year/month/date
    #And based on date change in flter:grid and heatmap and other filters should respond
    And Date filter should set to default data if user click on clear filter

