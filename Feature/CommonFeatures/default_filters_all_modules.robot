*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/default_filters_all_modules_steps.robot

*** Test Cases ***
Verify Default filters in "Plant comparison" module
        Given User access "/secure/plant-comparison" module
        And click on clear filter option
        Then User should see default filters "plant business" "sub business" "plant" filters on ui for plant comaparison

Verify Default filters in "Executive summary" module
        Given User access "/secure/executive-summary" module
        And click on clear filter option
        Then User should see default filters "plant" filters on ui for Executive summary

Verify Default filters in "Scheduling" module
        Given User access "/secure/scheduling" module
        And click on clear filter option
        Then User should see default filters "plant" "Final Exception Message" "Exception Requires Action" "Planner / MRP Controller" "Buyer /Purchasing Group" "Order Type" "Profit Center" "Action" "Production Work Order" filters on ui for Scheduling

Verify Default filters in "Purchasing" module
        Given User access "/secure/purchasing" module
        And click on clear filter option
        Then User should see default filters "plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" "Order Type" filters on ui for Purchasing

Verify Default filters in "Purchase-orders" module
        Given User access "/secure/purchase-orders" module
        And click on clear filter option
        Then User should see default filters "plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" "PO Action" "PO Number" filters on ui for Purchase-orders

Verify Default filters in "Receipt-optimization" module
        Given User access "/secure/receipt-optimization" module
        And click on clear filter option
        Then User should see default filters "Plant" "Buyer /Purchasing Group" "Vendor Name" "Profit Center" "Planner / MRP Controller" filters on ui for Receipt-optimization

Verify Default filters in "Master-data" module
        Given User access "/secure/master-data" module
        And click on clear filter option
        Then User should see default filters "Plant" filters on ui for Master-data

Verify Default filters in "Cycle-counting" module
        Given User access "/secure/cycle-counting" module
        And click on clear filter option
        Then User should see default filters "Plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" filters on ui for Cycle-counting

Verify Default filters in "Stock-policy-dashboard" module
        Given User access "/secure/stock-policy-dashboard" module
        And click on clear filter option
        Then User should see default filters "Plant business" "sub business" "Plant Region" "Plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" filters on ui for Stock-policy-dashboard

Verify Default filters in "Material-transfer" module
        Given User access "/secure/material-transfer" module
        And click on clear filter option
        Then User should see default filters "Plant business" "sub business" "Plant" "Order Type" "Buyer /Purchasing Group" "Material SKU" "Planner / MRP Controller" filters on ui for Material-transfer

Verify Default filters in "Inventory-entitlement" module
        Given User access "/secure/inventory-entitlement" module
        And click on clear filter option
        Then User should see default filters "Plant" "Plant Category" "Plant Region" "Plant business" "Buyer /Purchasing Group" "Planner / MRP Controller" "Material SKU" "Profit Center" filters on ui for Material-transfer

Verify Default filters in "Lead-time-analytics" module
        Given User access "/secure/lead-time-analytics" module
        And click on clear filter option
        Then User should see default filters "Plant" "Material SKU" "Source/Vendor" "Outliers" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" filters on ui for Lead-time-analytics

Verify Default filters in "Consumption-issues" module
        Given User access "/secure/consumption-issues" module
        And click on clear filter option
        Then User should see default filters "Plant" "Planner / MRP Controller" "Profit Center" "Buyer /Purchasing Group" filters on ui for Consumption-issues

Verify Default filters in "Buyer-control-center" module
        Given User access "/secure/buyer-control-center" module
        And click on clear filter option
        Then User should see default filters "Exception Requires Action" "Buyer /Purchasing Group" "Planner / MRP Controller" "Plant" "Profit Center" filters on ui for Buyer-control-center
