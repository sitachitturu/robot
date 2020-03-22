*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
      click link  ${link}
      sleep  10s

click on clear filter option
       wait until element is visible  clearFilterBtn  10s
       click element  clearFilterBtn
       sleep  4s

User should see default filters "plant business" "sub business" "plant" filters on ui for plant comaparison
       element should be visible  business
       element should be visible  sub_business
       element should be visible  plant

User should see default filters "plant" filters on ui for Executive summary
       element should be visible  plant

User should see default filters "plant" "Final Exception Message" "Exception Requires Action" "Planner / MRP Controller" "Buyer /Purchasing Group" "Order Type" "Profit Center" "Action" "Production Work Order" filters on ui for Scheduling
       element should be visible  plant
       element should be visible  exp
       element should be visible  exp_action
       element should be visible  mrpc
       element should be visible  pgroup
       element should be visible  record_type
       element should be visible  profit_center
       element should be visible  user_actions
       element should be visible  prod_order

User should see default filters "plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" "Order Type" filters on ui for Purchasing
       element should be visible  plant
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  profit_center
       element should be visible  order_type

User should see default filters "plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" "PO Action" "PO Number" filters on ui for Purchase-orders
       element should be visible  plant
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  profit_center
       element should be visible  action_description
       element should be visible  purchase_order_number

User should see default filters "plant" "Buyer /Purchasing Group" "Vendor Name" "Profit Center" "Planner / MRP Controller" filters on ui for Receipt-optimization
       element should be visible  plant
       element should be visible  pgroup
       element should be visible  source
       element should be visible  profit_center
       element should be visible  mrpc

User should see default filters "plant" filters on ui for Master-data
       element should be visible  plant

User should see default filters "plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" filters on ui for Cycle-counting
       element should be visible  plant
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  profit_center

User should see default filters "plant business" "sub business" "Plant Region" "Plant" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" filters on ui for Stock-policy-dashboard
       element should be visible  business
       element should be visible  sub_business
       element should be visible  region
       element should be visible  plant
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  pcenter

User should see default filters "plant business" "sub business" "Plant" "Order Type" "Buyer /Purchasing Group" "Material SKU" "Planner / MRP Controller" filters on ui for Material-transfer
       element should be visible  business
       element should be visible  sub_business
       element should be visible  plant
       element should be visible  order_type
       element should be visible  buyer
       element should be visible  sku
       element should be visible  mrpc

User should see default filters "Plant" "Plant Category" "Plant Region" "Plant business" "Buyer /Purchasing Group" "Planner / MRP Controller" "Material SKU" "Profit Center" filters on ui for Material-transfer
       element should be visible  plant
       element should be visible  pcat
       element should be visible  region
       element should be visible  business
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  sku
       element should be visible  pcenter

User should see default filters "Plant" "Material SKU" "Source/Vendor" "Outliers" "Buyer /Purchasing Group" "Planner / MRP Controller" "Profit Center" filters on ui for Lead-time-analytics
       element should be visible  plant
       element should be visible  sku
       element should be visible  source_vendor
       element should be visible  outlier
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  profit_center

User should see default filters "Plant" "Planner / MRP Controller" "Profit Center" "Buyer /Purchasing Group" filters on ui for Consumption-issues
       element should be visible  plant
       element should be visible  mrpc
       element should be visible  profit_center
       element should be visible  pgroup

User should see default filters "Exception Requires Action" "Buyer /Purchasing Group" "Planner / MRP Controller" "Plant" "Profit Center" filters on ui for Buyer-control-center
       element should be visible  exp_action
       element should be visible  pgroup
       element should be visible  mrpc
       element should be visible  plant
       element should be visible  profit_center





