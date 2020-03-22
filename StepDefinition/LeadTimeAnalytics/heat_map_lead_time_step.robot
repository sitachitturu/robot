6/12/2017
by sita chitturu(212590906)
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  Collections
Library  OperatingSystem
Library	 HttpLibrary.HTTP
Library	 RequestsLibrary
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access Lead Time Analytics module
       run keyword  scroll page to location  0  10000000
        click element  ${Lead Time Analytics Icon}
        sleep  65s
        wait until element is visible  addFilterBtn  20s

User see Lead TIME By with "source vendor" drop down and "positive lt and negative lt" drop down
        ${text}  get text  //*[@id="lead-time-by-title"]
        should be equal  ${text}  LEAD TIME BY
        element should be visible  //*[@id="dropcell"]
        ${text1}  get text  //*[@id="dropcell"]
        should be equal  Source/Vendor  ${text1}
        click element  //*[@id="dropcell"]
        sleep  3s
        element should be visible  //*[@id="list"]/li[1]
        element should be visible  //*[@id="list"]/li[2]
        click element  //*[@id="dropcell"]
        sleep  4s
        wait until element is visible  //*[@id="dropcell"]/px-dropdown-text  20s
        ${text2}  get text  xpath=//mo-filter-context/mo-lead-time/div/div/px-dropdown[2]/div/px-dropdown-text/span
        should be equal  ${text2}  LT Reduction Opportunity (Hist)
        click element  //*[@id="textWrap"]
        click element  //*[@id="list"]/li[1]

User should see following column "${test1}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${text7}" column "${text8}" column "${text9}" column "${text10}" column on heat map
        wait until element is visible  xpath=//table/thead//th//span[text()='${test1}']  30s
        element should be visible  xpath=//table/thead//th//span[text()='${test2}']
        element should be visible  xpath=//table/thead//th//span[text()='${test3}']
        wait until element is visible  xpath=//table/thead//th//span[text()='${test4}']  10s
        element should be visible  xpath=//table/thead//th//span[text()='${test4}']
        element should be visible  xpath=//table/thead//th//span[text()='${test5}']
        wait until element is visible  //table/thead//th//span[text()='${test6}']  30s
        element should be visible  xpath=//table/thead//th//span[text()='${test6}']
        element should be visible  xpath=//table/thead//th//span[text()='${text7}']
        element should be visible  xpath=//table/thead//th//span[text()='${text8}']
        element should be visible  xpath=//table/thead//th//span[text()='${text9}']
        element should be visible  xpath=//table/thead//th//span[text()='${text10}']

User click on heatmap for any source vendor user should see filter got selected
       mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[1]/td[1]/vaadin-grid-cell-content/mo-column/div
       double click element  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[1]/td[1]/vaadin-grid-cell-content/mo-column/div
       sleep  15s
       element should be visible  //mm-filter[2]/px-filter/div/div/button/iron-icon
       click element  source_vendor
       sleep  1s
       click element  source_vendor

