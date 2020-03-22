*** Settings ***
Library  Selenium2Library
Library  ../../Suits/excel_library.py
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Library   ../../Utilities/utility.py

*** Keywords ***
User click on age classification dropdown
    wait until element is visible  ${ageclassification_dropdown}  20s
    click element  ${ageclassification_dropdown}
    sleep  3s

User click exception message from age classification dropdown
    wait until element is visible  ${exception_message}  20s
    click element  ${exception_message}
    sleep  10s

User click on value tab
    wait until element is visible  ${value_tab}  20s
    click element  ${value_tab}
    sleep  10s

User click on edit filter
    wait until element is visible  ${Edit filter button}  20s
    click element  ${Edit filter button}

User select final exception message
    wait until element is visible  ${Final Exception Message}  20s
    click element  ${Final Exception Message}
    click element  ${Continue button}
    sleep  3s

User click on final exception message filter
    wait until element is visible  ${Final exp message filter}  20s
    click element  ${Final exp message filter}
    sleep  4s

User select cancel process
    wait until element is visible  ${Cancel process filter option}  20s
    click element  ${Cancel process filter option}
    click element  ${Apply btn final exp msg}
    sleep  10s

User select reschedule-in filter option
    wait until element is visible  ${reschedule-in filter option}  20s
    click element  ${reschedule-in filter option}
    click element  ${Apply btn final exp msg}
    sleep  10s

User select reschedule-out filter option
    wait until element is visible  ${reschedule-out filter option}  20s
    click element  ${reschedule-out filter option}
    click element  ${Apply btn final exp msg}
    sleep  10s

User select cancel process from final exception message
    User click on edit filter
    User select final exception message
    User click on final exception message filter
    User select cancel process

User selects reschedule-in from final exception message
    User click on edit filter
    User select final exception message
    User click on final exception message filter
    User select reschedule-in filter option

User selects reschedule-out from final exception message
    User click on edit filter
    User select final exception message
    User click on final exception message filter
    User select reschedule-out filter option

Gets cancellation total from heatmap for "${business}"
    sleep  5s
    ${cancellation sum string}  get text  ${Cancellation sum heatmap}
    ${cancellation sum from heatmap}=  get total numerical val heatmap  ${cancellation sum string}
    [Return]  ${cancellation sum from heatmap}
    set global variable  ${cancellation sum from heatmap}
    log to console  Sum for "cancellation" from Heatmap for "${business}":[${cancellation sum from heatmap}]



