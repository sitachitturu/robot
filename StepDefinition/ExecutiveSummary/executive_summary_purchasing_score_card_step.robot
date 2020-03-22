*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Library  RequestsLibrary
Library  Process
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User access "${link}" module
         wait until element is not visible  ${Page Spinner}  15s
         click link   ${link}
         sleep  25s
         wait until page contains  addFilterBtn   10s

User should see "purchase Requisitions" score card with "Purchase Requisitions" title,"On-time PR","NO Source","Avg OVD Days" on it
         wait until element is visible  ${purchasing_score_card}  30s
         element should contain  ${purchasing_score_card}  Purchase Requisitions
         element should contain  ${purchasing_score_card}  On-time PR
         element should contain  ${purchasing_score_card}  No Source
         element should contain  ${purchasing_score_card}  Avg OVD Days

User should see right number for On-Time PR in purchase requisitions score card
        click element  ${purchase_requisition module}
        sleep  15s
        ${text}  get text  ${significantly Aged col}
        log  ${text}
        ${TempString3}  replace string  ${text}  |  ${EMPTY}
       ${TempString1}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString1}
       ${text3..}  execute javascript  var string = "${TempString1}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text3..}
       ${convert}  convert to string  ${text3..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${Total_sig_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
        log  ${Total_sig_col_value}

        click element  ${purchase_orders module}
        sleep  15s

        ${text1}  get text  ${30+days_total}
        ${TempString2}  replace string  ${text1}  |  ${EMPTY}
       ${TempString2..}  replace string  ${TempString2}  ,  ${EMPTY}
       log  ${TempString2..}
       ${text2..}  execute javascript  var string = "${TempString2..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text2..}
       ${convert}  convert to string  ${text2..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${Total_30+days_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
       log  ${Total_30+days_col_value}

        ${text2}  get text  ${<30days_total}
        ${TempString22}  replace string  ${text2}  |  ${EMPTY}
       ${TempString22..}  replace string  ${TempString22}  ,  ${EMPTY}
       log  ${TempString22..}
       ${text3..}  execute javascript  var string = "${TempString22..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text3..}
       ${convert}  convert to string  ${text3..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${Total_<30days_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
       log  ${Total_<30days_col_value}

        ${text3}  get text  ${future_total}
        ${TempString4}  replace string  ${text3}  |  ${EMPTY}
       ${TempString4..}  replace string  ${TempString4}  ,  ${EMPTY}
       log  ${TempString4..}
       ${text4..}  execute javascript  var string = "${TempString4..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${Total_future_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
       log  ${Total_future_col_value}

        ${result}  evaluate  ${Total_30+days_col_value}+${Total_<30days_col_value}+${Total_future_col_value}
        log  ${result}
        ${output}  execute javascript  var x = `${Total_sig_col_value}`;var y = `${result}`;var z = 100-((x / y)*100); return z
        log  ${output}
        ${result2}  execute javascript  if (`${output}` <= '0.00' || `${output}` == 'undefined' || `${output}` == 'null' ){ return '0';}; var num=0; if(${output} > 0 ){if(${output}> 999999999){num  = (${output}/1000000000).toFixed(1); return num;} else if(${output}> 999999){num  = (${output}/1000000).toFixed(1); return num;}  else if(${output}> 999){num  = (${output}/1000).toFixed(1); return num;}else if(${output}> 99){num  = (${output}/100).toFixed(1); return num;}else if(${output}> 9){num  = ((${output}*10)/10).toFixed(1); return num;}else if(${output}> 0){num  = ${output}.toFixed(1); return num;}else if(${output}< 0){return num;}};
        log  ${result2}
        click element  ${Executive-Summary Iicon}
        wait until element does not contain  ${value_on-time-po}  --  40s
        ${on-time-po}  get text  ${value_on-time-po}
        log  ${on-time-po}
        run keyword and continue on failure  should be equal as numbers  ${on-time-po}  ${result2}
#      ${bar}  execute javascript  if(${on-time-po} <= 80.0){${accuracy_bar} = "#E53838";}else if (${on-time-po}<=90.0){${accuracy_bar}  = "#EDDD46";}else if(${on-time-po}>90.0){${accuracy_bar}  = "#60BD68";}
#      log  ${bar}

User should see right number for No Source in purchase requisitions score card
        click element  ${purchase_requisition module}
        sleep  15s
        ${value}  get text  ${heatmap_total_col}
        log  ${value}
        ${TempString2}  replace string  ${value}  |  ${EMPTY}
        ${TempString2..}  replace string  ${TempString2}  ,  ${EMPTY}
        log  ${TempString2..}
        ${text2..}  execute javascript  var string = "${TempString2..}"; var returnStr = string.split(" ",1); return returnStr;
        log  ${text2..}
        ${convert}  convert to string  ${text2..}
        ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
        ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
        ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
        ${Total_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
        log  ${Total_col_value}
        wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        click element  //*[@id='filterlist']//input[@value='source']
        click button  continue
        click element  source
        sleep  10s
        wait until element is visible  search-input  10s
    input text  search-input  No Source
    double click element  ${lazy_loading_search_icon_filter}
    sleep  4s
        click element  No Source
        ${sourceValue}  Get Text  ${no_source}
        ${TempString}  replace string  ${sourceValue}  (  ${EMPTY}
        ${TempString}  replace string  ${TempString}  )  ${EMPTY}
        ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
        ${TempInteger}  convert to integer  ${TempString}
        log  ${TempInteger}
        click element  ${no_source_Apply Button}
        sleep  15s
        ${output}  execute javascript  var x = `${TempInteger}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
        log  ${output}
        ${result2}  execute javascript  if (`${output}` == '0.00' || `${output}` == 'undefined' || `${output}` == 'null' ){ return '0';}; var num=0; if(${output} > 0 ){if(${output}> 999999999){num  = (${output}/1000000000).toFixed(1); return num;} else if(${output}> 999999){num  = (${output}/1000000).toFixed(1); return num;}  else if(${output}> 999){num  = (${output}/1000).toFixed(1); return num;}else if(${output}> 99){num  = (${output}/100).toFixed(1); return num;}else if(${output}> 0){num  = ${output}.toFixed(1); return num;}else if(${output}< 0){return num;}};
        log  ${result2}
        click element  ${Executive-Summary Iicon}
        wait until element contains  //*[@id="actionStat"]  ${result2}%  40s
#        ${no-source}  get text  //*[@id="actionStat"]
#        log  ${no-source}
#        run keyword and continue on failure  should match regexp  ${no-source}  ${result2}

User should see right number for AVG OVD in purchase requisitions score card
    ${avg_ovd_days_value_in_score_card}  get text  //mo-bar[@title='Avg OVD Days']//span[@id='actionStat']
    log to console  ${avg_ovd_days_value_in_score_card}
    ${avg_ovd_days_value_in_score_card..}  replace string using regexp  ${avg_ovd_days_value_in_score_card}  \\Days|\,  ${EMPTY}
    log  ${avg_ovd_days_value_in_score_card..}
    connect to database  dbConfigFile=${dbfile}
    ${avg_OVD_DAYS}  query  select cast(sum(net_days_for_age_bucket) as float)/cast(count(age_bucket) as float) from public.purchase_reqs_v where age_bucket != '<0';
    log  ${avg_OVD_DAYS}
    ${queryResults}  Evaluate  '${avg_OVD_DAYS}'.replace(',','')
    ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
    ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
    ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
    ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
    log  ${queryResults1}
    ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
    log  ${queryResultLength}
    ${queryResults1..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
    log  ${queryResults1..}
    ${tup1}  Set Variable  ${queryResults1..}
    ${DB_Avg_ovd_days_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
    log to console  ${DB_Avg_ovd_days_value}
    run keyword and continue on failure  should be equal  ${avg_ovd_days_value_in_score_card..}  ${DB_Avg_ovd_days_value}

select one by one business from plant business filter then the number in Avg Ovd days in PR score card should match to the PR query in db
      wait until element is visible  addFilterBtn  20s
      click element  addFilterBtn
      wait until element is visible  //*[@id='filterlist']//input[@value='business']   10s
      click element  //*[@id='filterlist']//input[@value='business']
      wait until element is visible  continue  20s
      click element  continue
      sleep  3s
      ${plant_file}  get file  ${plant_business_textfile_data}
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  click element  business
      \  sleep  4s
      \  click element  product-${item}
      \  wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span  20s
      \  click element  //mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
      \  ${text1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
      \  log to console  ${text1}
      \  wait until element is visible  ${business_Apply Button}  20s
      \  click element  ${business_Apply Button}
      \  sleep  10s
      \  ${avg_ovd_days_value_in_score_card}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
      \  log to console  ${avg_ovd_days_value_in_score_card}
      \  ${avg_ovd_days_value_in_score_card..}  replace string using regexp  ${avg_ovd_days_value_in_score_card}  \\Days|\,  ${EMPTY}
      \  log  ${avg_ovd_days_value_in_score_card..}
      \  connect to database  dbConfigFile=${dbfile}
      \  ${avg_OVD_DAYS}  query  select cast(sum(net_days_for_age_bucket) as float)/cast(count(age_bucket) as float) from public.purchase_reqs_v where plant_business = '${text1}' and age_bucket != '<0';
      \  log  ${avg_OVD_DAYS}
       \  ${queryResults}  Evaluate  '${avg_OVD_DAYS}'.replace(',','')
       \  ${queryResults}  Evaluate  '${queryResults}'.replace('(','')
       \  ${queryResults}  Evaluate  '${queryResults}'.replace(')','')
       \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
       \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
       \  ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
       \  log  ${queryResults1}
       \  ${queryResultLength}  execute javascript  return String(${queryResults1}).length;
       \  log  ${queryResultLength}
       \  ${queryResults1..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults1}};
       \  log  ${queryResults1..}
       \  ${tup1}  Set Variable  ${queryResults1..}
       \  ${DB_Avg_ovd_days_value}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){ num = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num = (${tup1}/1000000).toFixed(1); return num; } else if(${tup1}> 999){ num = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num = Number(${tup1}).toFixed(1); return num;} else if(${tup1}< 0){ return num; } };
       \  log to console  ${DB_Avg_ovd_days_value}
       \  run keyword and continue on failure  should be equal  ${avg_ovd_days_value_in_score_card..}  ${DB_Avg_ovd_days_value}
       \  click element  business
       \  sleep  3s
       \  click element  product-${item}
       \  wait until element is visible  ${business_Apply Button}  20s
       \  click element  ${business_Apply Button}
       \  sleep  4s