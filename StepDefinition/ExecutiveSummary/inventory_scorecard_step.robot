12/7/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Variables/inventory_entitlement_variables.robot
*** Keywords ***
User access Executive summary module
    click element  ${Executive-Summary Iicon}
User should see "Variation Entitlement title"
    wait until element is visible  //div[@id='inventoryScoreCard']//span[contains(normalize-space(), 'Variation to Entitlement')]  30s
User should see "12-month SMI" title
    wait until element is visible  //div[@id='inventoryScoreCard']//span[contains(normalize-space(), '12-month SMI')]  30s
User should see Variation Entitlement performance indicator
    wait until element is visible  //div[@id='inventoryScoreCard']//div[@id='block']  30s
User should see 12-month SMI performance indicator
    wait until element is visible  //div[@id='inventoryScoreCard']//div[@id='blocks']  30s
User should see hover over message for Inventory scorecard
    mouse over  //div[@id='div3']//mo-inventory-entitlement-help
    wait until element is visible  //div[@id='message']//div[contains(normalize-space(), 'sum of Inventory of Materials where a positive (excess) variation to entitlement exists')]  10s
User can see "Variation Entitlement"
    sleep  5s
    ${Variation Entitlement}  get text  //div[@id='accuracyContainer']//span[@id='actionStat']
    convert next "${Variation Entitlement}"
    ${Variation Entitlementconverted}  set variable  ${variable3xx}
    set global variable  ${Variation Entitlementconverted}
    log to console  ${Variation Entitlementconverted} EC
    convert percentage "${Variation Entitlement}"
    ${Variation Entitlement converted percentage}  set variable  ${variable3xx}
    set global variable  ${Variation Entitlement converted percentage}
    log to console  ${Variation Entitlement converted percentage} EC

User can see "12-month SMI" title
    sleep  5s
    ${12-month SMI}  get text  //mo-block-bar[@id='smi']//span[@id='actionStat']
    convert next "${12-month SMI}"
    ${12-month SMIconverted}  set variable  ${variable3xx}
    set global variable  ${12-month SMIconverted}
    log to console  ${12-month SMIconverted} EC
    convert percentage "${12-month SMI}"
    ${12-month SMI converted percentage}  set variable  ${variable3xx}
    log to console  ${12-month SMI converted percentage} EC
    set global variable  ${12-month SMI converted percentage}

User access Inventory Entitlement module
    click element  ${Inventory Entitlement icon}
    wait until element is visible  //*[@id='spine-container']/div/div[4]/div[1]/div/div/span[2]/render-html  40s
    ${Variation Entitlement inventory spine1}  get text  //*[@id='spine-container']/div/div[4]/div[1]/div/div/span[2]/render-html
    ${Variation Entitlement inventory spine}  replace string  ${Variation Entitlement inventory spine1}   $  ${EMPTY}
    set global variable  ${Variation Entitlement inventory spine}
    log to console  ${Variation Entitlement inventory spine} IE
    ${12-month SMI inventory spine1}  get text  //*[@id='spine-container']/div/div[2]/div[2]/div/div/span[2]/render-html
    ${12-month SMI inventory spine}  replace string  ${12-month SMI inventory spine1}   $  ${EMPTY}
    set global variable  ${12-month SMI inventory spine}
    log to console  ${12-month SMI inventory spine} IE

User should see matching values for "12-month SMI" and "Variation Entitlement"
    connect to database  dbConfigFile=${dbfile}
    ${slow moving}  QUERY  SELECT SUM(slow_moving_inventory_value) as smi_total FROM public.stock_policy_v;
    ${total stock}  QUERY  SELECT SUM(total_stock_usd) as total_usd FROM public.stock_policy_v;
    ${positive variation}  QUERY  SELECT SUM(positive_variation_value) as positive_variation_total FROM public.stock_policy_v;
    ${active inventory}  QUERY  SELECT SUM(active_inventory_value) as active_total FROM public.stock_policy_v;
    run keyword  convert "${positive variation}" and "${active inventory}"
    ${Variation Entitlement value..}  execute javascript  var x = `${variable..}`;var y = `${variable2..}`;if (y > 0) {var z = (100-(x / y)*100); return z; } else {return 0;}
    ${Variation Entitlement value.}  convert to number  ${Variation Entitlement value..}  1
    ${Variation Entitlement value}  convert to string  ${Variation Entitlement value.}
    log to console  ${Variation Entitlement value}
    run keyword  convert "${slow moving}" and "${total stock}"
    ${12-month SMI value..}  execute javascript  var x = `${variable..}`;var y = `${variable2..}`;if (y > 0) {var z = ((x / y)*100); return z; } else {return 0;}
    ${12-month SMI value.}  convert to number  ${12-month SMI value..}  1
    ${12-month SMI value}  convert to string  ${12-month SMI value.}
    log to console  ${12-month SMI value}
    run keyword and continue on failure  should be equal  ${12-month SMI converted percentage}  ${12-month SMI value}
    run keyword and continue on failure   should be equal  ${Variation Entitlement converted percentage}  ${Variation Entitlement value}
    log to console  ${Variation Entitlement inventory spine}
    run keyword and continue on failure  should be equal  ${Variation Entitlement inventory spine}  ${Variation Entitlementconverted}
    should be equal  ${12-month SMI inventory spine}  ${12-month SMIconverted}


convert "${variable1}" and "${variable2}"
    ${convert}  convert to string  ${variable1}
    log  ${convert}
    ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
    ${queryResults1}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
    log  ${queryResults1}
    ${queryResultLength1}  execute javascript  return String(${queryResults1}).length;
    log  ${queryResultLength1}
    ${variable..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults1}};
    set global variable  ${variable..}
    log  ${variable..}
    ${convert}  convert to string  ${variable2}
    log  ${convert}
    ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
    ${queryResults1}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
    log  ${queryResults1}
    ${queryResultLength1}  execute javascript  return String(${queryResults1}).length;
    log  ${queryResultLength1}
    ${variable2..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults1}};
    set global variable  ${variable2..}
    log  ${variable2..}

convert next "${text}"
    ${text3}  execute javascript  return "${text}".split("\ | ")[0];
    ${text3..}  convert to string  ${text3}
    ${queryResults}  replace string using regexp  ${text3..}  \\(|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
    ${variable3x.}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
    ${variable3x..}  replace string using regexp  ${variable3x.}  \\ |\,  ${EMPTY}
    ${variable3xx}  replace string  ${variable3x..}  $  ${EMPTY}
    set global variable  ${variable3xx}
    log  ${variable3xx}

convert percentage "${text}"
    ${text3}  execute javascript  return "${text}".split("\| ")[1];
    ${text3..}  convert to string  ${text3}
    ${queryResults}  replace string using regexp  ${text3..}  \\(|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
    ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
    ${variable3x}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
    ${variable3xxx}  replace string  ${variable3x}  $  ${EMPTY}
    ${variable3xx}  replace string  ${variable3xxx}  %  ${EMPTY}
    set global variable  ${variable3xx}
    log  ${variable3xx}
