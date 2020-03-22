*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/show_hide_all_modules_steps.robot

*** Test Cases ***
In order to see list in Show/hide columns user should be able to click on Show/Hide column at Scheduling page
     Given User access "/secure/scheduling" module
     And sleep  3s
     Then click show/hide column button and user should see list of columns for products in show/hide columns in scheduling module
     And sleep  3s
     And click show/hide column button and user should see list of columns for projects in show/hide columns in scheduling module

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Purchase Requisitions page
     Given User access "/secure/purchasing" module
     And scroll page to location  0  100000
     Then click show/hide column button and user should see list of columns in show/hide columns in purchase_req module

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Purchase orders page
     Given User access "/secure/purchase-orders" module
     Then click show/hide column button and user should see list of columns in show/hide columns in purchase orders module

Verify the list in Show/hide columns button in receipt_optimization module
    Given User access "/secure/receipt-optimization" module
    Then User should see Show/Hide Columns button
    And user should see list of columns in show/hide columns for receipt_optimization module

In order to see list in Show/hide columns user should be able to click on Show/Hide column at purchase order trending page in executive summary module
    Given User access "/secure/executive-summary" module
    And click on trending icon in executive summary score card in executive summary module
    Then click show/hide column button and user should see list of columns in show/hide columns in executive summary module

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Scheduling trending page in executive summary module
    Given User access "/secure/executive-summary" module
    And click on trending icon in executive summary score card in executive summary module
    Then click show/hide column button and user should see list of columns in show/hide columns in executive summary module

Verify the list of column name under Show hide Column button -Score tab in plant comparison module
    Given User access "/secure/plant-comparison" module
    Then User should see Show/Hide Columns button
    Then User should able to see list of columns in show/hide columns button-Score tab in plant comparison module

Verify the columns present in showhide list under Accuracy tab for cycle counting...
    Given User access "/secure/cycle-counting" module
    And scroll page to location  0  10000000
    Then User should see Show/Hide Columns button
    Then click show/hide column button and user should see list of columns in show/hide columns in cycle counting module
    And User should click show/hide button in 'On-Time'
    Then click show/hide column button and user should see list of columns in show/hide columns on-time

##############################################################################################################################################################################
Verify the list in Show/hide columns button in stock_policy opportunities details page in stock policy dash board
    Given User access "/secure/stock-policy-dashboard" module
    And sleep  20s
    And User click on view detalis safety stock view details..
    And user should see list of columns in show/hide columns in "safety_stock" opportunities details page
     And click element  ${rejected tab..}
    And sleep  4s
    And user should see list of columns in show/hide columns in "safety_stock" opportunities details page for rejected
    And click element  ${back button SS Dashboard from SS oppo...}

Verify the list in Show/hide columns button in reorder_point opportunities details page in stock policy dash board
    And sleep  20s
    And User click on view detalis ROP view details..
    And click element  ${view_details for rop..}
    And sleep  10s
    And user should see list of columns in show/hide columns in Rop opportunities details page
    And user see rejected tab for rop
    And click element  ${rejected tab.. for rop}
    And sleep  4s
    And user should see list of columns in show/hide columns in Rop opportunities details page for rejected
    And click element  ${back button SS Dashboard from rop oppo...}
    And sleep  4s

Verify the list in Show/hide columns button in Minimum_order_Quantity opportunities details page in stock policy dash board
    And sleep  20s
    And User click on view detalis MOQ view details..
    And click element  ${view_details for MOQ..}
    And sleep  7s
    And user should see list of columns in show/hide columns in Moq opportunities details page
    And user see rejected tab for MOQ
    And click element  ${rejected tab.. for moq}
    And user should see list of columns in show/hide columns in Moq opportunities details page for rejected
    And click element  ${back button SS Dashboard from MOQ oppo...}

Verify the list in Show/hide columns button in ABC Classification opportunities details page in stock policy dash board
    And sleep  20s
    And scroll page to location  0  100000
    And User click on view detalis ABC view details..
    And click element  ${view_details for ABC...}
    And sleep  7s
    And user should see list of columns in show/hide columns in ABC opportunities details page
    And user see rejected tab for abc
    And click element  ${rejected tab.. for abc}
    And user should see list of columns in show/hide columns in ABC opportunities details page for rejected
    And click element  ${back button SS Dashboard from ABC oppo...}
