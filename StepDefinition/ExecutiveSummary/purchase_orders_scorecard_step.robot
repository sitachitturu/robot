#Date:6/1/2017
#time:9.25 AM
#Created By: Sita Chitturu
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User access "${link}" module
    wait until element is not visible  ${Page Spinner}  15s
    click link   ${link}
    sleep  10s
    wait until page contains  addFilterBtn   40s

User should see "Purchase Orders" score card with "Purchase Orders" title,"Accuracy rate","Short Cycle","Cancellations","Reschedule In","Reschedule Out", "Overdue" on it
    wait until element is visible  ${purchase_order_score_card}  30s
    element should contain  ${purchase_order_score_card}  Purchase Orders
    element should contain  ${purchase_order_score_card}  Accuracy Rate
    element should contain  ${purchase_order_score_card}  Short Cycle
    element should contain  ${purchase_order_score_card}  Cancellations
    element should contain  ${purchase_order_score_card}  Reschedule In
    element should contain  ${purchase_order_score_card}  Reschedule Out
    element should contain  ${purchase_order_score_card}  Overdue

User should see Executive Summary
    element should be visible  ${Page title=Executive Summary}

User should see Accuracy Rate value
    wait until element does not contain  ${Accuracy Rate value}  --  40s
    ${Accuracy Rate}  get text  ${Accuracy Rate value}
    log to console  ${Accuracy Rate}
    set global variable  ${Accuracy Rate}

User access Purchase Orders module
    click element  ${purchase_orders icon}
User gets Total Count
    wait until element is visible  ${Total row}  60s
    sleep  20s
    ${Total count raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Total count raw}  |  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",2); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Total_col_count}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log to console  ${Total_col_count} Total count
    set global variable  ${Total_col_count}

User gets Overdue Count
    click element  addFilterBtn
    click element  ${final exeption message filter edit filters}
    click element  ${short cycle filter edit filters}
    click element  ${exception_require_action_filter_editfilters}
    click element  continue
    click element  exp
     wait until element is visible  //mm-filter[@id='exp']//paper-checkbox[@id='product-Overdue']//span[@class='count style-scope px-filter']  30s
     sleep  20s
    ${Overdue count raw}  get text  //mm-filter[@id='exp']//paper-checkbox[@id='product-Overdue']//span[@class='count style-scope px-filter']
#    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Overdue']
#    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
#    sleep  5s
#    wait until element is visible  ${Total row}  60s
#    ${Overdue count raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Overdue count raw}  (  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  )  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",2); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Overdue_count}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    click element  exp
    log to console  ${Overdue_count} Overdue count
    set global variable  ${Overdue_count}

User gets Short Cycle Count
    click element  sc
    wait until element is visible  //mm-filter[@id='sc']//paper-checkbox[@id='product-Yes']//span[@class='count style-scope px-filter']  30s
   sleep  20s
    ${Short Cycle count raw}  get text  //mm-filter[@id='sc']//paper-checkbox[@id='product-Yes']//span[@class='count style-scope px-filter']
#    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Overdue']
#    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
#    sleep  5s
#    wait until element is visible  ${Total row}  60s
#    ${Overdue count raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Short Cycle count raw}  (  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  )  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",2); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Short Cycle_count}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    click element  sc
    log to console  ${Short Cycle_count} Short Cycle count
    set global variable  ${Short Cycle_count}

User gets Total value
    click element  ${value$_tab}
    wait until element is visible  ${Overall row}  20s
    sleep  20s
    ${Total value raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Total value raw}  |  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3...}  replace string  ${TempString3}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3...}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Total_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log  ${Total_col_value}
    log to console  ${Total_col_value} Total value
    set global variable  ${Total_col_value}
User gets Cancellation value
    click element  exp_action
    wait until element is visible  //mm-filter[@id='exp_action']//paper-checkbox[@id='product-Action Required']  30s
    click element  //mm-filter[@id='exp_action']//paper-checkbox[@id='product-Action Required']
    click element  //mm-filter[@id='exp_action']//button[@id='ApplyBtn']
    click element  exp
    wait until element is visible   //mm-filter[@id='exp']//paper-checkbox[@id='product-Cancel process']//span[@class='count style-scope px-filter']  20s
    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Cancel process']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
    sleep  30s
    wait until element is visible  ${Overall row}  20s
    ${Cancel process value raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Cancel process value raw}  |  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3...}  replace string  ${TempString3}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3...}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Cancel process_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log  ${Cancel process_value}
    log to console  ${Cancel process_value} Cancellation value
    set global variable  ${Cancel process_value}
