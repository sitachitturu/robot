5/25/2017
212595411
date:6/12/2017
#added scripts with some changes in Ui by sita chitturu(212590906)
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  Collections
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access Lead Time Analytics module
        run keyword  scroll page to location  0  1000000
        click element  ${Lead Time Analytics Icon}
        sleep  48s

User should see Lead Time -Spine
        wait until element is visible  spine  40s
scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

User should see "TOTAL OPPORTUNITY"
        ${total_opp}  get text  ${total_oppurtunity_spine}
        should be equal  ${total_opp}  TOTAL OPPORTUNITY
User should see "ACTUAL LT"
        element should be visible  ${ACTUAL LT}
User should see "SYSTEM LT"
        element should be visible  ${SYSTEM LT}
User should see "TOTAL FULFILLMENT RISK"
        ${total_fullfill}  get text  ${total_fullfillment_risk}
        should be equal  ${total_fullfill}  TOTAL FULFILLMENT RISK
User should see "TOTAL DAILY OPPORTUNITY"
        ${total_DAILY OPPORTUNITY}  get text  ${total_daily_opp}
        should be equal  ${total_DAILY OPPORTUNITY}  TOTAL DAILY OPPORTUNITY
User should see "TOTAL DAILY FULFILLMENT RISK"
        ${total_FULFILLMENT RISK}  get text  ${total_daily_fullfillment}
        should be equal  ${total_FULFILLMENT RISK}  TOTAL DAILY FULFILLMENT RISK
User should see "+AVERAGE DAYS PUSH"
         ${+Avg Days Push}  get text  ${+ve avg days push}
         should be equal  ${+Avg Days Push}  + AVERAGE DAYS PUSH
User should see "-AVERAGE DAYS PUSH"
         ${-Avg Days Push}  get text  ${-ve avg days push}
         should be equal  ${-Avg Days Push}  - AVERAGE DAYS PUSH

User should see "ORIG. PO Lt"
        ${PO LT}  get text  ${PO_LT}
        should be equal as strings  ${PO LT}  ORIG. PO LT

#date:6/12/2017
#and added new scripts for spine by sita chitturu(212590906)

validate and compare value for "Total Daily Oppertunity" in spine with data base query for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_oppurtunity}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         ${DB_Total Daily Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total Daily Oppertunity_value}
         wait until element is visible  ${total_daily_opp_spine_value}  30s
         sleep  5s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total Daily Oppertunity_value}


validate and compare value for "Total Fullfillment Risk" in spine with data base query for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${count}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_fullfillment_risk_value}
         sleep  5s
         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s
         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value}
         should match regexp  ${ui_total_fullfillment_risk_value}  ${DB_TOTAL_fullfillment_risk_value}


validate and comapre value for "Total Opportunity" in spine with data base query for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         ${count}  ROW COUNT  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${count}
         ${queryResults}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         sleep  5s
         wait until element is visible  ${total_opp_spine_value}  30s
         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value}


validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_fullfil}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${queryResults2}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}
         ${tup2}  Set Variable  ${DB_Total full_fillment_risk_value}
          ${round_avg}  execute javascript  var result = Math.round(Number(${tup2})); return String(result);
          log  ${round_avg}
         sleep  5s
         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${ui_Total Daily Oppertunity_value}-${round_avg});return result;
         log  ${ui_and_db_value_diff}
         ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=0.3){return true} else {return false};
         should be true  ${ui_and_db_value_diffless_than_point2}

         #sh  ${ui_Total Daily Oppertunity_value}  ${DB_Total full_fillment_risk_value}

validate and compare value for "Actual Lt" in spine with data base query for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         ${DB_actual_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_actual_Lt_value})); return String(result);
         sleep  5s
         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${ui_Actual_Lt_value}-${DB_actual_Lt_value..});return result;
         log  ${ui_and_db_value_diff}
         ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=1){return true} else {return false};
         should be true  ${ui_and_db_value_diffless_than_point2}

validate and compare value for "System Lt" in spine with data base query for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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


