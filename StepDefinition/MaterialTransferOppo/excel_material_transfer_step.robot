*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library	 ExcelLibrary
Library  ../../Suits/excel_library.py
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot
Resource  ../../Variables/Material_Transfer_variables.robot
Library   ../../Utilities/utility.py

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  27s
       wait until page contains  addFilterBtn  10s

open excel file for opportuinities grid
     [Arguments]  ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
     log  ${path}
     ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
     [Return]  ${excel_file}
     ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
     log  ${total_no.ofrows_excel}
      ${total_no.ofrows_excel for opportunities..}  convert to string  ${total_no.ofrows_excel}
      set global variable  ${total_no.ofrows_excel for opportunities..}

Gets the total opportunity total from excel for selling opportunities
      [Arguments]   ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

     ${Total Opportunity for selling sum from excel}=  get_excel_column_sum  ${path}/Downloads/${excel_file_name}  Opportunity $
     [Return]  ${Total Opportunity for selling sum from excel}
     ${tup1}  set variable  ${Total Opportunity for selling sum from excel}
     set global variable  ${Total Opportunity for selling sum from excel}

     ${Total Opportunity for selling sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
     log  ${Total Opportunity for selling sum from excel..}
     ${Total Opportunity for selling sum from excel1..}  execute javascript  var result = ${Total Opportunity for selling sum from excel..}.toFixed(1); return result;
         log  ${Total Opportunity for selling sum from excel1..}
         ${CONVERT}  convert to string  ${Total Opportunity for selling sum from excel1..}
         ${Total Opportunity for selling sum from excel2..}  execute javascript  var value = `${CONVERT}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
          log  ${Total Opportunity for selling sum from excel2..}
      set global variable  ${Total Opportunity for selling sum from excel2..}

Gets the total opportunity total from excel for Buying opportunities
      [Arguments]   ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}

     ${Total Opportunity for buying sum from excel}=  get_excel_column_sum  ${path}/Downloads/${excel_file_name}  Opportunity $
     [Return]  ${Total Opportunity for buying sum from excel}
     ${tup1}  set variable  ${Total Opportunity for buying sum from excel}
     set global variable  ${Total Opportunity for buying sum from excel}

     ${Total Opportunity for buying sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
     log  ${Total Opportunity for buying sum from excel..}
     ${Total Opportunity for buying sum from excel1..}  execute javascript  var result = ${Total Opportunity for buying sum from excel..}.toFixed(1); return result;
         log  ${Total Opportunity for buying sum from excel1..}
         ${CONVERT}  convert to string  ${Total Opportunity for buying sum from excel1..}
         ${Total Opportunity for buying sum from excel2..}  execute javascript  var value = `${CONVERT}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
          log  ${Total Opportunity for buying sum from excel2..}
      set global variable  ${Total Opportunity for buying sum from excel2..}



get count of total opportunities from spine
     ${waiting for action count}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][1]/div[2]
     log  ${waiting for action count}
     ${convert}  convert to string  ${waiting for action count}
     ${waiting for action count_number}  replace string using regexp  ${waiting for action count}  \\Opps|\,  ${EMPTY}
     log  ${waiting for action count_number}
     set global variable  ${waiting for action count_number}