User gets Reschedule in value
    click element  exp
    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Cancel process']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
    click element  exp
    wait until element is visible  //mm-filter[@id='exp']//paper-checkbox[@id='product-Reschedule in']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Reschedule in']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
    sleep  20s
    wait until element is visible  ${Overall row}  20s
    ${Reschedule in process value raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Reschedule in process value raw}  |  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3...}  replace string  ${TempString3}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3...}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Reschedule in_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log  ${Reschedule in_value}
    log to console  ${Reschedule in_value} Reschedule in value
    set global variable  ${Reschedule in_value}
User gets Reschedule out value
    click element  exp
    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Reschedule in']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
    click element  exp
    wait until element is visible  //mm-filter[@id='exp']//paper-checkbox[@id='product-Reschedule out']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//paper-checkbox[@id='product-Reschedule out']//span[@class='count style-scope px-filter']
    click element  //mm-filter[@id='exp']//button[@id='ApplyBtn']
    sleep  20s
    wait until element is visible  ${Overall row}  20s
    ${Reschedule out process value raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${TempString3}  replace string  ${Reschedule out process value raw}  |  ${EMPTY}
    ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
    ${TempString3...}  replace string  ${TempString3}  $  ${EMPTY}
    log  ${TempString3..}
    ${text3..}  execute javascript  var string = "${TempString3...}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text3..}
    ${convert}  convert to string  ${text3..}
    ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
    ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
    ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
    ${Reschedule out_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
    log  ${Reschedule out_value}
    log to console  ${Reschedule out_value} Reschedule out value
    set global variable  ${Reschedule out_value}

User should see correct value for Accuracy Rate in Purchase Orders score card
    ${a}  execute javascript  var x = `${Overdue_count}`;var y = `${Total_col_count}`;var z = (1-x / y)*2; return z
    log  ${a}
    ${a1}  convert to number  ${a}  2
    ${b}  execute javascript  var x = `${Short Cycle_count}`;var y = `${Total_col_count}`;var z = (1-x / y)*0.5; return z
    log  ${b}
    ${b1}  convert to number  ${b}  2
    ${c}  execute javascript  var x = `${Cancel process_value}`;var y = `${Total_col_value}`;var z = (1-x / y)*4; return z
    log  ${c}
    ${c1}  convert to number  ${c}  2
    ${d}  execute javascript  var x = `${Reschedule in_value}`;var y = `${Total_col_value}`;var z = (1-x / y)*3; return z
    log  ${d}
    ${d1}  convert to number  ${d}  2
    ${e}  execute javascript  var x = `${Reschedule out_value}`;var y = `${Total_col_value}`;var z = (1-x / y)*3; return z
    log  ${e}
    ${e1}  convert to number  ${e}  2
    ${total}  evaluate  ${a1}+${b1}+${c1}+${d1}+${e1}
    ${result}  evaluate  ${total} / 12.5
    ${result final}  evaluate  ${result}*100
    ${result final1}  convert to number  ${result final}  1
    ${result final2}    convert to string  ${result final1}
    should be equal  ${result final2}  ${Accuracy Rate}


User should see correct value for Cancellations in purchase orders score card
    wait until element does not contain  ${Accuracy Rate value}  --  30s
    capture page screenshot
    ${Cancelaation value score card1}  get text  ${Cancelaation value score card}
    log to console  ${Cancelaation value score card1} Cancelaation
    ${result1}  execute javascript  if (`${Cancel process_value}` == '0.00' || `${Cancel process_value}` == 'undefined' || `${Cancel process_value}` == 'null' ){ return '0';}; var num=0; if(${Cancel process_value} > 0 ){if(${Cancel process_value}> 999999999){num  =  (${Cancel process_value}/1000000000).toFixed(1); return num;} else if(${Cancel process_value}> 999999){num  =  (${Cancel process_value}/1000000).toFixed(1); return num;}  else if(${Cancel process_value}> 999){num  =  (${Cancel process_value}/1000).toFixed(1); return num;}};
    log  ${result1}
    ${TempString1}  execute javascript  var value = `${Cancelaation value score card1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
    ${cancellation1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    log  ${cancellation1}
    run keyword and continue on failure  should be equal as numbers  ${result1}  ${cancellation1}

User should see correct value for Reschedule In in purchase orders score card
    ${Reschedule In value score card1}  get text  ${Reschedule In value score card}
    log to console  ${Reschedule In value score card1} Reschedule In
    ${result1}  execute javascript  if (`${Reschedule in_value}` == '0.00' || `${Reschedule in_value}` == 'undefined' || `${Reschedule in_value}` == 'null' ){ return '0';}; var num=0; if(${Reschedule in_value} > 0 ){if(${Reschedule in_value}> 999999999){num  =  (${Reschedule in_value}/1000000000).toFixed(1); return num;} else if(${Reschedule in_value}> 999999){num  =  (${Reschedule in_value}/1000000).toFixed(1); return num;}  else if(${Reschedule in_value}> 999){num  =  (${Reschedule in_value}/1000).toFixed(1); return num;}};
    log  ${result1}
    ${TempString1}  execute javascript  var value = `${Reschedule In value score card1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
    ${resin1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    log  ${resin1}
    run keyword and continue on failure  should be equal as numbers  ${result1}  ${resin1}

User should see correct value for Reschedule Out in purchase orders score card
    ${Reschedule Out value score card1}  get text  ${Reschedule Out value score card}
    log to console  ${Reschedule Out value score card1} Reschedule Out
    ${result1}  execute javascript  if (`${Reschedule out_value}` == '0.00' || `${Reschedule out_value}` == 'undefined' || `${Reschedule out_value}` == 'null' ){ return '0';}; var num=0; if(${Reschedule out_value} > 0 ){if(${Reschedule out_value}> 999999999){num  =  (${Reschedule out_value}/1000000000).toFixed(1); return num;} else if(${Reschedule out_value}> 999999){num  =  (${Reschedule out_value}/1000000).toFixed(1); return num;}  else if(${Reschedule out_value}> 999){num  =  (${Reschedule out_value}/1000).toFixed(1); return num;}};
    log  ${result1}
    ${TempString1}  execute javascript  var value = `${Reschedule Out value score card1}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
    ${resout1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    log  ${resout1}
    run keyword and continue on failure  should be equal as numbers  ${result1}  ${resout1}

User should see correct value for Overdue in purchase orders score card
    ${Overdue value score card1}  get text  ${Overdue value score card}
    log to console  ${Overdue value score card1} Overdue
    ${overdue}  replace string  ${Overdue value score card1}  %  ${EMPTY}
    log  ${overdue}
    ${result}  execute javascript  if (`${overdue}` == '0.00' || `${overdue}` == 'undefined' || `${overdue}` == 'null' ){ return '0';}; var num=0; if(${overdue} > 0 ){if(${overdue}> 999999999){num  = (${overdue}/1000000000).toFixed(1); return num;} else if(${overdue}> 999999){num  = (${overdue}/1000000).toFixed(1); return num;}  else if(${overdue}> 999){num  = (${overdue}/1000).toFixed(1); return num;}else if(${overdue}> 99){num  = (${overdue}/100).toFixed(1); return num;}else if(${overdue}> 9){num  = ((${overdue}*10)/10).toFixed(1); return num;}else if(${overdue}> 0){num  = ${overdue}.toFixed(1); return num;}else if(${overdue}< 0){return num;}};
    log  ${result}
    ${output}  execute javascript  var x = `${Overdue_count}`;var y = `${Total_col_count}`;var z = ((x / y)*100); return z
    log  ${output}
    ${output1}  convert to number  ${output}  1
    ${output2}  convert to string  ${output1}
    run keyword and continue on failure  should be equal  ${output2}  ${result}

User should see correct value for Short Cycle in purchase orders score card
    ${Short Cycle value score card1}  get text  ${Short Cycle value score card}
    log to console  ${Short Cycle value score card1} Short Cycle
    ${shortC}  replace string  ${Short Cycle value score card1}  %  ${EMPTY}
    log  ${overdue}
    ${result}  execute javascript  if (`${shortC}` == '0.00' || `${shortC}` == 'undefined' || `${shortC}` == 'null' ){ return '0';}; var num=0; if(${shortC} > 0 ){if(${shortC}> 999999999){num  = (${shortC}/1000000000).toFixed(1); return num;} else if(${shortC}> 999999){num  = (${shortC}/1000000).toFixed(1); return num;}  else if(${shortC}> 999){num  = (${shortC}/1000).toFixed(1); return num;}else if(${shortC}> 99){num  = (${shortC}/100).toFixed(1); return num;}else if(${shortC}> 9){num  = ((${shortC}*10)/10).toFixed(1); return num;}else if(${shortC}> 0){num  = ${shortC}.toFixed(1); return num;}else if(${shortC}< 0){return num;}};
    log  ${result}
    ${output}  execute javascript  var x = `${Short Cycle_count}`;var y = `${Total_col_count}`;var z = ((x / y)*100); return z
    log  ${output}
    ${output1}  convert to number  ${output}  1
    ${output2}  convert to string  ${output1}
    should be equal  ${output2}  ${result}
