*** Settings ***
Library  Selenium2Library
Library  Collections
Library  OperatingSystem
Library  String
Resource  ../../Variables/inventory_entitlement_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User click Inventory Entitlement icon
     wait until element is not visible  ${Page Spinner}  10s
     run keyword  scroll page to location  0  1000
     wait until element is visible  ${Inventory Entitlement icon}  15s
     click element  ${Inventory Entitlement icon}
      sleep  25s
User should see "Inventory Entitlement"
     element should be visible  ${Inventory Entitlement Page Title}
     ${title}  get text  ${Inventory Entitlement Page Title}
     log  ${title}
     should be equal  ${title}  Inventory Entitlement

User should see spine with text fileds "Total Stock USD" ,"Active USD", "Entitlement Inventory","Variation To Entitlement" etc
     wait until element is visible  ${Inventory Entitlement Page Title}  40s
     page should contain element  spine
     ${text}  get text  ${TotalStockUSD_spine}
     ${result}  should be equal  ${text}  TOTAL STOCK USD
     ${title}  get text  ${ActiveUSD_spine}
     ${result1}  should be equal  ${title}  ACTIVE USD
     ${title1}  get text  ${SMI>12 MM USD_spine}
     ${result2}  should be equal  ${title1}  SMI > 12 MM USD
     ${title2}  get text  ${EntitlemntInv_spine}
     ${result3}  should be equal  ${title2}  ENTITLEMENT INVENTORY
     ${title3}  get text  ${Total_QTRInput_spine}
     ${result4}  should be equal  ${title3}  TOTAL QTR INPUT USD
     ${title4}  get text  ${+Var_To_Entitlement_spine}
     ${result5}  should be equal  ${title4}  + VARIATION TO ENTITLEMENT
     ${title5}  get text  ${EndOfQTR_Inv_spine}
     ${result}  should be equal  ${title5}  END OF QTR INVENTORY
     ${title6}  get text  ${QTR_I/O_Difference_spine}
     ${result}  should be equal  ${title6}  QRT I/O DIFFERENCE
     ${title7}  get text  ${Total_QTR_output_Usd_spine}
     ${result}  should be equal  ${title7}  TOTAL QTR OUTPUT USD

User should see "$" sign for the values in spine
     wait until element is visible  spine  20s
     #click element  app-nav
     element should contain  ${Total_stock_Usd_spine_value}  $
     element should contain  ${Active_Usd_spine_value}  $
     element should contain  ${smi>12mm_usd_spine_value}  $
     element should contain  ${entitlement_inv_spine_value}  $
     element should contain  ${Total_Qtr_Input_usd_value}  $
     element should contain  ${+VarToEntitlement_spine_value}  $
     element should contain  ${Total_Qtr_Output_usd_spine_value}  $
     element should contain  ${EndOfQtrInv_spine_value}  $
     element should contain  ${Qtr_I/O_Diff_spine_value}  $

User should see performance indicators for "smi>12mm usd","+var to entitlement","qtr i/o diff"
      wait until element is visible  spine  20s
      page should contain element  ${smi_performance_indicator}
      page should contain element  ${+var_to_entitlement_per_indicator}
      page should contain element  ${qtr_i/o_diff_perf_indicator}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})
#      click element  ${test_scroll_bar}
      #drag and drop by offset  ${test_scroll_bar}  0  1000

