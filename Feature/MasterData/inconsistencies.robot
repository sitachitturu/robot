*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/MasterData/inconsistencies_step.robot

*** Test Cases ***

"Planned Delivery Time (LT) = 0 for Purchased Materials" inconsistency
    Given User access Master Data page
    Then User should see "Planned Delivery Time (LT) = 0 for Purchased Materials"
    When User click "View" details page for "Planned Delivery Time (LT) = 0 for Purchased Materials" inconsistency
    And User should see "Planned Delivery Time (LT) = 0 for Purchased Materials" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Ph Vendor Number" column "Vendor Name" column "Ma Planned Del Time" column "Pl Planned Del Time" column "Purchasing Group Name Buyer Name"
    And User should be able to see list of columns in show/hide columns option(mmdc53)

"Open Sales Order Validation" inconsistency
    Given User access Master Data page
    Then User should see "Open Sales Order Validation"
    When User click "View" details page for "Open Sales Order Validation" inconsistency
    And User should see "Open Sales Order Validation" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Sales Document" column "Bom Available" column "Route Available" column "Cost Available" column "Correct Material Status"
    And User should be able to see list of columns in show/hide columns option(mmdc39)

"Stor. Loc. for EP ‘Non Relevant’ for MRP" inconsistency
    Given User access Master Data page
    Then User should see "Stor. Loc. for EP ‘Non Relevant’ for MRP"
    When User click "View" details page for "Stor. Loc. for EP ‘Non Relevant’ for MRP" inconsistency
    And User should see "Stor. Loc. for EP ‘Non Relevant’ for MRP" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Mrp Controller" column "Purchasing Group Buyer Code" column "Storage Loc For Ep" column "Prod Stor Location"
    And User should be able to see list of columns in show/hide columns option(mmdc16)

"Conflicting Ind./Col. Indicator and Safety Stock" inconsistency
    Given User access Master Data page
    Then User should see "Conflicting Ind./Col. Indicator and Safety Stock"
    When User click "View" details page for "Conflicting Ind./Col. Indicator and Safety Stock" inconsistency
    And User should see "Conflicting Ind./Col. Indicator and Safety Stock" title at the top of the details page
    And User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Purchasing Group Buyer Code" column "Safety Stock" column "Reorder Point" column "Individual Coll"
    Then User should be able to see list of columns in show/hide columns option(mmdc36)

"Missing Work Scheduling Extension" inconsistency
    Given User access Master Data page
    Then User should see "Missing Work Scheduling Extension"
    When User click "View" details page for "Missing Work Scheduling Extension" inconsistency
    And User should see "Missing Work Scheduling Extension" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Purchasing Group Buyer Code" column "Material Type" column "Mrp Controller" column "Mrp Type"
    And User should be able to see list of columns in show/hide columns option(mmdc33)
"In-House Prod. Time = 0"
    Given User access Master Data page
    Then User should see "In-House Prod. Time = 0"
    When User click "View" details page for "In-House Prod. Time = 0" inconsistency
    And User should see "In-House Prod. Time = 0" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Total Replenishment Lead Time" column "Material Type" column "Mrp Controller" column "Mrp Type"
    And User should be able to see list of columns in show/hide columns option(mmdc15)

"Missing MRP Controller"
    Given User access Master Data page
    Then User should see "Missing MRP Controller"
    When User click "View" details page for "Missing MRP Controller" inconsistency
    And User should see "Missing MRP Controller" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Purchasing Group Buyer Code" column "Material Type" column "Plant Sp Matl Status" column "Mrp Type"
    And User should be able to see list of columns in show/hide columns option(mmdc17)
# This inconcistency has been removed
"In-House Prod. Time > Total LT"
    Given User access Master Data page
    Then User should not see "In-House Prod. Time > Total LT"

"Missing BOM and/or Routing"
    Given User access Master Data page
    Then User should see "Missing BOM and/or Routing"
    When User click "View" details page for "Missing BOM and/or Routing" inconsistency
    And User should see "Missing BOM and/or Routing" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Plant Sp Matl Status" column "Material Type" column "Mrp Controller" column "Mrp Type"
    And User should be able to see list of columns in show/hide columns option(mmdc11)

"Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials"
    Given User access Master Data page
    Then User should see "Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials"
    When User click "View" details page for "Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials" inconsistency
    And User should see "Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Ph Vendor Number" column "Vendor Name" column "Ma Planned Del Time" column "Pl Planned Del Time" column "Purchasing Group Name Buyer Name"
    And User should be able to see list of columns(list1) in show/hide columns option(mmdc32)

"Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials"
    Given User access Master Data page
    Then User should see "Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials"
    When User click "View" details page for "Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials" inconsistency
    And User should see "Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Ph Vendor Number" column "Vendor Name" column "Minimum Lot Size" column "Minimum Order Qty" column "Purchasing Group Name Buyer Name"
    And User should be able to see list of columns in show/hide columns option(mmdc50)

"Missing Purchasing Group"
    Given User access Master Data page
    Then User should see "Missing Purchasing Group"
    When User click "View" details page for "Missing Purchasing Group" inconsistency
    And User should see "Missing Purchasing Group" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Material Type" column "Profit Center" column "Mrp Controller" column "Mrp Type" column
    And User should be able to see list of columns in show/hide columns option(mmdc45)

"Missing Storage Location Extension"
    Given User access Master Data page
    Then User should see "Missing Storage Location Extension"
    When User click "View" details page for "Missing Storage Location Extension" inconsistency
    And User should see "Missing Storage Location Extension" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Profit Center" column "Mrp Controller" column "Purchasing Group Buyer Code" column "Storage Loc For Ep" column "Prod Stor Location"
    And User should be able to see list of columns in show/hide columns option(mmdc18)

"Source List MRP Relevancy Recommendation"
    Given User access Master Data page
    Then User should see "Source List MRP Relevancy Recommendation"
    When User click "View" details page for "Source List MRP Relevancy Recommendation" inconsistency
    And User should see "Source List MRP Relevancy Recommendation" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Ph Vendor Number" column "Mrp Controller Name" column "Purchasing Group Name Buyer Name" column "Vendor Name" column "Number Of Pos"
    And User should be able to see list of columns(list1) in show/hide columns option(mmdc52)

"Materials Missing a Profit Center Assignment"
    Given User access Master Data page
    Then User should see "Materials Missing a Profit Center Assignment"
    When User click "View" details page for "Materials Missing a Profit Center Assignment" inconsistency
    And User should see "Materials Missing a Profit Center Assignment" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Material Type" column "Mrp Controller" column "Purchasing Group Buyer Code" column "Mrp Type" column "Plant Sp Matl Status"
    And User should be able to see list of columns in show/hide columns option(mmdc61)

"List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed"
    Given User access Master Data page
    Then User should see "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed"
    When User click "View" details page for "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed" inconsistency
    And User should see "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Material Type" column "Mrp Controller" column "Purchasing Group Buyer Code" column "Profit Center" column "Safety Stock"
    And User should be able to see list of columns in show/hide columns option(mmdc54)

"Purchased to Stock materials with no Source List"
    Given User access Master Data page
    Then User should see "Purchased to Stock materials with no Source List"
    When User click "View" details page for "Purchased to Stock materials with no Source List" inconsistency
    And User should see "Purchased to Stock materials with no Source List" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Ph Vendor Number" column "Vendor Name" column "Reorder Point" column "Safety Stock" column "Purchasing Group Name Buyer Name"
    And User should be able to see list of columns in show/hide columns option(mmdc51)

"Missing Source List Flag MM"
    Given User access Master Data page
    Then User should see "Missing Source List Flag MM"
    When User click "View" details page for "Missing Source List Flag MM" inconsistency
    And User should see "Missing Source List Flag MM" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Material Sku" column "Ph Vendor Number" column "Vendor Name" column "Sl Number" column "Sl Fixed Vendor" column "Sl Mrp Relevant"
    And User should be able to see list of columns in show/hide columns option(mmdc72)

"Items Missing a Lead Time"
    Given User access Master Data page
    Then User should see "Items missing a Lead Time"
    When User click "View" details page for "Items missing a Lead Time" inconsistency
    And User should see "Items missing a Lead Time" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Item" column "Material Type" column "Lt Fixed Leadtime" column "Preprocessing leadtime" column "Full leadtime" column "Postprocessing leadtime"
    And User should be able to see list of columns in show/hide columns option(mmdc98)

"Missing BOM for Make Items"
    Given User access Master Data page
    Then User should see "Missing BOM for Make Items"
    When User click "View" details page for "Missing BOM for Make Items" inconsistency
    And User should see "Missing BOM for Make Items" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Item" column "Planner" column "Buyer" column "Plant Sp Matl Status" column "Material Type" column "Bom Bom Allowed"
    And User should be able to see list of columns in show/hide columns option(mmdc99)

"Items missing Approved Supplier List"
    Given User access Master Data page
    Then User should see "Items missing Approved Supplier List"
    When User click "View" details page for "Items missing Approved Supplier List" inconsistency
    And User should see "Items missing Approved Supplier List" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Item" column "Plant Sp Matl Status" column "Material Type" column "Asl Status" column "Po Purchasing Enabled" column "Planner"
    And User should be able to see list of columns in show/hide columns option(mmdc101)

