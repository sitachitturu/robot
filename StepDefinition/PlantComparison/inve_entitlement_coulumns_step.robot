*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  DatabaseLibrary
Library  OperatingSystem
Resource  ../../Variables/inventory_entitlement_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/plant_comparison_variables.robot

*** Keywords ***
User access "${link}" module
            click link   ${link}
            sleep  10s
User should see data grid with "12-month SMI" and "Variation to Entitlement" coulumns on UI
            element should be visible  //*[@id="content"]/div/span[text()='12-month SMI']
            ${text}  get text  ${12-smi-smi-column}
            should be equal  ${text}  12-month SMI
            element should be visible  //*[@id="content"]/div/span[text()='Variation to Entitlement']
            ${text1}  get text  ${variation_to_entitlement_col}
            should be equal  ${text1}  Variation to Entitlement

verify sorting option for the columns "12-month SMI"
            wait until element is visible  ${12-smi-smi-column}  20s
            double click element  ${12-smi-smi-column}
            sleep  2s
            ${text1}  get text  ${smi_row_value}
            log  ${text1}
            ${text1Result}  replace string using regexp  ${text1}  \\%|\,  ${EMPTY}
            click element  ${12-smi-smi-column}
            sleep  2s
            ${text2}  get text  ${smi_row_value}
            log  ${text2}
            ${text2Result}  replace string using regexp  ${text2}  \\%|\,  ${EMPTY}
            ${result}  evaluate  ${text2Result}>${text1Result}
            log  ${result}

verify sorting option for the columns "Variation to Entitlement"
            wait until element is visible  ${variation_to_entitlement_col}  20s
            double click element  ${variation_to_entitlement_col}
            sleep  3s
            ${text1}  get text  ${var_to_entitlement_row_value}
            log  ${text1}
            ${text1Result}  replace string using regexp  ${text1}  \\%|\,  ${EMPTY}
            click element  ${variation_to_entitlement_col}
            sleep  2s
            ${text2}  get text  ${var_to_entitlement_row_value}
            log  ${text2}
            ${text2Result}  replace string using regexp  ${text2}  \\%|\,  ${EMPTY}
            ${result}  evaluate  ${text2Result}>${text1Result}
            log  ${result}

User selects one by one plant from plant filter and Then verify calculations for "12-month SMI" column and "Variation to Entitlement" column
             wait until element is visible  plant  10s
             ${plant_file}  get file  ${plant_com_plant_filter_textfile}
             @{plant_array}  split to lines  ${plant_file}
             :FOR  ${item}  IN  @{plant_array}
             \  log  ${item}
             \  click element  plant
             \  sleep  15s
             \  input text  //mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[2]/input   ${item}
             \  sleep  4s
             \  click element  //*[@id="searchIcon"]
             \  run keyword and continue on failure  click element  ${item}
             \  wait until element is visible  ${Apply Button}  10s
             \  click button  ${Apply Button}
             \  sleep  3s
             \  wait until element is visible  ${smi_row_value}  10s
             \  ${smi_text}  get text  ${smi_row_value}
             \  log  ${smi_text}
             \  ${smi_text_Result}  replace string using regexp  ${smi_text}  \\%|\,  ${EMPTY}
             \  log  ${smi_text_Result}
             \  ${var_text}  get text  ${var_to_entitlement_row_value}
             \  log  ${var_text}
             \  ${var_text_Result}  replace string using regexp  ${var_text}  \\%|\,  ${EMPTY}
             \  log  ${var_text_Result}
             \  connect to database  dbConfigFile=${dbfile}
             \  ${queryResults1..}  QUERY  SELECT SUM(slow_moving_inventory_value) as smi_total FROM public.stock_policy_v where plant_code_plant_short_name='${item}';
             \  log  ${queryResults1..}
             \  ${convert}  convert to string  ${queryResults1..}
             \  log  ${convert}
             \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults1}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  log  ${queryResults1}
             \  ${queryResultLength1}  execute javascript  return String(${queryResults1}).length;
             \  log  ${queryResultLength1}
             \  ${queryResults1..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults1}};
             \  log  ${queryResults1..}
             \  ${queryResults2..}  QUERY  SELECT SUM(total_stock_usd) as total_usd FROM public.stock_policy_v where plant_code_plant_short_name='${item}';
             \  log  ${queryResults2..}
             \  ${convert}  convert to string  ${queryResults2..}
             \  log  ${convert}
             \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults2}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
             \  log  ${queryResults2}
             \  ${queryResultLength}  execute javascript  return String(${queryResults2}).length;
             \  log  ${queryResultLength}
             \  ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults2}};
             \  log  ${queryResults3..}
             \  ${result}  execute javascript  var x = `${queryResults1..}`;var y = `${queryResults3..}`;if (y > 0) {var z = ((x / y)*100); return z; } else {return 0;}
             \  log  ${result}
             \  ${smi_round_value}  execute javascript  var num = ${result};if(${result} > 0){return num;} else {return 0.0;}
             \  log  ${smi_round_value}
             \  ${round_avg}  execute javascript  var num = 0; num  = Number(${smi_round_value}).toFixed(1); return num;
             \  log  ${round_avg}
             \  ${smi_round_value}  set variable  ${round_avg}
             \  ${conver1}  convert to string  ${smi_round_value}
             \  run keyword and continue on failure  should be equal  ${conver1}  ${smi_text_Result}
             \  ${queryResults1..}  QUERY  SELECT SUM(positive_variation_value) as positive_variation_total FROM public.stock_policy_v where plant_code_plant_short_name='${item}';
             \  log  ${queryResults1..}
             \  ${convert}  convert to string  ${queryResults1..}
             \  log  ${convert}
             \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults1}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  log  ${queryResults1}
             \  ${queryResultLength1}  execute javascript  return String(${queryResults1}).length;
             \  log  ${queryResultLength1}
             \  ${queryResults1..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults1}};
             \  log  ${queryResults1..}
             \  ${queryResults2..}  QUERY  SELECT SUM(active_inventory_value) as active_total FROM public.stock_policy_v where plant_code_plant_short_name='${item}';
             \  log  ${queryResults2..}
             \  ${convert}  convert to string  ${queryResults2..}
             \  log  ${convert}
             \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults2}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
             \  log  ${queryResults2}
             \  ${queryResultLength}  execute javascript  return String(${queryResults2}).length;
             \  log  ${queryResultLength}
             \  ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults2}};
             \  log  ${queryResults3..}
             \  ${result}  execute javascript  var x = `${queryResults1..}`;var y = `${queryResults3..}`;if (y > 0) {var z = (100-(x / y)*100); return z; } else {return 0;}
             \  log  ${result}
             \  ${var_round_value}  execute javascript  var num = ${result};if(${result} > 0){return num;} else {return 0.0;}
             \  log  ${var_round_value}
             \  ${round_avg}  execute javascript  var num = 0; num  = Number(${var_round_value}).toFixed(1); return num;
             \  log  ${round_avg}
             \  run keyword and continue on failure  should be equal  ${round_avg}  ${var_text_Result}
             \  wait until element is visible  plant  20s
             \  click element  plant
             \  click element  ${show/selected}
             \  click element  ${paper_checkbox}
             \  wait until element is visible  ${Apply Button}  10s
             \  click button  ${Apply Button}
             \  sleep  2s