User should see correct value in spine for "+ VARIATION TO ENTITLEMENT","Active USD","Total Stock USD","SMI > 12 MM USD","ENTITLEMENT INVENTORY" after user round values taken from grid
      wait until element is visible  plant  20s
      run keyword  scroll page to location  100000  0
      click element  plant
      sleep  5s
      ${plant_file}  get file  ${inv_entitlement_plant_filter_data_text}
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log  ${item}
      \  click element  product-${item}
      \  wait until element is visible  ${Apply Button}  10s
      \  click button  ${Apply Button}
      \  sleep  10s
      # this all from below keywords which have code and we are calling that keywords inside the loop
      \  RUN KEYWORD  scroll page to location  0  10000000
      \  sleep  2s
      \  click element  ${plant_tree_tab_title}
      \  sleep  8s
      \  click element  ${Value ($)}
      \  sleep  2s
      \  click element  ${show/hide column}
      \  sleep  4s
      \  click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Standard Inventory (USD)')]
      \  click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Difference Std Inventory (USD)')]
      \  click element  //div[@id='gridContainer']//div[contains(normalize-space(), '-Var to Entitlement (USD)')]
      \  click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Entitlement Variation (USD)')]
      \  click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Total Outputs (USD)')]
      \  click element  ${show/hide column}
      \  sleep  3s
      \  Run Keyword  User should see correct values for "Total Stock Usd" on spine (Total Stock Usd=On Hand col)(for all plants)
      \  RUN KEYWORD  User should see correct values for "ACTIVE USD" on spine (ACTIVE USD=Active Inv(usd)col)for all plants in plant filter
      \  RUN KEYWORD  User should see correct values for "SMI > 12 MM USD" on spine (SMI > 12 MM USD=Slow Moving Inv(usd)col)for all plants in plant filter
      \  RUN KEYWORD  User should see correct values for "ENTITLEMENT INVENTORY" on spine (ENTITLEMENT INVENTORY=Entitlement Inv(usd)col)for all plants in plant filter
      \  RUN KEYWORD  User should see correct values for "+ VARIATION TO ENTITLEMENT" on spine (+ VARIATION TO ENTITLEMENT=+Var to Entitlement(usd)col)for all plants in plant filter
      #  the following steps for unchecking the selected plant
      \  wait until element is visible  plant  20s
      \  click element  plant
      \  sleep  3s
      \  wait until element is visible  search-input  10s
      \  click element  product-${item}

User should see correct values for "Total Stock Usd" on spine (Total Stock Usd=On Hand col)(for all plants)
      #the following steps is for getting value from spine for that field
      ${spine_value}  get text  ${Total_stock_Usd_spine_value}
      # the following conditions is for spine values if the value contains MM OR B OR K and $ or -$
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      sleep  10s
      #the following steps is for data grid and getting value and rounding value for that field
      ${grid_value}  get text  ${TotalStock_usd_value_grid}
      log  ${grid_value}
      ${TempString}  replace string  ${grid_value}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      # the following Javascript code from developer which is used in their code for rounding values
      log  ${TempString}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${TempString} > 0 ){if(${TempString}> 999999999){num  =  (${TempString}/1000000000).toFixed(1); return num;} else if(${TempString}> 999999){num  =  (${TempString}/1000000).toFixed(1); return num;}  else if(${TempString}> 999){num  =  (${TempString}/1000).toFixed(1); return num;}};
      log  ${result1}
      run keyword and continue on failure  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "ACTIVE USD" on spine (ACTIVE USD=Active Inv(usd)col)for all plants in plant filter
      #the following steps is for getting value from spine for that field
      ${spine_value}  get text  ${Active_Usd_spine_value}
      LOG  ${spine_value}
      # the following conditions is for spine values if the value contains MM OR B OR K and $ or -$
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      sleep  3s
      #the following steps is for data grid and getting value and rounding value for that field
      ${grid_value}  get text  ${Active_Usd_spine_grid_value}
      ${TempString}  replace string  ${grid_value}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      # the following Javascript code from developer which is used in their code for rounding values
      log  ${TempString}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${TempString} > 0 ){if(${TempString}> 999999999){num  =  (${TempString}/1000000000).toFixed(1); return num;} else if(${TempString}> 999999){num  =  (${TempString}/1000000).toFixed(1); return num;}  else if(${TempString}> 999){num  =  (${TempString}/1000).toFixed(1); return num;}};
      log  ${result1}
      run keyword and continue on failure  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "SMI > 12 MM USD" on spine (SMI > 12 MM USD=Slow Moving Inv(usd)col)for all plants in plant filter
      ${spine_value}  get text  ${smi>12mm_usd_spine_value}
      # the following Javascript code from developers
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      sleep  13s
      ${grid_value}  get text  ${smi>12mm_usd_spine_grid_value}
      ${TempString}  replace string  ${grid_value}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      # the following Javascript code from developer which is used in their code
      log  ${TempString}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${TempString} > 0 ){if(${TempString}> 999999999){num  =  (${TempString}/1000000000).toFixed(1); return num;} else if(${TempString}> 999999){num  =  (${TempString}/1000000).toFixed(1); return num;}  else if(${TempString}> 999){num  =  (${TempString}/1000).toFixed(1); return num;}};
      log  ${result1}
     run keyword and continue on failure  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "ENTITLEMENT INVENTORY" on spine (ENTITLEMENT INVENTORY=Entitlement Inv(usd)col)for all plants in plant filter
      ${spine_value}  get text  ${entitlement_inv_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      sleep  3s
      ${grid_value}  get text  ${entitlement_inv_spine_grid_value}
      ${TempString}  replace string  ${grid_value}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      # the following Javascript code from developer which is used in their code for rounding values
      log  ${TempString}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${TempString} > 0 ){if(${TempString}> 999999999){num  =  (${TempString}/1000000000).toFixed(1); return num;} else if(${TempString}> 999999){num  =  (${TempString}/1000000).toFixed(1); return num;}  else if(${TempString}> 999){num  =  (${TempString}/1000).toFixed(1); return num;}};
      log  ${result1}
      run keyword and continue on failure  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "+ VARIATION TO ENTITLEMENT" on spine (+ VARIATION TO ENTITLEMENT=+Var to Entitlement(usd)col)for all plants in plant filter
      ${spine_value}  get text  ${+VarToEntitlement_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      sleep  13s
      ${grid_value}  get text  ${+VarToEntitlement_spine_grid_value}
      ${TempString}  replace string  ${grid_value}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString}
      #the following Javascript code from developer which is used in their code for rounding values
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${TempString} > 0 ){if(${TempString}> 999999999){num  =  (${TempString}/1000000000).toFixed(1); return num;} else if(${TempString}> 999999){num  =  (${TempString}/1000000).toFixed(1); return num;}  else if(${TempString}> 999){num  =  (${TempString}/1000).toFixed(1); return num;}};
      log  ${result1}
      run keyword and continue on failure  should be equal as numbers  ${result1}  ${TempString1}