verify calculations for Total Opportunity in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap
        :FOR  ${i}  IN RANGE  1  9
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${text}
        \  ${Results}  replace string using regexp  ${text}  \\,|\,  ${EMPTY}
        \  ${Results}  replace string using regexp  ${text}  \\$|\,  ${EMPTY}
        \  ${text_value_heatmap}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${text_value_heatmap}
        \  ${TempString1}  execute javascript  var value = `${text_value_heatmap}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
        \  log  ${TempString1}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  SELECT SUM(opportunity_or_risk) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."vendor_name"= '${vendor_name}' and "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) GROUP BY "vendor_name" HAVING SUM(lt_diff) > 0 ORDER BY SUM(opportunity_or_risk);
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  log  ${queryResults1.}
        \  ${tup1}  set variable  ${queryResults1.}
        \  ${DB_queryResults2_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
        \  log  ${DB_queryResults2_value}
        \  run keyword and continue on failure  should be equal as numbers  ${text_value_heatmap}  ${DB_queryResults2_value}

verify calculations for Actual Lt in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap
        :FOR  ${i}  IN RANGE  6  12
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${actual_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-column/div
        \  ${vendor_Length}  execute javascript  return String(${actual_lt}).length;
        \  log  ${vendor_Length}
        \  ${actual_lt..}  execute javascript  if( ${vendor_Length} == 0){return 0}else {return ${actual_lt}};
        \  log  ${actual_lt..}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults1..}  QUERY  SELECT AVG(actual_lt) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."receipt_amt_usd" > 0 and vendor_name= '${vendor_name}';
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_Actual_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_Actual_Lt_value}
        \  ${tup1}  Set Variable  ${DB_Actual_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${round_avg..}  convert to integer  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${actual_lt}-${round_avg..});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

verify calculations for System Lt in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap
        :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${system_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-column/div
        \  connect to database  dbConfigFile=${dbfile}
        \  ${count}  ROW COUNT  select avg(processing_lead_time) as system_lt from public.lead_time_analytics_v
        \  log  ${count}
        \  ${queryResults1..}  QUERY  SELECT AVG("processing_lead_time") FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."receipt_amt_usd" > 0 and vendor_name= '${vendor_name}';
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_system_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_system_Lt_value}
        \  ${tup1}  Set Variable  ${DB_system_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${round_avg..}  convert to string  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${system_lt}-${round_avg..});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

Verify calculations for Avg Positive Lt in heat map for Positive LT Difference by selecting vendor by vendor and compare values in spine with heatmap
        :FOR  ${i}  IN RANGE  5  15
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${avg_positive_lt_hm}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  ${avg_positive_lt_hm..}  replace string using regexp  ${avg_positive_lt_hm}  \\Days|\,  ${EMPTY}
        \  ${avg_positive_lt_hm1..}  execute javascript  var string = "${avg_positive_lt_hm..}"; var returnStr = string.split(' ')[0]; return returnStr;
        \  connect to database  dbConfigFile=${dbfile}
        \  ${avg_days_positive}  query  SELECT AVG(CASE WHEN lt_diff >= 0 THEN lt_diff ELSE 0 END) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 and vendor_name='${vendor_name}' GROUP BY "vendor_name" HAVING SUM(lt_diff) >= 0 ORDER BY SUM(opportunity_or_risk) desc ;
        \  log  ${avg_days_positive}
        \  ${convert}  convert to string  ${avg_days_positive}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults}
        \  ${queryResults2}  execute javascript  var x = ${queryResults}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
        \  log  ${queryResults2}
        \  ${queryResultLength}  execute javascript  return String(${queryResults2}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults2}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_avg_+Lt_value}  execute javascript  var num = 0; if(Number(${tup2}).toFixed(1) %1 === 0) {return Number(Number(${tup2}).toFixed(1)).valueOf()} else { num  = Number(${tup2}).toFixed(1); return num;};
        \  log  ${DB_avg_+Lt_value}
        \  ${tup1}  Set Variable  ${DB_avg_+Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  run keyword and continue on failure  should be equal  ${avg_positive_lt_hm1..}  ${round_avg}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript  window.scrollTo(${x_location},${y_location})

Verify calculations for Po Amount in heatmap for Positive LT Difference with database by selecting vendor by vendor and compare values
        sleep  4s
        :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-column/div
        \  log  ${text}
        \  ${Results}  replace string using regexp  ${text}  \\,|\,  ${EMPTY}
        \  ${Results}  replace string using regexp  ${text}  \\$|\,  ${EMPTY}
        \  ${Results..}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${tup1}  set variable  ${Results..}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  SELECT SUM(receipt_amt_usd) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 and vendor_name='${vendor_name}' GROUP BY "vendor_name" HAVING SUM(lt_diff) >= 0 ORDER BY SUM(opportunity_or_risk) desc ;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults1..}
        \  ${tup2}  Set Variable  ${queryResults1..}
        \  ${db_po_number}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  run keyword and continue on failure  should be equal as numbers  ${db_po_number}  ${tup1}
#=================================================================================================================================================================================
#===========================================================================================================================================================================================
User clicks on lead time by "Negative Lt Difference"
        wait until element is visible  //px-dropdown[2]/div/px-dropdown-text/span  30s
        click element  //px-dropdown[2]/div/px-dropdown-text/span
        click element  //px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
        sleep  55s

User should see following column "${text1}" column "${text2}" column "${text3}" column "${text4}" column "${text5}" column "${text6}" column "on heat map for -ve difference
        wait until element is visible  xpath=//table/thead//th//span[text()='${text1}']  30s
        element should be visible  xpath=//table/thead//th//span[text()='${text2}']
        element should be visible  xpath=//table/thead//th//span[text()='${text3}']
        wait until element is visible  xpath=//table/thead//th//span[text()='${text4}']  10s
        element should be visible  xpath=//table/thead//th//span[text()='${text5}']
        element should be visible  xpath=//table/thead//th//span[text()='${text6}']

User should see right calculations for Fulfillment Risk in heat map for Negative LT Difference by selecting vendor by vendor and compare values in spine with heatmap
        sleep  4s
        :FOR  ${i}  IN RANGE  1  9
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${text}
        \  ${Results}  replace string using regexp  ${text}  \\-|\,  ${EMPTY}
        \  ${TempString1}  execute javascript  var value = `${Results}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
        \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
        \  log  ${TempString1,}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select SUM(opportunity_or_risk) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."vendor_name" = '${vendor_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\-|\,  ${EMPTY}
        \  log  ${queryResults1..}
        \  ${tup1}  set variable  ${queryResults1..}
        \  ${DB_queryResults2_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
        \  log  ${DB_queryResults2_value}
        \  run keyword and continue on failure  should be equal as numbers  ${TempString1,}  ${DB_queryResults2_value}

User should see right calculations for Po Amount in heatmap for Negative Lt Difference (by selecting vendor by vendor)
        sleep  4s
        :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-column/div
        \  log  ${text}
        \  ${Results}  replace string using regexp  ${text}  \\,|\,  ${EMPTY}
        \  ${Results}  replace string using regexp  ${text}  \\$|\,  ${EMPTY}
        \  ${Results..}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${tup1}  set variable  ${Results..}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select SUM(receipt_amt_usd) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."vendor_name" = '${vendor_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults1.}
        \  ${tup2}  Set Variable  ${queryResults1..}
        \  ${db_po_number}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  run keyword and continue on failure  should be equal as numbers  ${db_po_number}  ${tup1}


User should see right calculations for Actual Lt in heatmap for Negative Lt Difference (by selecting vendor by vendor)
        :FOR  ${i}  IN RANGE  1  6
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${actual_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-column/div
        \  ${vendor_Length}  execute javascript  return String(${actual_lt}).length;
        \  log  ${vendor_Length}
        \  ${actual_lt..}  execute javascript  if( ${vendor_Length} == 0){return 0}else {return ${actual_lt}};
        \  log  ${actual_lt..}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults1..}  QUERY  select AVG(actual_lt) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."vendor_name" = '${vendor_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_Actual_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_Actual_Lt_value}
        \  ${tup1}  Set Variable  ${DB_Actual_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${round_avg..}  convert to integer  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${actual_lt}-${round_avg..});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

User should see right calculations for system Lt in heatmap for Negative Lt Difference (by selecting vendor by vendor)
        :FOR  ${i}  IN RANGE  1  7
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${system_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-column/div
        \  connect to database  dbConfigFile=${dbfile}
        \  ${count}  ROW COUNT  select avg(processing_lead_time) as system_lt from public.lead_time_analytics_v
        \  log  ${count}
        \  ${queryResults1..}  QUERY  select AVG(processing_lead_time) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."vendor_name" = '${vendor_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" < 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_system_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_system_Lt_value}
        \  ${tup1}  Set Variable  ${DB_system_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${round_avg..}  convert to string  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${system_lt}-${round_avg..});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

User should see right calculations for Avg Negative Lt in heatmap for Negative Lt Difference (by selecting vendor by vendor)
        :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  wait until element is visible  ${vendor_name_in_column}  50s
        \  ${vendor_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${vendor_name}
        \  ${avg_negative_lt_hm}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  ${avg_negative_lt_hm..}  replace string using regexp  ${avg_negative_lt_hm}  \\Days|\,  ${EMPTY}
        \  ${avg_negative_lt_hm.}  replace string using regexp  ${avg_negative_lt_hm..}  \\-|\,  ${EMPTY}
        \  ${avg_negative_lt_hm1..}  execute javascript  var string = "${avg_negative_lt_hm.}"; var returnStr = string.split(' ')[0]; return returnStr;
        \  connect to database  dbConfigFile=${dbfile}
        \  ${neg_days_push}  query  select AVG(CASE WHEN lt_diff < 0 THEN lt_diff ELSE 0 END) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."vendor_name" = '${vendor_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${neg_days_push}
        \  ${convert}  convert to string  ${neg_days_push}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \\-|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResults2}  execute javascript  var x = ${queryResults..}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
        \  log  ${queryResults2}
        \  ${queryResultLength}  execute javascript  return String(${queryResults2}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults2}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_avg_-Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_avg_-Lt_value}
        \  ${tup1}  Set Variable  ${DB_avg_-Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  run keyword and continue on failure  should be equal as numbers  ${avg_negative_lt_hm1..}  ${round_avg}

#========================================================================================================================================================================================
#==========================================================================================================================================================================================
User clicks on lead time by "Material Sku"
        wait until element is visible  //px-dropdown/div/px-dropdown-text/span  30s
        click element  //px-dropdown/div/px-dropdown-text/span
        sleep  3s
        click element  //px-dropdown/div[2]/px-dropdown-content/div/ul/li[2]
        sleep  38s

verify calculations for Total Opportunity in heat map for Positive LT Difference by selecting Material SKU by Material SKU and compare values in spine with heatmap
         sleep  4s
        :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div    #clicks the heatmap row
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${text}
        \  ${TempString1}  execute javascript  var value = `${text}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
        \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
        \  log  ${TempString1,}
        \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  SELECT SUM(opportunity_or_risk) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) GROUP BY "vendor_name" HAVING SUM(lt_diff) > 0 ORDER BY SUM(opportunity_or_risk);
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\-|\,  ${EMPTY}
        \  log  ${queryResults1..}
        \  ${tup1}  set variable  ${queryResults1..}
        \  ${DB_queryResults2_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
        \  log  ${DB_queryResults2_value}
        \  run keyword and continue on failure  should be equal as numbers  ${oppo_value}  ${DB_queryResults2_value}

verify calculations for Total Opportunity in heat map for Negative LT Difference by selecting Material SKU by Material SKU and compare values in spine with heatmap
        sleep  4s
        :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
           #clicks the heatmap row
        \  sleep  3s
        \  ${sku_name}  get text  //vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  log  ${text}
         \  ${TempString1}  execute javascript  var value = `${text}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
        \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
        \  log  ${TempString1,}
        \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select SUM(opportunity_or_risk) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\-|\,  ${EMPTY}
        \  log  ${queryResults1..}
        \  ${tup1}  set variable  ${queryResults1..}
        \  ${DB_queryResults2_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
        \  log  ${DB_queryResults2_value}
        \  run keyword and continue on failure  should be equal as numbers  ${oppo_value}  ${DB_queryResults2_value}

Verify calculations for Po Amount in heatmap for Positive LT Difference with database by selecting Material SKU by Material SKU and compare values
        sleep  4s
        :FOR  ${i}  IN RANGE  5  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-column/div
        \  log  ${text}
        \  ${Results}  replace string using regexp  ${text}  \\,|\,  ${EMPTY}
        \  ${Results}  replace string using regexp  ${text}  \\$|\,  ${EMPTY}
        \  ${Results..}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${tup1}  set variable  ${Results..}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select SUM(receipt_amt_usd) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) >= 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults1..}
        \  ${tup2}  Set Variable  ${queryResults1..}
        \  ${db_po_number}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  run keyword and continue on failure  should be equal as numbers  ${db_po_number}  ${tup1}

Verify calculations for Po Amount in heatmap for Negative LT Difference with database by selecting Material SKU by Material SKU and compare values
        sleep  4s
        :FOR  ${i}  IN RANGE  5  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${text}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-column/div
        \  log  ${text}
        \  ${Results}  replace string using regexp  ${text}  \\,|\,  ${EMPTY}
        \  ${Results}  replace string using regexp  ${text}  \\$|\,  ${EMPTY}
        \  ${Results..}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
        \  ${tup1}  set variable  ${Results..}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults}  QUERY  select SUM(receipt_amt_usd) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) AND lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults}
        \  ${queryResults..}  Evaluate  '${queryResults}'.replace(',','')
        \  ${queryResults..}  Evaluate  '${queryResults..}'.replace('(','')
        \  ${queryResults}  Evaluate  '${queryResults..}'.replace(')','')
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults1.}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults1..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults1..}
        \  ${tup2}  Set Variable  ${queryResults1..}
        \  ${db_po_number}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  run keyword and continue on failure  should be equal as numbers  ${db_po_number}  ${tup1}

