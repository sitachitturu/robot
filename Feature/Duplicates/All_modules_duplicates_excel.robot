*** Settings ***
Library  Selenium2Library
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Library   ../../Utilities/utility.py
Resource  ../../StepDefinition/Duplicates/All_modules_duplicates_step.robot
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot

*** Test Cases ***
Verify Duplicates in db and excel and compare them in "Material Transfer Module"
    Given User access "/secure/material-transfer" module
    And Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line"
    And Remove old excel file  MaterialTransferSellingOpportunities.xlsx
    And sleep  8s
    And User click "Export to Excel" for transfer opportunities grid  ${export_excel_btn for selling opp}
    And sleep  2s
    Then open excel file for modules  MaterialTransferSellingOpportunities.xlsx
    And sleep  10s
    And Remove old excel file  MaterialTransferSellingOpportunities.xlsx
    And User click "Export to Excel" for transfer selling rejected grid  ${export to excel for rejected for seller}
    Then open excel file for rejected grid  MaterialTransferSellingOpportunities.xlsx
    And sum the oppoortunities excel records and rejected excel records
    Then check and compare duplicate records in db with excel
####==============================================================================================================================================================================================================================================
Verify Duplicates in db and excel and compare them in "purchase req module" for business "Power"
    Given User access "/secure/purchasing" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for business "Power"
    And select "Power" business from business filter
    And Remove old excel file  PurchaseReqs.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseReqs.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "purchase req module" for business "Renewables"
    ##Given User access "/secure/purchasing" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for business "Renewables"
    And select "Renewables" business from business filter
    And Remove old excel file  PurchaseReqs.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseReqs.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "purchase req module" for business "Healthcare"
    ##Given User access "/secure/purchasing" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for business "Healthcare"
    And select "Healthcare" business from business filter
    And Remove old excel file  PurchaseReqs.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseReqs.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "purchase req module" for business "MMF"
    ##Given User access "/secure/purchasing" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for business "MMF"
    And select "MMF" business from business filter
    And Remove old excel file  PurchaseReqs.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseReqs.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button
#####=================================================================================================================================================================================================================================
Verify Duplicates in db and excel and compare them in "purchase orders module" for business "Power"
    Given User access "/secure/purchase-orders" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for business "Power"
    And select "Power" business from business filter
    And Remove old excel file  PurchaseOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseOrders.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button


Verify Duplicates in db and excel and compare them in "purchase orders module" for business "Renewables"
    ##Given User access "/secure/purchase-orders" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for business "Renewables"
    And select "Renewables" business from business filter
    And Remove old excel file  PurchaseOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseOrders.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "purchase orders module" for business "Healthcare"
    ##Given User access "/secure/purchase-orders" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for business "Healthcare"
    And select "Healthcare" business from business filter
    And Remove old excel file  PurchaseOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseOrders.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "purchase orders module" for business "MMF"
    ##Given User access "/secure/purchase-orders" module
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for business "MMF"
    And select "MMF" business from business filter
    And Remove old excel file  PurchaseOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  PurchaseOrders.xlsx
    Then check and compare duplicate records in db with excel for other modules
    And click on clear filter button
