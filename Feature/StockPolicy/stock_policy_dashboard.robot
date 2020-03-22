*** Settings ***
Library           Selenium2Library
Resource  ../../StepDefinition/StockPolicy/stock_policy_dashboard_step.robot

*** Test Cases ***
#Verify stock_policy_dashboard navigation
#    Given User access "/secure/stock-policy-dashboard" module
#    #And User should click on expand filter view
#    And User should click on add filter button
#    And User should click on continue button
#    And User should click on plant business filter
#    #     And User should click on mmf
#    And User should click on apply button


Verify stock_policy_dashboard navigation
    Given User access "/secure/stock-policy-dashboard" module
    And User should see Stock Policy Opportunities lable
    And user should see default filters "Plant Business" "Sub Business" "Plant Region" "plant"
    And Delete All Bookmarks  /secure/stock-policy-dashboard
    And User should donut pie chart with name "TOTAL OPPORTUNITIES"
    And User should see "Safety Stock" bar chart with View Details option and with Inventory opportunities and Fullfillment Opportunities
    And User should see "Reorder Point" bar chart with view details option
    And User should see "Minimum Order Quantity" bar chart with view details option
    And User should see "ABC CLASSIFICATION" bar chart with View details option

Verify View Details option on stock policy dashboard for safety stock
    When User click on View Details in Safety stock bar chart
    Then User need to redirect to Safety stock opportunities page and User should see "Safety Stock Opportunities " Title
    And User should see "Plant Business" "Sub business" "Plant" "Plant Region" " Material Sku" filters on default page
    And User should see "opprtunities" and "Rejected" options and Edit filters button and clear filter button
    And User should see columns "PLANT" "MATERIAL SKU" "CURRENT QTY" "RECOMMENDED QTY" "OPPORTUNITY $" "DECISION" columns FOR ss oppor.
    And click Back button to navigate SS Dashboard from SS oppo.

Verify View Details option on stock policy dashboard for REORDER POINT
    Given User access "/secure/stock-policy-dashboard" module
    When User click on View Details in REORDER POINT bar chart
    Then User need to redirect to REORDER POINT opportunities page and User should see "Reorder Point Opportunities " Title
    And User should see "Plant Business" "Sub business" "Plant" "Plant Region" " Material Sku" filters on default page
    And User should see "Rejected" options and Edit filters button and clear filter button
    And User should see columns "PLANT" "MATERIAL SKU" "CURRENT QTY" "RECOMMENDED QTY" "OPPORTUNITY $" "DECISION" columns FOR for rop
    And click Back button to navigate SS Dashboard from ROP oppo.

Verify View Details option on stock policy dashboard for MINIMUM ORDER QUANTITY
    Given User access "/secure/stock-policy-dashboard" module
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    Then User need to redirect to MINIMUM ORDER QUANTITY opportunities page and User should see "Minimum Order Quantity Opportunities " Title
    And User should see "Plant Business" "Sub business" "Plant" "Plant Region" " Material Sku" filters on default page
    And User should see "opprtunities" and "Rejected" options and Edit filters button and clear filter button FOR moq OPPO.
    And User should see columns "PLANT" "MATERIAL SKU" "CURRENT QTY" "RECOMMENDED QTY" "OPPORTUNITY $" "CURRENT LOT DAYS" "SUGGESTED LOT DAYS" "DECISION" columns FOR for moq
    And click Back button to navigate SS Dashboard from MOQ oppo.

Verify View Details option on stock policy dashboard for ABC CLASSIFICATION
    Given User access "/secure/stock-policy-dashboard" module
    When User click on View Details in ABC Classification bar chart
    Then User need to redirect to ABC Classification page and User should see "ABC Classification Opportunities " Title
    And User should see "Plant Business" "Sub business" "Plant" "Plant Region" " Material Sku" filters on default page
    And User should see "opprtunities" and "Rejected" options and Edit filters button and clear filter button FOR moq OPPO.
    And User should see columns "PLANT" "MATERIAL SKU" "Material Desc" "CURRENT CLASSIFICATION" "RECOMMENDED CLASSIFICATION" "ANNUAL SPEND" "DECISION" columns FOR ABc
    And click Back button to navigate SS Dashboard from ABC Classification oppo.

Verify Material Sku Page fields by click on View details option for SS ooportunities
    Given User access "/secure/stock-policy-dashboard" module
    When User click on View Details in Safety stock bar chart
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to SS opp. details page
    And click Back button to navigate SS Dashboard from SS oppo.

Verify Material Sku Page fields by click on View details option for ROP ooportunities
    Given User access "/secure/stock-policy-dashboard" module
    When User click on View Details in REORDER POINT bar chart
    And User click on one of the row in material sku column for rop
    Then User should see same material sku number that user selected for rop
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to ROP opp. details page
    And click Back button to navigate SS Dashboard from ROP oppo.

Verify Material Sku Page fields by click on View details option for MOQ ooportunities
     Given User access "/secure/stock-policy-dashboard" module
     When User click on View Details in MINIMUM ORDER QUANTITY bar chart
     And User click on one of the row in material sku column
     Then User should see same material sku number that user selected
     And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
     And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
     And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
     And click back button to navigate to MOQ opp. details page
     And click Back button to navigate SS Dashboard from MOQ oppo.

