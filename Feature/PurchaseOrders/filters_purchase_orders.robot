*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/filters_purchase_orders_step.robot


*** Test Cases ***
Check Filters on Purchase Orders
    Given User access "/secure/purchase-orders" module
    Then User should see "Plant" filter
    Then User should see "Buyer / Purch. Group" filter
    And click "Edit Filter(s)"

    When User check check box with "PO Created By Username" name
    When User check check box with "Source/Vendor" name
    When User check check box with "Final Exception Message" name
    When User check check box with "Planner / MRP Contr." name
    When User check check box with "Plant Category" name
    When User check check box with "Plant Region" name
    When User check check box with "Plant Business" name
    When User check check box with "Sub Business" name
    When User check check box with "Exception Requires Action" name
    When User check check box with "Short Cycle" name
    When User check check box with "Procurement Type" name
    When User check check box with "Ideal Finish Date" name
    When User check check box with "Profit Center" name
    When User check check box with "Aging Buckets" name
    When User check check box with "Purchase Org Code" name
    When User check check box with "Purchase Org Name" name
    When User check check box with "Project Code" name
    When User check check box with "Project Name" name
    When User check check box with "WBS Element" name
    When User check check box with "Account Assign. Category" name
    When User check check box with "Purchasing Document Type" name
    when User check check box with "PO line status" name
    And click "Continue"

    #Then User should be able to see Buyer / Purch. Group Code Filter
    Then User should be able to see PO Created By Username Filter
    Then User should be able to see Source/Vendor Filter
    Then User should be able to see Final Exception Message
    Then User should be able to see Planner / MRP Contr. Filter
    Then User should be able to see Plant Category Filter
    Then User should be able to see Plant Region Filter
    Then User should be able to see Plant Business Filter
    Then User should be able to see Exception Requires Action Filter
    Then User should be able to see Short Cycle Filter
    Then User should be able to see Procurement Type Filter
    Then User should be able to see Ideal Finish Date
    Then User should be able to see Profit Center Filter
    Then User should be able to see Purchase Org Code Filter
    Then User should be able to see Purchase Org Name Filter
    Then User should be able to see Project Code Filter
    Then User should be able to see Project Name Filter
    Then User should be able to see sub_business Filter
    Then User should be able to see Aging Buckets Filter
    Then User should be able to see WBS Element Filter
    Then User should be able to see Account Assign. Category Filter
    Then User should be able to see Purchasing Document Type Filter
    then User should be able to see PO Line status filter

Count sums of all filters should equal the sum of records for corresponding plant
    Count sums of all filters should equal the sum of records for corresponding plant

Verify newly added feature "Clear filter" option
    Given User access "/secure/purchase-orders" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    #Given User access "/secure/purchase-orders" module
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify for races plants "DE1,DE2,DE3,DE4,DE5,PNS" Planner/mrp controller name should mapped to Planner Code. for purchase ORDERS module
    Given User access "/secure/purchase-orders" module
    When User selects plants DE1,DE2,DE3,DE4,DE5,PNS from plant filter
    Then open planner/mrp controller filter and user should see codes for that selected races plants

Verify 500 Internal Error message - Aging bucket filter in purchase orders module
    Given User access "/secure/purchase-orders" module
    And User select Aging bucket filter from edit filters
    And User select <30,30+,60+,on hold value from aging bucket filter
    Then User can not see a defect : Grid is not loading
#
Verify newly added filter "PO Created By UserName" with column "PO Created By UserName" from show/hide
    Given User access "/secure/purchase-orders" module
    And User select PO Created By UserName filter and business filter from edit filters
    And select business "Renewables" from business filter and select username from "po crated by username" filter
    And scroll page down and select PO Created By Username col from show/hide
    Then User should see selected buyername in the po username column
    And User should see matching username record count with total in heatmap for buyer,vendor,planner,material,plant

