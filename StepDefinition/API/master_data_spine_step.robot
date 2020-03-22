*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  RequestsLibrary
Library  Process
Library  OperatingSystem
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User click Master Data icon
        click element  ${Master Data Icon}
        sleep  13s
User should see "Master Data"
         element should be visible  ${Master Data Page Title}

User should see Today(consistencies) text with right numbers(total sum of quantity) on the spine
         ${today_spine_value}  get text  //*[@id="endPointNum"]
         log  ${today_spine_value}
         ${today_spine_value..}  replace string using regexp  ${today_spine_value}  \\,|\,  ${EMPTY}
         log  ${today_spine_value..}
         ${today_spine_value..1}  convert to integer  ${today_spine_value..}
         ${mmdc16_quantity_value}  get text  //*[@id="MMDC16"]/div/div[4]/mo-master-data-quantity-cell/span
           ${1}  replace string using regexp  ${mmdc16_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc53_quantity_value}  get text  //*[@id="MMDC53"]/div/div[4]/mo-master-data-quantity-cell/span
           ${2}  replace string using regexp  ${mmdc53_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc36_quantity_value}  get text  //*[@id="MMDC36"]/div/div[4]/mo-master-data-quantity-cell/span
           ${3}  replace string using regexp  ${mmdc36_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc39_quantity_value}  get text  //*[@id="MMDC39"]/div/div[4]/mo-master-data-quantity-cell/span
           ${4}  replace string using regexp  ${mmdc39_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc33_quantity_value}  get text  //*[@id="MMDC33"]/div/div[4]/mo-master-data-quantity-cell/span
           ${5}  replace string using regexp  ${mmdc33_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc32_quantity_value}  get text  //*[@id="MMDC32"]/div/div[4]/mo-master-data-quantity-cell/span
           ${6}  replace string using regexp  ${mmdc32_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc61_quantity_value}  get text  //*[@id="MMDC61"]/div/div[4]/mo-master-data-quantity-cell/span
           ${7}  replace string using regexp  ${mmdc61_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc11_quantity_value}  get text  //*[@id="MMDC11"]/div/div[4]/mo-master-data-quantity-cell/span
           ${8}  replace string using regexp  ${mmdc11_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc17_quantity_value}  get text  //*[@id="MMDC17"]/div/div[4]/mo-master-data-quantity-cell/span
           ${9}  replace string using regexp  ${mmdc17_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc54_quantity_value}  get text  //*[@id="MMDC54"]/div/div[4]/mo-master-data-quantity-cell/span
           ${10}  replace string using regexp  ${mmdc54_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc50_quantity_value}  get text  //*[@id="MMDC50"]/div/div[4]/mo-master-data-quantity-cell/span
           ${11}  replace string using regexp  ${mmdc50_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc15_quantity_value}  get text  //*[@id="MMDC15"]/div/div[4]/mo-master-data-quantity-cell/span
           ${12}  replace string using regexp  ${mmdc15_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc45_quantity_value}  get text  //*[@id="MMDC45"]/div/div[4]/mo-master-data-quantity-cell/span
           ${13}  replace string using regexp  ${mmdc45_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc18_quantity_value}  get text  //*[@id="MMDC18"]/div/div[4]/mo-master-data-quantity-cell/span
           ${14}  replace string using regexp  ${mmdc18_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc52_quantity_value}  get text  //*[@id="MMDC52"]/div/div[4]/mo-master-data-quantity-cell/span
           ${15}  replace string using regexp  ${mmdc52_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc51_quantity_value}  get text  //*[@id="MMDC51"]/div/div[4]/mo-master-data-quantity-cell/span
           ${16}  replace string using regexp  ${mmdc51_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc72_quantity_value}  get text  //*[@id="MMDC72"]/div/div[4]/mo-master-data-quantity-cell/span
           ${17}  replace string using regexp  ${mmdc72_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc98_quantity_value}  get text  //*[@id="MMDC98"]/div/div[4]/mo-master-data-quantity-cell/span
           ${18}  replace string using regexp  ${mmdc98_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc99_quantity_value}  get text  //*[@id="MMDC99"]/div/div[4]/mo-master-data-quantity-cell/span
           ${19}  replace string using regexp  ${mmdc99_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc101_quantity_value}  get text  //*[@id="MMDC101"]/div/div[4]/mo-master-data-quantity-cell/span
           ${20}  replace string using regexp  ${mmdc101_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc100_quantity_value}  get text  //*[@id="MMDC100"]/div/div[4]/mo-master-data-quantity-cell/span
           ${21}  replace string using regexp  ${mmdc100_quantity_value}  \\,|\,  ${EMPTY}

         ${mmdc102_quantity_value}  get text  //*[@id="MMDC102"]/div/div[4]/mo-master-data-quantity-cell/span
           ${22}  replace string using regexp  ${mmdc102_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc20_quantity_value}  get text  //*[@id="MMDC20"]/div/div[4]/mo-master-data-quantity-cell/span
           ${23}  replace string using regexp  ${mmdc20_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc21_quantity_value}  get text  //*[@id="MMDC21"]/div/div[4]/mo-master-data-quantity-cell/span
           ${24}  replace string using regexp  ${mmdc21_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc19_quantity_value}  get text  //*[@id="MMDC19"]/div/div[4]/mo-master-data-quantity-cell/span
           ${25}  replace string using regexp  ${mmdc19_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc104_quantity_value}  get text  //*[@id="MMDC104"]/div/div[4]/mo-master-data-quantity-cell/span
           ${26}  replace string using regexp  ${mmdc104_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc106_quantity_value}  get text  //*[@id="MMDC106"]/div/div[4]/mo-master-data-quantity-cell/span
           ${27}  replace string using regexp  ${mmdc106_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc105_quantity_value}  get text  //*[@id="MMDC105"]/div/div[4]/mo-master-data-quantity-cell/span
           ${28}  replace string using regexp  ${mmdc105_quantity_value}  \\,|\,  ${EMPTY}

           ${mmdc103_quantity_value}  get text  //*[@id="MMDC103"]/div/div[4]/mo-master-data-quantity-cell/span
           ${29}  replace string using regexp  ${mmdc103_quantity_value}  \\,|\,  ${EMPTY}

           ${grid_sum}  evaluate  ${1}+${2}+${3}+${4}+${5}+${6}+${7}+${8}+${9}+${10}+${11}+${12}+${13}+${14}+${15}+${16}+${17}+${18}+${19}+${20}+${21}+${22}+${23}+${24}+${25}+${26}+${27}+${28}+${29}
           log  ${grid_sum}
           should be equal  ${today_spine_value..1}  ${grid_sum}