verify spine value for PO LT with data base and compare both ui with database for "${text}" "${text3}" "${text2}"
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select AVG(orig_po_lead_time) AS "orig_po_lead_time" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         ${DB_PO_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_PO_Lt_value}
         ${DB_PO_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_PO_Lt_value})); return String(result);
         log  ${DB_PO_Lt_value..}
         sleep  5s
         wait until element is visible  ${PO_LT_spine_value}  30s
         ${ui_PO_Lt}  get text  ${PO_LT_spine_value}
         ${ui_PO_Lt_value}  replace string using regexp  ${ui_PO_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_PO_Lt_value}
         should be equal  ${ui_PO_Lt_value}  ${DB_PO_Lt_value..}


user see +/-5 days dropdown and click that dropdown and user should select +/- 12 days from dropdown
         wait until element is visible  ${leass than 5 days dropdown}  10s
         click element  ${leass than 5 days dropdown}
         sleep  2s
         click element  ${less than 12 days from dropdown}
         sleep  25s

####===========================================================================================================================
user see +/-5 days dropdown and click that dropdown and user should select All from dropdown
         wait until element is visible  ${leass than 5 days dropdown}  10s
         click element  ${leass than 5 days dropdown}
         sleep  2s
         click element  ${all from dropdown}
         sleep  35s

validate and compare value for "Total Daily Oppertunity" in spine with data base query for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_oppurtunity}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
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
         ${DB_Total Daily Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; } else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total Daily Oppertunity_value}
         wait until element is visible  ${total_daily_opp_spine_value}  30s
         sleep  5s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total Daily Oppertunity_value}


validate and compare value for "Total Fullfillment Risk" in spine with data base query for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
         log  ${count}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_fullfillment_risk_value}
         sleep  5s
         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s
         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value}
         should match regexp  ${ui_total_fullfillment_risk_value}  ${DB_TOTAL_fullfillment_risk_value}


validate and comapre value for "Total Opportunity" in spine with data base query for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
         log  ${count}
         ${queryResults}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
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
         sleep  5s
         wait until element is visible  ${total_opp_spine_value}  30s
         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value}


validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_fullfil}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
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
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${queryResults2}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}
         ${tup2}  Set Variable  ${DB_Total full_fillment_risk_value}
          ${round_avg}  execute javascript  var result = Math.round(Number(${tup2})); return String(result);
          log  ${round_avg}
         sleep  5s
         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${ui_Total Daily Oppertunity_value}-${DB_Total full_fillment_risk_value});return result;
         log  ${ui_and_db_value_diff}
         ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=0.3){return true} else {return false};
         should be true  ${ui_and_db_value_diffless_than_point2}


validate and compare value for "Actual Lt" in spine with data base query for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
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
         ${DB_actual_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_actual_Lt_value})); return String(result);
         sleep  5s
         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         should be equal  ${ui_Actual_Lt_value}  ${DB_Actual_Lt_value..}


validate and compare value for "System Lt" in spine with data base query for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
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


verify spine value for PO LT with data base and compare both ui with database for All
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select AVG(orig_po_lead_time) AS "orig_po_lead_time" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'lt_reduction_fulfillment_risk';
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
         ${DB_PO_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_PO_Lt_value}
         ${DB_PO_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_PO_Lt_value})); return String(result);
         log  ${DB_PO_Lt_value..}
         sleep  5s
         wait until element is visible  ${PO_LT_spine_value}  30s
         ${ui_PO_Lt}  get text  ${PO_LT_spine_value}
         ${ui_PO_Lt_value}  replace string using regexp  ${ui_PO_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_PO_Lt_value}
         should be equal  ${ui_PO_Lt_value}  ${DB_PO_Lt_value..}

#####=================================================================================================================================================================================
user click on ltreduction opportunity dropdown user should be able to select open po placement from dropdown
         wait until element is visible  //px-dropdown[2]/div/px-dropdown-text/span  30s
        click element  //px-dropdown[2]/div/px-dropdown-text/span
        sleep  5s
        click element  //px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[3]
        sleep  15s

