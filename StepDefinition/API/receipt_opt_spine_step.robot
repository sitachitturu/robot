6/26/2017.
212590906
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  RequestsLibrary
Library  Process
Library  Collections
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
           click link   ${link}
           sleep  20s
           wait until page contains  addFilterBtn  30s

User should see "${title}"
           xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1

User should see "Total Opportunity","Number Of opportunities","UpComing Opportunities($)","Upcoming Opportunities(#)" fields on spine
           wait until element is visible  spine  20s
           ${text}  get text  ${total_oppor_text}
           should be equal  ${text}  TOTAL OPPORTUNITY
           ${text1}  get text  ${number_of_oppor_text}
           should be equal  ${text1}  NUMBER OF OPPORTUNITIES
           ${text2}  get text  ${upcoming_oppor($)_text}
           should be equal  ${text2}  UPCOMING OPPORTUNITIES ($)
           ${text3}  get text  ${upcoming_oppor(#)_text}
           should be equal  ${text3}  UPCOMING OPPORTUNITIES (#)

Select vendor name from source/vendor filter and validate and compare value for "Total Opportunity" in spine with data base query for November month for "${push_days}" push days
            click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month = '11' and planned_date_year= '2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${queryResultLength}  execute javascript  return String(${queryResults}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults}};
            log  ${queryResults2..}
            ${tup1}  Set Variable  ${queryResults2..}
            ${DB_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_Oppertunity_value}
            ${DB_Total_Oppertunity..}  convert to string  ${DB_Total_Oppertunity_value}
            click element  ${2nd month button}
            sleep  7s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[4]-1=li[3] for next month
            sleep  10s
            wait until element is visible  ${ui_total_opp_spine_value}  20s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${DB_Total_Oppertunity..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s

validate and compare value for "Number Of Opportunities" in spine with data base query for Selected vendor and for selected November month for "${push_days}" push days
            click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  15s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${count}  ROW COUNT  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '11' and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${count}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '11' and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${queryResultLength}  execute javascript  return String(${queryResults}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults}};
            log  ${queryResults2..}
            ${tup1}  Set Variable  ${queryResults2..}
            ${DB_No_Of_Opportunities_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_No_Of_Opportunities_value}
            ${DB_No_Of_Opportunities_value..}  convert to string  ${DB_No_Of_Opportunities_value}
            sleep  10s
            wait until element is visible  ${ui_no_of_opp_spine_value}  20s
            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${DB_No_Of_Opportunities_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for November month andfor selected vendor for "${push_days}" push days
            click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  3s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('12') and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('1','2' ) and planned_date_year='${next_year}' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_upcoming_Oppertunity_value}
            ${DB_upcoming_Oppertunity_value..}  convert to string  ${DB_upcoming_Oppertunity_value}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${DB_upcoming_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for November month and for selected vendor for "${push_days}" push days
             click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  15s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('12') and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('1','2' ) and planned_date_year='${next_year}' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value(#)}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            ${DB_upcoming_Oppertunity_value(#)..}  convert to string  ${DB_upcoming_Oppertunity_value(#)}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${DB_upcoming_Oppertunity_value(#)..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
Select different buyers names from buyer filter and validate and compare value for "Total Opportunity" in spine with data base query for November month for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  5s
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            sleep  15s
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month = '11' and planned_date_year= '2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${tup}  Set Variable  ${queryResults}
            ${queryResultLength}  execute javascript  return String(${tup}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${tup}};
            log  ${queryResults2..}
            ${tup1}  set variable  ${queryResults2..}
            ${DB_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_Oppertunity_value}
            ${DB_Total_Oppertunity_value..}  convert to string  ${DB_Total_Oppertunity_value}
            wait until element is visible  ${ui_total_opp_spine_value}  20s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${DB_Total_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "Number Of Opportunities" in spine with data base query for Selected buyer names and for selected November month for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  5s
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${count}  ROW COUNT  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '11' and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${count}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '11' and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${DB_No_Of_Opportunities_value}  Set Variable  ${queryResults}
            wait until element is visible  ${ui_no_of_opp_spine_value}  20s
            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${DB_No_Of_Opportunities_value}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for November month andfor selected buyer names for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  5s
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
             ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('12') and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('1','2' ) and planned_date_year='2019' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_upcoming_Oppertunity_value}
            ${DB_upcoming_Oppertunity_value..}  convert to string  ${DB_upcoming_Oppertunity_value}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${DB_upcoming_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for November month and for selected buyers for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  5s
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('12') and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('1','2' ) and planned_date_year='2019' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
             ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value(#)}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            ${DB_upcoming_Oppertunity_value(#)..}  convert to string  ${DB_upcoming_Oppertunity_value(#)}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${DB_upcoming_Oppertunity_value(#)..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
Select vendor name from source/vendor filter and validate and compare value for "Total Opportunity" in spine with data base query for Ocotober month for "${push_days}" push days
            click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year= '2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${tup1}  Set Variable  ${queryResults2..}
            ${DB_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_Oppertunity_value}
            ${DB_Total_Oppertunity_value..}  convert to string  ${DB_Total_Oppertunity_value}
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
            sleep  10s
            wait until element is visible  ${ui_total_opp_spine_value}  20s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${DB_Total_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "Number Of Opportunities" in spine with data base query for Selected vendor and for selected Ocotober month for "${push_days}" push days
            click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${count}  ROW COUNT  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${count}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${DB_No_Of_Opportunities_value}  Set Variable  ${queryResults}
            wait until element is visible  ${ui_no_of_opp_spine_value}  20s
            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${DB_No_Of_Opportunities_value}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for Ocotober month andfor selected vendor for "${push_days}" push days
            click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_upcoming_Oppertunity_value}
            ${DB_upcoming_Oppertunity_value..}  convert to string  ${DB_upcoming_Oppertunity_value}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${DB_upcoming_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for Ocotober month and for selected vendor for "${push_days}" push days
            click element  source
            sleep  5s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and vendor_name='${vendor_name}' and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
             ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value(#)}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            ${DB_upcoming_Oppertunity_value(#)..}  convert to string  ${DB_upcoming_Oppertunity_value(#)}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${DB_upcoming_Oppertunity_value(#)..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
Select different buyers names from buyer filter and validate and compare value for "Total Opportunity" in spine with data base query for Ocotober month for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year= '2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${queryResultLength}  execute javascript  return String(${queryResults}).length;
            log  ${queryResultLength}
            ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults}};
            log  ${queryResults3..}
            ${buyer_db_value}  set variable  ${queryResults3..}
            ${conver1}  convert to string  ${buyer_db_value}
            ${tup1}  Set Variable  ${conver1}
            ${DB_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_Oppertunity_value}
            ${DB_Total_Oppertunity_value..}  convert to string  ${DB_Total_Oppertunity_value}
            wait until element is visible  ${ui_total_opp_spine_value}  20s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${DB_Total_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s

validate and compare value for "Number Of Opportunities" in spine with data base query for Selected buyer names and for selected Ocotober month for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${count}  ROW COUNT  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${count}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${DB_No_Of_Opportunities_value}  Set Variable  ${queryResults}
            wait until element is visible  ${ui_no_of_opp_spine_value}  20s
            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${DB_No_Of_Opportunities_value}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for Ocotober month andfor selected buyer names for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
             ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_upcoming_Oppertunity_value}
            ${DB_upcoming_Oppertunity_value..}  convert to string  ${DB_upcoming_Oppertunity_value}
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${DB_upcoming_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for Ocotober month and for selected buyers for "${push_days}" push days
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  5s
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and opportunity='opportunity' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value(#)}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            ${DB_upcoming_Oppertunity_value(#)..}  convert to string  ${DB_upcoming_Oppertunity_value(#)}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]   #future change required to li[3]-1=li[2] for next month
#            sleep  10s
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${DB_upcoming_Oppertunity_value(#)..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s

select <10 from push days dropdown
           wait until element is visible  //px-dropdown[3]/div/px-dropdown-text/span   20s
           click element  //px-dropdown[3]/div/px-dropdown-text/span
           wait until element is visible  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[2]   20s
           click element  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li
           sleep  7s

select <20 from push days drop down
           wait until element is visible  //px-dropdown[3]/div/px-dropdown-text/span   20s
           click element  //px-dropdown[3]/div/px-dropdown-text/span
           wait until element is visible  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[2]   20s
           click element  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[2]
           sleep  7s

select <30 from push days drop down
           wait until element is visible  //px-dropdown[3]/div/px-dropdown-text/span   20s
           click element  //px-dropdown[3]/div/px-dropdown-text/span
           wait until element is visible  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[3]   20s
           click element  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[3]
           sleep  3s

select >= 30from push days drop down
           wait until element is visible  //px-dropdown[3]/div/px-dropdown-text/span   20s
           click element  //px-dropdown[3]/div/px-dropdown-text/span
           wait until element is visible  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[4]   20s
           click element  //px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[4]
           sleep  3s
#=======================================================================================================================================

validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for November month and for selected buyers for "${push_days}" push days without opportunity
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[6]/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  5s
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  15s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('12') and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('1','2' ) and planned_date_year='2019' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
             ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value(#)}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            ${DB_upcoming_Oppertunity_value(#)..}  convert to string  ${DB_upcoming_Oppertunity_value(#)}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[4]-1=li[3] for next month
            sleep  15s
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${DB_Result}
             wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  3s
Select vendor name from source/vendor filter and validate and compare value for "Total Opportunity" in spine with data base query for Ocotober month for "${push_days}" push days without opportunity
              click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year= '2018' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${tup1}  Set Variable  ${queryResults2..}
            ${DB_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_Oppertunity_value}
            ${DB_Total_Oppertunity_value..}  convert to string  ${DB_Total_Oppertunity_value}
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
            sleep  10s
            wait until element is visible  ${ui_total_opp_spine_value}  20s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${DB_Total_Oppertunity_value..}
             wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  3s
validate and compare value for "Number Of Opportunities" in spine with data base query for Selected vendor and for selected Ocotober month for "${push_days}" push days without opportunity
              click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${count}  ROW COUNT  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${count}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${DB_No_Of_Opportunities_value}  Set Variable  ${queryResults}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
#            sleep  10s
            wait until element is visible  ${ui_no_of_opp_spine_value}  20s
            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${DB_No_Of_Opportunities_value}
              wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  3s
validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for Ocotober month andfor selected vendor for "${push_days}" push days without opportunity
              click element  source
            sleep  10s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            sleep  4s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  5s
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_upcoming_Oppertunity_value}
            ${DB_upcoming_Oppertunity_value..}  convert to string  ${DB_upcoming_Oppertunity_value}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
#            sleep  10s
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${DB_upcoming_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s

validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for Ocotober month and for selected vendor for "${push_days}" push days without opportunity
            click element  source
            sleep  5s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            sleep  2s
            ${vendor_name}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${vendor_name}
            wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and vendor_name='${vendor_name}' and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
             ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value(#)}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            ${DB_upcoming_Oppertunity_value(#)..}  convert to string  ${DB_upcoming_Oppertunity_value(#)}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
            sleep  15s
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${DB_Result}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
Select different buyers names from buyer filter and validate and compare value for "Total Opportunity" in spine with data base query for Ocotober month for "${push_days}" push days without opportunity

            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year= '2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${queryResultLength}  execute javascript  return String(${queryResults}).length;
            log  ${queryResultLength}
            ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults}};
            log  ${queryResults3..}
            ${buyer_db_value}  set variable  ${queryResults3..}
            ${conver1}  convert to string  ${buyer_db_value}
            ${tup1}  Set Variable  ${conver1}
            ${DB_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_Total_Oppertunity_value}
            ${DB_Total_Oppertunity_value..}  convert to string  ${DB_Total_Oppertunity_value}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
            sleep  10s
            wait until element is visible  ${ui_total_opp_spine_value}  20s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${DB_Total_Oppertunity_value..}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "Number Of Opportunities" in spine with data base query for Selected buyer names and for selected Ocotober month for "${push_days}" push days without opportunity
            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
            ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            connect to database  dbConfigFile=${dbfile}
            ${count}  ROW COUNT  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${count}
            ${queryResults1..}  QUERY  SELECT count(po_open_quantity) AS no FROM public.receipt_optimization_v where planned_date_month = '10' and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults}
            ${DB_No_Of_Opportunities_value}  Set Variable  ${queryResults}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
            sleep  10s
            wait until element is visible  ${ui_no_of_opp_spine_value}  20s
            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${DB_No_Of_Opportunities_value}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s
validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for Ocotober month andfor selected buyer names for "${push_days}" push days without opportunity

            click element  pgroup
            sleep  5s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span   20s
            click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
            ${buyer_name1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
            log  ${buyer_name1}
            ${buyer_name2}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox[2]/div[2]/span
            log  ${buyer_name2}
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  13s
             ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
            log  ${currentYear}
            ${next_year}  execute javascript  var nextyear= (${currentYear}+1);return nextyear;
            log  ${next_year}
            connect to database  dbConfigFile=${dbfile}
            ${november}  query  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('11','12') and planned_date_year='2018' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${november}
            ${convert}  convert to string  ${november}
            log  ${convert}
            ${queryResults_nov}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults_nov}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults_nov}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults_nov}
            ${queryResults1..}  QUERY  SELECT SUM(CAST(net_open_value_usd as BigInt)) AS opp FROM public.receipt_optimization_v where planned_date_month IN ('1') and planned_date_year='2019' and purchasing_group_name_buyer_name IN ('${buyer_name1}','${buyer_name2}') and "push_days"${push_days};
            log  ${queryResults1..}
            ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${queryResults1}
            ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
            log  ${queryResultLength}
            ${queryResults2..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
            log  ${queryResults2..}
            ${DB_Result}  evaluate  ${queryResults_nov}+${queryResults2..}
            log  ${DB_Result}
            ${tup1}  Set Variable  ${DB_Result}
            ${DB_upcoming_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${DB_upcoming_Oppertunity_value}
#            click element  ${2nd month button}
#            sleep  3s
#            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for next month
            sleep  10s
            wait until element is visible  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html  20s
            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${DB_upcoming_Oppertunity_value}
            wait until element is visible  clearFilterBtn  20s
            click element  clearFilterBtn
            sleep  5s

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for <10)
            ${token}  run   ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}

            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  6s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            sleep  7s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for <10)
            ${token}  run   ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B1%5D&monthby=%5B10%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
           # go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            click element  ${2nd month button}
            sleep  7s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'October')]  #future change required to li[3]-1=li[2] for october month
            sleep  15s

            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for <10)
            ${token}  run   ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B1%5D&monthby=%5B11%5D&yearby=%5B2018%5D&source_vendor=%5B%22INGETEAM%20LTDA%22%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            click element  ${2nd month button}
            sleep  7s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for november month
            sleep  15s

            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for <10)
            ${token}  run   ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B1%5D&monthby=%5B12%5D&yearby=%5B2018%5D&source_vendor=%5B%22INGETEAM%20LTDA%22%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            click element  ${2nd month button}
            sleep  7s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'December')]  #future change required to li[3]-1=li[2] for november month
            sleep  15s

            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for <20)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?monthby=%5B${currentMonth}%5D&pushdays=%5B2%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            click element  ${2nd month button}
            sleep  3s
            click element  //px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            run keyword  select <20 from push days drop down
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for <20)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B2%5D&monthby=%5B10%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'October')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for <20)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B2%5D&monthby=%5B11%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for <20)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B2%5D&monthby=%5B12%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'December')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for <30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?monthby=%5B${currentMonth}%5D&pushdays=%5B3%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            click element  ${2nd month button}
            sleep  3s
            click element  //px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            run keyword  select <30 from push days drop down
            sleep  3s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for <30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B3%5D&monthby=%5B10%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'October')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for <30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B3%5D&monthby=%5B11%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for <30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B3%5D&monthby=%5B12%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'December')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for >=30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
            log  ${currentMonth}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?monthby=%5B${currentMonth}%5D&pushdays=%5B4%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            click element  ${2nd month button}
            sleep  3s
            click element  //px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            run keyword  select >=30 from push days drop down
            sleep  3s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for >=30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B4%5D&monthby=%5B10%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'October')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for >=30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B4%5D&monthby=%5B11%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  3s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'November')]  #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for >=30)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/receiptoptimization/spineData?pushdays=%5B4%5D&monthby=%5B12%5D&dataBy=month  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["data"]["current_period"]}
            log  ${json["data"]["total_opportunity"]}
            log  ${json["data"]["total_poNumber"]}
            log  ${json["data"]["upcoming_opportunity"]}
            log  ${json["data"]["upcoming_period"]}
            log  ${json["data"]["upcoming_ponumber"]}
            [Return]  ${resp}
            #go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/receipt-optimization
            sleep  3s
            ${tup1}  set variable  ${json["data"]["total_opportunity"]}
            ${API_Total_Oppertunity_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${API_Total_Oppertunity_value}
            ${tup2}  set variable  ${json["data"]["upcoming_opportunity"]}
            ${API_upcoming_opportunity_value}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(1); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${API_upcoming_opportunity_value}

            #run keyword  select <20 from push days drop down
            click element  ${2nd month button}
            sleep  23s
            click element  //ul[@id='list']//li[contains(normalize-space(), 'December')]   #future change required to li[3]-1=li[2] for october month
            sleep  17s
            ${UI_total_oppor_spine_value}  get text  ${ui_total_opp_spine_value}
            ${ui_total_oppurtunity_value}  replace string using regexp  ${UI_total_oppor_spine_value}  \\$|\,  ${EMPTY}
            log  ${ui_total_oppurtunity_value}
            should be equal  ${ui_total_oppurtunity_value}  ${API_Total_Oppertunity_value}

            ${UI_NO.OF OPPORTUNITIES_VALUE}  get text  ${ui_no_of_opp_spine_value}
            log  ${UI_NO.OF OPPORTUNITIES_VALUE}
            should be equal  ${UI_NO.OF OPPORTUNITIES_VALUE}  ${json["data"]["total_poNumber"]}

            ${ui_upcoming_oppor_value}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
            ${ui_upcoming_oppurtunities_value}  replace string using regexp  ${ui_upcoming_oppor_value}  \\$|\,  ${EMPTY}
            log  ${ui_upcoming_oppurtunities_value}
            should be equal  ${ui_upcoming_oppurtunities_value}  ${API_upcoming_opportunity_value}

            ${ui_upcoming_oppor_value(#)}  get text  //*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
            should be equal  ${ui_upcoming_oppor_value(#)}  ${json["data"]["upcoming_ponumber"]}

            ${default_current_month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[2]/div/div/span[2]/span[2]
            log  ${default_current_month}
            should be equal  ${default_current_month}  ${json["data"]["current_period"]}

            ${upcoming_months for current month}  get text  //mo-receipt-optimization/px-spine/div/div/div/div[3]/div/div/div/span[2]/span
            log  ${upcoming_months for current month}
            ${upcoming_months for current month..}  fetch from right  ${upcoming_months for current month}  ${SPACE}
            log  ${upcoming_months for current month..}
            should be equal  ${json["data"]["upcoming_period"]}  ${upcoming_months for current month..}

select vendor from vendor filter
            click element  source
            sleep  13s
            click element  //mm-filter[5]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            click element  //mm-filter[5]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[5]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[3]/div
            wait until element is visible  ${vendor_apply_button}  20s
            click element  ${vendor_apply_button}
            sleep  17s

Select buyers from buyer filter
            click element  pgroup
            sleep  3s
            click element  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
            click element  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div
            click element  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[3]/div
            wait until element is visible  ${buyer_apply_button}  20s
            click element  ${buyer_apply_button}
            sleep  7s
