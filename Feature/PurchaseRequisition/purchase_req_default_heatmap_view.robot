*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseRequisition/purchase_req_default_heatmap_view_step.robot

*** Test Cases ***
Verify the title "PURCHASE REQUISITION ITEMS BY" in purchase requisitions module
        Given User access "/secure/purchasing" module
        Then User should see "Requisitions (incl. Planned)"
        And User should see "PURCHASE REQUISITION ITEMS BY"

Verify Buyer/Vendor/Planner etc drop down box in purchase requisitions module
        Then User should see dropdown box having name Buyer on it
        And User should able to select and Verify the list(vendor,planner,material,plant,buyer)on Buyer dropdown box

Verify the list in Show/hide columns button in purchase requisitions module
        Then User should see Show/Hide Columns button

Verify the purchase requisition page with list of default columns should be displayed
        Then User should see following column "Age (Bucket)" column "Delivery Date" column "Material SKU" column "Value (USD)" column "PR Number" column "Requisition Date" column "Short Cycle" column "Source/Vendor" column

Verify Export to Excel option and verify the columns list displaying on excels
        Then User see Excel to Export option on Purchase requisitions landing page

Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "altais-erp"
        Given User access "/secure/purchasing" module
        And sub_business "altais-erp" from sub_business filter and change view to plant
        Then Verify numbers in heatmap by selecting sub_business "altias-erp" and select plant from items by dropdown and verify all column values for count view in PR module
       And unselect altais -erp plants from sub_business filter
###==============================================================================================================================================================================================
## as oil and gas business is no more in mos application , hence commenting out this script
#Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "gog_ofs"
##        Then Verify numbers in heatmap by selecting sub_business "gog_ofs" and select plant from items by dropdown and verify all column values for count view in PR module
##        And uselect "gog_ofs" plants from plant sub_business
##=========================================================================================================================================================================================================
Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "pascal"
        Then Verify numbers in heatmap by selecting sub_business "pascal" and select plant from items by dropdown and verify all column values for count view in PR module
        And uselect "pascal" plants from plant sub_business

Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "zeal"
        Then Verify numbers in heatmap by selecting sub_business "zeal" and select plant from items by dropdown and verify all column values for count view in PR module
        And uselect "zeal" plants from plant sub_business
#
##Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "hc_glprod_healthcare"
##        Then Verify numbers in heatmap by selecting sub_business "hc_glprod_healthcare" and select plant from items by dropdown and verify all column values for count view in PR module
##        And uselect "hc_glprod_healthcare" plants from plant sub_business

Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "powermax"
        Then Verify numbers in heatmap by selecting sub_business "powermax" and select plant from items by dropdown and verify all column values for count view in PR module
        And uselect "powermax" plants from plant sub_business

Verify Numbers in columns in heat map for count view and for plant view in purchase requisition module for Plant sub_business by selecting "alpha"
       Then Verify numbers in heatmap by selecting sub_business "alpha" and select plant from items by dropdown and verify all column values for count view in PR module
       And uselect "alpha" plants from plant sub_business

Verify Numbers in columns in heat map for count view and for planner view in purchase requisition module for plant "racesbi_ods-onshorewind"
       Then Verify numbers in heatmap by selecting plant "racesbi_ods-onshorewind" and planner by planner and verify all column values for count view in PR module
       And uselect "racesbi_ods-onshorewind" plants from plant sub_business

Verify Numbers in columns in heat map for count view and for planner view in purchase requisition module for plant "sap-apcis"
       Then Verify numbers in heatmap by selecting plant ""sap-apcis"" and planner by planner and verify all column values for count view in PR module
       And uselect "sap-apcis"" plants from plant sub_business