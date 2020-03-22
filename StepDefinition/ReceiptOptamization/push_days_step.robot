9/19/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  DatabaseLibrary
Library  OperatingSystem
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***

User access "/secure/receipt-optimization" module
    click element  ${Receipt Optimization Icon}
    sleep  20s
User should see "Push Days" column
    wait until element is visible  ${Push Days}  30s

"push_days" column should be in database
    connect to database  dbConfigFile=${dbfile}

User should see Push Days column values are less or equal 10 in Month view <10 days
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  13s
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  13s
    ${highest value from the grid text}=  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
    log to console  ${highest value from the grid text}
    should be true  ${highest value from the grid text} < 10

User should see Push Days column values are less or equal 20 in Month view <20 days
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '<20 Days')]
    sleep  15s
    ${highest value from the grid text}=  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
    log to console  ${highest value from the grid text}
    should be true  ${highest value from the grid text} < 20
User should see Push Days column values are less or equal 30 in Month view <30 days
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '<30 Days')]
    sleep  15s
    ${highest value from the grid text}=  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
    log to console  ${highest value from the grid text}
    should be true  ${highest value from the grid text} < 30
User should see Push Days column values are less or equal 105 in Month view +30 days
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '+30 Days')]
    sleep  15s
    ${highest value from the grid text}=  execute javascript  return $("#dataTableGrid table tr:nth(1) td:nth(6) div").text();
    log to console  ${highest value from the grid text}
    should be true  ${highest value from the grid text} <= 105


User should see Push Days column values are less or equal 10 in Quarter view <10 days
    click element  //px-dropdown[@display-value='Month']
    click element  //ul[@id='list']//li[contains(normalize-space(), 'Quarter')]
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '<10 Days')]
    wait until element is visible  //div[@id='content']//span[contains(normalize-space(), 'Buyer Name')]  20s
    sleep  3s
    click element  ${show/hide column}
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Push Days']
    click element  ${show/hide column}
    sleep  13s
    wait until element is visible  //div[@id='content']//span[contains(normalize-space(), 'Push Days')]  20s
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  13s
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  13s
    ${message}=  execute javascript  return (function(){var text = $("#dataTableGrid table tr:nth(1) td:nth(7) div").text(); var values=text.split(","); for(i in values) {if(parseInt(values[i]) > 10) return("Wrong value " + values[i] + " in " + text);}; return "OK"})();
    log to console  ${message}
    should be equal  ${message}  OK

User should see Push Days column values are less or equal 20 in Quarter view <20 days
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '<20 Days')]
    sleep  15s
    click element  ${show/hide column}
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Push Days']
    click element  ${show/hide column}
    sleep  3s
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  8s
    ${message}=  execute javascript  return (function(){var text = $("#dataTableGrid table tr:nth(1) td:nth(7) div").text(); var values=text.split(","); for(i in values) {if(parseInt(values[i]) > 20) return("Wrong value " + values[i] + " in " + text);}; return "OK"})();
    log to console  ${message}
    should be equal  ${message}  OK

User should see Push Days column values are less or equal 30 in Quarter view <30 days
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '<30 Days')]
    wait until element is visible  //div[@id='content']//span[contains(normalize-space(), 'Buyer Name')]  20s
    sleep  13s
    click element  ${show/hide column}
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Push Days']
    click element  ${show/hide column}
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  13s
    ${message}=  execute javascript  return (function(){var text = $("#dataTableGrid table tr:nth(1) td:nth(7) div").text(); var values=text.split(","); for(i in values) {if(parseInt(values[i]) > 30) return("Wrong value " + values[i] + " in " + text);}; return "OK"})();
    log to console  ${message}
    should be equal  ${message}  OK

User should see Push Days column values are less or equal 105 in Quarter view +30 days
    click element  //px-dropdown[@display-value='<10 Days']
    click element  //ul[@id='list']//li[contains(normalize-space(), '+30 Days')]
    wait until element is visible  //div[@id='content']//span[contains(normalize-space(), 'Buyer Name')]  20s
    sleep  13s
    click element  ${show/hide column}
    click element  //paper-checkbox[@aria-label='Select Row']//div[text()='Push Days']
    click element  ${show/hide column}
    sleep  14s
    execute javascript  $("span:contains('Push')")[0].click()
    sleep  13s
    ${message}=  execute javascript  return (function(){var text = $("#dataTableGrid table tr:nth(1) td:nth(7) div").text(); var values=text.split(","); for(i in values) {if(parseInt(values[i]) > 105) return("Wrong value " + values[i] + " in " + text);}; return "OK"})();
    log to console  ${message}
    should be equal  ${message}  OK

all values in column should be less or equal than 105
    ${results}  QUERY  select MAX(push_days) from public.receipt_optimization_v
    log to console  ${results}
    ${convert}  convert to string  ${results}
         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
         ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
         log to console  ${queryResults}
    should be true  ${queryResults} <= 105