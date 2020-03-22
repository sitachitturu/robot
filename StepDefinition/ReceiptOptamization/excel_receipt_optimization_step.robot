7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  Collections
Library  OperatingSystem
Library  String
Library  ../../Suits/excel_library.py
Resource  ../../Library/filter_library.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Variables/receipt_optamization_variables.robot
Library   ../../Utilities/utility.py

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  25s
       wait until page contains  addFilterBtn  10s

User select Quarter View
    wait until element is visible  //div[@id='dropcell']//span[contains(normalize-space(), 'Month')]   10s
    click element  //div[@id='dropcell']//span[contains(normalize-space(), 'Month')]
    wait until element is visible  //ul[@id='list']//li[contains(normalize-space(), 'Quarter')]   10s
    click element  //ul[@id='list']//li[contains(normalize-space(), 'Quarter')]
    sleep  3s

User select year
    [Arguments]  ${current_year}  ${desired_year}
    wait until element is visible  //div[@id='dropcell']//span[contains(normalize-space(), '${current_year}')]   10s
    click element  //div[@id='dropcell']//span[contains(normalize-space(), '${current_year}')]
    wait until element is visible  //ul[@id='list']//li[contains(normalize-space(), '${desired_year}')]   10s
    click element  //ul[@id='list']//li[contains(normalize-space(), '${desired_year}')]
    sleep  3s