#####======================================================================================================================================================================================================================================
Verify Duplicates in db and excel and compare them in "scheduling module" for business "MMF"
    Given User access "/secure/scheduling" module
    And click on clear filter button
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for business "MMF"
    And select "MMF" business from business filter
    And Remove old excel file  ProductionOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  ProductionOrders.xlsx
    And Remove old excel file  ProductionOrders.xlsx
    And Remove old excel file  ProjectActivity.xlsx
    And User click "Export to Excel" for projects  ${export_excel_btn_Projects}
    Then open excel file for rejected grid  ProjectActivity.xlsx
    And sum the oppoortunities excel records and rejected excel records
    Then check and compare duplicate records in db with excel
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "scheduling module" for business "Power"
    ##Given User access "/secure/scheduling" module
    And click on clear filter button
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for business "Power"
    And select "Power" business from business filter
    And Remove old excel file  ProductionOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    And sleep  100s
    Then open excel file for modules  ProductionOrders.xlsx
    And Remove old excel file  ProductionOrders.xlsx
    And Remove old excel file  ProjectActivity.xlsx
    And User click "Export to Excel" for projects  ${export_excel_btn_Projects}
    Then open excel file for rejected grid  ProjectActivity.xlsx
    And sum the oppoortunities excel records and rejected excel records
    Then check and compare duplicate records in db with excel
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "scheduling module" for business "Renewables"
    ##Given User access "/secure/scheduling" module
    And click on clear filter button
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for business "Renewables"
    And select "Renewables" business from business filter
    And Remove old excel file  ProductionOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  ProductionOrders.xlsx
    And Remove old excel file  ProductionOrders.xlsx
    And Remove old excel file  ProjectActivity.xlsx
    And User click "Export to Excel" for projects  ${export_excel_btn_Projects}
    Then open excel file for rejected grid  ProjectActivity.xlsx
    And sum the oppoortunities excel records and rejected excel records
    Then check and compare duplicate records in db with excel
    And click on clear filter button

Verify Duplicates in db and excel and compare them in "scheduling module" for business "Healthcare"
    ##Given User access "/secure/scheduling" module
    And click on clear filter button
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for business "Healthcare"
    And select "Healthcare" business from business filter
    And Remove old excel file  ProductionOrders.xlsx
    And User click "Export to Excel" for modules  ${Export to Excel}
    Then open excel file for modules  ProductionOrders.xlsx
    And Remove old excel file  ProductionOrders.xlsx
    And Remove old excel file  ProjectActivity.xlsx
    And User click "Export to Excel" for projects  ${export_excel_btn_Projects}
    Then open excel file for rejected grid  ProjectActivity.xlsx
    And sum the oppoortunities excel records and rejected excel records
    Then check and compare duplicate records in db with excel
    And click on clear filter button

###=============================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='alstom_altais_hvr' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.purchase_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "alstom_altais_hvr" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.cycl_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "alstom_altais_hvr" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "alstom_altais_hvr" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "alstom_altais_hvr" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "alstom_altais_hvr" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "alstom_altais_hvr" for "${db_search_path}.cogi_v" for 4columns

##========================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='gem_ipus' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gem_ipus" for "${db_search_path}.purchase_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gem_ipus" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gem_ipus" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gem_ipus" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gem_ipus" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gem_ipus" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gem_ipus" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gem_ipus" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gem_ipus" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gem_ipus" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gem_ipus" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gem_ipus" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gem_ipus" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gem_ipus" for "${db_search_path}.cogi_v" for 4columns

####================================================================================================================================================================================================================================================================================================================================================================================================

Verify Duplicates in db for erp_schema='gem_bravo_ascp' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.purchase_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gem_bravo_ascp" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gem_bravo_ascp" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gem_bravo_ascp" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gem_bravo_ascp" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gem_bravo_ascp" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gem_bravo_ascp" for "${db_search_path}.cogi_v" for 4columns

####==================================================================================================================================================================================================================================================================================================================

Verify Duplicates in db for erp_schema='sap_apcis' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "sap_apcis" for "${db_search_path}.purchase_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "sap_apcis" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "sap_apcis" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "sap_apcis" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "sap_apcis" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "sap_apcis" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "sap_apcis" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "sap_apcis" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "sap_apcis" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "sap_apcis" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "sap_apcis" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "sap_apcis" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "sap_apcis" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "sap_apcis" for "${db_search_path}.cogi_v" for 4columns

#####===========================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='sap_fusion' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "sap_fusion" for "${db_search_path}.purchase_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "sap_fusion" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "sap_fusion" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "sap_fusion" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "sap_fusion" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "sap_fusion" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "sap_fusion" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "sap_fusion" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "sap_fusion" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "sap_fusion" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "sap_fusion" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "sap_fusion" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "sap_fusion" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "sap_fusion" for "${db_search_path}.cogi_v" for 4columns