validate and compare value for "Total Daily Oppertunity" in spine with data base query for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_oppurtunity}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log to console  ${avg_days_positive}
         ${queryResults}  Evaluate  '${total_oppurtunity}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${queryResults1.}  execute javascript  var x = ${queryResults1}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults1.}
         ${tup}  set variable  ${queryResults1.}
         ${queryResults1..}  execute javascript  var num = 0; num  = Number(${tup}); return num;
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
         ${round_avg}  execute javascript  var num = 0; num  = Number(${tup1}); return num;
         log  ${round_avg}
          ${results}  run keyword and ignore error  execute javascript  var x = ${queryResults1..}; var y = ${round_avg}; var result = x/y; return result;
          log  ${results}
          ${results...}  execute javascript  var x = ${queryResults1..}; var y = ${round_avg}; var result = x+y; return result;
          ${queryResultLength}  execute javascript  return String(${results...}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${results...}};
            log  ${queryResults2..}
            ${tup1}  Set Variable  ${queryResults2..}
            ${DB_Total_daily_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_daily_Oppertunity_value}
            ${DB_Total_daily_Oppertunity..}  convert to string  ${DB_Total_daily_Oppertunity_value}
         wait until element is visible  ${total_daily_opp_spine_value}  30s
         sleep  5s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total_daily_Oppertunity..}

validate and compare value for "Total Fullfillment Risk" in spine with data base query for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${count}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_fullfillment_risk_value}
         ${DB_TOTAL_fullfillment_risk_value..}  convert to string  ${DB_TOTAL_fullfillment_risk_value}
         sleep  5s
         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s
         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value}
         should match regexp  ${ui_total_fullfillment_risk_value}  ${DB_TOTAL_fullfillment_risk_value..}


validate and comapre value for "Total Opportunity" in spine with data base query for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${count}
         ${queryResults}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         ${DB_TOTAL_oppurtunity_value..}  convert to string  ${DB_TOTAL_oppurtunity_value}
         sleep  5s
         wait until element is visible  ${total_opp_spine_value}  30s
         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value..}

validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_fullfil}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${queryResults2}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}
         ${tup2}  Set Variable  ${DB_Total full_fillment_risk_value}
          ${round_avg}  execute javascript  var result = Math.round(Number(${tup2})); return String(result);
          log  ${round_avg}
          ${DB_Total full_fillment_risk_value..}  convert to string  ${DB_Total full_fillment_risk_value}
         sleep  5s
         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total full_fillment_risk_value..}


validate and compare value for "Actual Lt" in spine with data base query for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup}  Set Variable  ${queryResults..}
            ${queryResultLength}  execute javascript  return String(${tup}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${tup}};
            log  ${queryResults2..}
            ${tup1}  set variable  ${queryResults2..}
            ${DB_actual_lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_actual_lt_value}
            ${DB_actual_lt_value.}  convert to string  ${DB_actual_lt_value}
         ${DB_actual_Lt_value..}  run keyword and ignore error  execute javascript  var result = Math.round(Number(${DB_actual_Lt_value})); return String(result);
         ${DB_actual_Lt_value..1}  run keyword and ignore error  convert to string  ${DB_actual_Lt_value..}
         sleep  5s
         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         should be equal  ${ui_Actual_Lt_value}  ${DB_Actual_Lt_value.}


validate and compare value for "System Lt" in spine with data base query for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         ${DB_system_Lt_value..1}  convert to string  ${DB_system_Lt_value..}
         sleep  5s
         wait until element is visible  ${system_lt_spine_value}  30s
         ${ui_System_Lt}  get text  ${system_lt_spine_value}
         ${ui_System_Lt_value}  replace string using regexp  ${ui_System_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_System_Lt_value}
         should be equal  ${ui_System_Lt_value}  ${DB_system_Lt_value..1}


verify spine value for PO LT with data base and compare both ui with database for "${text}" "${text3}" "${text2}" for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select AVG(orig_po_lead_time) AS "orig_po_lead_time" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement' and ("lead_time_analytics"."po_early_by" ${text2} ${text3} "lead_time_analytics"."po_early_by" ${text});
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
         ${DB_PO_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_PO_Lt_value}
         ${DB_PO_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_PO_Lt_value})); return String(result);
         log  ${DB_PO_Lt_value..}
         ${DB_PO_Lt_value..1}  convert to string  ${DB_PO_Lt_value..}
         sleep  5s
         wait until element is visible  ${PO_LT_spine_value}  30s
         ${ui_PO_Lt}  get text  ${PO_LT_spine_value}
         ${ui_PO_Lt_value}  replace string using regexp  ${ui_PO_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_PO_Lt_value}
         should be equal  ${ui_PO_Lt_value}  ${DB_PO_Lt_value..}

