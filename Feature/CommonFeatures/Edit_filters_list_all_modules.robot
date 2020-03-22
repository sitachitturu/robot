*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/Edit_filters_list_all_modules_steps.robot

*** Test Cases ***
In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Scheduling page
     Given User access "/secure/scheduling" module
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for scheduling
     Then user should see all selected filters from edit filters in ui for scheduling module
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at purchasing page
     Given User access "/secure/purchasing" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for purchasing
     Then user should see all selected filters from edit filters in ui for purchasing module
     And open edit filters and click cancel button user should not see edit filters popup from ui
#
In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at purchase orders
     Given User access "/secure/purchase-orders" module
     And sleep  13s
     Then User should see Edit filters button
     And scroll page to location  10000000  0
     And select all existing filters from editfilters and click continue button for purchase orders
     Then user should see all selected filters from edit filters in ui for purchase orders
     And scroll page to location  10000000  0
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at plant comparison
     Given User access "/secure/plant-comparison" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for plant-comparison
     Then user should see all selected filters from edit filters in ui for "plant-comparison"
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at executive_summary
     Given User access "/secure/executive-summary" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for executive_summary
     Then user should see all selected filters from edit filters in ui for "executive_summary"
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Receipt_optimization
     Given User access "/secure/receipt-optimization" module
     And sleep  4s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for receipt-optimization
     Then user should see all selected filters from edit filters in ui for receipt-optimization
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Master_Data
     Given User access "/secure/master-data" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for Master_Data
     Then user should see all selected filters from edit filters in ui for Master_Data
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Master_Data_material_creation_monitor
     Given User access "/secure/master-data" module
     And click element  ${material_creation_monitor_tab}
     And sleep  4s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for material_creation_monitor
     Then user should see all selected filters from edit filters in ui for material_creation_monitor
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Cycle_Counting_Accuracy
     Given User access "/secure/cycle-counting" module
     And sleep  13s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for cycle-counting_accuracy
     Then user should see all selected filters from edit filters in ui for cycle-counting_accuracy
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Cycle_Counting_Ontime
     When User click ontime tab in cycle counting module
     Then User should see Edit filters button
     Then user should see all selected filters from edit filters in ui for cycle-counting_Ontime
     And open edit filters and click cancel button user should not see edit filters popup from ui

########################################POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER####################################################################################################################################################
#In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at stock policy dashboard
#     Given User access "/secure/stock-policy-dashboard" module
#     Then User should see Add Filters button
#     And select all existing filters from editfilters and click continue button for stock-policy-dashboard
#     Then user should see all selected filters from edit filters in ui for stock-policy-dashboard
#     And open edit filters and click cancel button user should not see edit filters popup from ui
#     And sleep  3s
#
#In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at safety stock opportunities
#     #Given User access "/secure/stock-policy-dashboard" module
#     When User click safety stock details veiw all
#     Then User should see Add Filters button
#     And select all existing filters from editfilters and click continue button for "safety stock opportunities" in stock policy
#     Then user should see all selected filters from edit filters in ui for "safety stock opportunities" in stock policy
#     And open edit filters and click cancel button user should not see edit filters popup from ui
#     And click back button SS Dashboard from SS oppo
#     And sleep  6s
#
#
#In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at ROP opportunities
#     When User click ROP opportunities details veiw all
#     Then User should see Add Filters button
#     And select all existing filters from editfilters and click continue button for "ROP opportunities" in stock policy
#     Then user should see all selected filters from edit filters in ui for "ROP opportunities" in stock policy
#     And open edit filters and click cancel button user should not see edit filters popup from ui
#     And click back button SS Dashboard from rop oppo
#     And sleep  6s
###
#In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at MOQ opportunities
#     When User click moq opportunities details veiw all
#     Then User should see Add Filters button
#     And select all existing filters from editfilters and click continue button for "moq opportunities" in stock policy
#     Then user should see all selected filters from edit filters in ui for "moq opportunities" in stock policy
#     And open edit filters and click cancel button user should not see edit filters popup from ui
#     And click back button SS Dashboard from MOQ oppo
#     And sleep  6s
#
#In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at ABC opportunities
#      #Given User access "/secure/stock-policy-dashboard" module
#      And scroll page to location  0  1000000
#      And sleep  3s
#     When User click ABC opportunities details veiw all
#     Then User should see Add Filters button
#     And select all existing filters from editfilters and click continue button for "ABC opportunities" in stock policy
#     Then user should see all selected filters from edit filters in ui for "ABC opportunities" in stock policy
#     And open edit filters and click cancel button user should not see edit filters popup from ui
#     And click back button SS Dashboard from ABC oppo
#     And sleep  6s
##############################################POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER POLYMER#########################################################################################################################################################################################

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Material Transfer
     Given User access "/secure/material-transfer" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for material-transfer
     Then user should see all selected filters from edit filters in ui for material-transfer
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Inventory Entitlement
     Given User access "/secure/inventory-entitlement" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for inventory-entitlement
     Then user should see all selected filters from edit filters in ui for inventory-entitlement
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Lead-Time-Analytics
     Given User access "/secure/lead-time-analytics" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for Lead-Time-Analytics
     Then user should see all selected filters from edit filters in ui for Lead-Time-Analytics
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at Consumption Issues
     Given User access "/secure/consumption-issues" module
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for consumption-issues
     Then user should see all selected filters from edit filters in ui for consumption-issues
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at buyer_control_center
     Given User access "/secure/buyer-control-center" module
     And sleep  3s
     And click element  clearFilterBtn
     And sleep  4s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for buyer_control_center
     Then user should see all selected filters from edit filters in ui for buyer_control_center
     And open edit filters and click cancel button user should not see edit filters popup from ui

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at BCC-INVENTORY & CASH OPPORUNITIES
     when User click on view all tab on INVENTORY & CASH OPPORUNITIES grid
     And sleep  3s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for BCC-"INVENTORY & CASH OPPORUNITIES"
     Then user should see all selected filters from edit filters in ui for BCC-"INVENTORY & CASH OPPORUNITIES"
     And open edit filters and click cancel button user should not see edit filters popup from ui
     And click element  ${back button}
     And sleep  4s

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at BCC-RISK: OVERDUE + RESCHEDULE IN
     Given User access "/secure/buyer-control-center" module
     And click element  clearFilterBtn
     When User click on view all tab on RISK: OVERDUE + RESCHEDULE IN grid
     And click element  clearFilterBtn
     And sleep  15s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for BCC-"RISK: OVERDUE + RESCHEDULE IN"
     Then user should see all selected filters from edit filters in ui for BCC-"RISK: OVERDUE + RESCHEDULE IN"
     And open edit filters and click cancel button user should not see edit filters popup from ui
     And click element  ${back button}
     And sleep  17s

In order to see list of filters in edit filters user should be able to see all filters from edit filters in ui at BCC-REQUISITIONS
     Given User access "/secure/buyer-control-center" module
     And click element  clearFilterBtn
     When User click on view all tab on RISK: REQUISITIONS grid
     And click element  clearFilterBtn
     And sleep  13s
     Then User should see Edit filters button
     And select all existing filters from editfilters and click continue button for BCC-REQUISITIONS
     Then user should see all selected filters from edit filters in ui for BCC-REQUISITIONS
     And open edit filters and click cancel button user should not see edit filters popup from ui
     And click element  ${back button}
     And sleep  7s