####=======================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='gpw_omega' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gpw_omega" for "${db_search_path}.purchase_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gpw_omega" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gpw_omega" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gpw_omega" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gpw_omega" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gpw_omega" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gpw_omega" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gpw_omega" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gpw_omega" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gpw_omega" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gpw_omega" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gpw_omega" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gpw_omega" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gpw_omega" for "${db_search_path}.cogi_v" for 4columns

####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='powermax' across all modules
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "powermax" for "${db_search_path}.purchase_ords_v" for 5columns
   And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "powermax" for "${db_search_path}.production_ords_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "powermax" for "${db_search_path}.purchase_reqs_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "powermax" for "${db_search_path}.stock_policy_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "powermax" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "powermax" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "powermax" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "powermax" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "powermax" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "powermax" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "powermax" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "powermax" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "powermax" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "powermax" for "${db_search_path}.cogi_v" for 4columns


####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='pw_alpha' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "pw_alpha" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "pw_alpha" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "pw_alpha" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "pw_alpha" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "pw_alpha" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "pw_alpha" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "pw_alpha" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "pw_alpha" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "pw_alpha" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "pw_alpha" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "pw_alpha" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "pw_alpha" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "pw_alpha" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "pw_alpha" for "${db_search_path}.cogi_v" for 4columns

#####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='racesbi_ods ' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "racesbi_ods " for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "racesbi_ods " for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "racesbi_ods " for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "racesbi_ods " for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "racesbi_ods " for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "racesbi_ods " for "${db_search_path}.cogi_v" for 4columns

####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='gpw_foxtrot ' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gpw_foxtrot " for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gpw_foxtrot " for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gpw_foxtrot " for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gpw_foxtrot " for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gpw_foxtrot " for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gpw_foxtrot " for "${db_search_path}.cogi_v" for 4columns

####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='gpw_sap_repairs' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gpw_sap_repairs" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gpw_sap_repairs" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gpw_sap_repairs" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gpw_sap_repairs" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gpw_sap_repairs" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gpw_sap_repairs" for "${db_search_path}.cogi_v" for 4columns

####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='baan_belfort' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema " baan_belfort" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema " baan_belfort" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema " baan_belfort" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema " baan_belfort" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema " baan_belfort" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp " baan_belfort" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema " baan_belfort" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema " baan_belfort" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema " baan_belfort" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp " baan_belfort" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema " baan_belfort" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp " baan_belfort" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp " baan_belfort" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp " baan_belfort" for "${db_search_path}.cogi_v" for 4columns

#####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='copics' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "copics" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "copics" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "copics" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "copics" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "copics" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "copics" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "copics" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "copics" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "copics" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "copics" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "copics" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "copics" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "copics" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "copics" for "${db_search_path}.cogi_v" for 4columns

#####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='gpw_romeo' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gpw_romeo" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gpw_romeo" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gpw_romeo" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gpw_romeo" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gpw_romeo" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gpw_romeo" for "${db_search_path}.cogi_v" for 4columns

####=========================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='hc_bioprod ' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "hc_bioprod " for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "hc_bioprod " for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "hc_bioprod " for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "hc_bioprod " for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "hc_bioprod " for "${db_search_path}.cogi_v" for 4columns

######===========================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='hc_bioprod ' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "hc_bioprod " for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "hc_bioprod " for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "hc_bioprod " for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "hc_bioprod " for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "hc_bioprod " for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "hc_bioprod " for "${db_search_path}.cogi_v" for 4columns

######===========================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='hc_glprod ' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "hc_glprod " for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "hc_glprod " for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "hc_glprod " for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "hc_glprod " for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "hc_glprod " for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "hc_glprod " for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "hc_glprod " for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "hc_glprod " for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "hc_glprod " for "${db_search_path}.cogi_v" for 4columns