####============================================================================================================================================

validate and compare value for "Total Daily Oppertunity" in spine with data base query for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_oppurtunity}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log  ${total_oppurtunity}
         ${avg_days_positive}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) > 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as positive_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log to console  ${avg_days_positive}
         ${queryResults}  Evaluate  '${total_oppurtunity}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults1}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         log  ${queryResults1}
         ${queryResults1.}  execute javascript  var x = ${queryResults1}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
         log  ${queryResults1.}
         ${tup}  set variable  ${queryResults1.}
         ${queryResults1..}  execute javascript  var num = 0; num  = Number(${tup}); return num;
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
         ${round_avg}  execute javascript  var num = 0; num  = Number(${tup1}); return num;
         log  ${round_avg}
          ${results}  run keyword and ignore error  execute javascript  var x = ${queryResults1..}; var y = ${round_avg}; var result = x/y; return result;
          log  ${results}
          ${results...}  execute javascript  var x = ${queryResults1..}; var y = ${round_avg}; var result = x+y; return result;
          ${queryResultLength}  execute javascript  return String(${results...}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${results...}};
            log  ${queryResults2..}
            ${tup1}  Set Variable  ${queryResults2..}
            ${DB_Total_daily_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_daily_Oppertunity_value}
            ${DB_Total_daily_Oppertunity..}  convert to string  ${DB_Total_daily_Oppertunity_value}
         wait until element is visible  ${total_daily_opp_spine_value}  30s
         sleep  5s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_opp_spine_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total_daily_Oppertunity..}


validate and compare value for "Total Fullfillment Risk" in spine with data base query for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log  ${count}
         ${queryResults}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log  ${queryResults}
         ${queryResults}  Evaluate  '${queryResults}'.replace(',','')
         ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
         ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
         ${queryResults1}  Evaluate  '${queryResults}'.replace('-','')
         log  ${queryResults1}
         ${tup1}  Set Variable  ${queryResults1}
         ${DB_TOTAL_fullfillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_TOTAL_fullfillment_risk_value}
         ${DB_TOTAL_fullfillment_risk_value..}  convert to string  ${DB_TOTAL_fullfillment_risk_value}
         sleep  5s
         wait until element is visible  ${total_fullfillment_risk_spine_value}  30s
         ${ui_total_fullfillment_risk}  get text  ${total_fullfillment_risk_spine_value}
         ${ui_total_fullfillment_risk_value}  replace string using regexp  ${ui_total_fullfillment_risk}  \\$|\,  ${EMPTY}
         log  ${ui_total_fullfillment_risk_value}
         should match regexp  ${ui_total_fullfillment_risk_value}  ${DB_TOTAL_fullfillment_risk_value..}


validate and comapre value for "Total Opportunity" in spine with data base query for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${count}  ROW COUNT  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log  ${count}
         ${queryResults}  QUERY  SELECT SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) > 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_opportunity" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
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
         ${DB_TOTAL_oppurtunity_value..}  convert to string  ${DB_TOTAL_oppurtunity_value}
         sleep  5s
         wait until element is visible  ${total_opp_spine_value}  30s
         ${ui_total_oppurtunity}  get text  ${total_opp_spine_value}
         ${ui_total_oppurtunity_value}  replace string using regexp  ${ui_total_oppurtunity}  \\$|\,  ${EMPTY}
         log  ${ui_total_oppurtunity_value}
         should match regexp  ${ui_total_oppurtunity_value}  ${DB_TOTAL_oppurtunity_value..}


validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${total_fullfil}  QUERY  select SUM (CASE WHEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) < 0 THEN (processing_lead_time - (receipt_date::date - pol_creation_datetime::date)) * (qty_received * unit_price_usd) / 250 ELSE 0 END) AS "total_fulfillment_risk" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log  ${total_fullfil}
         ${neg_days_push}  query  select AVG (CASE WHEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) < 0 THEN processing_lead_time - (receipt_date::date - pol_creation_datetime::date) ELSE 0 END) as negative_average_days_push FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
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
          ${results}  execute javascript  var x = ${queryResults1..}; var y = ${queryResults2}; var result = x/y; return result;
          log  ${results}
         ${tup1}  Set Variable  ${results}
         ${DB_Total full_fillment_risk_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_Total full_fillment_risk_value}
         ${tup2}  Set Variable  ${DB_Total full_fillment_risk_value}
          ${round_avg}  execute javascript  var result = Math.round(Number(${tup2})); return String(result);
          log  ${round_avg}
          ${DB_Total full_fillment_risk_value..}  convert to string  ${DB_Total full_fillment_risk_value}
         sleep  5s
         wait until element is visible  ${total_daily_fullfillment_risk_value}  30s
         ${ui_Total Daily Oppertunity}  get text  ${total_daily_fullfillment_risk_value}
         ${ui_Total Daily Oppertunity_value}  replace string using regexp  ${ui_Total Daily Oppertunity}  \\$|\,  ${EMPTY}
         log  ${ui_Total Daily Oppertunity_value}
         should be equal  ${ui_Total Daily Oppertunity_value}  ${DB_Total full_fillment_risk_value..}


validate and compare value for "Actual Lt" in spine with data base query for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(receipt_date::date - pol_creation_datetime::date) as actual_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
         log  ${queryResults1..}
         ${convert}  convert to string  ${queryResults1..}
         log  ${convert}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log  ${queryResults..}
         ${tup}  Set Variable  ${queryResults..}
            ${queryResultLength}  execute javascript  return String(${tup}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${tup}};
            log  ${queryResults2..}
            ${tup1}  set variable  ${queryResults2..}
            ${DB_actual_lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_actual_lt_value}
            ${DB_actual_lt_value.}  convert to string  ${DB_actual_lt_value}
         ${DB_actual_Lt_value..}  run keyword and ignore error  execute javascript  var result = Math.round(Number(${DB_actual_Lt_value})); return String(result);
         ${DB_actual_Lt_value..1}  run keyword and ignore error  convert to string  ${DB_actual_Lt_value..}
         sleep  5s
         wait until element is visible  ${Actual_lt_spine_value}  30s
         ${ui_Actual_Lt}  get text  ${Actual_lt_spine_value}
         ${ui_Actual_Lt_value}  replace string using regexp  ${ui_Actual_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_Actual_Lt_value}
         should be equal  ${ui_Actual_Lt_value}  ${DB_Actual_Lt_value.}


validate and compare value for "System Lt" in spine with data base query for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select avg(processing_lead_time) as system_lt FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
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
         ${DB_system_Lt_value..1}  convert to string  ${DB_system_Lt_value..}
         sleep  5s
         wait until element is visible  ${system_lt_spine_value}  30s
         ${ui_System_Lt}  get text  ${system_lt_spine_value}
         ${ui_System_Lt_value}  replace string using regexp  ${ui_System_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_System_Lt_value}
         should be equal  ${ui_System_Lt_value}  ${DB_system_Lt_value..1}


verify spine value for PO LT with data base and compare both ui with database for All for open po placement
         connect to database  dbConfigFile=${dbfile}
         sleep  3s
         ${queryResults1..}  QUERY  select AVG(orig_po_lead_time) AS "orig_po_lead_time" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE query_identifier = 'open_po_placement';
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
         ${DB_PO_Lt_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
         log  ${DB_PO_Lt_value}
         ${DB_PO_Lt_value..}  execute javascript  var result = Math.round(Number(${DB_PO_Lt_value})); return String(result);
         log  ${DB_PO_Lt_value..}
         ${DB_PO_Lt_value..1}  convert to string  ${DB_PO_Lt_value..}
         sleep  5s
         wait until element is visible  ${PO_LT_spine_value}  30s
         ${ui_PO_Lt}  get text  ${PO_LT_spine_value}
         ${ui_PO_Lt_value}  replace string using regexp  ${ui_PO_Lt}  \\Days|\,  ${EMPTY}
         log  ${ui_PO_Lt_value}
         should be equal  ${ui_PO_Lt_value}  ${DB_PO_Lt_value..}
