*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  RequestsLibrary
Library  Process
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/stock_policy_dashboard_variables.robot

*** Keywords ***
User access "${link}" module
         click link   ${link}
         sleep  30s
         #wait until page contains  addFilterBtn  10s

User should see safety stock bar chart today date value same as today values in pichart for weekly view
         #wait until element is visible  //*[@id="ssdashboard"]/mo-stock-policy-dashboard/section[2]  10s
         ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
         log  ${day}
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/weeks  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_ss"]}
            log  ${json[0]["increase_ss"]}
            ${tup1}  set variable  ${json[0]["decrease_ss"]}
            log  ${tup1}
            ${barchart_decrease_ss}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ss}
            ${pie_chart_decrease_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[0].innerText;return x;
            log  ${pie_chart_decrease_ss}
            ${pie_chart_decrease_ss.}  replace string using regexp  ${pie_chart_decrease_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ss..}  replace string using regexp  ${pie_chart_decrease_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ss...}  replace string using regexp  ${pie_chart_decrease_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ss....}  replace string using regexp  ${pie_chart_decrease_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ss....}
            ${pie_chart_decrease_ss1....}  execute javascript  var value = `${pie_chart_decrease_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ss1....}
            should be equal as numbers  ${pie_chart_decrease_ss1....}  ${barchart_decrease_ss}
            ${tup2}  set variable  ${json[0]["increase_ss"]}
            log  ${tup2}
            ${barchart_increase_ss}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_ss}
            ${pie_chart_increase_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[1].innerText;return x;
            log  ${pie_chart_increase_ss}
            ${pie_chart_increase_ss.}  replace string using regexp  ${pie_chart_increase_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_ss..}  replace string using regexp  ${pie_chart_increase_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_ss...}  replace string using regexp  ${pie_chart_increase_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_ss....}  replace string using regexp  ${pie_chart_increase_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_ss....}
            ${pie_chart_increase_ss1....}  execute javascript  var value = `${pie_chart_increase_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_ss1....}
            should be equal as numbers  ${pie_chart_increase_ss1....}  ${barchart_increase_ss}

User should see reorder point bar chart today date value same as today values in pichart for weekly view
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/weeks  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_rop"]}
            log  ${json[0]["increase_rop"]}
            ${tup1}  set variable  ${json[0]["decrease_rop"]}
            log  ${tup1}
            ${barchart_decrease_rop}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_rop}
            ${pie_chart_decrease_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[2].innerText;return x;
            log  ${pie_chart_decrease_rop}
            ${pie_chart_decrease_rop.}  replace string using regexp  ${pie_chart_decrease_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_rop..}  replace string using regexp  ${pie_chart_decrease_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_rop...}  replace string using regexp  ${pie_chart_decrease_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_rop....}  replace string using regexp  ${pie_chart_decrease_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_rop....}
            ${pie_chart_decrease_rop1....}  execute javascript  var value = `${pie_chart_decrease_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_rop1....}
            should be equal as numbers  ${pie_chart_decrease_rop1....}  ${barchart_decrease_rop}
            ${tup2}  set variable  ${json[0]["increase_rop"]}
            log  ${tup2}
            ${barchart_increase_rop}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_rop}
            ${pie_chart_increase_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[3].innerText;return x;
            log  ${pie_chart_increase_rop}
            ${pie_chart_increase_rop.}  replace string using regexp  ${pie_chart_increase_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_rop..}  replace string using regexp  ${pie_chart_increase_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_rop...}  replace string using regexp  ${pie_chart_increase_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_rop....}  replace string using regexp  ${pie_chart_increase_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_rop....}
            ${pie_chart_increase_rop1....}  execute javascript  var value = `${pie_chart_increase_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_rop1....}
            should be equal as numbers  ${pie_chart_increase_rop1....}  ${barchart_increase_rop}

User should see Minimum Order Quantity bar chart today date value same as today values in pichart for weekly view
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/weeks  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_moq"]}
            log  ${json[0]["increase_moq"]}
            ${tup1}  set variable  ${json[0]["decrease_moq"]}
            log  ${tup1}
            ${barchart_decrease_moq}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_moq}
            ${pie_chart_decrease_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[4].innerText;return x;
            log  ${pie_chart_decrease_moq}
            ${pie_chart_decrease_moq.}  replace string using regexp  ${pie_chart_decrease_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_moq..}  replace string using regexp  ${pie_chart_decrease_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_moq...}  replace string using regexp  ${pie_chart_decrease_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_moq....}  replace string using regexp  ${pie_chart_decrease_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_moq....}
            ${pie_chart_decrease_moq1....}  execute javascript  var value = `${pie_chart_decrease_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_moq1....}
            should be equal as numbers  ${pie_chart_decrease_moq1....}  ${barchart_decrease_moq}
            ${tup2}  set variable  ${json[0]["increase_moq"]}
            log  ${tup2}
            ${barchart_increase_moq}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_moq}
            ${pie_chart_increase_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[5].innerText;return x;
            log  ${pie_chart_increase_moq}
            ${pie_chart_increase_moq.}  replace string using regexp  ${pie_chart_increase_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_moq..}  replace string using regexp  ${pie_chart_increase_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_moq...}  replace string using regexp  ${pie_chart_increase_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_moq....}  replace string using regexp  ${pie_chart_increase_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_moq....}
            ${pie_chart_increase_moq1....}  execute javascript  var value = `${pie_chart_increase_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_moq1....}
            should be equal as numbers  ${pie_chart_increase_moq1....}  ${barchart_increase_moq}

User should see safety stock bar chart today date value same as today values in pichart for monthly view
            ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
            log  ${day}
            ${month view}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return x;
            log  ${month view}
            set global variable  ${month view}
            click element  ${month view}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${month option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS > option:nth-child(2)');return x;
            click element  ${month option from dropdown}
            set global variable  ${month option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/months  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_ss"]}
            log  ${json[0]["increase_ss"]}
            ${tup1}  set variable  ${json[0]["decrease_ss"]}
            log  ${tup1}
            ${barchart_decrease_ss}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ss}
            ${pie_chart_decrease_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[0].innerText;return x;
            log  ${pie_chart_decrease_ss}
            ${pie_chart_decrease_ss.}  replace string using regexp  ${pie_chart_decrease_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ss..}  replace string using regexp  ${pie_chart_decrease_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ss...}  replace string using regexp  ${pie_chart_decrease_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ss....}  replace string using regexp  ${pie_chart_decrease_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ss....}
            ${pie_chart_decrease_ss1....}  execute javascript  var value = `${pie_chart_decrease_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ss1....}
            should be equal as numbers  ${pie_chart_decrease_ss1....}  ${barchart_decrease_ss}
            ${tup2}  set variable  ${json[0]["increase_ss"]}
            log  ${tup2}
            ${barchart_increase_ss}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_ss}
            ${pie_chart_increase_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[1].innerText;return x;
            log  ${pie_chart_increase_ss}
            ${pie_chart_increase_ss.}  replace string using regexp  ${pie_chart_increase_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_ss..}  replace string using regexp  ${pie_chart_increase_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_ss...}  replace string using regexp  ${pie_chart_increase_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_ss....}  replace string using regexp  ${pie_chart_increase_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_ss....}
            ${pie_chart_increase_ss1....}  execute javascript  var value = `${pie_chart_increase_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_ss1....}
            should be equal as numbers  ${pie_chart_increase_ss1....}  ${barchart_increase_ss}

User should see reorder point bar chart today date value same as today values in pichart for monthly view
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${month view in rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP');return x;
            log  ${month view in rop}
            set global variable  ${month view in rop}
            click element  ${month view in rop}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${month option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP > option:nth-child(2)');return x;
            click element  ${month option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/rop/months  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_rop"]}
            log  ${json[0]["increase_rop"]}
            ${tup1}  set variable  ${json[0]["decrease_rop"]}
            log  ${tup1}
            ${barchart_decrease_rop}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_rop}
            ${pie_chart_decrease_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[2].innerText;return x;
            log  ${pie_chart_decrease_rop}
            ${pie_chart_decrease_rop.}  replace string using regexp  ${pie_chart_decrease_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_rop..}  replace string using regexp  ${pie_chart_decrease_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_rop...}  replace string using regexp  ${pie_chart_decrease_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_rop....}  replace string using regexp  ${pie_chart_decrease_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_rop....}
            ${pie_chart_decrease_rop1....}  execute javascript  var value = `${pie_chart_decrease_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_rop1....}
            should be equal as numbers  ${pie_chart_decrease_rop1....}  ${barchart_decrease_rop}
            ${tup2}  set variable  ${json[0]["increase_rop"]}
            log  ${tup2}
            ${barchart_increase_rop}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_rop}
            ${pie_chart_increase_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[3].innerText;return x;
            log  ${pie_chart_increase_rop}
            ${pie_chart_increase_rop.}  replace string using regexp  ${pie_chart_increase_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_rop..}  replace string using regexp  ${pie_chart_increase_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_rop...}  replace string using regexp  ${pie_chart_increase_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_rop....}  replace string using regexp  ${pie_chart_increase_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_rop....}
            ${pie_chart_increase_rop1....}  execute javascript  var value = `${pie_chart_increase_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_rop1....}
            should be equal as numbers  ${pie_chart_increase_rop1....}  ${barchart_increase_rop}

User should see Minimum Order Quantity bar chart today date value same as today values in pichart for monthly view
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${month view in MOQ}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ');return x;
            log  ${month view in MOQ}
            set global variable  ${month view in MOQ}
            click element  ${month view in MOQ}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${month option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ > option:nth-child(2)');return x;
            click element  ${month option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/moq/months  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_moq"]}
            log  ${json[0]["increase_moq"]}
            ${tup1}  set variable  ${json[0]["decrease_moq"]}
            log  ${tup1}
            ${barchart_decrease_moq}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_moq}
            ${pie_chart_decrease_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[4].innerText;return x;
            log  ${pie_chart_decrease_moq}
            ${pie_chart_decrease_moq.}  replace string using regexp  ${pie_chart_decrease_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_moq..}  replace string using regexp  ${pie_chart_decrease_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_moq...}  replace string using regexp  ${pie_chart_decrease_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_moq....}  replace string using regexp  ${pie_chart_decrease_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_moq....}
            ${pie_chart_decrease_moq1....}  execute javascript  var value = `${pie_chart_decrease_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_moq1....}
            should be equal as numbers  ${pie_chart_decrease_moq1....}  ${barchart_decrease_moq}
            ${tup2}  set variable  ${json[0]["increase_moq"]}
            log  ${tup2}
            ${barchart_increase_moq}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_moq}
            ${pie_chart_increase_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[5].innerText;return x;
            log  ${pie_chart_increase_moq}
            ${pie_chart_increase_moq.}  replace string using regexp  ${pie_chart_increase_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_moq..}  replace string using regexp  ${pie_chart_increase_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_moq...}  replace string using regexp  ${pie_chart_increase_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_moq....}  replace string using regexp  ${pie_chart_increase_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_moq....}
            ${pie_chart_increase_moq1....}  execute javascript  var value = `${pie_chart_increase_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_moq1....}
            should be equal as numbers  ${pie_chart_increase_moq1....}  ${barchart_increase_moq}

User should see safety stock bar chart today date value same as today values in pichart for Quarterly view
            ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
            log  ${day}
            ${quarterly view in ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return x;
            log  ${quarterly view in ss}
            click element  ${quarterly view in ss}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${quarterly option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS > option:nth-child(3)');return x;
            click element  ${quarterly option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/quarters  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_ss"]}
            log  ${json[0]["increase_ss"]}
            ${tup1}  set variable  ${json[0]["decrease_ss"]}
            log  ${tup1}
            ${barchart_decrease_ss}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ss}
            ${pie_chart_decrease_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[0].innerText;return x;
            log  ${pie_chart_decrease_ss}
            ${pie_chart_decrease_ss.}  replace string using regexp  ${pie_chart_decrease_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ss..}  replace string using regexp  ${pie_chart_decrease_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ss...}  replace string using regexp  ${pie_chart_decrease_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ss....}  replace string using regexp  ${pie_chart_decrease_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ss....}
            ${pie_chart_decrease_ss1....}  execute javascript  var value = `${pie_chart_decrease_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ss1....}
            should be equal as numbers  ${pie_chart_decrease_ss1....}  ${barchart_decrease_ss}
            ${tup2}  set variable  ${json[0]["increase_ss"]}
            log  ${tup2}
            ${barchart_increase_ss}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_ss}
            ${pie_chart_increase_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[1].innerText;return x;
            log  ${pie_chart_increase_ss}
            ${pie_chart_increase_ss.}  replace string using regexp  ${pie_chart_increase_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_ss..}  replace string using regexp  ${pie_chart_increase_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_ss...}  replace string using regexp  ${pie_chart_increase_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_ss....}  replace string using regexp  ${pie_chart_increase_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_ss....}
            ${pie_chart_increase_ss1....}  execute javascript  var value = `${pie_chart_increase_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_ss1....}
            should be equal as numbers  ${pie_chart_increase_ss1....}  ${barchart_increase_ss}

User should see reorder point bar chart today date value same as today values in pichart for Quarterly view
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${quarterly view in rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP');return x;
            log  ${quarterly view in rop}
            click element  ${quarterly view in rop}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${quarterly option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP > option:nth-child(3)');return x;
            click element  ${quarterly option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/rop/quarters  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_rop"]}
            log  ${json[0]["increase_rop"]}
            ${tup1}  set variable  ${json[0]["decrease_rop"]}
            log  ${tup1}
            ${barchart_decrease_rop}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_rop}
            ${pie_chart_decrease_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[2].innerText;return x;
            log  ${pie_chart_decrease_rop}
            ${pie_chart_decrease_rop.}  replace string using regexp  ${pie_chart_decrease_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_rop..}  replace string using regexp  ${pie_chart_decrease_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_rop...}  replace string using regexp  ${pie_chart_decrease_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_rop....}  replace string using regexp  ${pie_chart_decrease_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_rop....}
            ${pie_chart_decrease_rop1....}  execute javascript  var value = `${pie_chart_decrease_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_rop1....}
            should be equal as numbers  ${pie_chart_decrease_rop1....}  ${barchart_decrease_rop}
            ${tup2}  set variable  ${json[0]["increase_rop"]}
            log  ${tup2}
            ${barchart_increase_rop}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_rop}
            ${pie_chart_increase_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[3].innerText;return x;
            log  ${pie_chart_increase_rop}
            ${pie_chart_increase_rop.}  replace string using regexp  ${pie_chart_increase_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_rop..}  replace string using regexp  ${pie_chart_increase_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_rop...}  replace string using regexp  ${pie_chart_increase_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_rop....}  replace string using regexp  ${pie_chart_increase_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_rop....}
            ${pie_chart_increase_rop1....}  execute javascript  var value = `${pie_chart_increase_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_rop1....}
            should be equal as numbers  ${pie_chart_increase_rop1....}  ${barchart_increase_rop}

User should see Minimum Order Quantity bar chart today date value same as today values in pichart for Quarterly view
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${quarterly view in moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ');return x;
            log  ${quarterly view in moq}
            click element  ${quarterly view in moq}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${quarterly option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ > option:nth-child(3)');return x;
            click element  ${quarterly option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/moq/quarters  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_moq"]}
            log  ${json[0]["increase_moq"]}
            ${tup1}  set variable  ${json[0]["decrease_moq"]}
            log  ${tup1}
            ${barchart_decrease_moq}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_moq}
            ${pie_chart_decrease_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[4].innerText;return x;
            log  ${pie_chart_decrease_moq}
            ${pie_chart_decrease_moq.}  replace string using regexp  ${pie_chart_decrease_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_moq..}  replace string using regexp  ${pie_chart_decrease_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_moq...}  replace string using regexp  ${pie_chart_decrease_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_moq....}  replace string using regexp  ${pie_chart_decrease_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_moq....}
            ${pie_chart_decrease_moq1....}  execute javascript  var value = `${pie_chart_decrease_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_moq1....}
            should be equal as numbers  ${pie_chart_decrease_moq1....}  ${barchart_decrease_moq}
            ${tup2}  set variable  ${json[0]["increase_moq"]}
            log  ${tup2}
            ${barchart_increase_moq}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(1); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_moq}
            ${pie_chart_increase_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[5].innerText;return x;
            log  ${pie_chart_increase_moq}
            ${pie_chart_increase_moq.}  replace string using regexp  ${pie_chart_increase_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_moq..}  replace string using regexp  ${pie_chart_increase_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_moq...}  replace string using regexp  ${pie_chart_increase_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_moq....}  replace string using regexp  ${pie_chart_increase_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_moq....}
            ${pie_chart_increase_moq1....}  execute javascript  var value = `${pie_chart_increase_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_moq1....}
            should be equal as numbers  ${pie_chart_increase_moq1....}  ${barchart_increase_moq}

click on reset filter button
           ${reset button}  execute javascript  var button=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('header > div > button.filter--controls-reset > px-icon');return button;
           set global variable  ${reset button}
           click element  ${reset button}
           sleep  16s

1User should see safety stock bar chart today date value same as today values in pichart for weekly view for business "${TEXT}"
         ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
         log  ${day}
         ${expand button}  execute javascript  var v=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('header > div > button.filter--controls-expand');return v;
         set global variable  ${expand button}
         click element  ${expand button}
         sleep  4s
         ${business filter}  execute javascript  var x=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn');return x;
         set global variable  ${business filter}
         click element  ${business filter}
         sleep  4s
         ${business_text}  execute javascript  var k=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#product-${TEXT} > div > span.name');return k;
         click element  ${business_text}
         ${business_Apply button..}  execute javascript  var button=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#ApplyBtn');return button;
         set global variable  ${business_Apply Button..}
         click element  ${business_Apply Button..}
         sleep  8s
         click element  ${expand button}
         ##${expand1}  dom:document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS')
         sleep  2s
         ${ss weekly}  execute javascript  var a=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return a;
         click element  ${ss weekly}
         ${weekly from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS > option:nth-child(1)');return x;
         click element  ${weekly from dropdown}
         sleep  4s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/weeks?business=%5B%22${TEXT}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_ss"]}
            log  ${json[0]["increase_ss"]}
            ${tup1}  set variable  ${json[0]["decrease_ss"]}
            log  ${tup1}
            ${barchart_decrease_ss}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ss}
            ${pie_chart_decrease_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[0].innerText;return x;
            log  ${pie_chart_decrease_ss}
            ${pie_chart_decrease_ss.}  replace string using regexp  ${pie_chart_decrease_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ss..}  replace string using regexp  ${pie_chart_decrease_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ss...}  replace string using regexp  ${pie_chart_decrease_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ss....}  replace string using regexp  ${pie_chart_decrease_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ss....}
            ${pie_chart_decrease_ss1....}  execute javascript  var value = `${pie_chart_decrease_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ss1....}
            should be equal as numbers  ${pie_chart_decrease_ss1....}  ${barchart_decrease_ss}
            ${tup2}  set variable  ${json[0]["increase_ss"]}
            log  ${tup2}
            ${barchart_increase_ss}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_ss}
            ${pie_chart_increase_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[1].innerText;return x;
            log  ${pie_chart_increase_ss}
            ${pie_chart_increase_ss.}  replace string using regexp  ${pie_chart_increase_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_ss..}  replace string using regexp  ${pie_chart_increase_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_ss...}  replace string using regexp  ${pie_chart_increase_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_ss....}  replace string using regexp  ${pie_chart_increase_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_ss....}
            ${pie_chart_increase_ss1....}  execute javascript  var value = `${pie_chart_increase_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_ss1....}
            should be equal as numbers  ${pie_chart_increase_ss1....}  ${barchart_increase_ss}

2User should see "rop" bar chart today date value same as today values in pichart for "${weeks}" view for business "${text1}"
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${ss weekly}  execute javascript  var a=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return a;
         click element  ${ss weekly}
         ${weekly from rop dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP > option:nth-child(1)');return x;
         click element  ${weekly from rop dropdown}
         sleep  4s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/rop/${weeks}?business=%5B%22${text1}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_rop"]}
            log  ${json[0]["increase_rop"]}
            ${tup1}  set variable  ${json[0]["decrease_rop"]}
            log  ${tup1}
            ${barchart_decrease_rop}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_rop}
            ${pie_chart_decrease_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[2].innerText;return x;
            log  ${pie_chart_decrease_rop}
            ${pie_chart_decrease_rop.}  replace string using regexp  ${pie_chart_decrease_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_rop..}  replace string using regexp  ${pie_chart_decrease_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_rop...}  replace string using regexp  ${pie_chart_decrease_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_rop....}  replace string using regexp  ${pie_chart_decrease_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_rop....}
            ${pie_chart_decrease_rop1....}  execute javascript  var value = `${pie_chart_decrease_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_rop1....}
            should be equal as numbers  ${pie_chart_decrease_rop1....}  ${barchart_decrease_rop}
            ${tup2}  set variable  ${json[0]["increase_rop"]}
            log  ${tup2}
            ${barchart_increase_rop}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_rop}
            ${pie_chart_increase_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[3].innerText;return x;
            log  ${pie_chart_increase_rop}
            ${pie_chart_increase_rop.}  replace string using regexp  ${pie_chart_increase_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_rop..}  replace string using regexp  ${pie_chart_increase_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_rop...}  replace string using regexp  ${pie_chart_increase_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_rop....}  replace string using regexp  ${pie_chart_increase_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_rop....}
            ${pie_chart_increase_rop1....}  execute javascript  var value = `${pie_chart_increase_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_rop1....}
            should be equal as numbers  ${pie_chart_increase_rop1....}  ${barchart_increase_rop}
scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

3User should see "moq" bar chart today date value same as today values in pichart for "${weeks}" view for business "${text2}"
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${ss weekly}  execute javascript  var a=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return a;
         click element  ${ss weekly}
         ${weekly from MOQ dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ > option:nth-child(1)');return x;
         click element  ${weekly from MOQ dropdown}
         sleep  4s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/moq/${weeks}?business=%5B%22${text2}%22%5D  headers=${headers}  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_moq"]}
            log  ${json[0]["increase_moq"]}
            ${tup1}  set variable  ${json[0]["decrease_moq"]}
            log  ${tup1}
            ${barchart_decrease_moq}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_moq}
            ${pie_chart_decrease_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[4].innerText;return x;
            log  ${pie_chart_decrease_moq}
            ${pie_chart_decrease_moq.}  replace string using regexp  ${pie_chart_decrease_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_moq..}  replace string using regexp  ${pie_chart_decrease_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_moq...}  replace string using regexp  ${pie_chart_decrease_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_moq....}  replace string using regexp  ${pie_chart_decrease_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_moq....}
            ${pie_chart_decrease_moq1....}  execute javascript  var value = `${pie_chart_decrease_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_moq1....}
            should be equal as numbers  ${pie_chart_decrease_moq1....}  ${barchart_decrease_moq}
            ${tup2}  set variable  ${json[0]["increase_moq"]}
            log  ${tup2}
            ${barchart_increase_moq}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_moq}
            ${pie_chart_increase_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[5].innerText;return x;
            log  ${pie_chart_increase_moq}
            ${pie_chart_increase_moq.}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_moq..}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_moq...}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_moq....}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_moq....}
            ${pie_chart_increase_moq1....}  run keyword and ignore error  execute javascript  var value = `${pie_chart_increase_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_moq1....}
            run keyword and ignore error  should be equal as numbers  ${pie_chart_increase_moq1....}  ${barchart_increase_moq}

4User should see safety stock bar chart today date value same as today values in pichart for "${months}" view for business "${TEXT3}"
            ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
            log  ${day}
            ${month view}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return x;
            log  ${month view}
            click element  ${month view}
            sleep  2s
            ${month option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS > option:nth-child(2)');return x;
            click element  ${month option from dropdown}
            sleep  12s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/${months}?business=%5B%22${TEXT3}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_ss"]}
            log  ${json[0]["increase_ss"]}
            ${tup1}  set variable  ${json[0]["decrease_ss"]}
            log  ${tup1}
            ${barchart_decrease_ss}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ss}
            ${pie_chart_decrease_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[0].innerText;return x;
            log  ${pie_chart_decrease_ss}
            ${pie_chart_decrease_ss.}  replace string using regexp  ${pie_chart_decrease_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ss..}  replace string using regexp  ${pie_chart_decrease_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ss...}  replace string using regexp  ${pie_chart_decrease_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ss....}  replace string using regexp  ${pie_chart_decrease_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ss....}
            ${pie_chart_decrease_ss1....}  execute javascript  var value = `${pie_chart_decrease_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ss1....}
            should be equal as numbers  ${pie_chart_decrease_ss1....}  ${barchart_decrease_ss}
            ${tup2}  set variable  ${json[0]["increase_ss"]}
            log  ${tup2}
            ${barchart_increase_ss}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_ss}
            ${pie_chart_increase_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[1].innerText;return x;
            log  ${pie_chart_increase_ss}
            ${pie_chart_increase_ss.}  replace string using regexp  ${pie_chart_increase_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_ss..}  replace string using regexp  ${pie_chart_increase_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_ss...}  replace string using regexp  ${pie_chart_increase_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_ss....}  replace string using regexp  ${pie_chart_increase_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_ss....}
            ${pie_chart_increase_ss1....}  execute javascript  var value = `${pie_chart_increase_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_ss1....}
            should be equal as numbers  ${pie_chart_increase_ss1....}  ${barchart_increase_ss}

5User should see Minimum Order Quantity bar chart today date value same as today values in pichart for "${months}" view for business "${text4}"
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
           ${month view in MOQ}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ');return x;
            log  ${month view in MOQ}
            set global variable  ${month view in MOQ}
            click element  ${month view in MOQ}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${month option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ > option:nth-child(2)');return x;
            click element  ${month option from dropdown}
            sleep  4s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/moq/${months}?business=%5B%22${text4}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_moq"]}
            log  ${json[0]["increase_moq"]}
            ${tup1}  set variable  ${json[0]["decrease_moq"]}
            log  ${tup1}
            ${barchart_decrease_moq}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_moq}
            ${pie_chart_decrease_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[4].innerText;return x;
            log  ${pie_chart_decrease_moq}
            ${pie_chart_decrease_moq.}  replace string using regexp  ${pie_chart_decrease_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_moq..}  replace string using regexp  ${pie_chart_decrease_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_moq...}  replace string using regexp  ${pie_chart_decrease_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_moq....}  replace string using regexp  ${pie_chart_decrease_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_moq....}
            ${pie_chart_decrease_moq1....}  execute javascript  var value = `${pie_chart_decrease_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_moq1....}
            should be equal as numbers  ${pie_chart_decrease_moq1....}  ${barchart_decrease_moq}
            ${tup2}  set variable  ${json[0]["increase_moq"]}
            log  ${tup2}
            ${barchart_increase_moq}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_moq}
            ${pie_chart_increase_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[5].innerText;return x;
            log  ${pie_chart_increase_moq}
            ${pie_chart_increase_moq.}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_moq..}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_moq...}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_moq....}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_moq....}
            ${pie_chart_increase_moq1....}  run keyword and ignore error  execute javascript  var value = `${pie_chart_increase_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_moq1....}
            run keyword and ignore error  should be equal as numbers  ${pie_chart_increase_moq1....}  ${barchart_increase_moq}

6User should see reorder point bar chart today date value same as today values in pichart for "${months}" view for business "${text5}"
           ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
           log  ${day}
            ${month view in rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP');return x;
            log  ${month view in rop}
            set global variable  ${month view in rop}
            click element  ${month view in rop}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${month option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP > option:nth-child(2)');return x;
            click element  ${month option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/moq/${months}?business=%5B%22${text5}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_rop"]}
            log  ${json[0]["increase_rop"]}
            ${tup1}  set variable  ${json[0]["decrease_rop"]}
            log  ${tup1}
            ${barchart_decrease_rop}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_rop}
            ${pie_chart_decrease_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[2].innerText;return x;
            log  ${pie_chart_decrease_rop}
            ${pie_chart_decrease_rop.}  replace string using regexp  ${pie_chart_decrease_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_rop..}  replace string using regexp  ${pie_chart_decrease_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_rop...}  replace string using regexp  ${pie_chart_decrease_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_rop....}  replace string using regexp  ${pie_chart_decrease_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_rop....}
            ${pie_chart_decrease_rop1....}  execute javascript  var value = `${pie_chart_decrease_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_rop1....}
            should be equal as numbers  ${pie_chart_decrease_rop1....}  ${barchart_decrease_rop}
            ${tup2}  set variable  ${json[0]["increase_rop"]}
            log  ${tup2}
            ${barchart_increase_rop}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_rop}
            ${pie_chart_increase_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[3].innerText;return x;
            log  ${pie_chart_increase_rop}
            ${pie_chart_increase_rop.}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_rop..}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_rop...}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_rop....}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_rop....}
            ${pie_chart_increase_rop1....}  run keyword and ignore error  execute javascript  var value = `${pie_chart_increase_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_rop1....}
            run keyword and ignore error  should be equal as numbers  ${pie_chart_increase_rop1....}  ${barchart_increase_rop}

7User should see SS bar chart today date value same as today values in pichart for ${quarters} view for business "${text6}"
            ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
            log  ${day}
            ${quarterly view in ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS');return x;
            log  ${quarterly view in ss}
            click element  ${quarterly view in ss}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${quarterly option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameSS > option:nth-child(3)');return x;
            click element  ${quarterly option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/${quarters}?business=%5B%22${text6}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_ss"]}
            log  ${json[0]["increase_ss"]}
            ${tup1}  set variable  ${json[0]["decrease_ss"]}
            log  ${tup1}
            ${barchart_decrease_ss}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ss}
            ${pie_chart_decrease_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[0].innerText;return x;
            log  ${pie_chart_decrease_ss}
            ${pie_chart_decrease_ss.}  replace string using regexp  ${pie_chart_decrease_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ss..}  replace string using regexp  ${pie_chart_decrease_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ss...}  replace string using regexp  ${pie_chart_decrease_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ss....}  replace string using regexp  ${pie_chart_decrease_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ss....}
            ${pie_chart_decrease_ss1....}  execute javascript  var value = `${pie_chart_decrease_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ss1....}
            should be equal as numbers  ${pie_chart_decrease_ss1....}  ${barchart_decrease_ss}
            ${tup2}  set variable  ${json[0]["increase_ss"]}
            log  ${tup2}
            ${barchart_increase_ss}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_ss}
            ${pie_chart_increase_ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[1].innerText;return x;
            log  ${pie_chart_increase_ss}
            ${pie_chart_increase_ss.}  replace string using regexp  ${pie_chart_increase_ss}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_ss..}  replace string using regexp  ${pie_chart_increase_ss.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_ss...}  replace string using regexp  ${pie_chart_increase_ss..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_ss....}  replace string using regexp  ${pie_chart_increase_ss...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_ss....}
            ${pie_chart_increase_ss1....}  execute javascript  var value = `${pie_chart_increase_ss....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_ss1....}
            should be equal as numbers  ${pie_chart_increase_ss1....}  ${barchart_increase_ss}

8User should see ROP bar chart today date value same as today values in pichart for ${quarters} view for business "${text7}"
            ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
            log  ${day}
            ${quarterly view in rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP');return x;
            log  ${quarterly view in rop}
            click element  ${quarterly view in rop}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${quarterly option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameROP > option:nth-child(3)');return x;
            click element  ${quarterly option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/${quarters}?business=%5B%22${text7}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_rop"]}
            log  ${json[0]["increase_rop"]}
            ${tup1}  set variable  ${json[0]["decrease_rop"]}
            log  ${tup1}
            ${barchart_decrease_ROP}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_ROP}
            ${pie_chart_decrease_ROP}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[2].innerText;return x;
            log  ${pie_chart_decrease_ROP}
            ${pie_chart_decrease_ROP.}  replace string using regexp  ${pie_chart_decrease_ROP}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_ROP..}  replace string using regexp  ${pie_chart_decrease_ROP.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_ROP...}  replace string using regexp  ${pie_chart_decrease_ROP..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_ROP....}  replace string using regexp  ${pie_chart_decrease_ROP...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_ROP....}
            ${pie_chart_decrease_ROP1....}  execute javascript  var value = `${pie_chart_decrease_ROP....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_ROP1....}
            should be equal as numbers  ${pie_chart_decrease_ROP1....}  ${barchart_decrease_ROP}
            ${tup2}  set variable  ${json[0]["increase_rop"]}
            log  ${tup2}
            ${barchart_increase_rop}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_rop}
            ${pie_chart_increase_rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[3].innerText;return x;
            log  ${pie_chart_increase_rop}
            ${pie_chart_increase_rop.}  replace string using regexp  ${pie_chart_increase_rop}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_rop..}  replace string using regexp  ${pie_chart_increase_rop.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_rop...}  replace string using regexp  ${pie_chart_increase_rop..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_rop....}  replace string using regexp  ${pie_chart_increase_rop...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_rop....}
            ${pie_chart_increase_rop1....}  execute javascript  var value = `${pie_chart_increase_rop....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_rop1....}
            should be equal as numbers  ${pie_chart_increase_rop1....}  ${barchart_increase_rop}

9User should see MOQ bar chart today date value same as today values in pichart for ${quarters} view for business "${text9}"
            ${day}  execute javascript  var dateTokens = ((new Date()).toString()).split(" "); return dateTokens[1] + ' ' + dateTokens[2];
            log  ${day}
            ${quarterly view in moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ');return x;
            log  ${quarterly view in moq}
            click element  ${quarterly view in moq}  ##//*[@id="timeFrameSS"]
            sleep  2s
            ${quarterly option from dropdown}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#timeFrameMOQ > option:nth-child(3)');return x;
            click element  ${quarterly option from dropdown}
            sleep  2s
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
            ${resp}  Get Request  MySession  /secure/api/v1/stockpolicy/stockOpportunities/ss/${quarters}?business=%5B%22${text9}%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json[0]["decrease_moq"]}
            log  ${json[0]["increase_moq"]}
            ${tup1}  set variable  ${json[0]["decrease_moq"]}
            log  ${tup1}
            ${barchart_decrease_moq}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(2); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(2); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
            log  ${barchart_decrease_moq}
            ${pie_chart_decrease_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[4].innerText;return x;
            log  ${pie_chart_decrease_moq}
            ${pie_chart_decrease_moq.}  replace string using regexp  ${pie_chart_decrease_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_decrease_moq..}  replace string using regexp  ${pie_chart_decrease_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_decrease_moq...}  replace string using regexp  ${pie_chart_decrease_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_decrease_moq....}  replace string using regexp  ${pie_chart_decrease_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_decrease_moq....}
            ${pie_chart_decrease_moq1....}  execute javascript  var value = `${pie_chart_decrease_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_decrease_moq1....}
            should be equal as numbers  ${pie_chart_decrease_moq1....}  ${barchart_decrease_moq}
            ${tup2}  set variable  ${json[0]["increase_moq"]}
            log  ${tup2}
            ${barchart_increase_moq}  execute javascript  if (${tup2} == 0.00 || ${tup2} == undefined || ${tup2} == null ){ return 0; }; var num = 0; if(${tup2} > 0 ){ if(${tup2}> 999999999){  num  = (${tup2}/1000000000).toFixed(1); return num;}else if(${tup2}> 999999){ num  = (${tup2}/1000000).toFixed(2); return num; }  else if(${tup2}> 999){ num  = (${tup2}/1000).toFixed(2); return num; }else if(${tup2}> 0){ num  = ${tup2}; return num;} else if(${tup2}< 0){ return num; } };
            log  ${barchart_increase_moq}
            ${pie_chart_increase_moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('#totalOpportunities > mo-stock-policy-opp').shadowRoot.querySelector('#moLegend').shadowRoot.querySelectorAll('.legend-value')[5].innerText;return x;
            log  ${pie_chart_increase_moq}
            ${pie_chart_increase_moq.}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq}  \\$|\,  ${EMPTY}
            ${pie_chart_increase_moq..}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq.}  \\(|\,  ${EMPTY}
            ${pie_chart_increase_moq...}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq..}  \\)|\,  ${EMPTY}
            ${pie_chart_increase_moq....}  run keyword and ignore error  replace string using regexp  ${pie_chart_increase_moq...}  \\USD|\,  ${EMPTY}
            log  ${pie_chart_increase_moq....}
            ${pie_chart_increase_moq1....}  run keyword and ignore error  execute javascript  var value = `${pie_chart_increase_moq....}`; if(value.includes('m')){ value =  value.replace('m', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('b')){ value = value.replace('b', '');}; if(value == '0'){return '0';} return value;
            log  ${pie_chart_increase_moq1....}
            run keyword and ignore error  should be equal as numbers  ${pie_chart_increase_moq1....}  ${barchart_increase_moq}