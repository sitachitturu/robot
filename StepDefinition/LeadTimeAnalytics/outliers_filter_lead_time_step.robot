*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access Lead Time Analytics module
         click element  ${Lead Time Analytics Icon}
         sleep  38s

User should see "Outliers" filter on landing page of lead time analytics module
         wait until element is visible  outlier  20
         ${text}  get text  outlier
         should be equal  Outliers  ${text}

User should see restriced outlier filter in lead_time_analytics landing page
        element should be visible  //mm-global-filter/mm-filter[4]/px-filter/div/div/button/iron-icon

user select "Significant outlier" from outlier filter
         wait until element is visible  outlier  20
         click element  outlier
         wait until element is visible  product-Significant Outlier  20s
         click element  product-Significant Outlier
         wait until element is visible  ${outlier_Apply Button}  20s
         click element  ${outlier_Apply Button}
         sleep  14s

user select "Within 1 Std Deviation" from outlier filter
         wait until element is visible  outlier  20
         click element  outlier
         wait until element is visible  product-Within 1 Std Deviation  20s
         click element  product-Within 1 Std Deviation
         wait until element is visible  ${outlier_Apply Button}  20s
         click element  ${outlier_Apply Button}
         sleep  14s

user select "Within 2 Std Deviation" from outlier filter
         wait until element is visible  outlier  20
         click element  outlier
         wait until element is visible  product-Within 2 Std Deviations  20s
         click element  product-Within 2 Std Deviations
         wait until element is visible  ${outlier_Apply Button}  20s
         click element  ${outlier_Apply Button}
         sleep  20s

user select "Significant outlier" from outlier filter and should see correct numbers for Total Daily opportunity in spine
         wait until element is visible  plant  20s
         click element  plant
         sleep  12s
         click element  product-5250 - Greenville
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         wait until element is visible  ApplyBtn  20s
         click element  ApplyBtn
         sleep  15s
          wait until element is visible  outlier  20
         click element  outlier
         wait until element is visible  product-Significant Outlier  20s
         click element  product-Significant Outlier
         wait until element is visible  ${outlier_Apply Button}  20s
         click element  ${outlier_Apply Button}
         sleep  14s
         connect to database  dbConfigFile=${dbfile}
         #${queryResults}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_opportunity from public.lead_time_analytics_v
         ${total_oppurtunity}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) as total_opportunity FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log to console  ${avg_days_positive}

         ${queryResults}  Evaluate  '${total_oppurtunity}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${convert}  convert to string  ${avg_days_positive}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log to console  ${queryResults}
         ${queryResults2}  execute javascript  var x = ${queryResults}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults2}
         ${tup1}  Set Variable  ${queryResults2}
         ${round_avg}  execute javascript  var num = 0; num  = Number(${tup1}).toFixed(1); return num;
         log  ${round_avg}
         ${results}  execute javascript  var x = ${queryResults1}; var y = ${round_avg}; var result = x/y; return result;
         log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total Daily Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){num = (${tup1}.toFixed(0)); return num;}else if(${tup1}< 0){ return num; } };
         log  ${DB_Total Daily Oppertunity_value}
         #${DB_Total Daily Oppertunity_value..}  execute javascript  var num = 0; num  = Number(${DB_Total Daily Oppertunity_value}).toFixed(1); return num;
         wait until element is visible  ${total_daily_opp_spine_value}  30s

         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total Daily Oppertunity_value}

scroll page to location
         [Arguments]    ${x_location}    ${y_location}
         Execute JavaScript  window.scrollTo(${x_location},${y_location})

user select outlier col from show/hide col
         run keyword  scroll page to location  0  1000000
         wait until element is visible  ${show/hide column}  30s
         click element  ${show/hide column}
         sleep  5s
         click element  ${plant_code_col}
         click element  ${line_number_col}
         click element  ${shipment_line_number_col}
         click element  ${crteation_date_col}
         click element  ${release_number_col}
         click element  ${material sku col}
         click element  ${Material Description}
         click element  ${Preprocessing LT}
         click element  ${System LT}
         click element  ${Actual_lt_col_show_hide}
         click element  ${Source/Vendor_col}
         click element  ${buyer_purchasing group_col}
         click element  ${planner/mrp controller_col}
         click element  ${profit center_col}
         click element  ${early/late receipt_col}
         click element  ${po early/late by days_col}
         click element  ${need by date_col}
         click element  ${orig. need by data _col}
         click element  ${current rivison number col}
         click element  ${po lt col}
         click element  ${orig.po lt}
         click element  ${asl lt}
         click element  ${outlier_col}
         click element  ${show/hide column}
         sleep  13s

user should see data showing "Significant Outlier" in outlier column
         element should be visible  ${outlier_grid_col_name}
         element should contain  ${outlier_col_data}  Significant Outlier