"Missing Routings for Make Items"
    Given User access Master Data page
    Then User should see "Missing Routings for Make Items"
    When User click "View" details page for "Missing Routings for Make Items" inconsistency
    And User should see "Missing Routings for Make Items" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Item" column "Planner" column "Buyer" column "Plant Sp Matl Status" column "Material Type" column "Bom Bom Allowed"
    And User should be able to see list of columns in show/hide columns option(mmdc100)

"Inactive BOM Components"
    Given User access Master Data page
    Then User should see "Inactive BOM Components"
    When User click "View" details page for "Inactive BOM Components" inconsistency
    And User should see "Inactive BOM Components" title at the top of the details page
    Then User should see following column "Plant Code - Name" column "Assembly" column "Assy Desc" column "Component" column "Comp Type Description" column "Comp Status" column "Supply Type"
    And User should be able to see list of columns in show/hide columns option(mmdc102)

"Purchase Order Has A Past Due Promise Date"
    Given User access Master Data page
    Then User should see "Purchase Order Has A Past Due Promise Date"
    When User click "View" details page for "Purchase Order Has A Past Due Promise Date" inconsistency
    And User should see "Purchase Order Has A Past Due Promise Date" title at the top of the details page
    Then User should see 11 columns: column "Plant Code - Name" column "Purchasing Group Name Buyer Name" column "Po Purchase Order Number" column "Material Description" column "Po Line" column "Source Vendor" column "Vendor Site" column "Release Number" column "Schedule Line" column "Po Requested Delivery Date" column "Po Confirmation Delivery Date"
    And User should be able to see list of columns in show/hide columns option(mmdc20)

"Buyer Name On Item Does Not Match Purchase Order"
    Given User access Master Data page
    Then User should see "Buyer Name On Item Does Not Match Purchase Order"
    When User click "View" details page for "Buyer Name On Item Does Not Match Purchase Order" inconsistency
    And User should see "Buyer Name On Item Does Not Match Purchase Order" title at the top of the details page
    Then User should see 13 columns: column "Plant Code - Name" column "Purchasing Group Name Buyer Name" column "Po Purchase Order Number" column "Po Buyer Id" column "Item Buyer Id" column "Material Description" column "Po Line" column "Source Vendor" column "Vendor Site" column "Release Number" column "Schedule Line" column "Po Requested Delivery Date" column "Po Confirmation Delivery Date"
    And User should be able to see list of columns in show/hide columns option(mmdc21)

"Purchase Order Is Missing a Promise Date"
    Given User access Master Data page
    Then User should see "Purchase Order Is Missing a Promise Date"
    When User click "View" details page for "Purchase Order Is Missing a Promise Date" inconsistency
    And User should see "Purchase Order Is Missing a Promise Date" title at the top of the details page
    Then User should see 11 columns: column "Plant Code - Name" column "Purchasing Group Name Buyer Name" column "Po Purchase Order Number" column "Material Description" column "Po Line" column "Source Vendor" column "Vendor Site" column "Release Number" column "Schedule Line" column "Po Requested Delivery Date" column "Po Confirmation Delivery Date"
    And User should be able to see list of columns in show/hide columns option(mmdc19)

Item lead time is greater than 365 days
    Given User access Master Data page
    Then User should see "Item lead time is greater than 365 days"
    When User click "View" details page for "Item lead time is greater than 365 days" inconsistency
    And User should see "Item lead time is greater than 365 days" title at the top of the details page
    Then User should see 8 columns "Plant Code - Name" column "Item" column "Material Type" column "Buyer" column "Full leadtime" column "Preprocessing leadtime" column "Postprocessing leadtime" column
    And User should be able to see list of columns in show/hide columns option(mmdc106)

Item is having a dummy lead time value
    Given User access Master Data page
    Then User should see "Item is having a dummy lead time value"
    When User click "View" details page for "Item is having a dummy lead time value" inconsistency
    And User should see "Item is having a dummy lead time value" title at the top of the details page
    Then User should see 8 columns "Plant Code - Name" column "Item" column "Material Type" column "Buyer" column "Full leadtime" column "Preprocessing leadtime" column "Postprocessing leadtime" column
    And User should be able to see list of columns in show/hide columns option(mmdc105)

Item is missing an approved supplier lead time
    Given User access Master Data page
    Then User should see "Item is missing an approved supplier lead time"
    When User click "View" details page for "Item is missing an approved supplier lead time" inconsistency
    And User should see "Item is missing an approved supplier lead time" title at the top of the details page
    Then User should see 8 columns "Plant Code - Name" column "Item" column "Material Type" column "Buyer" column "Source Vendor" column "Vendor Site" column "Asl Processing Leadtime" column
    And User should be able to see list of columns in show/hide columns option(mmdc104)