######===========================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='hc_glprod ' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "hc_glprod " for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "hc_glprod " for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "hc_glprod " for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "hc_glprod " for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "hc_glprod " for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "hc_glprod " for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "hc_glprod " for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "hc_glprod " for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "hc_glprod " for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "hc_glprod " for "${db_search_path}.cogi_v" for 4columns

######===========================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='get_cas' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "get_cas" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "get_cas" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "get_cas" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "get_cas" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "get_cas" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "get_cas" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "get_cas" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "get_cas" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "get_cas" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "get_cas" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "get_cas" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "get_cas" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "get_cas" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "get_cas" for "${db_search_path}.cogi_v" for 4columns

######===========================================================================================================================================================================================================================================================================================================================================================================================================
Verify Duplicates in db for erp_schema='gog_ofs' across all modules
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_ords_v" and unique columns "po_purchase_order_number""po_line""release_number""erp_schema""schedule_line" for other modules for erp_schema "gog_ofs" for "${db_search_path}.purchase_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.production_ords_v" and unique columns "production_order""material_sku""plant_code""op_activity_number""network_number" for other modules for erp_schema "gog_ofs" for "${db_search_path}.production_ords_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.purchase_reqs_v" and unique columns "plant_code""purchase_req_num""purchase_req_item""material_sku""erp_schema" for other modules for erp_schema "gog_ofs" for "${db_search_path}.purchase_reqs_v" for 5columns
    And Run db query to get no. of duplicate records for "${db_search_path}.stock_policy_v" and unique columns "erp_schema""plant_code""material_sku" for other modules for erp_schema "gog_ofs" for "${db_search_path}.stock_policy_v" for 3columns
    And Run db query to get no. of duplicate records for "${db_search_path}.cogi_consumption_v" and unique columns "erp_schema""order_number""material_number" for other modules for erp_schema "gog_ofs" for "${db_search_path}.cogi_consumption_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_v" and unique columns "inventory_record""material_sku""erp_schema""record_item" for other modules for erp "gog_ofs" for "${db_search_path}.cycle_count_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cycle_count_on_time_v" and unique columns "material_sku""plant_key""erp_schema" for other modules for erp_schema "gog_ofs" for "${db_search_path}.cycle_count_on_time_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.lead_time_analytics_v" and unique columns "po_number""line_number""shipment_line_number""release_number""erp_schema" for other modules for erp_schema "gog_ofs" for "${db_search_path}.lead_time_analytics_v" for 5columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_creation_v" and unique columns "plant_code""material""erp_schema" for other modules for erp_schema "gog_ofs" for "${db_search_path}.material_creation_v" for 3columns

    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.receipt_optimization_v" and unique columns "po_purchase_order_number""po_header_id""po_line_id""line_location_id" for other modules for erp "gog_ofs" for "${db_search_path}.receipt_optimization_v" for 4columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.md_materials_v" and unique columns "material_sku""plant_code""erp_schema" for other modules for erp_schema "gog_ofs" for "${db_search_path}.md_materials_v" for 3columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.po_view" and unique columns "po_purchase_order_number""po_line""schedule_line""erp_schema""confirmation_number""release_number" for other modules for erp "gog_ofs" for "${db_search_path}.po_view" for 6columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.material_transfer_v" and unique columns "Demand_Plant""Excess_Plant""Excess_erp_schema""Demand_erp_schema""Order_number""Release_number""Item_number""Schedule_line" for other modules for "${db_search_path}.material_transfer_v" and erp "gog_ofs" for 8columns
    And run keyword and continue on failure  Run db query to get no. of duplicate records for "${db_search_path}.cogi_v" and unique columns "doc_goods_mvt_error""order_number""counter""erp_schema" for other modules for erp "gog_ofs" for "${db_search_path}.cogi_v" for 4columns