user select "Significant outlier" from outlier filter and should see correct numbers for Total Fullfillment Risk in spine
         run keyword  scroll page to location  10000000  0
         wait until element is visible  plant  20s
         click element  plant
         sleep  14s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${count}  ROW COUNT  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${count}
         ${queryResults}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}
         ${tup2}  Set Variable  ${DB_Total full_fillment_risk_value}
          ${round_avg}  execute javascript  var result = Math.round(Number(${tup2})); return String(result);
          log  ${round_avg}
         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s

         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         ${ui_total_fullfillment_risk_value..}  replace string using regexp  ${ui_total_fullfillment_risk_value}  \\-|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value..}
         ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${round_avg}-${ui_total_fullfillment_risk_value..});return result;
          log  ${ui_and_db_value_diff}
         ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=5){return true} else {return false};
         should be true  ${ui_and_db_value_diffless_than_point2}

select "Significant outlier" from outlier filter and User should see correct numbers for Total Opportunity in spine
         run keyword  scroll page to location  10000000  0
         wait until element is visible  plant  20s
         click element  plant
         sleep  15s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) as total_opportunity FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${queryResults}
         ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_oppurtunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){num = (${tup1}.toFixed(0)); return num;}else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_oppurtunity_value}
         wait until element is visible  ${total_opp_spine_value}  30s

         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value}
         wait until element is visible  plant  20s

select "Significant outlier" from outlier filter and User should see correct numbers for Total Daily Fullfillment Risk in spine
         run keyword  scroll page to location  10000000  0
         wait until element is visible  plant  20s
         click element  plant
         sleep  12s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${total_fullfil}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         ${queryResults}  Evaluate  '${total_fullfil}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults1..}  replace string using regexp  ${queryResults1}  \\-|\,  ${EMPTY}
         log  ${queryResults1..}
         ${convert}  convert to string  ${neg_days_push}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \\-|\,  ${EMPTY}
         log  ${queryResults..}
         ${queryResults2}  execute javascript  var x = ${queryResults..}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults2}
         ${tup1}  set variable  ${queryResults2}
         ${DB_queryResults2_value}  execute javascript  var result = ${queryResults2}.toFixed(1); return result;
         log  ${DB_queryResults2_value}
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${DB_queryResults2_value}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){num = (${tup1}.toFixed(0)); return num;}else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}

         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total full_fillment_risk_value}

user select "Significant outlier" from outlier filter And User should see correct numbers for System Lt in spine
        run keyword  scroll page to location  10000000  0
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup1}  Set Variable  ${queryResults..}
         ${DB_system_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_system_Lt_value}
         ${DB_system_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_system_Lt_value})); return String(result);
         sleep  5s
         wait until element is visible  ${system_lt_spine_value}  30s
         ${ui_System_Lt}  get text  ${system_lt_spine_value}
         ${ui_System_Lt_value}  replace string using regexp  ${ui_System_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_System_Lt_value}
         should be equal  ${ui_System_Lt_value}  ${DB_system_Lt_value..}

user select "Significant outlier" from outlier filter And User should see correct numbers for Actual Lt in spine
         run keyword  scroll page to location  10000000  0
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Significant Outlier' and plant_code_plant_short_name='${text1}';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup1}  Set Variable  ${queryResults..}
         ${DB_Actual_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Actual_Lt_value}
         ${DB_Actual_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_Actual_Lt_value})); return String(result);
         sleep  5s

         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${DB_Actual_Lt_value..}-${ui_Actual_Lt_value});return result;
          log  ${ui_and_db_value_diff}
         ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
         should be true  ${ui_and_db_value_diffless_than_point2}
##===============================================================================================================================================================================================
user select "Within 1 Std Deviation" from outlier filter and user should see correct numbers for Total Daily opportunity in spine
         wait until element is visible  plant  20
         click element  plant
         sleep  12s
         click element  product-5250 - Greenville
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         wait until element is visible  ApplyBtn  20s
         click element  ApplyBtn
         sleep  15s
         wait until element is visible  outlier  20
         click element  outlier
         wait until element is visible  product-Within 1 Std Deviation  20s
         click element  product-Within 1 Std Deviation
         wait until element is visible  ${outlier_Apply Button}  20s
         click element  ${outlier_Apply Button}
         sleep  14s
         connect to database  dbConfigFile=${dbfile}
         ${total_oppurtunity}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) as total_opportunity FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log to console  ${avg_days_positive}

         ${queryResults}  Evaluate  '${total_oppurtunity}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${convert}  convert to string  ${avg_days_positive}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log to console  ${queryResults}
         ${queryResults2}  execute javascript  var x = ${queryResults}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults2}
         ${tup1}  Set Variable  ${queryResults2}
         ${round_avg}  execute javascript  var num = 0; num  = Number(${tup1}).toFixed(1); return num;
         log  ${round_avg}
         ${results}  execute javascript  var x = ${queryResults1}; var y = ${round_avg}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total Daily Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total Daily Oppertunity_value}
         wait until element is visible  ${total_daily_opp_spine_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${DB_Total Daily Oppertunity_value}-${ui_Total Daily Oppertunity_value});return result;
          log  ${ui_and_db_value_diff}
         ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
         should be true  ${ui_and_db_value_diffless_than_point2}