User should select plants FU03,E5WD,RF01
      wait until element is visible  plant  20s
      run keyword  scroll page to location  100000  0
      click element  plant
      sleep  3s
      wait until element is visible  search-input  10s
      input text  search-input  FU03
      wait until element is visible  product-FU03 - SHT Suzhou  20s
      click element  product-FU03 - SHT Suzhou
      wait until element is visible  search-input  10s
      input text  search-input  TT10
      wait until element is visible  product-TT10 - PES 2 Stafford  20s
      click element  product-TT10 - PES 2 Stafford
      wait until element is visible  search-input  10s
      input text  search-input  RF01
      wait until element is visible  product-RF01 - ATT Gebze  20s
      click element  product-RF01 - ATT Gebze
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      sleep  13s
      RUN KEYWORD  scroll page to location  0  10000000
      click element  ${Value ($)}
      sleep  10s
      click element  ${show/hide column}
      click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Standard Inventory (USD)')]
      click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Difference Std Inventory (USD)')]
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), '-Var to Entitlement (USD)')]
      click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Entitlement Variation (USD)')]
      click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Total Outputs (USD)')]
      click element  ${show/hide column}
      sleep  13s

User should see correct values for "Total Stock Usd" on spine (Total Stock Usd=On Hand col) for plants FU03,E5WD,RF01
      ${spine_value}  get text  ${Total_stock_Usd_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      ${Count1}  get text  ${onhand_col_row1}
      ${count2}  get text  ${onhand_col_row2}
      wait until element is visible  ${onhand_col_row3}  20s
      ${count3}  get text  ${onhand_col_row3}
      ${TempString}  replace string  ${Count1}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString2}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString2}
      ${TempString}  replace string  ${Count2}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString3}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString3}
      ${TempString}  replace string  ${Count3}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString4}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString4}
      ${count}  evaluate  ${TempString2}+${TempString3}+${TempString4}
      log  ${count}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${count} > 0 ){if(${count}> 999999999){num  =  (${count}/1000000000).toFixed(1); return num;} else if(${count}> 999999){num  =  (${count}/1000000).toFixed(1); return num;}  else if(${count}> 999){num  =  (${count}/1000).toFixed(1); return num;}};
      log  ${result1}
      Run Keyword if  ${result1} > 0  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for ""ACTIVE USD"" on spine ("ACTIVE USD"=Active Inv(usd)col) for plants FU03,E5WD,RF01
      ${spine_value}  get text  ${Active_Usd_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      # the following steps are for unchecking the unnecessary columns because dafault page have 12 columns, we need only 6
      ${Count1}  get text  ${active_usd_col_row1}
      ${count2}  get text  ${active_usd_col_row2}
      wait until element is visible  ${active_usd_col_row3}   20s
      ${count3}  get text  ${active_usd_col_row3}
      ${TempString}  replace string  ${Count1}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString2}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString2}
      ${TempString}  replace string  ${Count2}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString3}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString3}
      ${TempString}  replace string  ${Count3}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString4}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString4}
      ${count}  evaluate  ${TempString2}+${TempString3}+${TempString4}
      log  ${count}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${count} > 0 ){if(${count}> 999999999){num  =  (${count}/1000000000).toFixed(1); return num;} else if(${count}> 999999){num  =  (${count}/1000000).toFixed(1); return num;}  else if(${count}> 999){num  =  (${count}/1000).toFixed(1); return num;}};
      log  ${result1}
      Run Keyword if  ${result1} > 0  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "SMI > 12 MM USD" on spine ("SMI > 12 MM USD"=Slow Moving Inv(usd) col) for plants FU03,E5WD,RF01
      ${spine_value}  get text  ${smi>12mm_usd_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      ${Count1}  get text  ${smi_usd_column_row1}
      ${count2}  get text  ${smi_usd_column_row2}
      wait until element is visible  ${smi_usd_column_row3}  20s
      ${count3}  get text  ${smi_usd_column_row3}
      ${TempString}  replace string  ${Count1}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString2}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString2}
      ${TempString}  replace string  ${Count2}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString3}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString3}
      ${TempString}  replace string  ${Count3}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString4}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString4}
      ${count}  evaluate  ${TempString2}+${TempString3}+${TempString4}
      log  ${count}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${count} > 0 ){if(${count}> 999999999){num  =  (${count}/1000000000).toFixed(1); return num;} else if(${count}> 999999){num  =  (${count}/1000000).toFixed(1); return num;}  else if(${count}> 999){num  =  (${count}/1000).toFixed(1); return num;}};
      log  ${result1}
      Run Keyword if  ${result1} > 0  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "ENTITLEMENT INVENTORY" on spine ("ENTITLEMENT INVENTORY"=Entitlement Inv(usd) col) for plants FU03,E5WD,RF01
      ${spine_value}  get text  ${entitlement_inv_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      click element  ${plant_tree_tab_title}
      sleep  12s
      ${Count1}  get text  ${Entitlement_inv_column_row1}
      ${count2}  get text  ${Entitlement_inv_column_row2}
      wait until element is visible  ${Entitlement_inv_column_row3}  20s
      ${count3}  get text  ${Entitlement_inv_column_row3}
      ${TempString}  replace string  ${Count1}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString2}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString2}
      ${TempString}  replace string  ${Count2}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString3}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString3}
      ${TempString}  replace string  ${Count3}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString4}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString4}
      ${count}  evaluate  ${TempString2}+${TempString3}+${TempString4}
      log  ${count}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${count} > 0 ){if(${count}> 999999999){num  =  (${count}/1000000000).toFixed(1); return num;} else if(${count}> 999999){num  =  (${count}/1000000).toFixed(1); return num;}  else if(${count}> 999){num  =  (${count}/1000).toFixed(1); return num;}};
      log  ${result1}
      Run Keyword if  ${result1} > 0  should be equal as numbers  ${result1}  ${TempString1}