Priority 1 Change-Day-over-Day Column Sum Should Match Corresponding Spine Value
    ${row_count}  get matching xpath count  //*[@class='priority1 style-scope mo-master-data-priority-cell']
    ${grid_sum}=  set variable  0
    convert to number  ${grid_sum}

    :FOR    ${i}  IN RANGE    1   ${row_count}+1
         \  ${value}  get text  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid'][${i}]//*//span[@class='style-scope mo-master-data-change-cell']
         \  ${value}  replace string using regexp  ${value}  ,  ${EMPTY}
         \  ${arrow}  run keyword if  '${value}' != 'no change'  get arrow  ${i}
         \  log  after: ${arrow}
         \  ${value}  set variable if  '${value}' == 'no change'  0  ${value}
         \  convert to number  ${value}
         \  ${neg_value}  evaluate  ${value} * -1
         \  ${value}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${value}
         \  ${grid_sum}  evaluate  ${grid_sum} + ${value}

    ${spine_sum}  get text  ${spine_value_customer_impacting}
#    ${spine_sum}  replace string using regexp  ${spine_sum}  ,  ${EMPTY}
    ${spine_sum}  execute javascript  var value = `${spine_sum}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    convert to number  ${spine_sum}
    ${arrow}  run keyword if  '${spine_sum}' != 'no change'  get element attribute  ${spine_arrow_customer_impacting}

    ${neg_value}  evaluate  ${spine_sum} * -1
    ${spine_sum}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${spine_sum}

    log  ${spine_sum}
    log  ${grid_sum}
    ${grid_sum1}  execute javascript  if (${grid_sum} == 0.00 || ${grid_sum} == undefined || ${grid_sum} == null ){ return 0; }; var num = 0; if(${grid_sum} > 0 ){ if(${grid_sum}> 999999999){  num  = (${grid_sum}/1000000000).toFixed(1); return num;}else if(${grid_sum}> 999999){ num  = (${grid_sum}/1000000).toFixed(1); return num; }  else if(${grid_sum}> 999){ num  = (${grid_sum}/1000).toFixed(1); return num; }else if(${grid_sum}> 0){ num  = ${grid_sum}; return num;} else if(${grid_sum}< 0){ return num; } };
    should be equal as numbers  ${spine_sum}   ${grid_sum1}


Priority 2 Change-Day-over-Day Column Sum Should Match Corresponding Spine Value
    ${total_row_count}  get matching xpath count  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid']
    ${row_count}  get matching xpath count  //*[@class='priority2 style-scope mo-master-data-priority-cell']
    ${priority_1_count}  get matching xpath count  //*[@class='priority1 style-scope mo-master-data-priority-cell']
    ${priority_3_count}  get matching xpath count  //*[@class='priority3 style-scope mo-master-data-priority-cell']

    ${first_index}  evaluate  ${priority_1_count}
    ${second_index}  evaluate  ${total_row_count}-${priority_3_count}

    ${grid_sum}=  set variable  0
    convert to number  ${grid_sum}
    :FOR    ${i}  IN RANGE     ${first_index}+1    ${second_index}+1
         \  ${value}  get text  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid'][${i}]//*//span[@class='style-scope mo-master-data-change-cell']
         \  ${value}  replace string using regexp  ${value}  ,  ${EMPTY}
         \  ${arrow}  run keyword if  '${value}' != 'no change'  get arrow  ${i}
         \  log  after: ${arrow}
         \  ${value}  set variable if  '${value}' == 'no change'  0  ${value}
         \  convert to number  ${value}
         \  ${neg_value}  evaluate  ${value} * -1
         \  ${value}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${value}
         \  ${grid_sum}  evaluate  ${grid_sum} + ${value}

    ${spine_sum}  get text  ${spine_value_cost/inventory_impacting}
    ${spine_sum}  execute javascript  var value = `${spine_sum}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    convert to number  ${spine_sum}
    ${arrow}  run keyword if  '${spine_sum}' != 'no change'  get element attribute  ${spine_arrow_cost/inventory_impacting}

    ${neg_value}  evaluate  ${spine_sum} * -1
    ${spine_sum}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${spine_sum}

    log  ${spine_sum}
    ${grid_sum1}  execute javascript  if (${grid_sum} == 0.00 || ${grid_sum} == undefined || ${grid_sum} == null ){ return 0; }; var num = 0; if(${grid_sum} > 0 ){ if(${grid_sum}> 999999999){  num  = (${grid_sum}/1000000000).toFixed(1); return num;}else if(${grid_sum}> 999999){ num  = (${grid_sum}/1000000).toFixed(1); return num; }  else if(${grid_sum}> 999){ num  = (${grid_sum}/1000).toFixed(1); return num; }else if(${grid_sum}> 0){ num  = ${grid_sum}; return num;} else if(${grid_sum}< 0){ return num; } };
    should be equal as numbers  ${spine_sum}   ${grid_sum1}