user select "Within 1 Std Deviation" from outlier filter and user should see correct numbers for Total Fullfillment Risk in spine for "Within 1 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  8s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${count}  ROW COUNT  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${count}
         ${queryResults}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_fullfillment_risk_value}

         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s
         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value}
         should match regexp  ${ui_total_fullfillment_risk_value}  ${DB_TOTAL_fullfillment_risk_value}

user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for Total Opportunity in spine for "Within 1 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  8s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) as total_opportunity FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${queryResults}
         ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_oppurtunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_oppurtunity_value}

         wait until element is visible  ${total_opp_spine_value}  30s
         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value}

user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for Total Daily Fullfillment Risk in spine for "Within 1 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  8s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${total_fullfil}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         ${queryResults}  Evaluate  '${total_fullfil}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults1..}  replace string using regexp  ${queryResults1}  \\-|\,  ${EMPTY}
         log  ${queryResults1..}
         ${convert}  convert to string  ${neg_days_push}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \\-|\,  ${EMPTY}
         log  ${queryResults..}
         ${queryResults2}  execute javascript  var x = ${queryResults..}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults2}
         ${tup1}  set variable  ${queryResults2}
         ${DB_queryResults2_value}  execute javascript  var result = ${queryResults2}.toFixed(1); return result;
         log  ${DB_queryResults2_value}
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${DB_queryResults2_value}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}

         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total full_fillment_risk_value}

user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for System Lt in spine for "Within 1 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  8s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup1}  Set Variable  ${queryResults..}
         ${DB_system_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_system_Lt_value}
         ${DB_system_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_system_Lt_value})); return String(result);
         sleep  5s

         wait until element is visible  ${system_lt_spine_value}  30s
         ${ui_System_Lt}  get text  ${system_lt_spine_value}
         ${ui_System_Lt_value}  replace string using regexp  ${ui_System_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_System_Lt_value}
         should be equal  ${ui_System_Lt_value}  ${DB_system_Lt_value..}

user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for Actual Lt in spine for "Within 1 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  8s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 1 Std Deviation' and plant_code_plant_short_name='${text1}';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup1}  Set Variable  ${queryResults..}
         ${DB_Actual_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Actual_Lt_value}
         ${DB_Actual_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_Actual_Lt_value})); return String(result);
         sleep  5s

         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         should be equal  ${ui_Actual_Lt_value}  ${DB_Actual_Lt_value..}

user should see data showing "Within 1 Std Deviation" in outlier column
         element should be visible  ${outlier_grid_col_name}
         element should contain  ${outlier_col_data}  Within 1 Std Deviation

##=================================================================================================================================================================================
user select "Within 2 Std Deviation" from outlier filter and user should see correct numbers for Total Daily opportunity in spine for "Within 2 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  12s
         click element  product-5250 - Greenville
         #${plant_filter_checkbox}
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         wait until element is visible  ApplyBtn  20s
         click element  ApplyBtn
         sleep  15s
         wait until element is visible  outlier  20
         click element  outlier
         wait until element is visible  product-Within 2 Std Deviations  20s
         click element  product-Within 2 Std Deviations
         wait until element is visible  ${outlier_Apply Button}  20s
         click element  ${outlier_Apply Button}
         sleep  30s
         connect to database  dbConfigFile=${dbfile}
         ${total_oppurtunity}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) as total_opportunity FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log to console  ${avg_days_positive}

         ${queryResults}  Evaluate  '${total_oppurtunity}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${convert}  convert to string  ${avg_days_positive}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log to console  ${queryResults}
         ${queryResults2}  execute javascript  var x = ${queryResults}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults2}
         ${tup1}  Set Variable  ${queryResults2}
         ${round_avg}  execute javascript  var num = 0; num  = Number(${tup1}).toFixed(1); return num;
         log  ${round_avg}
         ${results}  execute javascript  var x = ${queryResults1}; var y = ${round_avg}; var result = x/y; return result;
         log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total Daily Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total Daily Oppertunity_value}

         wait until element is visible  ${total_daily_opp_spine_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total Daily Oppertunity_value}