get value of total opportunities from spine
     ${waiting for action value}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][1]/div[4]
     log  ${waiting for action value}
     ${convert}  convert to string  ${waiting for action value}
     ${waiting for action value_number}  replace string using regexp  ${waiting for action value}  \\$|\,  ${EMPTY}
     ${waiting for action value_number..}  replace string using regexp  ${waiting for action value_number}  \\USD|\,  ${EMPTY}
     log  ${waiting for action value_number..}
     ${waiting for action value_number1..}  execute javascript  var value = `${waiting for action value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${waiting for action value_number1..}
     set global variable  ${waiting for action value_number1..}

click on export to excel(export checklist) in waiting for action grid for total opportunities
     click element  //*[@id="sellingOpp"]//*[@id="exportExcel"]
     sleep  2s
     click element  //*[@id="sellingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
     sleep  20s

get count of IN PROCESS from spine
   ${IN PROCESS count}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][2]/div[2]
     log  ${IN PROCESS count}
     ${convert}  convert to string  ${IN PROCESS count}
     ${IN PROCESS count_number}  replace string using regexp  ${IN PROCESS count}  \\Opps|\,  ${EMPTY}
     log  ${IN PROCESS count_number}
     set global variable  ${IN PROCESS count_number}

get value of IN PROCESS from spine
   ${IN PROCESS value}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][2]/div[4]
     log  ${IN PROCESS value}
     ${convert}  convert to string  ${IN PROCESS value}
     ${IN PROCESS value_number}  replace string using regexp  ${IN PROCESS value}  \\$|\,  ${EMPTY}
     ${IN PROCESS value_number..}  replace string using regexp  ${IN PROCESS value_number}  \\USD|\,  ${EMPTY}
     log  ${IN PROCESS value_number..}
     ${IN PROCESS value_number1..}  execute javascript  var value = `${IN PROCESS value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${IN PROCESS value_number1..}
     set global variable  ${IN PROCESS value_number1..}

click on export to excel(export checklist) in "${grid name}" grid
     click element  //*[@id="sellingOpp"]//*[@id="exportExcel"]
     sleep  2s
     click element  //*[@id="sellingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
     sleep  20s

click on export to excel(export checklist) in "${grid name}" buying grid
      click element  //*[@id="buyingOpp"]//*[@id="exportExcel"]
     sleep  2s
     click element  //*[@id="buyingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
     sleep  20s

click on export to excel(export checklist) in EXECUTED grid
    click element  //*[@id="sellingOpp"]//*[@id="oldXlsExport"]
     sleep  12s
click on export to excel(export checklist) in EXECUTED buying grid
    click element  //*[@id="buyingOpp"]//*[@id="oldXlsExport"]
     sleep  12s

get count of EXECUTED from spine
    ${EXECUTED count}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][4]/div[2]
     log  ${EXECUTED count}
     ${convert}  convert to string  ${EXECUTED count}
     ${EXECUTED count_number}  replace string using regexp  ${EXECUTED count}  \\Opps|\,  ${EMPTY}
     log  ${EXECUTED count_number}
     set global variable  ${EXECUTED count_number}

get value of EXECUTED from spine
    ${EXECUTED value}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][4]/div[4]
     log  ${EXECUTED value}
     ${convert}  convert to string  ${EXECUTED value}
     ${EXECUTED value_number}  replace string using regexp  ${EXECUTED value}  \\$|\,  ${EMPTY}
     ${EXECUTED value_number..}  replace string using regexp  ${EXECUTED value_number}  \\USD|\,  ${EMPTY}
     log  ${EXECUTED value_number..}
     ${EXECUTED value_number1..}  execute javascript  var value = `${EXECUTED value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${EXECUTED value_number1..}
     set global variable  ${EXECUTED value_number1..}

get count of ACCEPTED from spine
     ${ACCEPTED count}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][3]/div[2]
     log  ${ACCEPTED count}
     ${convert}  convert to string  ${ACCEPTED count}
     ${ACCEPTED count_number}  replace string using regexp  ${ACCEPTED count}  \\Opps|\,  ${EMPTY}
     log  ${ACCEPTED count_number}
     set global variable  ${ACCEPTED count_number}

get value of ACCEPTED from spine
     ${ACCEPTED value}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][3]/div[4]
     log  ${ACCEPTED value}
     ${convert}  convert to string  ${ACCEPTED value}
     ${ACCEPTED value_number}  replace string using regexp  ${ACCEPTED value}  \\$|\,  ${EMPTY}
     ${ACCEPTED value_number..}  replace string using regexp  ${ACCEPTED value_number}  \\USD|\,  ${EMPTY}
     log  ${ACCEPTED value_number..}
     ${ACCEPTED value_number1..}  execute javascript  var value = `${ACCEPTED value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${ACCEPTED value_number1..}
     set global variable  ${ACCEPTED value_number1..}

get count of REJECTED from spine
     ${REJECTED count}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][5]/div[2]
     log  ${REJECTED count}
     ${convert}  convert to string  ${REJECTED count}
     ${REJECTED count_number}  replace string using regexp  ${REJECTED count}  \\Opps|\,  ${EMPTY}
     log  ${REJECTED count_number}
     set global variable  ${REJECTED count_number}