Get count for cancellation from heatmap for count for "${business}"
     sleep  5s
    ${cancellation sum string}  get text  ${Cancellation sum heatmap}
    ${cancellation sum from heatmap for count}=  execute javascript  var string = "${cancellation sum string}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${cancellation sum from heatmap for count}
     ${queryResults1}  convert to string  ${cancellation sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${cancellation sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${cancellation sum from heatmap for count..}
    set global variable  ${cancellation sum from heatmap for count..}
    log to console  Sum for "cancellation" from Heatmap for "${business}":[${cancellation sum from heatmap for count..}]

Gets the cancellation total from excel for "${business}"
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

    ${cancellation sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseOrders.xlsx  Net Open Value (USD)
    [Return]  ${cancellation sum from excel}
    ${tup1}  set variable  ${cancellation sum from excel}
    ${cancellation sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; } ;
    log  ${cancellation sum from excel..}
    set global variable  ${cancellation sum from excel..}
    log to console  Sum for "cancellation" from Excel for "${business}":[${cancellation sum from excel..}]

Validate cancellation values
    [Arguments]  ${sum from heatmap}  ${sum from excel}
    should be equal  ${sum from heatmap}  ${sum from excel}

Click net open value usd from show hide
    click button  ${show/hide column}
    wait until element is visible  ${Net open value(usd) show hide}
    click element  ${Net open value(usd) show hide}
    click button  ${show/hide column}

Gets reschedule-in total from heatmap for "${business}"
    sleep  5s
    ${reschedule-in sum string}  get text  ${reschedule-in sum heatmap}
    ${reschedule-in sum from heatmap}=  get total numerical val heatmap  ${reschedule-in sum string}
    [Return]  ${reschedule-in sum from heatmap}
    set global variable  ${reschedule-in sum from heatmap}
    log to console  Sum for "reschedule-in" from Heatmap for "${business}":[${reschedule-in sum from heatmap}]

Gets reschedule-in total from heatmap for ${business} for count
     sleep  5s
    ${reschedule-in sum string}  get text  ${reschedule-in sum heatmap}
    ${reschedule-in sum from heatmap for count}=  execute javascript  var string = "${reschedule-in sum string}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${reschedule-in sum from heatmap for count}
    ${queryResults1}  convert to string  ${reschedule-in sum from heatmap for count}
     ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${reschedule-in sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${reschedule-in sum from heatmap for count..}
    set global variable  ${reschedule-in sum from heatmap for count..}
    log to console  Sum for "reschedule-in" from Heatmap for "${business}":[${reschedule-in sum from heatmap for count..}]


Gets the reschedule-in total from excel for "${business}"
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

    ${reschedule-in sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseOrders.xlsx  Net Open Value (USD)
    [Return]  ${reschedule-in sum from excel}
    ${tup1}  set variable  ${reschedule-in sum from excel}
    ${reschedule-in sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; } ;
    log  ${reschedule-in sum from excel..}
    set global variable  ${reschedule-in sum from excel..}
    log to console  Sum for "Reschedule-in" from Excel for "${business}":[${reschedule-in sum from excel..}]

Validate reschedule-in total values
    [Arguments]  ${sum from heatmap}  ${sum from excel}
    should be equal  ${sum from heatmap}  ${sum from excel}

Gets reschedule-out total from heatmap for "${business}"
    sleep  5s
    ${reschedule-out sum string}  get text  ${reschedule-out sum heatmap}
    ${reschedule-out sum from heatmap}=  get total numerical val heatmap  ${reschedule-out sum string}
    [Return]  ${reschedule-out sum from heatmap}
    set global variable  ${reschedule-out sum from heatmap}
    log to console  Sum for "reschedule-out" from Heatmap for "${business}":[${reschedule-out sum from heatmap}]

Gets reschedule-out total from heatmap for ${business} for count
     sleep  5s
    ${reschedule-out sum string}  get text  ${reschedule-out sum heatmap}
    ${reschedule-out sum from heatmap for count}=  execute javascript  var string = "${reschedule-out sum string}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${reschedule-out sum from heatmap for count}
    ${queryResults1}  convert to string  ${reschedule-out sum from heatmap for count}
    ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${reschedule-out sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${reschedule-out sum from heatmap for count..}
    set global variable  ${reschedule-out sum from heatmap for count..}
    log to console  Sum for "reschedule-out" from Heatmap for "${business}":[${reschedule-out sum from heatmap for count..}]

Gets reschedule-out total from excel for "${business}"
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

    ${reschedule-out sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseOrders.xlsx  Net Open Value (USD)
    [Return]  ${reschedule-out sum from excel}
    ${tup1}  set variable  ${reschedule-out sum from excel}
    ${reschedule-out sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; } ;
    log  ${reschedule-out sum from excel..}
    set global variable  ${reschedule-out sum from excel..}
    log to console  Sum for "Reschedule-out" from Excel for "${business}":[${reschedule-out sum from excel..}]

Validate reschedule-out total values
    [Arguments]  ${sum from heatmap}  ${sum from excel}
    should be equal  ${sum from heatmap}  ${sum from excel}

User select no exception filter option
    wait until element is visible  ${no exception filter option}  20s
    click element  ${no exception filter option}
    click element  ${Apply btn final exp msg}
    sleep  10s

User selects no exception from final exception message
    User click on edit filter
    User select final exception message
    User click on final exception message filter
    User select no exception filter option

Gets no exception total from heatmap for "${business}"
    sleep  5s
    ${no exception sum string}  get text  ${no exception sum heatmap}
    ${no exception sum from heatmap}=  get total numerical val heatmap  ${no exception sum string}
    [Return]  ${no exception sum from heatmap}
    set global variable  ${no exception sum from heatmap}
    log to console  Sum for "no exception" from Heatmap for "${business}":[${no exception sum from heatmap}]


Gets no exception total from heatmap for ${business} for count
     sleep  5s
    ${no exception sum string}  get text  ${no exception sum heatmap}
    ${no exception sum from heatmap for count}=  execute javascript  var string = "${no exception sum string}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${no exception sum from heatmap for count}
    ${queryResults1}  convert to string  ${no exception sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${no exception sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${no exception sum from heatmap for count..}
    set global variable  ${no exception sum from heatmap for count..}
    log to console  Sum for "no exception" from Heatmap for "${business}":[${no exception sum from heatmap for count..}]


Gets no exception total from excel for "${business}"
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

    ${no exception sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseOrders.xlsx  Net Open Value (USD)
    [Return]  ${no exception sum from excel}
    ${tup1}  set variable  ${no exception sum from excel}
    ${no exception sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; } ;
    log  ${no exception sum from excel..}
    set global variable  ${no exception sum from excel..}
    log to console  Sum for "No Exception" from Excel for "${business}":[${no exception sum from excel..}]

Validate no exception total values
    [Arguments]  ${sum from heatmap}  ${sum from excel}
    should be equal  ${sum from heatmap}  ${sum from excel}

User select overdue filter option
    wait until element is visible  ${overdue filter option}  20s
    click element  ${overdue filter option}
    click element  ${Apply btn final exp msg}
    sleep  10s

User selects overdue from final exception message
    User click on edit filter
    User select final exception message
    User click on final exception message filter
    User select overdue filter option

Gets overdue total from heatmap for "${business}"
    sleep  5s
    ${overdue sum string}  get text  ${overdue sum heatmap}
    ${overdue sum from heatmap}=  get total numerical val heatmap  ${overdue sum string}
    [Return]  ${overdue sum from heatmap}
    set global variable  ${overdue sum from heatmap}
    log to console  Sum for "overdue" from Heatmap for "${business}":[${overdue sum from heatmap}]


Gets overdue total from heatmap for ${business} for count
     sleep  5s
    ${overdue sum string}  get text  ${overdue sum heatmap}
    ${overdue sum from heatmap for count}=  execute javascript  var string = "${overdue sum string}"; var returnStr = string.split(" ",1); return returnStr;
    [Return]  ${overdue sum from heatmap for count}
     ${queryResults1}  convert to string  ${overdue sum from heatmap for count}
      ${queryResults1.}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults1.}  \\]|\,  ${EMPTY}
                  ${queryResults..}   replace string using regexp  ${queryResults1.}  \\(|\,  ${EMPTY}
                  ${queryResults}   replace string using regexp  ${queryResults..}  \\)|\,  ${EMPTY}
                  ${queryResults1.}  replace string using regexp  ${queryResults}  \\Decimal|\,  ${EMPTY}
                  ${queryResults..}  replace string using regexp  ${queryResults1.}  \[a-zA-Z]|\,  ${EMPTY}
                  ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
                  log  ${queryResultLength}
                  ${overdue sum from heatmap for count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
                   log  ${overdue sum from heatmap for count..}
    set global variable  ${overdue sum from heatmap for count..}
    log to console  Sum for "overdue" from Heatmap for "${business}":[${overdue sum from heatmap for count..}]

Gets overdue total from excel for "${business}"
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

    ${overdue sum from excel}  get_excel_column_sum  ${path}/Downloads/PurchaseOrders.xlsx  Net Open Value (USD)
    [Return]  ${overdue sum from excel}
    ${tup1}  set variable  ${overdue sum from excel}
    ${overdue sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ num  = Math.round(${tup1}); return num; } else { return num; } ;
    log  ${overdue sum from excel..}
    set global variable  ${overdue sum from excel..}
    log to console  Sum for "Overdue" from Excel for "${business}":[${overdue sum from excel..}]


Validate overdue total values
    [Arguments]  ${sum from heatmap}  ${sum from excel}
    should be equal  ${sum from heatmap}  ${sum from excel}