Total Opportunity Amount should equal excel sheet Sum("Open PO Amount") in current selected Quarter
    #Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
    ${open_po_amount} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[1]
    ${open_po_amount} =  fetch from right  ${open_po_amount}  $
    ${open_po_amount} =	 Convert To Number  ${open_po_amount}

    #Get The appropriate excel column index based on the quarter (Q1, Q2, Q3, or Q4)
    ${quarter} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    ${quarter} =  fetch from right  ${quarter}  (
    ${quarter} =  Get Substring	 ${quarter}  0  2
    log  ${quarter}

    ${excel_column} =  set variable  0
    ${excel_column} =  set variable if  '${quarter}' == 'Q1'    3    ${excel_column}
    ${excel_column} =  set variable if  '${quarter}' == 'Q2'    5    ${excel_column}
    ${excel_column} =  set variable if  '${quarter}' == 'Q3'    7    ${excel_column}
    ${excel_column} =  set variable if  '${quarter}' == 'Q4'    9    ${excel_column}
    log  ${excel_column}

    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    log  ${path}

    #Get the PO sum from the excel file
    ${column_sum}=  get excel column sum      ${path}/Downloads/ReceiptOptimizationQuarter.xlsx   ${excel_column}
    ${column_sum} =	Convert To Number  ${column_sum}

    #Get the unit next to the PO amount from the spine (either K, thousands, or M, millions)
    ${units}=  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    ${units}=	Get Substring	${units}  0  1
    log  ${units}

    #Scaling the PO Amount to the appropriate value according
    ${open_po_amount}=  set variable if  '${units}' == 'K'  ${open_po_amount*1000}  ${open_po_amount}
    ${open_po_amount}=  set variable if  '${units}' == 'M'  ${open_po_amount*1000000}  ${open_po_amount}

    #Scaling the multiple (for rounding purposes) to the appropriate units (thousands or millions)
    ${multiple}=  set variable  1
    ${multiple}=  set variable if  '${units}' == 'K'  100  ${multiple}
    ${multiple}=  set variable if  '${units}' == 'M'  100000  ${multiple}
    ${multiple} =	Convert To Number  ${multiple}

    #Rounding the column sum to the same multiple the PO amount from the spine is rounded to.
    ${column_sum}=  round to multiple  ${column_sum}  ${multiple}

    #Compairing the PO amount from the spine with the rounded value from the excel column sum
    should be equal as numbers  ${open_po_amount}  ${column_sum}


Total Opportunity Amount should equal excel sheet Sum ("Open Po Amount") in the next Quarter
    [Arguments]   ${excel_file_name}
    ${plant_file}  get file  ${receipt_opt_plant_filter_data}
    log  ${plant_file}
    @{plant_array}  split to lines  ${plant_file}
    :FOR  ${plant}  IN  @{plant_array}
      \  log  ${plant}
      \  click element  plant
      \  sleep  5s
      \  ${plant_code}  execute javascript  var string = "${plant}"; var returnStr = string.split(' ')[2]; return returnStr;
      \  input text  ${search_input_plant}  ${plant_code}
      \  click element  product-${plant}
      \  wait until element is visible  ${Apply Button}  10s
      \  click button  ${Apply Button}
      \  sleep  10s
    \  Remove old excel file  ReceiptOptimizationQuarter.xlsx
    \  sleep  8s
    \  User click "Export to Excel"  ${Export to Excel Quarter Data Table}
    \  #Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
    \  #Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
    \  ${open_po_amount} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
    \  ${open_po_amount} =  fetch from right  ${open_po_amount}  $
    \  ${open_po_amount} =	 Convert To Number  ${open_po_amount}
    \  #Get The appropriate excel column index based on the quarter (Q1, Q2, Q3, or Q4)
    \  ${quarter} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
    \  ${quarter} =  fetch from right  ${quarter}  (
    \  ${quarter} =  Get Substring	 ${quarter}  0  2
    \  log  ${quarter}
     \  ${units}=  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
     \  log  ${units}
     \  ${TempString1}  execute javascript  var value = `${units}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     \  log  ${TempString1}
     \  ${quarter year}  execute javascript  var string = "${TempString1}"; var returnStr = string.split(' ')[1]; return returnStr;
     \  ${quarter year}  fetch from right  ${quarter year}  (

    \  #check if windows (HOMEPATH), or Mac/Linux (HOME)
    \  ${status}=  run keyword and return status  log  %{HOME}
    \  ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    \  log  ${path}

    \  #Get the PO sum from the excel file
    \  ${column_sum}  get excel column sum  ${path}/Downloads/${excel_file_name}  ${quarter year} Opportunity
    \  log  ${column_sum}
    \  ${tup1}  set variable  ${column_sum}
    \  ${Total Opportunity sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
     \  log  ${Total Opportunity sum from excel..}

    \  #Get the unit next to the PO amount from the spine (either K, thousands, or M, millions)
    \  ${units}=  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
    \  ${units}=	Get Substring	${units}  0  1
    \  log  ${units}

    \  #Compairing the PO amount from the spine with the rounded value from the excel column sum
    \  run keyword and continue on failure  should be equal as numbers  ${Total Opportunity sum from excel..}  ${open_po_amount}
    \  click element  clearFilterBtn



Total Opportunity Amount should equal excel sheet Sum("Total Opportunity col.") in current selected Month - INDIVIDUAL PLANTS..
#Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
    [Arguments]   ${excel_file_name}
    ${open_po_amount} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[1]
    ${open_po_amount} =  fetch from right  ${open_po_amount}  $
    ${open_po_amount} =	 Convert To Number  ${open_po_amount}

    #Set the excel column to the Total Opportunity Column in the excel file, which is column index 7.
    ${excel_column} =  set variable  7

    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    log  ${path}

    #Get the PO sum from the excel file
    ${column_sum}  get excel column sum  ${path}/Downloads/${excel_file_name}  Total Opportunity
    log  ${column_sum}
    should be equal as numbers  ${column_sum}  ${open_po_amount}




Total Opportunity Amount should equal excel sheet Sum("Total Opportunity col.") in current selected Month - INDIVIDUAL PLANTS
    [Arguments]   ${excel_file_name}
    ${plant_file}  get file  ${receipt_opt_plant_filter_data}
    log  ${plant_file}
    @{plant_array}  split to lines  ${plant_file}
    :FOR  ${plant}  IN  @{plant_array}
      \  log  ${plant}
      \  click element  plant
      \  sleep  2s
      \  ${plant_code}  execute javascript  var string = "${plant}"; var returnStr = string.split(' ')[2]; return returnStr;
      \  input text  ${search_input_plant}  ${plant_code}
      \  click element  product-${plant}
      \  wait until element is visible  ${Apply Button}  10s
      \  click button  ${Apply Button}
      \  sleep  10s
      \  Remove old excel file  ReceiptOptimization.xlsx
      \  sleep  8s
      \  User click "Export to Excel"  ${Export to Excel defoult page}
      \  sleep  5s
        #Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
      \  ${open_po_amount} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[1]
      \  ${open_po_amount} =  fetch from right  ${open_po_amount}  $
      \  ${open_po_amount} =	 Convert To Number  ${open_po_amount}

      \  #Set the excel column to the Total Opportunity Column in the excel file, which is column index 7.
      \  ${status}=  run keyword and return status  log  %{HOME}
      \  ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
      \  log  ${path}

      #Get the PO sum from the excel file
    \  ${column_sum}  get excel column sum  ${path}/Downloads/${excel_file_name}  Total Opportunity
    \  log  ${column_sum}
    \  ${tup1}  set variable  ${column_sum}
    \  ${Total Opportunity sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
     \  log  ${Total Opportunity sum from excel..}
    \  should be equal as numbers  ${Total Opportunity sum from excel..}  ${open_po_amount}
        \  click element  clearFilterBtn



Total Opportunity Amount should equal excel sheet Sum("Open PO Amount") in current selected Quarter - INDIVIDUAL PLANTS
    [Arguments]   ${excel_file_name}
    ${plant_file}  get file  ${receipt_opt_plant_filter_data}
    log  ${plant_file}
    @{plant_array}  split to lines  ${plant_file}
    :FOR  ${plant}  IN  @{plant_array}
      \  log  ${plant}
      \  click element  plant
      \  sleep  5s
      \  ${plant_code}  execute javascript  var string = "${plant}"; var returnStr = string.split(' ')[2]; return returnStr;
      \  input text  ${search_input_plant}  ${plant_code}
      \  click element  product-${plant}
      \  wait until element is visible  ${Apply Button}  10s
      \  click button  ${Apply Button}
      \  sleep  10s
    \  Remove old excel file  ReceiptOptimizationQuarter.xlsx
    \  sleep  8s
    \  User click "Export to Excel"  ${Export to Excel Quarter Data Table}
    \  #Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
    \  #Get the Open PO Amount value from the spine (Total Opportunity Spine Value)
    \  ${open_po_amount} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[1]
    \  ${open_po_amount} =  fetch from right  ${open_po_amount}  $
    \  ${open_po_amount} =	 Convert To Number  ${open_po_amount}
    \  #Get The appropriate excel column index based on the quarter (Q1, Q2, Q3, or Q4)
    \  ${quarter} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    \  ${quarter} =  fetch from right  ${quarter}  (
    \  ${quarter} =  Get Substring	 ${quarter}  0  2
    \  log  ${quarter}
     \  ${units}=  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
     \  log  ${units}
     \  ${TempString1}  execute javascript  var value = `${units}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
     \  log  ${TempString1}
     \  ${quarter year}  execute javascript  var string = "${TempString1}"; var returnStr = string.split(' ')[1]; return returnStr;
     \  ${quarter year}  fetch from right  ${quarter year}  (

    \  #check if windows (HOMEPATH), or Mac/Linux (HOME)
    \  ${status}=  run keyword and return status  log  %{HOME}
    \  ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    \  log  ${path}

    \  #Get the PO sum from the excel file
    \  ${column_sum}  get excel column sum  ${path}/Downloads/${excel_file_name}  ${quarter year} Opportunity
    \  log  ${column_sum}
    \  ${tup1}  set variable  ${column_sum}
    \  ${Total Opportunity sum from excel..}  execute javascript  if (${tup1} == 0.00 || ${tup1} == undefined || ${tup1} == null ){ return 0; }; var num = 0; if(${tup1} > 0 ){ if(${tup1}> 999999999){  num  = (${tup1}/1000000000).toFixed(1); return num;}else if(${tup1}> 999999){ num  = (${tup1}/1000000).toFixed(1); return num; }  else if(${tup1}> 999){ num  = (${tup1}/1000).toFixed(1); return num; }else if(${tup1}> 0){ num  = ${tup1}; return num;} else if(${tup1}< 0){ return num; } };
     \  log  ${Total Opportunity sum from excel..}

    \  #Get the unit next to the PO amount from the spine (either K, thousands, or M, millions)
    \  ${units}=  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    \  ${units}=	Get Substring	${units}  0  1
    \  log  ${units}

    \  #Compairing the PO amount from the spine with the rounded value from the excel column sum
    \  should be equal as numbers  ${Total Opportunity sum from excel..}  ${open_po_amount}
    \  click element  clearFilterBtn


Ensure Appropriate Year Selected
    #Get The appropriate excel column index based on the quarter (Q1, Q2, Q3, or Q4)
    ${quarter} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
    ${quarter} =  fetch from right  ${quarter}  (
    ${quarter} =  Get Substring	 ${quarter}  0  2
    log  ${quarter}

    #Get the Year of the upcoming quarter. (If the current quarter is Q4, we will have to change the year drop-down to the following year because the upcoming quarter will be Q1 of the next year.
    ${current_year}  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    ${current_year}  fetch from left  ${current_year}  )
    ${current_year}  fetch from right  ${current_year}  ${SPACE}

    ${upcoming_year}  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
    ${upcoming_year}  fetch from left  ${upcoming_year}  )
    ${upcoming_year}  fetch from right  ${upcoming_year}  ${SPACE}

    log  ${current_year}
    log  ${upcoming_year}

    #if the upcoming quarter is q1, we must change the year to see the upcoming Q1 data
    #otherwise, it will automatically be on the correct date.
    run keyword if  '${quarter}' == 'Q1'  User select year   ${current_year}   ${upcoming_year}