get value of REJECTED from spine
     ${REJECTED value}  get text  //div[@id='sellingOpp']/div[@id='sellSpineData']/div[@class='cell style-scope mo-material-transfer'][5]/div[4]
     log  ${REJECTED value}
     ${convert}  convert to string  ${REJECTED value}
     ${REJECTED value_number}  replace string using regexp  ${REJECTED value}  \\$|\,  ${EMPTY}
     ${REJECTED value_number..}  replace string using regexp  ${REJECTED value_number}  \\USD|\,  ${EMPTY}
     log  ${REJECTED value_number..}
     ${REJECTED value_number1..}  execute javascript  var value = `${REJECTED value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${REJECTED value_number1..}
     set global variable  ${REJECTED value_number1..}

get count of total opportunities from spine for buying grid
     ${waiting for action count}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][1]/div[2]
     log  ${waiting for action count}
     ${convert}  convert to string  ${waiting for action count}
     ${waiting for action count_number_buyer}  replace string using regexp  ${waiting for action count}  \\Opps|\,  ${EMPTY}
     log  ${waiting for action count_number_buyer}
     set global variable  ${waiting for action count_number_buyer}

get value of total opportunities from spine for buying grid
     ${waiting for action value}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][1]/div[4]
     log  ${waiting for action value}
     ${convert}  convert to string  ${waiting for action value}
     ${waiting for action value_number}  replace string using regexp  ${waiting for action value}  \\$|\,  ${EMPTY}
     ${waiting for action value_number..}  replace string using regexp  ${waiting for action value_number}  \\USD|\,  ${EMPTY}
     log  ${waiting for action value_number..}
     ${waiting for action value_number1_buyer..}  execute javascript  var value = `${waiting for action value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${waiting for action value_number1_buyer..}
     set global variable  ${waiting for action value_number1_buyer..}

get count of IN PROCESS from spine for buying grid
    ${IN PROCESS count}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][2]/div[2]
     log  ${IN PROCESS count}
     ${convert}  convert to string  ${IN PROCESS count}
     ${IN PROCESS count_number_buyer}  replace string using regexp  ${IN PROCESS count}  \\Opps|\,  ${EMPTY}
     log  ${IN PROCESS count_number_buyer}
     set global variable  ${IN PROCESS count_number_buyer}

get value of IN PROCESS from spine for buying grid
   ${IN PROCESS value}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][2]/div[4]
     log  ${IN PROCESS value}
     ${convert}  convert to string  ${IN PROCESS value}
     ${IN PROCESS value_number}  replace string using regexp  ${IN PROCESS value}  \\$|\,  ${EMPTY}
     ${IN PROCESS value_number..}  replace string using regexp  ${IN PROCESS value_number}  \\USD|\,  ${EMPTY}
     log  ${IN PROCESS value_number..}
     ${IN PROCESS value_number1_buyer..}  execute javascript  var value = `${IN PROCESS value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${IN PROCESS value_number1_buyer..}
     set global variable  ${IN PROCESS value_number1_buyer..}

get count of ACCEPTED from spine for buying grid
     ${ACCEPTED count}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][3]/div[2]
     log  ${ACCEPTED count}
     ${convert}  convert to string  ${ACCEPTED count}
     ${ACCEPTED count_number_buyer}  replace string using regexp  ${ACCEPTED count}  \\Opps|\,  ${EMPTY}
     log  ${ACCEPTED count_number_buyer}
     set global variable  ${ACCEPTED count_number_buyer}

get value of ACCEPTED from spine for buying grid
     ${ACCEPTED value}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][3]/div[4]
     log  ${ACCEPTED value}
     ${convert}  convert to string  ${ACCEPTED value}
     ${ACCEPTED value_number}  replace string using regexp  ${ACCEPTED value}  \\$|\,  ${EMPTY}
     ${ACCEPTED value_number..}  replace string using regexp  ${ACCEPTED value_number}  \\USD|\,  ${EMPTY}
     log  ${ACCEPTED value_number..}
     ${ACCEPTED value_number1_buyer..}  execute javascript  var value = `${ACCEPTED value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${ACCEPTED value_number1_buyer..}
     set global variable  ${ACCEPTED value_number1_buyer..}

get count of EXECUTED from spine for buying grid
     ${EXECUTED count}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][4]/div[2]
     log  ${EXECUTED count}
     ${convert}  convert to string  ${EXECUTED count}
     ${EXECUTED count_number_buyer}  replace string using regexp  ${EXECUTED count}  \\Opps|\,  ${EMPTY}
     log  ${EXECUTED count_number_buyer}
     set global variable  ${EXECUTED count_number_buyer}