verify calculations for Actual Lt in heat map for Positive LT Difference by selecting sku by sku and compare values in database with heatmap
        :FOR  ${i}  IN RANGE  5  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  sleep  3s
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${actual_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-column/div
        \  ${Results}  replace string using regexp  ${actual_lt}  \\,|\,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults1..}  QUERY  SELECT AVG(actual_lt) AS "actual_lt" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) GROUP BY "vendor_name" HAVING SUM(lt_diff) > 0 ORDER BY SUM(opportunity_or_risk) asc;
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_Actual_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_Actual_Lt_value}
        \  ${tup1}  Set Variable  ${DB_Actual_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${actual_lt}-${round_avg});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

verify calculations for Actual Lt in heat map for Negative Lt difference by selecting sku by sku and compare values in database with heatmap
       :FOR  ${i}  IN RANGE  1  5
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${actual_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-column/div
        \  ${Results}  replace string using regexp  ${actual_lt}  \\,|\,  ${EMPTY}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults1..}  QUERY  select AVG(actual_lt) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' and "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) GROUP BY "vendor_name" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc;
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${queryResults2..})); return String(result);
        \  log  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${actual_lt}-${round_avg});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

verify calculations for System Lt in heat map for Positive LT Difference by selecting sku by sku and compare values in spine with heatmap
       :FOR  ${i}  IN RANGE  9  14
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${system_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-column/div
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults1..}  QUERY  select AVG(processing_lead_time) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' and "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."query_identifier" = 'lt_reduction_fulfillment_risk' AND ("lead_time_analytics"."po_early_by" <= 5 AND "lead_time_analytics"."po_early_by" >= -5) GROUP BY "vendor_name" HAVING SUM(lt_diff) > 0 ORDER BY SUM(opportunity_or_risk) asc;
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_system_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_system_Lt_value}
        \  ${tup1}  Set Variable  ${DB_system_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${round_avg..}  convert to string  ${round_avg}
        \  run keyword and continue on failure  should be equal as numbers  ${system_lt}  ${round_avg..}

verify calculations for System Lt in heat map for negative LT Difference by selecting sku by sku and compare values in spine with heatmap
       :FOR  ${i}  IN RANGE  1  14
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${system_lt}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[4]/vaadin-grid-cell-content/mo-column/div
        \  connect to database  dbConfigFile=${dbfile}
        \  ${queryResults1..}  QUERY  select AVG(processing_lead_time) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "item_id" HAVING SUM(lt_diff) >= 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${queryResults1..}
        \  ${convert}  convert to string  ${queryResults1..}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_system_Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_system_Lt_value}
        \  ${tup1}  Set Variable  ${DB_system_Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  ${round_avg..}  convert to string  ${round_avg}
        \  ${ui_and_db_value_diff}  execute javascript  var result =Math.abs(${system_lt}-${round_avg..});return result;
        \  log  ${ui_and_db_value_diff}
        \  ${ui_and_db_value_diff_less_than_point2}  execute javascript  if(${ui_and_db_value_diff}<=2){return true} else {return false};
        \  should be true  ${ui_and_db_value_diffless_than_point2}

Verify calculations for Avg Positive Lt in heat map for Positive LT Difference by selecting sku by sku and compare values in spine with heatmap
        :FOR  ${i}  IN RANGE  3  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${avg_positive_lt_hm}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  ${avg_positive_lt_hm..}  replace string using regexp  ${avg_positive_lt_hm}  \\Days|\,  ${EMPTY}
        \  ${avg_positive_lt_hm1..}  execute javascript  var string = "${avg_positive_lt_hm..}"; var returnStr = string.split(' ')[0]; return returnStr;
        \  connect to database  dbConfigFile=${dbfile}
        \  ${avg_days_positive}  query  select AVG(lt_diff) AS "diff_lt" FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."lt_diff" >= 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 and item_id= '${sku_name}' GROUP BY "item_id" HAVING SUM(lt_diff) >= 0 ORDER BY SUM(opportunity_or_risk) desc;
        \  log  ${avg_days_positive}
        \  ${convert}  convert to string  ${avg_days_positive}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
#        \  ${queryResults2}  execute javascript  var x = ${queryResults..}; console.log("x: ", x);  var result = /\\d+[.]?[\\d]*/g.exec(x)[0]; return result;
#        \  log  ${queryResults2}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_avg_+Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_avg_+Lt_value}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${DB_avg_+Lt_value})); return String(result);
        \  log  ${round_avg}
        \  run keyword and continue on failure  should be equal as numbers  ${avg_positive_lt_hm1..}  ${round_avg}

Verify calculations for Avg Negative Lt in heat map for negative LT Difference by selecting sku by sku and compare values in spine with heatmap
        :FOR  ${i}  IN RANGE  5  10
        \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  ${sku_name}  get text  //table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
        \  log  ${sku_name}
        \  ${avg_negative_lt_hm}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
        \  ${avg_negative_lt_hm..}  replace string using regexp  ${avg_negative_lt_hm}  \\Days|\,  ${EMPTY}
        \  ${avg_negative_lt_hm1..}  execute javascript  var string = "${avg_negative_lt_hm..}"; var returnStr = string.split(' ')[0]; return returnStr;
        \  connect to database  dbConfigFile=${dbfile}
        \  ${neg_days_push}  query  select AVG(CASE WHEN lt_diff < 0 THEN lt_diff ELSE 0 END) FROM "lead_time_analytics_v" AS "lead_time_analytics" WHERE "lead_time_analytics"."item_id" = '${sku_name}' AND "lead_time_analytics"."lt_diff" < 0 AND "lead_time_analytics"."receipt_amt_usd" > 0 GROUP BY "item_id" HAVING SUM(lt_diff) < 0 ORDER BY SUM(opportunity_or_risk) asc ;
        \  log  ${neg_days_push}
        \  ${convert}  convert to string  ${neg_days_push}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
        \  log  ${queryResults..}
        \  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
        \  log  ${queryResultLength}
        \  ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
        \  log  ${queryResults2..}
        \  ${tup2}  Set Variable  ${queryResults2..}
        \  ${DB_avg_-Lt_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){ num = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num = (${tup2}/1000000).toFixed(1); return num; } else if(${tup2}> 999){ num = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num = Number(${tup2}).toFixed(1); return num;} else if(${tup2}< 0){ return num; } };
        \  log  ${DB_avg_-Lt_value}
        \  ${tup1}  Set Variable  ${avg_negative_lt_hm1..}
        \  ${round_avg}  execute javascript  var result = Math.round(Number(${tup1})); return String(result);
        \  log  ${round_avg}
        \  run keyword and continue on failure  should be equal as numbers  ${avg_negative_lt_hm1..}  ${round_avg}