User selects one by one plant from plant filter and Then verify calculations for "12-month SMI" column and "Variation to Entitlement" column......
             wait until element is visible  plant  10s
             ${plant_file}  get file  ${plant_com_plant_filter_textfile}
             @{plant_array}  split to lines  ${plant_file}
             :FOR  ${item}  IN  @{plant_array}
             \  log  ${item}
             \  click element  plant
             \  sleep  15s
             \  input text  //mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[2]/input   ${item}
             \  sleep  4s
             \  click element  //*[@id="searchIcon"]
             \  run keyword and continue on failure  click element  ${item}
             \  wait until element is visible  ${Apply Button}  10s
             \  click button  ${Apply Button}
             \  sleep  3s
             \  wait until element is visible  ${smi_row_value}  10s
             \  ${smi_text}  get text  ${smi_row_value}
             \  log  ${smi_text}
             \  ${smi_text_Result}  replace string using regexp  ${smi_text}  \\%|\,  ${EMPTY}
             \  log  ${smi_text_Result}
             \  ${var_text}  get text  ${var_to_entitlement_row_value}
             \  log  ${var_text}
             \  ${var_text_Result}  replace string using regexp  ${var_text}  \\%|\,  ${EMPTY}
             \  log  ${var_text_Result}
             \  connect to database  dbConfigFile=${dbfile}
             \  ${queryResults1..}  QUERY  select (sum(smi_value) )/ sum(total_stock_usd) *100 FROM public.plant_comparison_trend_latest_v; where plant_code_plant_short_name='${item}';
             \  log  ${queryResults1..}
             \  ${convert}  convert to string  ${queryResults1..}
             \  log  ${convert}
             \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
             \  ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  ${queryResults1}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
             \  log  ${queryResults1}
             \  ${queryResultLength1}  execute javascript  return String(${queryResults1}).length;
             \  log  ${queryResultLength1}
             \  ${queryResults1..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults1}};
             \  log  ${queryResults1..}
              \  ${smi_round_value}  execute javascript  var num = ${queryResults1..};if(${queryResults1..} > 0){return num;} else {return 0.0;}
             \  log  ${smi_round_value}
             \  ${round_avg}  execute javascript  var num = 0; num  = Number(${smi_round_value}).toFixed(1); return num;
             \  log  ${round_avg}
             \  ${smi_round_value}  set variable  ${round_avg}
             \  ${conver1}  convert to string  ${smi_round_value}
             \  run keyword and continue on failure  should be equal  ${conver1}  ${smi_text_Result}

User clicks on "12-month SMI" row then user should direct to inventory entitlement module and user should see "Inventory Entitlement" title in page
             wait until element is visible  ${12-smi-smi-column}  20s
             mouse over  //vaadin-grid-table/table/tbody/tr/td[6]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
             double click element  //vaadin-grid-table/table/tbody/tr/td[6]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
             sleep  3s
             element should be visible  ${Inventory Entitlement Page Title}
             ${title}  get text  ${Inventory Entitlement Page Title}
             log  ${title}
             should be equal  ${title}  Inventory Entitlement

User clicks on "Variation to Entitlement" row then user should direct to inventory entitlement module and user should see "Inventory Entitlement" title in page
             click element  ${Plant Comparison Icon}
             sleep  4s
             wait until element is visible  ${variation_to_entitlement_col}  20s
             mouse over  //vaadin-grid-table/table/tbody/tr/td[7]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
             click element  //vaadin-grid-table/table/tbody/tr/td[7]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
             sleep  2s
             element should be visible  ${Inventory Entitlement Page Title}
             ${title}  get text  ${Inventory Entitlement Page Title}
             log  ${title}
             should be equal  ${title}  Inventory Entitlement