Priority 3 Change-Day-over-Day Column Sum Should Match Corresponding Spine Value
    ${total_row_count}  get matching xpath count  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid']
    ${row_count}  get matching xpath count  //*[@class='priority3 style-scope mo-master-data-priority-cell']
    ${first_index}  evaluate   ${total_row_count}-${row_count}
    ${grid_sum}=  set variable  0
    convert to number  ${grid_sum}
    :FOR    ${i}  IN RANGE  ${first_index}+1  ${total_row_count}+1
         \  ${value}  get text  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid'][${i}]//*//span[@class='style-scope mo-master-data-change-cell']
         \  ${value}  replace string using regexp  ${value}  ,  ${EMPTY}
         \  ${arrow}  run keyword if  '${value}' != 'no change'  get arrow  ${i}
         \  log  after: ${arrow}
         \  ${value}  set variable if  '${value}' == 'no change'  0  ${value}
         \  convert to number  ${value}
         \  ${neg_value}  evaluate  ${value} * -1
         \  ${value}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${value}
         \  ${grid_sum}  evaluate  ${grid_sum} + ${value}

    ${spine_sum}  get text  ${spine_value_data_consistency}
    ${spine_sum}  execute javascript  var value = `${spine_sum}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    convert to number  ${spine_sum}
    ${arrow}  run keyword if  '${spine_sum}' != 'no change'  get element attribute  ${spine_arrow_data_consistency}

    ${neg_value}  evaluate  ${spine_sum} * -1
    ${spine_sum}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${spine_sum}

    log  ${spine_sum}
    ${grid_sum1}  execute javascript  if (${grid_sum} == 0.00 || ${grid_sum} == undefined || ${grid_sum} == null ){ return 0; }; var num = 0; if(${grid_sum} > 0 ){ if(${grid_sum}> 999999999){  num  = (${grid_sum}/1000000000).toFixed(1); return num;}else if(${grid_sum}> 999999){ num  = (${grid_sum}/1000000).toFixed(1); return num; }  else if(${grid_sum}> 999){ num  = (${grid_sum}/1000).toFixed(1); return num; }else if(${grid_sum}> 0){ num  = ${grid_sum}; return num;} else if(${grid_sum}< 0){ return num; } };
    should be equal as numbers  ${spine_sum}   ${grid_sum1}


Change-Day-over-Day Column Sum Should Match Total Spine Value
    ${row_count}  get matching xpath count  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid']
    ${grid_sum}=  set variable  0
    convert to number  ${grid_sum}
    :FOR    ${i}  IN RANGE    1   ${row_count}+1
         \  ${value}  get text  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid'][${i}]//*//span[@class='style-scope mo-master-data-change-cell']
         \  ${value}  replace string using regexp  ${value}  ,  ${EMPTY}
         \  ${arrow}  run keyword if  '${value}' != 'no change'  get arrow  ${i}
         \  log  after: ${arrow}
         \  ${value}  set variable if  '${value}' == 'no change'  0  ${value}
         \  convert to number  ${value}
         \  ${neg_value}  evaluate  ${value} * -1
         \  ${value}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${value}
         \  ${grid_sum}  evaluate  ${grid_sum} + ${value}

    ${spine_sum}  get text  ${spine_value_total}
    ${spine_sum}  execute javascript  var value = `${spine_sum}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('k')){ value =  value.replace('k', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
    convert to number  ${spine_sum}
    ${arrow}  run keyword if  '${spine_sum}' != 'no change'  get element attribute  ${spine_arrow_total}

    ${neg_value}  evaluate  ${spine_sum} * -1
    ${spine_sum}  set variable if  '${arrow}' == 'arrow-upward'  ${neg_value}  ${spine_sum}

    log  ${spine_sum}
    ${grid_sum1}  execute javascript  if (${grid_sum} == 0.00 || ${grid_sum} == undefined || ${grid_sum} == null ){ return 0; }; var num = 0; if(${grid_sum} > 0 ){ if(${grid_sum}> 999999999){  num  = (${grid_sum}/1000000000).toFixed(1); return num;}else if(${grid_sum}> 999999){ num  = (${grid_sum}/1000000).toFixed(1); return num; }  else if(${grid_sum}> 999){ num  = (${grid_sum}/1000).toFixed(1); return num; }else if(${grid_sum}> 0){ num  = ${grid_sum}; return num;} else if(${grid_sum}< 0){ return num; } };
    should be equal as numbers  ${spine_sum}   ${grid_sum1}

Get Arrow
    [Arguments]  ${i}
     ${arrow}  get element attribute  //mo-master-data-row[@class='masterDataRow style-scope mo-master-data-grid'][${i}]//*//iron-icon[contains(@class, 'style-scope mo-master-data-change-cell')]@icon
    [Return]  ${arrow}

compare Cost/Inventory-impacting,customer-impacting,Data Consistency value in spine in ui with api
            ${token}  run   ${api_token}
            log to console  ${token}"
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/masterData  headers=${headers}                    ##/secure/api/v1/masterData  headers=${headers}   #/secure/api/v1/stockpolicy/stockOpportunities/total  headers=${headers}  #MySession  /secure/api/v1/masterData  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["counts_data"]["costImp"]["total"]}
            log  ${json["counts_data"]["custImp"]["total"]}
            log  ${json["counts_data"]["dataConst"]["total"]}
            log  ${json["counts_data"]["total"]["total"]}
            log  ${json["end_point"]}
            log  ${json["begin_point"]}
            [Return]  ${resp}
            go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/master-data
            sleep  3s
            ${cost/inventory-impacting value}  get text  ${spine_value_cost/inventory_impacting}
            log  ${cost/inventory-impacting value}
            should be equal  ${json["counts_data"]["costImp"]["total"]}  ${cost/inventory-impacting value}

            ${spine_value_customer_impacting..}  get text  ${spine_value_customer_impacting}
            log  ${spine_value_customer_impacting..}
            should be equal  ${json["counts_data"]["custImp"]["total"]}  ${spine_value_customer_impacting..}

            ${spine_value_data_consistency..}  get text  ${spine_value_data_consistency}
            log  ${spine_value_data_consistency..}
            should be equal  ${json["counts_data"]["dataConst"]["total"]}  ${spine_value_data_consistency..}

            ${spine_value_total..}  get text  ${spine_value_total}
            log  ${spine_value_total..}
            should be equal  ${json["counts_data"]["total"]["total"]}  ${spine_value_total..}

            ${spine_today_total_value..}  get text  //*[@id="endPointNum"]
            log  ${spine_today_total_value..}
            ${spine_today_total_value1..}  replace string using regexp  ${spine_today_total_value..}  \\,|\,  ${EMPTY}
            ${spine_today_total_value1...}  convert to integer  ${spine_today_total_value1..}
            should be equal  ${json["end_point"]}  ${spine_today_total_value1...}

            ${spine_begin_total_value..}  get text  //*[@id="start"]
            log  ${spine_begin_total_value..}
            ${spine_begin_total_value1..}  replace string using regexp  ${spine_begin_total_value..}  \\,|\,  ${EMPTY}
            ${spine_begin_total_value1...}  convert to integer  ${spine_begin_total_value1..}
            should be equal  ${json["begin_point"]}  ${spine_begin_total_value1...}