#====================================================================================================================================================================================
#==================================================================================================================================================================================
click on source/vendor filter and uncheck the selected one and hit apply and user should see heatmap got refreshed
       wait until element is visible  addFilterBtn  20s
       mouse over  ${heatmap_row1}
       double click element  ${heatmap_row1}
       sleep  8s
       element should be visible  ${vendor_filter_selected_icon}
       element should be visible  ${vendor_filter_selected_icon2}
       wait until element is visible  clearFilterBtn  20s
       click element  clearFilterBtn
       sleep  12s
       element should not be visible  ${vendor_filter_selected_icon}
       element should not be visible  ${vendor_filter_selected_icon2}
       element should be visible  ${source/vendor_restricted_icon}
       mouse over  ${heatmap_row1}
       mouse over  ${heatmap_row2}

User click any source vendor user should see filter got selected and able to clear the selected filters and able to see default view of heatmap
       wait until element is visible  addFilterBtn  20s
       click element  ${opportunity_dropdown}
       click element  ${fullfillment_risk_dropdown}
       sleep  26s
       mouse over  ${heatmap_row1}
       double click element  ${heatmap_row1}
       sleep  5s
       element should be visible  ${vendor_filter_selected_icon}
       element should be visible  ${vendor_filter_selected_icon2}
       wait until element is visible  clearFilterBtn  20s
       click element  clearFilterBtn
       sleep  18s
       element should not be visible  ${vendor_filter_selected_icon}
       element should not be visible  ${vendor_filter_selected_icon2}
       element should be visible  ${source/vendor_restricted_icon}
       mouse over  ${heatmap_row1}
       mouse over  ${heatmap_row2}