User should see correct values for "+ VARIATION TO ENTITLEMENT" on spine ("+ VARIATION TO ENTITLEMENT"=+Var to Entitlement(usd) col) for plants FU03,E5WD,RF01
      ${spine_value}  get text  ${+VarToEntitlement_spine_value}
      ${TempString1}  execute javascript  var value = `${spine_value}`; if(value.includes('-$')){ return value.replace('-$', '');} else { return value.replace('$', '');}
      ${TempString1}  execute javascript  var value = `${TempString1}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
      log  ${TempString1}
      click element  ${plant_tree_tab_title}
      ${Count1}  get text  ${+var_to_entitlement_column_row1}
      ${count2}  get text  ${+var_to_entitlement_column_row2}
      wait until element is visible  ${+var_to_entitlement_column_row3}  20s
      ${count3}  get text  ${+var_to_entitlement_column_row3}
      ${TempString}  replace string  ${Count1}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString2}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString2}
      ${TempString}  replace string  ${Count2}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString3}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString3}
      ${TempString}  replace string  ${Count3}  $  ${EMPTY}
      ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
      ${TempString4}  replace string  ${TempString}  ,  ${EMPTY}
      log  ${TempString4}
      ${count}  evaluate  ${TempString2}+${TempString3}+${TempString4}
      log  ${count}
      ${result1}  execute javascript  if (`${TempString}` == '0.00' || `${TempString}` == 'undefined' || `${TempString}` == 'null' ){ return '0';}; var num=0; if(${count} > 0 ){if(${count}> 999999999){num  =  (${count}/1000000000).toFixed(1); return num;} else if(${count}> 999999){num  =  (${count}/1000000).toFixed(1); return num;}  else if(${count}> 999){num  =  (${count}/1000).toFixed(1); return num;}};
      log  ${result1}
      Run Keyword if  ${result1} > 0  should be equal as numbers  ${result1}  ${TempString1}

