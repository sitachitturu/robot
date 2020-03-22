*** Settings ***
Library           Selenium2Library
Resource  ../../StepDefinition/API/barchart_stock_policy_step_definition.robot

*** Test Cases ***
Verify today barchart value with pie chart for safety stock for weekly view
     Given User access "/secure/stock-policy-dashboard" module
     And User should see safety stock bar chart today date value same as today values in pichart for weekly view

Verify today barchart value with pie chart for reorder point for weekly view
     And User should see reorder point bar chart today date value same as today values in pichart for weekly view

Verify today barchart value with pie chart for Minimum Order Quantity point for weekly view
     And User should see Minimum Order Quantity bar chart today date value same as today values in pichart for weekly view

Verify today barchart value with pie chart for safety stock for monthly view
     And User should see safety stock bar chart today date value same as today values in pichart for monthly view

Verify today barchart value with pie chart for reorder point for monthly view
     And User should see reorder point bar chart today date value same as today values in pichart for monthly view

Verify today barchart value with pie chart for Minimum Order Quantity point for monthly view
     And User should see Minimum Order Quantity bar chart today date value same as today values in pichart for monthly view

Verify today barchart value with pie chart for safety stock for Quarterly view
     And User should see safety stock bar chart today date value same as today values in pichart for Quarterly view

Verify today barchart value with pie chart for reorder point for Quarterly view
     And User should see reorder point bar chart today date value same as today values in pichart for Quarterly view

Verify today barchart value with pie chart for Minimum Order Quantity point for Quarterly view
     And User should see Minimum Order Quantity bar chart today date value same as today values in pichart for Quarterly view
#
##+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Verify today barchart value with pie chart for safety stock for weekly view for business "MMF"
     #Given User access "/secure/stock-policy-dashboard" module
     And sleep  4s
     And 1User should see safety stock bar chart today date value same as today values in pichart for weekly view for business "MMF"

Verify today barchart value with pie chart for reorder point for weekly view for business "MMF"
     And 2User should see "rop" bar chart today date value same as today values in pichart for "weeks" view for business "MMF"

Verify today barchart value with pie chart for Minimum Order Quantity point for weekly view for business "MMF"
     And 3User should see "moq" bar chart today date value same as today values in pichart for "weeks" view for business "MMF"

Verify today barchart value with pie chart for safety stock for monthly view for business "MMF"
     And 4User should see safety stock bar chart today date value same as today values in pichart for "months" view for business "MMF"

Verify today barchart value with pie chart for reorder point for monthly view for business "MMF"
     And 6User should see reorder point bar chart today date value same as today values in pichart for "months" view for business "MMF"

Verify today barchart value with pie chart for Minimum Order Quantity point for monthly view for business "MMF"
     And 5User should see Minimum Order Quantity bar chart today date value same as today values in pichart for "months" view for business "MMF"

Verify today barchart value with pie chart for safety stock for Quarterly view for business "MMF"
     And 7User should see SS bar chart today date value same as today values in pichart for "quarters" view for business "MMF"

Verify today barchart value with pie chart for reorder point for Quarterly view for business "MMF"
     And 8User should see ROP bar chart today date value same as today values in pichart for "quarters" view for business "MMF"

Verify today barchart value with pie chart for Minimum Order Quantity point for Quarterly view for business "MMF"
     And 9User should see MOQ bar chart today date value same as today values in pichart for "quarters" view for business "MMF"
#
##+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Verify today barchart value with pie chart for safety stock for weekly view for business "Renewables"
     #Given User access "/secure/stock-policy-dashboard" module
     And sleep  3s
     And click on reset filter button
     And sleep  15s
     And 1User should see safety stock bar chart today date value same as today values in pichart for weekly view for business "Renewables"

Verify today barchart value with pie chart for reorder point for weekly view for business "Renewables"
     And 2User should see "rop" bar chart today date value same as today values in pichart for "weeks" view for business "Renewables"

Verify today barchart value with pie chart for Minimum Order Quantity point for weekly view for business "Renewables"
     And 3User should see "moq" bar chart today date value same as today values in pichart for "weeks" view for business "Renewables"

Verify today barchart value with pie chart for safety stock for monthly view for business "Renewables"
     And 4User should see safety stock bar chart today date value same as today values in pichart for "months" view for business "Renewables"

Verify today barchart value with pie chart for reorder point for monthly view for business "Renewables"
     And 6User should see reorder point bar chart today date value same as today values in pichart for "months" view for business "Renewables"

Verify today barchart value with pie chart for Minimum Order Quantity point for monthly view for business "Renewables"
     And 5User should see Minimum Order Quantity bar chart today date value same as today values in pichart for "months" view for business "Renewables"

Verify today barchart value with pie chart for safety stock for Quarterly view for business "Renewables"
     And 7User should see SS bar chart today date value same as today values in pichart for "quarters" view for business "Renewables"

Verify today barchart value with pie chart for reorder point for Quarterly view for business "Renewables"
     And 8User should see ROP bar chart today date value same as today values in pichart for "quarters" view for business "Renewables"

Verify today barchart value with pie chart for Minimum Order Quantity point for Quarterly view for business "Renewables"
     And 9User should see MOQ bar chart today date value same as today values in pichart for "quarters" view for business "Renewables"
#
##+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
##++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Verify today barchart value with pie chart for safety stock for weekly view for business "Power"
     #Given User access "/secure/stock-policy-dashboard" module
     And sleep  3s
     And click on reset filter button
     And sleep  5s
     And 1User should see safety stock bar chart today date value same as today values in pichart for weekly view for business "Power"

Verify today barchart value with pie chart for reorder point for weekly view for business "Power"
     And 2User should see "rop" bar chart today date value same as today values in pichart for "weeks" view for business "Power"

Verify today barchart value with pie chart for Minimum Order Quantity point for weekly view for business "Power"
     And 3User should see "moq" bar chart today date value same as today values in pichart for "weeks" view for business "Power"

Verify today barchart value with pie chart for safety stock for monthly view for business "Power"
     And 4User should see safety stock bar chart today date value same as today values in pichart for "months" view for business "Power"

Verify today barchart value with pie chart for reorder point for monthly view for business "Power"
     And 6User should see reorder point bar chart today date value same as today values in pichart for "months" view for business "Power"

Verify today barchart value with pie chart for Minimum Order Quantity point for monthly view for business "Power"
     And 5User should see Minimum Order Quantity bar chart today date value same as today values in pichart for "months" view for business "Power"

Verify today barchart value with pie chart for safety stock for Quarterly view for business "Power"
     And 7User should see SS bar chart today date value same as today values in pichart for "quarters" view for business "Power"

Verify today barchart value with pie chart for reorder point for Quarterly view for business "Power"
     And 8User should see ROP bar chart today date value same as today values in pichart for "quarters" view for business "Power"

Verify today barchart value with pie chart for Minimum Order Quantity point for Quarterly view for business "Power"
     And 9User should see MOQ bar chart today date value same as today values in pichart for "quarters" view for business "Power"