#################################################################################################################################################################################################################

Verify list of columns in Show/hide columns for opportunities and rejected grid for seller for material transfer module
     Given User access "/secure/material-transfer" module
     And sleep  3s
     Then click show/hide column button and verify list of columns in ui list with saved columns textfile for opportunities grid in MT module
     And sleep  3s
     And click element  ${rejected tab for seller}
     And sleep  3s
     And click show/hide column button and verify list of columns in ui list with saved columns textfile for Rejected grid in MT module

Verify list of columns in Show/hide columns for opportunities and rejected grid for Buyer for material transfer module
     Given User access "/secure/material-transfer" module
     And sleep  3s
     And scroll page to location  0  100000
     Then click show/hide column button and verify list of columns in ui list with saved columns textfile for opportunities grid in MT module for buying
     And scroll page to location  0  100000
     And sleep  3s
     And click element  ${rejected tab for buying}
     And sleep  3s
     And click show/hide column button and verify list of columns in ui list with saved columns textfile for Rejected grid in MT module for buyer

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Inventory Entitlement page
     Given User access "/secure/inventory-entitlement" module
     And sleep  24s
     Then click show/hide column button and user should see list of columns in show/hide columns for inventory module

Verify show/hide columns list for details view for LTA
    Given User access "/secure/lead-time-analytics" module
    And sleep  30s
    Then click show/hide column button and user should see list of columns in show/hide columns on details view for LTA

Verify show/hide columns list for Aggregated view
    Given User access "/secure/lead-time-analytics" module
    And sleep  20s
    Then user should see aggregated tab and click on it and click show/hide column button and user should see list of columns in show/hide columns for Aggregated view for Lta

Verify the columns present in showhide list under Consumption issues tab
    When User access "/secure/consumption-issues" module
    Then click element  ${Tab_Consumption_Issues}
    And sleep  5s
    And scroll page to location  0  100000
    Then click element  ${Consumption_Issues_showhide_button}
    Then click show/hide column button and user should see list of columns in show/hide columns under Consumption Issues tab

Verify the columns present in showhide list under COGI/Hold tab
    And click element  ${Tab_COGI}
    And sleep  5s
    And scroll page to location  0  100000
    Then click element  ${Consumption_Issues_COGI_showhide_button}
    Then click show/hide column button and user should see list of columns in show/hide columns under COGI/Hold tab

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Buyer Control Center page in purchase order summary view all
     Given User access "/secure/buyer-control-center" module
     And click element  ${bcc_po_summary_view_all}
     And sleep  5s
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in purchase order summary view all "opportunities tab"
     And click element  ${bcc_rejected_tab}
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in purchase order summary view all "rejected tab"

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Buyer Control Center page in Inventory&Cash Opportunities view all
     Given User access "/secure/buyer-control-center" module
     And click element  clearFilterBtn
     And sleep  25s
     And click element  ${bcc_Inventory&Cash Opportunities_view_all}
     And sleep  5s
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in Inventory&Cash Opportunities view all "opportunities tab"
     And click element  ${bcc_rejected_tab}
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in Inventory&Cash Opportunities view all "rejected tab"

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Buyer Control Center page in overdue+resvhdeule in Opportunities view all
     Given User access "/secure/buyer-control-center" module
     And click element  clearFilterBtn
     And sleep  25s
     And click element  ${bcc_overdue+resvhdeule in Opportunities_view_all}
     And sleep  5s
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in overdue+resvhdeule in Opportunities view all "opportunities tab"
     And click element  ${bcc_rejected_tab}
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in overdue+resvhdeule in Opportunities view all "rejected tab"

In order to see list in Show/hide columns user should be able to click on Show/Hide column at Buyer Control Center page in requisitions Opportunities view all
     Given User access "/secure/buyer-control-center" module
     And click element  clearFilterBtn
     And sleep  25s
     And click element  ${bcc_requisitions Opportunities_view_all}
     And sleep  5s
     Then click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in requisitions Opportunities view all "opportunities tab"

