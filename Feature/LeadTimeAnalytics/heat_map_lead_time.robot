6/12/2017
by sita chitturu(212590906)
*** Settings ***
Library  Selenium2Library
Resource   ../../StepDefinition/LeadTimeAnalytics/heat_map_lead_time_step.robot

*** Test Cases ***
Verify Heat map group by Positive LT Difference
     Given User access Lead Time Analytics module
     And User see Lead TIME By with "source vendor" drop down and "positive lt and negative lt" drop down
     And User should see following column "Source/Vendor" column "Total Opportunity" column "PO Amount" column "ASL/System LT" column "Actual LT" column "Orig.PO LT" column "LT Difference" column "Po Early/Late By Days" column "Early/Late Receipt" column "Record Count" column on heat map

Verify dynamic heatmap by selecting row from heatmap for positive lt difference
     When User click on heatmap for any source vendor user should see filter got selected
     Then click on source/vendor filter and uncheck the selected one and hit apply and user should see heatmap got refreshed

Verify dynamic heatmap by selecting row from heatmap for negative lt difference
     When User click any source vendor user should see filter got selected and able to clear the selected filters and able to see default view of heatmap
#
Verify Total Opportunity in heat map with spine by selecting vendor by vendor for positive Lt difference
     Given User access Lead Time Analytics module
     ##And User see Lead TIME By with "source vendor" drop down and "positive lt and negative lt" drop down
     And verify calculations for Total Opportunity in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap

Verify Actual Lt in heat map with spine by selecting vendor by vendor for positive Lt difference
     And verify calculations for Actual Lt in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap

Verify system Lt in heat map with spine by selecting vendor by vendor for positive Lt differenc
     And verify calculations for System Lt in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap

#===================================================================================================================================================================================================================
#=====================================================================================================================================================================================================================
verify PO Amount in heatmap with spine by selecting vendor by vendor for Negative Lt Differenc
     Given User access Lead Time Analytics module
     When User clicks on lead time by "Negative Lt Difference"
     And User should see right calculations for Po Amount in heatmap for Negative Lt Difference (by selecting vendor by vendor)

Verify Actual Lt in heat map with spine by selecting vendor by vendor for Negative Lt Differenc
     And User should see right calculations for Actual Lt in heatmap for Negative Lt Difference (by selecting vendor by vendor)

Verify system Lt in heat map with spine by selecting vendor by vendor for Negative Lt Differenc
     And User should see right calculations for system Lt in heatmap for Negative Lt Difference (by selecting vendor by vendor)

Verify Fulfillment Risk in heat map with spine by selecting vendor by vendor for Negative Lt differenc
     Then User should see right calculations for Fulfillment Risk in heat map for Negative LT Difference by selecting vendor by vendor and compare values in spine with heatmap
####=============================================================================================================================================================================================================
####=========================================================================================================================================================================================
Verify Total Opportunity in heat map with spine by selecting Material SKU by Material SKU for positive Lt differenc
     Given User access Lead Time Analytics module
     When User clicks on lead time by "Material Sku"
     And verify calculations for Total Opportunity in heat map for Positive LT Difference by selecting Material SKU by Material SKU and compare values in spine with heatmap

Verify PO Amount in heatmap with spine by selecting Material SKU by Material SKU for Positive Lt Differenc
      And Verify calculations for Po Amount in heatmap for Positive LT Difference with database by selecting Material SKU by Material SKU and compare values

Verify Actual Lt in heat map with spine by selecting sku by sku for positive Lt difference
      And verify calculations for Actual Lt in heat map for Positive LT Difference by selecting sku by sku and compare values in database with heatmap

Verify system Lt in heat map with spine by selecting sku by sku for positive Lt difference
     And verify calculations for System Lt in heat map for Positive LT Difference by selecting sku by sku and compare values in spine with heatmap

##==============================================================================================================================================================================
#####==============================================================================================================================================================================
##Verify Total Opportunity in heat map with spine by selecting Material SKU by Material SKU for Negative Lt differenc
##      And User clicks on lead time by "Negative Lt Difference"
##      And verify calculations for Total Opportunity in heat map for Negative LT Difference by selecting Material SKU by Material SKU and compare values in spine with heatmap
##
##Verify PO Amount in heatmap with spine by selecting Material SKU by Material SKU for Negative Lt Differenc
##      And Verify calculations for Po Amount in heatmap for Negative LT Difference with database by selecting Material SKU by Material SKU and compare values
##
##Verify Actual Lt in heat map with spine by selecting sku by sku for Negative Lt difference
##      And verify calculations for Actual Lt in heat map for Negative Lt difference by selecting sku by sku and compare values in database with heatmap

Verify Heat map group by Negative LT Differenc
      And User clicks on lead time by "Negative Lt Difference"
      When User clicks on lead time by "Material Sku"
      Then User should see following column "Source/Vendor" column "Fulfillment Risk" column "PO Amount" column "System LT" column "Actual LT" column "LT Difference" column "on heat map for -ve difference
###==================================================================================================================================================================================
###====================================================================================================================================================================================
Verify condition:Total opportunity column for LT Reduction Opportunity should not show negative values for default view
     Given User access Lead Time Analytics module
     Then verify Total opportunity col. for LT Reduction Opportunity should not show negative values

Verify condition:Total opportunity column for LT Reduction Opportunity should not show negative values by sorting the total oppo. column
     Then verify Total opportunity col. for LT Reduction Opportunity should not show negative values by sorting the total oppo. column

Verify condition:Total opportunity column for fullfillment risk should not show negative values for default view
     Then verify Total opportunity col. for fullfillment risk should not show negative values

Verify condition:Total opportunity column for fullfillment risk should not show negative values by sorting the total oppo. column
     Then verify Total opportunity col. for fullfillment risk should not show negative values by sorting the total oppo. column

Verify condition:Total opportunity column for fullfillment risk should not show negative values by sorting the total oppo. column for material sku
     Then verify Total opportunity col. for fullfillment risk should not show negative values by sorting the total oppo. column for material sku

Verify condition:Total opportunity column for LT Reduction Opportunity should not show negative values for default view by selecting sku
     Given User access Lead Time Analytics module
     Then verify Total opportunity col. for LT Reduction Opportunity should not show negative values by selecting sku

Verify condition:Total opportunity column for LT Reduction Opportunity should not show negative values by sorting the total oppo. column
     Then verify Total opportunity col. for LT Reduction Opportunity should not show negative values by sorting the total oppo. column by selecting sku

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#====================================================================================================================================================================================
Verify Open Po placement in opportunities dropdown for source/vendor
     Given User access Lead Time Analytics module
     And User should see "Open PO Placement" and able to click on it
     And User should see following columns "Source/Vendor" column "Open PO Placement" column "PO Amount" column "ASL/System LT" column "Orig.PO LT" column "Po Early/Late By Days" column "Early/Late Receipt" column "Record Count" column on heat map

Verify Buyer dropdown for Fullfillment risk, lt reduction and open po placement
     When User select Buyer from vendor dropdown user should see data in grid related to buyer for open po placement
     When User select Buyer from vendor dropdown user should see data in grid related to buyer for lt reduction
     When User select Buyer from vendor dropdown user should see data in grid related to buyer for fullfillment risk

Verify po count and po amount bar chart in lta trending page
     When User click on Trends
     Then User should see PO AMOUNT dropdown as default bar chart
     And User click on po amount dropdown and select po line
     And User should see poline bar chart in ui
