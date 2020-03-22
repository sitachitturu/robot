*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot

*** Keywords ***
User access "${link}" module
         wait until element is not visible  ${Page Spinner}  15s
         click link   ${link}
         sleep  15s
         wait until page contains  addFilterBtn   10s

User should see "MasterData" score card with "Customer-impacting Inconsistencies" ,"Cost-impacting Inconsistencies","Replenishment Strategy Inconsistencies" fields
         wait until element is visible  ${master_data_score_card}  30s
         element should contain  ${master_data_score_card}  Master Data
         element should contain  ${master_data_score_card}  Customer-impacting Inconsistencies
         element should contain  ${master_data_score_card}  Cost-impacting Inconsistencies
         element should contain  ${master_data_score_card}  Replenishment Strategy Inconsistencies

scroll page to location
         [Arguments]    ${x_location}    ${y_location}
         Execute JavaScript    window.scrollTo(${x_location},${y_location})

User should see right number for Customer-impacting Inconsistencies in Master Data score card
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${cust_im_incon}  get text  ${md_value}
         log  ${cust_im_incon}
         ${customer_value}  execute javascript  var value = `${cust_im_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${customer_value}
         set global variable  ${customer_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  6s
         run keyword  Customer-impacting Inconsistencies in Master Data score card

User should see right number for COST Impacting Inconsistencies in Master Data score card
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${cost_im_incon}  get text  ${md_cost_value}
         log  ${cost_im_incon}
         ${customer_value}  execute javascript  var value = `${cost_im_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${customer_value}
         set global variable  ${customer_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  10s
         run keyword  Cost-impacting Inconsistencies in Master Data score card

User should see right number for Replenishment Strategy Inconsistencies in Master Data score card
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${reple_stra_incon}  get text  ${md_strategy_value}
         log  ${reple_stra_incon}
         ${strategy_value}  execute javascript  var value = `${reple_stra_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${strategy_value}
         set global variable  ${strategy_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  13s
         run keyword  Replenishment Strategy Inconsistencies in Master Data score card


selecting business from plant business filter
         wait until element is visible  addFilterBtn  20s
         click element  addFilterBtn
         sleep  3s
         wait until element is visible  //*[@id='filterlist']//input[@value='business']  10s
         click element  //*[@id='filterlist']//input[@value='business']
         wait until element is visible  continue  10s
         click element  continue
         wait until element is visible  business  20s
         click element  business
         sleep  2s
         click element  product-Renewables
         wait until element is visible  ${business_Apply Button}  10s
         click button  ${business_Apply Button}
         sleep  13s

User should see right number for Customer-impacting Inconsistencies in Master Data score card by selecting different plants
         run keyword  selecting business from plant business filter
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${cust_im_incon}  get text  ${md_value}
         log  ${cust_im_incon}
         ${customer_value}  execute javascript  var value = `${cust_im_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
#         ${customer_value}  convert to integer  ${customer_value..}
         log  ${customer_value}
         set global variable  ${customer_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  13s
         run keyword  selecting business from plant business filter
         run keyword  Customer-impacting Inconsistencies in Master Data score card

User should see right number for COST Impacting Inconsistencies in Master Data score card by selecting different plants
         run keyword  selecting business from plant business filter
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${cost_im_incon}  get text  ${md_cost_value}
         log  ${cost_im_incon}
         ${customer_value}  execute javascript  var value = `${cost_im_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
#         ${customer_value}  convert to integer  ${customer_value..}
         log  ${customer_value}
         set global variable  ${customer_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  13s
         run keyword  selecting business from plant business filter
         run keyword  Cost-impacting Inconsistencies in Master Data score card

User should see right number for Replenishment Strategy Inconsistencies in Master Data score card by selecting different plants
         run keyword  selecting business from plant business filter
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${reple_stra_incon}  get text  ${md_strategy_value}
         log  ${reple_stra_incon}
         ${strategy_value}  execute javascript  var value = `${reple_stra_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${strategy_value}
         set global variable  ${strategy_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  13s
         run keyword  selecting business from plant business filter
         run keyword  Replenishment Strategy Inconsistencies in Master Data score card

selecting any region from region plant
         wait until element is visible  addFilterBtn  20s
         click button  addFilterBtn
         wait until element is visible  ${plant_region_filter}  10s
         click element  ${plant_region_filter}
         wait until element is visible  continue  10s
         click button  continue
         wait until element is visible  region  20s
         click element  region
         wait until element is visible  product-EMEA  20s
         click element  product-EMEA
         wait until element is visible  ${region_Apply Button}  10s
         click button  ${region_Apply Button}
         sleep  13s

User should see right number for Customer-impacting Inconsistencies in Master Data score card by selecting region from region filter
         run keyword  selecting any region from region plant
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${cust_im_incon}  get text  ${md_value}
         log  ${cust_im_incon}
         ${customer_value}  execute javascript  var value = `${cust_im_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${customer_value}
         set global variable  ${customer_value}
         #${customer_value..}  convert to integer  ${customer_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  13s
         run keyword  selecting any region from region plant
         run keyword  customer-impacting inconsistencies in master data score card

User should see right number for COST Impacting Inconsistencies in Master Data score card by selecting region fron region filter
         run keyword  selecting any region from region plant
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${cost_im_incon}  get text  ${md_cost_value}
         log  ${cost_im_incon}
         ${customer_value}  execute javascript  var value = `${cost_im_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${customer_value}
         set global variable  ${customer_value}
         #${customer_value..}  run keyword if  ${customer_value} = 0  convert to integer  ${customer_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  3s
         run keyword  selecting any region from region plant
         run keyword  Cost-impacting Inconsistencies in Master Data score card

User should see right number for Replenishment Strategy Inconsistencies in Master Data score card by selecting region fron region filter
         run keyword  selecting any region from region plant
         RUN KEYWORD  scroll page to location  0  100000
         sleep  3s
         ${reple_stra_incon}  get text  ${md_strategy_value}
         log  ${reple_stra_incon}
         ${strategy_value}  execute javascript  var value = `${reple_stra_incon}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
         log  ${strategy_value}
         set global variable  ${strategy_value}
         #validating data in master data module
         click element  ${master_data_module}
         sleep  10s
         run keyword  selecting any region from region plant
         run keyword  Replenishment strategy inconsistencies in master data score card

Customer-impacting Inconsistencies in Master Data score card
    ${priority_cell}  get text  //*[@id="MMDC16"]/div/div[1]/mo-master-data-priority-cell
    ${mmdc16_quantity_value}  get text  //*[@id="MMDC16"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc16_quantity_value1}  replace string using regexp  ${mmdc16_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc53_quantity_value}  get text  //*[@id="MMDC53"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc53_quantity_value2}  replace string using regexp  ${mmdc53_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc36_quantity_value}  get text  //*[@id="MMDC36"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc36_quantity_value3}  replace string using regexp  ${mmdc36_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc39_quantity_value}  get text  //*[@id="MMDC39"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc39_quantity_value4}  replace string using regexp  ${mmdc39_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc33_quantity_value}  get text  //*[@id="MMDC33"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc33_quantity_value5}  replace string using regexp  ${mmdc33_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc98_quantity_value}  get text  //*[@id="MMDC98"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc98_quantity_value6}  replace string using regexp  ${mmdc98_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc20_quantity_value}  get text  //*[@id="MMDC20"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc20_quantity_value7}  replace string using regexp  ${mmdc20_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc21_quantity_value}  get text  //*[@id="MMDC21"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc21_quantity_value8}  replace string using regexp  ${mmdc21_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc19_quantity_value}  get text  //*[@id="MMDC19"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc19_quantity_value9}  replace string using regexp  ${mmdc19_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc104_quantity_value}  get text  //*[@id="MMDC104"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc104_quantity_value10}  replace string using regexp  ${mmdc104_quantity_value}  \\,|\,  ${EMPTY}
    ${output}  evaluate  ${mmdc16_quantity_value1}+${mmdc53_quantity_value2}+${mmdc36_quantity_value3}+${mmdc39_quantity_value4}+${mmdc33_quantity_value5}+${mmdc98_quantity_value6}+${mmdc20_quantity_value7}+${mmdc21_quantity_value8}+${mmdc19_quantity_value9}+${mmdc104_quantity_value10}
    log  ${output}
    ${sum_priority1}  execute javascript  if (${output} == 0.00 || ${output} == undefined || ${output} == null ){ return 0; }; var num = 0; if(${output} > 0 ){ if(${output}> 999999999){  num  = (${output}/1000000000).toFixed(1); return num;}else if(${output}> 999999){ num  = (${output}/1000000).toFixed(1); return num; }  else if(${output}> 999){ num  = (${output}/1000).toFixed(1); return num; }else if(${output}> 0){ num  = ${output}; return num;} else if(${output}< 0){ return num; } };
    log  ${sum_priority1}
    ${sum_priority1..}  convert to string  ${sum_priority1}
    should be equal  ${customer_value}  ${sum_priority1..}

Cost-impacting Inconsistencies in Master Data score card
    ${mmdc11_quantity_value}  get text  //*[@id="MMDC11"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc11_quantity_value2}  replace string using regexp  ${mmdc11_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc17_quantity_value}  get text  //*[@id="MMDC17"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc17_quantity_value3}  replace string using regexp  ${mmdc17_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc54_quantity_value}  get text  //*[@id="MMDC54"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc54_quantity_value4}  replace string using regexp  ${mmdc54_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc50_quantity_value}  get text  //*[@id="MMDC50"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc50_quantity_value5}  replace string using regexp  ${mmdc50_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc15_quantity_value}  get text  //*[@id="MMDC15"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc15_quantity_value6}  replace string using regexp  ${mmdc15_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc32_quantity_value}  get text  //*[@id="MMDC32"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc32_quantity_value7}  replace string using regexp  ${mmdc32_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc45_quantity_value}  get text  //*[@id="MMDC45"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc45_quantity_value8}  replace string using regexp  ${mmdc45_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc61_quantity_value}  get text  //*[@id="MMDC61"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc61_quantity_value9}  replace string using regexp  ${mmdc61_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc99_quantity_value}  get text  //*[@id="MMDC99"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc99_quantity_value10}  replace string using regexp  ${mmdc99_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc100_quantity_value}  get text  //*[@id="MMDC100"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc100_quantity_value11}  replace string using regexp  ${mmdc100_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc101_quantity_value}  get text  //*[@id="MMDC101"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc101_quantity_value12}  replace string using regexp  ${mmdc101_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc102_quantity_value}  get text  //*[@id="MMDC102"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc102_quantity_value13}  replace string using regexp  ${mmdc102_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc106_quantity_value}  get text  //*[@id="MMDC106"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc106_quantity_value14}  replace string using regexp  ${mmdc106_quantity_value}  \\,|\,  ${EMPTY}

    ${mmdc105_quantity_value}  get text  //*[@id="MMDC105"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc105_quantity_value15}  replace string using regexp  ${mmdc105_quantity_value}  \\,|\,  ${EMPTY}

    ${output}  evaluate  ${mmdc11_quantity_value2}+${mmdc17_quantity_value3}+${mmdc54_quantity_value4}+${mmdc50_quantity_value5}+${mmdc15_quantity_value6}+${mmdc32_quantity_value7}+${mmdc45_quantity_value8}+${mmdc61_quantity_value9}+${mmdc99_quantity_value10}+${mmdc100_quantity_value11}+${mmdc101_quantity_value12}+${mmdc102_quantity_value13}+${mmdc106_quantity_value14}+${mmdc105_quantity_value15}
    log  ${output}
    ${sum_priority2}  execute javascript  if (${output} == 0.00 || ${output} == undefined || ${output} == null ){ return 0; }; var num = 0; if(${output} > 0 ){ if(${output}> 999999999){  num  = (${output}/1000000000).toFixed(1); return num;}else if(${output}> 999999){ num  = (${output}/1000000).toFixed(1); return num; }  else if(${output}> 999){ num  = (${output}/1000).toFixed(1); return num; }else if(${output}> 0){ num  = ${output}; return num;} else if(${output}< 0){ return num; } };
    log  ${sum_priority2}
    should be equal  ${customer_value}  ${sum_priority2}

Replenishment Strategy Inconsistencies in Master Data score card
    ${priority_cell}  get text  //*[@id="MMDC18"]/div/div[1]/mo-master-data-priority-cell
    ${mmdc18_quantity_value}  get text  //*[@id="MMDC18"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc18_quantity_value1}  replace string using regexp  ${mmdc18_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc52_quantity_value}  get text  //*[@id="MMDC52"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc52_quantity_value2}  replace string using regexp  ${mmdc52_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc51_quantity_value}  get text  //*[@id="MMDC51"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc51_quantity_value2}  replace string using regexp  ${mmdc51_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc72_quantity_value}  get text  //*[@id="MMDC72"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc72_quantity_value3}  replace string using regexp  ${mmdc72_quantity_value}  \\,|\,  ${EMPTY}
    ${mmdc103_quantity_value}  get text  //*[@id="MMDC103"]/div/div[4]/mo-master-data-quantity-cell/span
    ${mmdc103_quantity_value4}  replace string using regexp  ${mmdc103_quantity_value}  \\,|\,  ${EMPTY}

    ${output}  evaluate  ${mmdc18_quantity_value1}+${mmdc52_quantity_value2}+${mmdc51_quantity_value2}+${mmdc72_quantity_value3}+${mmdc103_quantity_value4}
    log  ${output}
    ${sum_priority1.}  execute javascript  if (${output} == 0.00 || ${output} == undefined || ${output} == null ){ return 0; }; var num = 0; if(${output} > 0 ){ if(${output}> 999999999){  num  = (${output}/1000000000).toFixed(1); return num;}else if(${output}> 999999){ num  = (${output}/1000000).toFixed(1); return num; }  else if(${output}> 999){ num  = (${output}/1000).toFixed(1); return num; }else if(${output}> 0){ num  = ${output}; return num;} else if(${output}< 0){ return num; } };
    log  ${sum_priority1.}
    ${sum_priority1}  convert to string  ${sum_priority1.}
    should be equal  ${strategy_value}  ${sum_priority1}