verify Total opportunity col. for LT Reduction Opportunity should not show negative values
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${Results}  replace string using regexp  ${text1}  \\,|\,  ${EMPTY}
      \  ${Results}  replace string using regexp  ${text1}  \\$|\,  ${EMPTY}
      \  ${Results..}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${Results..}>=0

verify Total opportunity col. for LT Reduction Opportunity should not show negative values by sorting the total oppo. column
     click element  //table/thead//th//span[text()='Total Opportunity']
     sleep  13s
     :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${TempString1}  execute javascript  var value = `${text1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      \  log  ${TempString1,}
      \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${oppo_value}>=0

verify Total opportunity col. for fullfillment risk should not show negative values
      click element  ${opportunity_dropdown}
      click element  ${fullfillment_risk_dropdown}
      sleep  27s
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${TempString1}  execute javascript  var value = `${text1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      \  log  ${TempString1,}
      \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${oppo_value}<=0

verify Total opportunity col. for fullfillment risk should not show negative values by sorting the total oppo. column
      click element  //table/thead//th//span[text()='Fulfillment Risk']
      sleep  17s
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${TempString1}  execute javascript  var value = `${text1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      \  log  ${TempString1,}
      \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${oppo_value}<=0

verify Total opportunity col. for fullfillment risk should not show negative values for material sku
      click element  //px-dropdown-text/span
      click element  //px-dropdown-content/div/ul/li[2]
      sleep  27s
      click element  ${opportunity_dropdown}
      sleep  2s
      click element  ${fullfillment_risk_dropdown}
      sleep  38s
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${Results}  replace string using regexp  ${text1}  \\,|\,  ${EMPTY}
      \  ${Results}  replace string using regexp  ${text1}  \\$|\,  ${EMPTY}
      \  ${Results..}  replace string using regexp  ${Results}  \[a-zA-Z]|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${Results..}<=0

verify Total opportunity col. for fullfillment risk should not show negative values by sorting the total oppo. column for material sku
      click element  //table/thead//th//span[text()='Fulfillment Risk']
      sleep  17s
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${TempString1}  execute javascript  var value = `${text1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      \  log  ${TempString1,}
      \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${oppo_value}<=0

verify Total opportunity col. for LT Reduction Opportunity should not show negative values by selecting sku
      click element  //px-dropdown-text/span
      click element  //px-dropdown-content/div/ul/li[2]
      sleep  20s
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${TempString1}  execute javascript  var value = `${text1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      \  log  ${TempString1,}
      \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${oppo_value}<=0

verify Total opportunity col. for LT Reduction Opportunity should not show negative values by sorting the total oppo. column by selecting sku
      click element  //table/thead//th//span[text()='Total Opportunity']
      sleep  17s
      :FOR  ${i}  IN RANGE  1  10
      \  mouse over  //div/div[3]/div[2]/div/div/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[1]/vaadin-grid-cell-content/mo-column/div
      \  ${text1}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
      \  ${TempString1}  execute javascript  var value = `${text1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      \  ${TempString1,}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      \  log  ${TempString1,}
      \  ${oppo_value}  replace string using regexp  ${TempString1,}  \\-|\,  ${EMPTY}
      \  run keyword and continue on failure  evaluate  ${oppo_value}<=0

User should see "Open PO Placement" and able to click on it
      wait until element is visible  ${opportunity_dropdown}  10s
      click element  ${opportunity_dropdown}
      wait until element is visible  ${open_po_placement dropdown}  10s
      click element  ${open_po_placement dropdown}
      sleep  5s

User should see following columns "${text1}" column "${text2}" column "${text3}" column "${text4}" column "${text5}" column "${text6}" column "${text7}" column "${text8}" column on heat map
        wait until element is visible  xpath=//table/thead//th//span[text()='${text1}']  30s
        element should be visible  xpath=//table/thead//th//span[text()='${text2}']
        element should be visible  xpath=//table/thead//th//span[text()='${text3}']
        wait until element is visible  xpath=//table/thead//th//span[text()='${text4}']  10s
        element should be visible  xpath=//table/thead//th//span[text()='${text5}']
        element should be visible  xpath=//table/thead//th//span[text()='${text6}']
        element should be visible  xpath=//table/thead//th//span[text()='${text7}']
        wait until element is visible  //table/thead//th//span[text()='${text8}']  30s

User select Buyer from vendor dropdown user should see data in grid related to buyer for open po placement
        wait until element is visible  ${opportunity_dropdown}  10s
        wait until element is visible  //px-dropdown/div/px-dropdown-text/span  30s
        click element  //px-dropdown/div/px-dropdown-text/span
        sleep  3s
        click element  //px-dropdown/div[2]/px-dropdown-content/div/ul/li[3]
        sleep  28s
        element should not be visible  ${spinner}
        element should not contain  ${heatmap}  ${spinner}
        ${buyer name from heatmap}  get text  ${heatmap_row1}
        log  ${buyer name from heatmap}
        scroll page to location  0  1000000000
        element should not contain  ${data_grid}  ${spinner}

User select Buyer from vendor dropdown user should see data in grid related to buyer for lt reduction
       wait until element is visible  ${opportunity_dropdown}  10s
       click element  ${opportunity_dropdown}
       click element  ${lt reduction dropdown}
        sleep  28s
        element should not be visible  ${spinner}
        element should not contain  ${heatmap}  ${spinner}
        ${buyer name from heatmap}  get text  ${heatmap_row1}
        log  ${buyer name from heatmap}
        scroll page to location  0  1000000000
        element should not contain  ${data_grid}  ${spinner}

User select Buyer from vendor dropdown user should see data in grid related to buyer for fullfillment risk
       scroll page to location  10000000  0
       sleep  2s
       wait until element is visible  ${opportunity_dropdown}  10s
       click element  ${opportunity_dropdown}
       click element  ${fullfillment_risk_dropdown}
       sleep  28s
        element should not be visible  ${spinner}
        element should not contain  ${heatmap}  ${spinner}
        ${buyer name from heatmap}  get text  ${heatmap_row1}
        log  ${buyer name from heatmap}
        scroll page to location  0  1000000000
        element should not contain  ${data_grid}  ${spinner}

User click on Trends
        wait until element is visible  ${trend button_lta}  10s
        click element  ${trend button_lta}
        sleep  3s

User should see PO AMOUNT dropdown as default bar chart
       element should be visible  ${po amount dropdown}
       element should be enabled  ${po amount dropdown}
       element should be visible  ${po amount barchart}
       scroll page to location   0  100000
       element should be enabled  ${po amount barchart}

User click on po amount dropdown and select po line
      click element  ${po amount dropdown}
      click element  ${po count}

User should see poline bar chart in ui
       element should be visible  ${po count dropdown}
       element should be enabled  ${po count dropdown}
       element should be visible  ${po count barchart}
       scroll page to location  0  10000000
       element should be enabled  ${po count barchart}
       element should be visible  //*[@id="rollingchart"]
       element should be enabled  //*[@id="rollingchart"]