get value of EXECUTED from spine for buying grid
     ${EXECUTED value}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][4]/div[4]
     log  ${EXECUTED value}
     ${convert}  convert to string  ${EXECUTED value}
     ${EXECUTED value_number}  replace string using regexp  ${EXECUTED value}  \\$|\,  ${EMPTY}
     ${EXECUTED value_number..}  replace string using regexp  ${EXECUTED value_number}  \\USD|\,  ${EMPTY}
     log  ${EXECUTED value_number..}
     ${EXECUTED value_number1_buyer..}  execute javascript  var value = `${EXECUTED value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${EXECUTED value_number1_buyer..}
     set global variable  ${EXECUTED value_number1_buyer..}

get count of REJECTED from spine for buying grid
    ${REJECTED count}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][5]/div[2]
     log  ${REJECTED count}
     ${convert}  convert to string  ${REJECTED count}
     ${REJECTED count_number_buyer}  replace string using regexp  ${REJECTED count}  \\Opps|\,  ${EMPTY}
     log  ${REJECTED count_number_buyer}
     set global variable  ${REJECTED count_number_buyer}

get value of REJECTED from spine for buying grid
     ${REJECTED value}  get text  //div[@id='buyingOpp']/div[@id='buySpineData']/div[@class='cell style-scope mo-material-transfer'][5]/div[4]
     log  ${REJECTED value}
     ${convert}  convert to string  ${REJECTED value}
     ${REJECTED value_number}  replace string using regexp  ${REJECTED value}  \\$|\,  ${EMPTY}
     ${REJECTED value_number..}  replace string using regexp  ${REJECTED value_number}  \\USD|\,  ${EMPTY}
     log  ${REJECTED value_number..}
     ${REJECTED value_number1_buyer..}  execute javascript  var value = `${REJECTED value_number..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     log  ${REJECTED value_number1_buyer..}
     ${REJECTED value_number1_buyer1..}  convert to string  ${REJECTED value_number1_buyer..}
     set global variable  ${REJECTED value_number1_buyer1..}

click on export to excel(export checklist) in waiting for action grid for EXECUTED
     click element  //*[@id='mos-xls-button']/a[@id='oldXlsExport']
     sleep  20s

click on export to excel(export checklist) in waiting for action grid for total opportunities for buyer
    click element  //*[@id="buyingOpp"]//*[@id="exportExcel"]
     sleep  4s
     click element  //*[@id="buyingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
     sleep  20s

count and values from spine for waiting for action should be equal to count and value of total opportunities in excel
     should be equal as numbers  ${waiting for action count_number}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${waiting for action value_number1..}  ${Total Opportunity for selling sum from excel2..}

count and values from spine for IN PROCESS should be equal to count and value of total opportunities in excel
     should be equal as numbers  ${IN PROCESS count_number}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${IN PROCESS value_number1..}  ${Total Opportunity for selling sum from excel2..}

count and values from spine for ACCEPTED should be equal to count and value of total opportunities in excel
     should be equal as numbers  ${ACCEPTED count_number}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${ACCEPTED value_number1..}  ${Total Opportunity for selling sum from excel2..}

count and values from spine for EXECUTED should be equal to count and value of total opportunities in excel
     should be equal as numbers  ${EXECUTED count_number}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${EXECUTED value_number1..}  ${Total Opportunity for selling sum from excel2..}

count and values from spine for REJECTED should be equal to count and value of total opportunities in excel
     should be equal as numbers  ${REJECTED count_number}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${REJECTED value_number1..}  ${Total Opportunity for selling sum from excel2..}

count and values from spine for waiting for action should be equal to count and value of total opportunities in excel for buying grid
     should be equal as numbers  ${waiting for action count_number_buyer}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${waiting for action value_number1_buyer..}  ${Total Opportunity for buying sum from excel2..}

count and values from spine for IN PROCESS should be equal to count and value of total opportunities in excel for buying grid
     should be equal as numbers  ${IN PROCESS count_number_buyer}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${IN PROCESS value_number1_buyer..}  ${Total Opportunity for buying sum from excel2..}

count and values from spine for ACCEPTED should be equal to count and value of total opportunities in excel for buying grid
     should be equal as numbers  ${ACCEPTED count_number_buyer}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${ACCEPTED value_number1_buyer..}  ${Total Opportunity for buying sum from excel2..}

count and values from spine for EXECUTED should be equal to count and value of total opportunities in excel for buying grid
     should be equal as numbers  ${EXECUTED count_number_buyer}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${EXECUTED value_number1_buyer..}  ${Total Opportunity for buying sum from excel2..}

count and values from spine for REJECTED should be equal to count and value of total opportunities in excel for buying grid
     should be equal as numbers  ${REJECTED count_number_buyer}  ${total_no.ofrows_excel for opportunities..}
     should be equal as numbers  ${REJECTED value_number1_buyer1..}  ${Total Opportunity for buying sum from excel2..}