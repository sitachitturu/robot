*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/user_profile_smaoke_test_steps.robot

*** Test Cases ***
In order to see User profile user should be able to click on user profile prompt or icon at purchase_req page
     Given User access "/secure/purchasing" module
     When run keyword and ignore error  User prompt to use user profile
     And sleep  3s
     And Delete All Bookmarks  /secure/purchasing
     And click on clear filters
     And User select business "Renewables" from user profile
     And user should see business filter got selected in "/secure/purchasing" module and business in filter got selected

In order to see User profile user should be able to click on user profile prompt or icon at scheduling page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/scheduling
     And user should see business filter got selected in "/secure/scheduling" module and business in filter got selected

In order to see User profile user should be able to click on user profile prompt or icon at purchase_orders page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/purchase-orders
     And user should see business filter got selected in "/secure/purchase-orders" module and business in filter got selected
     And click on clear filters

In order to see User profile user should be able to click on user profile prompt or icon at receipt_opt page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/receipt-optimization
     And user should see business filter got selected in "/secure/receipt-optimization" module and business in filter got selected in receipt

In order to see User profile user should be able to click on user profile prompt or icon at Master data page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/master-data
     And Delete All Bookmarks  /secure/master-data
     And Delete All Bookmarks  /secure/master-data
     And user should see business filter got selected in "/secure/master-data" module and business in filter got selected in receipt

In order to see User profile user should be able to click on user profile prompt or icon at cycle-counting page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/cycle-counting
     And user should see business filter got selected in "/secure/cycle-counting" module and business in filter got selected


In order to see User profile user should be able to click on user profile prompt or icon at stock-policy-dashboard page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/stock-policy-dashboard
     And user should see business filter got selected in "/secure/stock-policy-dashboard" module and business in filter got selected

In order to see list in Show/hide columns user should be able to click on Show/Hide column at inventory-entitlement page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/inventory-entitlement
     And user should see business filter got selected in "/secure/inventory-entitlement" module and business in filter got selected

In order to see User profile user should be able to click on user profile prompt or icon at lead-time-analytics page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/lead-time-analytics
     And Delete All Bookmarks  /secure/lead-time-analytics
     And click on profile image and click on save button for business
     And user should see business filter got selected in "/secure/lead-time-analytics" module and business in filter got selected

In order to see User profile user should be able to click on user profile prompt or icon at executive-summary page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/executive-summary
     And Delete All Bookmarks  /secure/executive-summary
     And user should see business filter got selected in "/secure/executive-summary" module and business in filter got selected

In order to see User profile user should be able to click on user profile prompt or icon at plant-comparison page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/plant-comparison
     And Delete All Bookmarks  /secure/plant-comparison
     And user should see business filter got selected in "/secure/plant-comparison" module and business in filter got selected
     And run keyword  delete selected items from user profile

In order to see User profile user should be able to click on user profile prompt or icon at Material Transfer page
     And sleep  3s
     And click on clear filters
     And Delete All Bookmarks  /secure/material-transfer
     And Delete All Bookmarks  /secure/material-transfer
     And user should see business filter got selected in "/secure/material-transfer" module and business in filter got selected
     And run keyword  delete selected items from user profile