Verify Material Sku Page fields by click on View details option for ABC ooportunities
     Given User access "/secure/stock-policy-dashboard" module
     When User click on View Details in ABC Classification bar chart
     And User click on one of the row in material sku column
     Then User should see same material sku number that user selected
     And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
     And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
     And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
     And click back button to navigate to MOQ opp. details page
     And click Back button to navigate SS Dashboard from MOQ oppo.

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting business "MMF"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "MMF" from business filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to SS opp. details page
    And click Back button to navigate SS Dashboard from SS oppo.

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting business "MMF"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "MMF" from business filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to ROP opp. details page
    And click Back button to navigate SS Dashboard from ROP oppo.
#
Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting business "MMF"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "MMF" from business filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to MOQ opp. details page
    And click Back button to navigate SS Dashboard from MOQ oppo.

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting business "MMF"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "MMF" from business filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to MOQ opp. details page
    And click Back button to navigate SS Dashboard from MOQ oppo.

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting business "Renewables"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "Renewables" from business filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to SS opp. details page
    And click Back button to navigate SS Dashboard from SS oppo.

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting business "Renewables"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "Renewables" from business filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting business "Renewables"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "Renewables" from business filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting business "Renewables"
    Given User access "/secure/stock-policy-dashboard" module
    And Select business "Renewables" from business filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to MOQ opp. details page
    And click Back button to navigate SS Dashboard from MOQ oppo.

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting Sub_business "Power Services"
    Given User access "/secure/stock-policy-dashboard" module
    And Select sub_business "Power Services" from sub_business filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting Sub_business "Power Services"
    Given User access "/secure/stock-policy-dashboard" module
    And Select sub_business "Power Services" from sub_business filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting Sub_business "Power Services"
    Given User access "/secure/stock-policy-dashboard" module
    And Select sub_business "Power Services" from sub_business filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting Sub_business "Power Services"
    Given User access "/secure/stock-policy-dashboard" module
    And Select sub_business "Power Services" from sub_business filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
    And click back button to navigate to MOQ opp. details page
    And click Back button to navigate SS Dashboard from MOQ oppo.

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting region "ASIA"
    Given User access "/secure/stock-policy-dashboard" module
    And Select region "ASIA" from region filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting region "Asia"
    Given User access "/secure/stock-policy-dashboard" module
    And Select region "ASIA" from region filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting region "Asia"
    Given User access "/secure/stock-policy-dashboard" module
    And Select region "ASIA" from region filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting region "Asia"
    Given User access "/secure/stock-policy-dashboard" module
    And Select region "ASIA" from region filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting any plant Any first plant
    Given User access "/secure/stock-policy-dashboard" module
    And Select any plant from plant filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting any plant Any first plant
    Given User access "/secure/stock-policy-dashboard" module
    And Select any plant from plant filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting any plant Any first plant
    Given User access "/secure/stock-policy-dashboard" module
    And Select any plant from plant filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting any plant Any first plant
    Given User access "/secure/stock-policy-dashboard" module
    And Select any plant from plant filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting any buyer from buyer filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Buyer/Purchasing group filter and click continue button
    And Select any buyer from buyer filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting any buyer from buyer filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Buyer/Purchasing group filter and click continue button
    And Select any buyer from buyer filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting any buyer from buyer filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Buyer/Purchasing group filter and click continue button
    And Select any buyer from buyer filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting any buyer from buyer filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Buyer/Purchasing group filter and click continue button
    And Select any buyer from buyer filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for SS ooportunities by selecting any buyer from Planner filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Planner/Mrp Controller filter and click continue button
    And Select any planner from planner filter and click apply button
    When User click on View Details in Safety stock bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ROP ooportunities by selecting any buyer from Planner filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Planner/Mrp Controller filter and click continue button
    And Select any planner from planner filter and click apply button
    When User click on View Details in REORDER POINT bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for MOQ ooportunities by selecting any buyer from Planner filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Planner/Mrp Controller filter and click continue button
    And Select any planner from planner filter and click apply button
    When User click on View Details in MINIMUM ORDER QUANTITY bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify Material Sku Page fields by click on View details option for ABC ooportunities by selecting any buyer from Planner filter
    Given User access "/secure/stock-policy-dashboard" module
    And User select Planner/Mrp Controller filter and click continue button
    And Select any planner from planner filter and click apply button
    When User click on View Details in ABC Classification bar chart
    And User should see filter got selected color
    And User click on one of the row in material sku column
    Then User should see same material sku number that user selected
    And fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
    And fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
    And SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible

Verify weekly dropdown in ss barchart, rop barchart, moq barchart
    Given User access "/secure/stock-policy-dashboard" module
    Then User shoud see weekly dropdown enabled for ss barchart, rop barchart, moq barchart

Verify weekly dropdown function when we select data with zero records(expected beheviour weekly dropdown should not be clickable)
    Given User access "/secure/stock-policy-dashboard" module
    And select business "Renewables" from plant business filter and hit apply button
    And select data which contains zero record and hit apply button
    Then user should see grayed out weekly dropdown and not clickable