user select "Within 2 Std Deviation" from outlier filter and user should see correct numbers for Total Fullfillment Risk in spine for "Within 2 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         wait until element is visible  ${plant_show/selected}  10s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_fullfillment_risk_value}

         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s
         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value}
         should match regexp  ${ui_total_fullfillment_risk_value}  ${DB_TOTAL_fullfillment_risk_value}

user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for Total Opportunity in spine for "Within 2 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         wait until element is visible  ${plant_show/selected}  10s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) as total_opportunity FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log  ${queryResults}
         ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_oppurtunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_oppurtunity_value}

         wait until element is visible  ${total_opp_spine_value}  30s
         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value}

user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for Total Daily Fullfillment Risk in spine for "Within 2 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         wait until element is visible  ${plant_show/selected}  10s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${total_fullfil}  QUERY  select round(SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END)) as total_fulfillment_risk FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         ${queryResults}  Evaluate  '${total_fullfil}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults1..}  replace string using regexp  ${queryResults1}  \\-|\,  ${EMPTY}
         log  ${queryResults1..}
         ${convert}  convert to string  ${neg_days_push}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \\-|\,  ${EMPTY}
         log  ${queryResults..}
         ${queryResults2}  execute javascript  var x = ${queryResults..}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults2}
         ${tup1}  set variable  ${queryResults2}
         ${DB_queryResults2_value}  execute javascript  var result = ${queryResults2}.toFixed(1); return result;
         log  ${DB_queryResults2_value}
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${DB_queryResults2_value}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 99){ num  = (${tup1}).toFixed(0); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}

         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total full_fillment_risk_value}

user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for System Lt in spine for "Within 2 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         wait until element is visible  ${plant_show/selected}  10s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup1}  Set Variable  ${queryResults..}
         ${DB_system_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_system_Lt_value}
         ${DB_system_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_system_Lt_value})); return String(result);
         sleep  5s

         wait until element is visible  ${system_lt_spine_value}  30s
         ${ui_System_Lt}  get text  ${system_lt_spine_value}
         ${ui_System_Lt_value}  replace string using regexp  ${ui_System_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_System_Lt_value}
         should be equal  ${ui_System_Lt_value}  ${DB_system_Lt_value..}

user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for Actual Lt in spine for "Within 2 Std Deviation"
         wait until element is visible  plant  20s
         click element  plant
         sleep  7s
         wait until element is visible  ${plant_show/selected}  10s
         click element  ${plant_show/selected}
         ${text1}  get text  ${selected_plant_name}
         log  ${text1}
         click element  plant
         connect to database  dbConfigFile=${dbfile}
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" >= -5 and "lead_time_analytics"."po_early_by" <= 5) and Outlier='Within 2 Std Deviations' and plant_code_plant_short_name='${text1}';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup1}  Set Variable  ${queryResults..}
         ${DB_Actual_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Actual_Lt_value}
         ${DB_Actual_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_Actual_Lt_value})); return String(result);
         sleep  5s

         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         should be equal  ${ui_Actual_Lt_value}  ${DB_Actual_Lt_value..}

user should see data showing "Within 2 Std Deviation" in outlier column
         element should be visible  xpath=//table/thead//th//span[text()='Outlier']
         element should contain  ${outlier_col_data}  Within 2 Std Deviation

user select newly added col from show/hide col
         run keyword  scroll page to location  0  1000000
         wait until element is visible  ${show/hide column}  20s
         click element  ${show/hide column}
         click element  ${Actual_lt_col_show_hide}
         click element  ${actual_lt_avg_col}
         click element  ${actual_lt_std_dev_col}
         click element  ${actual_lt_+1_std_dev_col}
         click element  ${actual_lt_-1_std_dev_col}
         click element  ${actual_lt_+2_std_dev_col}
         click element  ${actual_lt_-2_std_dev_col}
         click element  ${outlier_col}
         click element  ${show/hide column}
         sleep  3s

User should see "${column1}" col "${column2}" col "${column3}" col "${column4}" col "${column5}" col " col "${column6}" col "${column7}" col "${column8}" col
       wait until element is not visible  ${Page Spinner}  30s
       element should be visible  xpath=//table/thead//th//span[text()='${column1}']
       element should be visible  xpath=//table/thead//th//span[text()='${column2}']
       element should be visible  xpath=//table/thead//th//span[text()='${column3}']
       element should be visible  xpath=//table/thead//th//span[text()='${column4}']
       element should be visible  xpath=//table/thead//th//span[text()='${column5}']
       element should be visible  xpath=//table/thead//th//span[text()='${column6}']
       #Scroll grid horizontaly 700px
       element should be visible  xpath=//table/thead//th//span[text()='${column7}']
       element should be visible  xpath=//table/thead//th//span[text()='${column8}']