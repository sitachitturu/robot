*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Resource  ../../Variables/VariablesAdmin/validation_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
        go to  ${WELCOME.URL}/secure/validation
        wait until page contains  addFilterBtn  10s
        wait until element is visible  //div[@id='topBar']//span[contains(normalize-space(), 'Validation')]  10s
#        log  ${page_title}
#        should be equal  ${page_title}  Validation

select plant from plant filter and compare with critical plants list
        ${TextFileContent}  get file  ${plants_list_from_plant_lookup}
        Log    ${TextFileContent}
        ${plant_file}  get file  ${plants_list_from_plant_lookup}
        @{plant_array}  split to lines  ${plant_file}
        :FOR  ${item}  IN  @{plant_array}
        \  log to console  ${item}
        \  wait until element is enabled  ${input_text}  10s
        \  log  ${item}
        \  wait until element is visible  plant  20s
        \  click element  plant
        \  sleep  3s
        \  wait until element is visible  ${input_text}  10s
        \  input text  ${input_text}  ${item}
        \  run keyword and continue on failure  wait until element is visible  product-${item}  20s
        \  run keyword and continue on failure  click element  product-${item}
        \  wait until element is visible  ApplyBtn  10s
        \  click button  ApplyBtn
        \  run keyword and continue on failure  wait until element is visible  //div[@id='dTableGrid']//div[contains(normalize-space(), '${item}')]  20s
        \  ${production_ords_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(2) div").text();
        \  log  ${production_ords_col} Production Orders
        \  ${Length_production_ords_col}  execute javascript  return String(${production_ords_col}).length;
        \  log  ${Length_production_ords_col}
        \  ${production_ords_col..}  execute javascript  if( ${Length_production_ords_col} == 0){return 0}else {return ${Length_production_ords_col}};
        \  log  ${production_ords_col..}

        \  ${project_activity_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(3) div").text();
        \  log  ${project_activity_col} Project Activity
        \  ${Length_project_activity_col}  execute javascript  return String(${project_activity_col}).length;
        \  log  ${Length_project_activity_col}
        \  ${project_activity_col..}  execute javascript  if( ${Length_project_activity_col} == 0){return 0}else {return ${Length_project_activity_col}};
        \  log  ${project_activity_col..}

        \  ${purchase_orders_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(4) div").text();
        \  log  ${purchase_orders_col} Purchase Orders
        \  ${Length_purchase_orders_col}  execute javascript  return String(${purchase_orders_col}).length;
        \  log  ${Length_purchase_orders_col}
        \  ${purchase_orders_col..}  execute javascript  if( ${Length_purchase_orders_col} == 0){return 0}else {return ${Length_purchase_orders_col}};
        \  log  ${purchase_orders_col..}

        \  ${purchase_req_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(5) div").text();
        \  log  ${purchase_req_col} Purchase Req
        \  ${Length_purchase_req_col}  execute javascript  return String(${purchase_req_col}).length;
        \  log  ${Length_purchase_req_col}
        \  ${purchase_req_col..}  execute javascript  if( ${Length_purchase_req_col} == 0){return 0}else {return ${Length_purchase_req_col}};
        \  log  ${purchase_req_col..}

        \  ${cogi_consump_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
        \  log  ${cogi_consump_col} Cogi Consumption
        \  ${Length_cogi_consump_col}  execute javascript  return String(${cogi_consump_col}).length;
        \  log  ${Length_cogi_consump_col}
        \  ${cogi_consump_col..}  execute javascript  if( ${Length_cogi_consump_col} == 0){return 0}else {return ${Length_cogi_consump_col}};
        \  log  ${cogi_consump_col..}

        \  ${cogi_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(7) div").text();
        \  log  ${cogi_col} Cogi
        \  ${Length_cogi_col}  execute javascript  return String(${cogi_col}).length;
        \  log  ${Length_cogi_col}
        \  ${cogi_col..}  execute javascript  if( ${Length_cogi_col} == 0){return 0}else {return ${Length_cogi_col}};
        \  log  ${cogi_col..}

        \  ${cycle_counting_ontime_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(8) div").text();
        \  log  ${cycle_counting_ontime_col} Cycle Counting On time
        \  ${Length_cycle_counting_ontime_col}  execute javascript  return String(${cycle_counting_ontime_col}).length;
        \  log  ${Length_cycle_counting_ontime_col}
        \  ${cycle_counting_ontime_col..}  execute javascript  if( ${Length_cycle_counting_ontime_col} == 0){return 0}else {return ${Length_cycle_counting_ontime_col}};
        \  log  ${cycle_counting_ontime_col..}

        \  ${cycle_counting_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(9) div").text();
        \  log  ${cycle_counting_col} Cycle Counting
        \  ${Length_cycle_counting_col}  execute javascript  return String(${cycle_counting_col}).length;
        \  log  ${Length_cycle_counting_col}
        \  ${cycle_counting_col..}  execute javascript  if( ${Length_cycle_counting_col} == 0){return 0}else {return ${Length_cycle_counting_col}};
        \  log  ${cycle_counting_col..}

        \  ${leadtime_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(10) div").text();
        \  log  ${leadtime_col} LTA
        \  ${Length_leadtime_col}  execute javascript  return String(${leadtime_col}).length;
        \  log  ${Length_leadtime_col}
        \  ${leadtime_col..}  execute javascript  if( ${Length_leadtime_col} == 0){return 0}else {return ${Length_leadtime_col}};
        \  log  ${leadtime_col..}

        \  ${md_materials_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(11) div").text();
        \  log  ${md_materials_col} MD Materials
        \  ${Length_md_materials_col}  execute javascript  return String(${md_materials_col}).length;
        \  log  ${Length_md_materials_col}
        \  ${md_materials_col..}  execute javascript  if( ${Length_md_materials_col} == 0){return 0}else {return ${Length_md_materials_col}};
        \  log  ${md_materials_col..}

        \  ${md_sales_order_col}  execute javascript   return $("#dataTableGrid table tr:nth(1) td:nth(12) div").text();
        \  log  ${md_sales_order_col} MD Sales Ord
        \  ${Length_md_sales_order_col}  execute javascript  return String(${md_sales_order_col}).length;
        \  log  ${Length_md_sales_order_col}
        \  ${md_sales_order_col..}  execute javascript  if( ${Length_md_sales_order_col} == 0){return 0}else {return ${Length_md_sales_order_col}};
        \  log  ${md_sales_order_col..}

        \  ${md_sourcing_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(13) div").text();
        \  log  ${md_sourcing_col} MD Sourcing
        \  ${Length_md_sourcing_col}  execute javascript  return String(${md_sourcing_col}).length;
        \  log  ${Length_md_sourcing_col}
        \  ${md_sourcing_col..}  execute javascript  if( ${Length_md_sourcing_col} == 0){return 0}else {return ${Length_md_sourcing_col}};
        \  log  ${md_sourcing_col..}

        \  ${material_creation_col}  execute javascript   return $("#dataTableGrid table tr:nth(1) td:nth(14) div").text();
        \  log  ${material_creation_col} Material Creation
        \  ${Length_material_creation_col}  execute javascript  return String(${material_creation_col}).length;
        \  log  ${Length_material_creation_col}
        \  ${material_creation_col..}  execute javascript  if( ${Length_material_creation_col} == 0){return 0}else {return ${Length_material_creation_col}};
        \  log  ${material_creation_col..}

        \  ${receipt_opt_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(15) div").text();
        \  log  ${receipt_opt_col} Receipt Opt
        \  ${Length_receipt_opt_col}  execute javascript  return String(${receipt_opt_col}).length;
        \  log  ${Length_receipt_opt_col}
        \  ${receipt_opt_col..}  execute javascript  if( ${Length_receipt_opt_col} == 0){return 0}else {return ${Length_receipt_opt_col}};
        \  log  ${receipt_opt_col..}

        \  ${stock_policy_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(16) div").text();
        \  log  ${stock_policy_col} Stock Policy
        \  ${Length_stock_policy_col}  execute javascript  return String(${stock_policy_col}).length;
        \  log  ${Length_stock_policy_col}
        \  ${stock_policy_col..}  execute javascript  if( ${Length_stock_policy_col} == 0){return 0}else {return ${Length_stock_policy_col}};
        \  log  ${stock_policy_col..}

        \  ${result}  evaluate  ${production_ords_col..}+${project_activity_col..}+${purchase_orders_col..}+${purchase_req_col..}+${cogi_consump_col..}+${cogi_col..}+${cycle_counting_ontime_col..}+${cycle_counting_col..}+${leadtime_col..}+${md_materials_col..}+${md_sales_order_col..}+${md_sourcing_col..}+${md_sourcing_col..}+${material_creation_col..}+${receipt_opt_col..}+${stock_policy_col..}
        \  run keyword if  ${result} == 0  log to console  ${result} ${item}
        \  run keyword and continue on failure  evaluate  ${result} > 0
        \  click element  clearFilterBtn
        \  sleep   5s

select plant from plant lookup table from database and verify plants are visible and those available plants have data or not
          connect to database  dbConfigFile=${dbfile}
          ${plant_code_plant_shortname_db}  QUERY  select plant_code_plant_short_name from plant_lookup;
          log  ${plant_code_plant_shortname_db}
           @{list}  Create List  ${EMPTY}
           : FOR  ${value}  IN  @{plant_code_plant_shortname_db}
            \  ${siteName}=  set variable  @{value}[0]
            \  log  ${siteName}
            \  wait until element is visible  plant  20s
            \  click element  plant
            \  run keyword and continue on failure  click element  product-${siteName}
            \  wait until element is visible  ${Apply Button}  10s
            \  click button  ${Apply Button}
            \  sleep  2s
            \  run keyword and continue on failure  wait until element is visible  //div[@id='dTableGrid']//div[contains(normalize-space(), '${siteName}')]
            \  ${erp_schema}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(1) div").text();
            \  log  ${erp_schema}
            \  ${production_ords_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(2) div").text();
            \  log  ${production_ords_col} Production Orders
            \  ${Length_production_ords_col}  execute javascript  return String(${production_ords_col}).length;
            \  log  ${Length_production_ords_col}
            \  ${production_ords_col..}  execute javascript  if( ${Length_production_ords_col} == 0){return 0}else {return ${Length_production_ords_col}};
            \  log  ${production_ords_col..}

            \  ${project_activity_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(3) div").text();
            \  log  ${project_activity_col} Project Activity
            \  ${Length_project_activity_col}  execute javascript  return String(${project_activity_col}).length;
            \  log  ${Length_project_activity_col}
            \  ${project_activity_col..}  execute javascript  if( ${Length_project_activity_col} == 0){return 0}else {return ${Length_project_activity_col}};
            \  log  ${project_activity_col..}

            \  ${purchase_orders_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(4) div").text();
            \  log  ${purchase_orders_col} Purchase Orders
            \  ${Length_purchase_orders_col}  execute javascript  return String(${purchase_orders_col}).length;
            \  log  ${Length_purchase_orders_col}
            \  ${purchase_orders_col..}  execute javascript  if( ${Length_purchase_orders_col} == 0){return 0}else {return ${Length_purchase_orders_col}};
            \  log  ${purchase_orders_col..}

            \  ${purchase_req_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(5) div").text();
            \  log  ${purchase_req_col} Purchase Req
            \  ${Length_purchase_req_col}  execute javascript  return String(${purchase_req_col}).length;
            \  log  ${Length_purchase_req_col}
            \  ${purchase_req_col..}  execute javascript  if( ${Length_purchase_req_col} == 0){return 0}else {return ${Length_purchase_req_col}};
            \  log  ${purchase_req_col..}

            \  ${cogi_consump_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
            \  log  ${cogi_consump_col} Cogi Consumption
            \  ${Length_cogi_consump_col}  execute javascript  return String(${cogi_consump_col}).length;
            \  log  ${Length_cogi_consump_col}
            \  ${cogi_consump_col..}  execute javascript  if( ${Length_cogi_consump_col} == 0){return 0}else {return ${Length_cogi_consump_col}};
            \  log  ${cogi_consump_col..}

            \  ${cogi_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(7) div").text();
            \  log  ${cogi_col} Cogi
            \  ${Length_cogi_col}  execute javascript  return String(${cogi_col}).length;
            \  log  ${Length_cogi_col}
            \  ${cogi_col..}  execute javascript  if( ${Length_cogi_col} == 0){return 0}else {return ${Length_cogi_col}};
            \  log  ${cogi_col..}

            \  ${cycle_counting_ontime_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(8) div").text();
            \  log  ${cycle_counting_ontime_col} Cycle Counting On time
            \  ${Length_cycle_counting_ontime_col}  execute javascript  return String(${cycle_counting_ontime_col}).length;
            \  log  ${Length_cycle_counting_ontime_col}
            \  ${cycle_counting_ontime_col..}  execute javascript  if( ${Length_cycle_counting_ontime_col} == 0){return 0}else {return ${Length_cycle_counting_ontime_col}};
            \  log  ${cycle_counting_ontime_col..}

            \  ${cycle_counting_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(9) div").text();
            \  log  ${cycle_counting_col} Cycle Counting
            \  ${Length_cycle_counting_col}  execute javascript  return String(${cycle_counting_col}).length;
            \  log  ${Length_cycle_counting_col}
            \  ${cycle_counting_col..}  execute javascript  if( ${Length_cycle_counting_col} == 0){return 0}else {return ${Length_cycle_counting_col}};
            \  log  ${cycle_counting_col..}

            \  ${leadtime_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(10) div").text();
            \  log  ${leadtime_col} LTA
            \  ${Length_leadtime_col}  execute javascript  return String(${leadtime_col}).length;
            \  log  ${Length_leadtime_col}
            \  ${leadtime_col..}  execute javascript  if( ${Length_leadtime_col} == 0){return 0}else {return ${Length_leadtime_col}};
            \  log  ${leadtime_col..}

            \  ${md_materials_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(11) div").text();
            \  log  ${md_materials_col} MD Materials
            \  ${Length_md_materials_col}  execute javascript  return String(${md_materials_col}).length;
            \  log  ${Length_md_materials_col}
            \  ${md_materials_col..}  execute javascript  if( ${Length_md_materials_col} == 0){return 0}else {return ${Length_md_materials_col}};
            \  log  ${md_materials_col..}

            \  ${md_sales_order_col}  execute javascript   return $("#dataTableGrid table tr:nth(1) td:nth(12) div").text();
            \  log  ${md_sales_order_col} MD Sales Ord
            \  ${Length_md_sales_order_col}  execute javascript  return String(${md_sales_order_col}).length;
            \  log  ${Length_md_sales_order_col}
            \  ${md_sales_order_col..}  execute javascript  if( ${Length_md_sales_order_col} == 0){return 0}else {return ${Length_md_sales_order_col}};
            \  log  ${md_sales_order_col..}

            \  ${md_sourcing_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(13) div").text();
            \  log  ${md_sourcing_col} MD Sourcing
            \  ${Length_md_sourcing_col}  execute javascript  return String(${md_sourcing_col}).length;
            \  log  ${Length_md_sourcing_col}
            \  ${md_sourcing_col..}  execute javascript  if( ${Length_md_sourcing_col} == 0){return 0}else {return ${Length_md_sourcing_col}};
            \  log  ${md_sourcing_col..}

            \  ${material_creation_col}  execute javascript   return $("#dataTableGrid table tr:nth(1) td:nth(14) div").text();
            \  log  ${material_creation_col} Material Creation
            \  ${Length_material_creation_col}  execute javascript  return String(${material_creation_col}).length;
            \  log  ${Length_material_creation_col}
            \  ${material_creation_col..}  execute javascript  if( ${Length_material_creation_col} == 0){return 0}else {return ${Length_material_creation_col}};
            \  log  ${material_creation_col..}

            \  ${receipt_opt_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(15) div").text();
            \  log  ${receipt_opt_col} Receipt Opt
            \  ${Length_receipt_opt_col}  execute javascript  return String(${receipt_opt_col}).length;
            \  log  ${Length_receipt_opt_col}
            \  ${receipt_opt_col..}  execute javascript  if( ${Length_receipt_opt_col} == 0){return 0}else {return ${Length_receipt_opt_col}};
            \  log  ${receipt_opt_col..}

            \  ${stock_policy_col}  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(16) div").text();
            \  log  ${stock_policy_col} Stock Policy
            \  ${Length_stock_policy_col}  execute javascript  return String(${stock_policy_col}).length;
            \  log  ${Length_stock_policy_col}
            \  ${stock_policy_col..}  execute javascript  if( ${Length_stock_policy_col} == 0){return 0}else {return ${Length_stock_policy_col}};
            \  log  ${stock_policy_col..}

            \  ${result}  evaluate  ${production_ords_col..}+${project_activity_col..}+${purchase_orders_col..}+${purchase_req_col..}+${cogi_consump_col..}+${cogi_col..}+${cycle_counting_ontime_col..}+${cycle_counting_col..}+${leadtime_col..}+${md_materials_col..}+${md_sales_order_col..}+${md_sourcing_col..}+${md_sourcing_col..}+${material_creation_col..}+${receipt_opt_col..}+${stock_policy_col..}
            \  run keyword if  ${result} == 0  log to console  ${result} ${siteName} ${erp_schema}
            \  run keyword and continue on failure  evaluate  ${result} > 0
            \  click element  clearFilterBtn
