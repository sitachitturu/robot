7/13/2017
212613237

*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  20s
       wait until page contains  addFilterBtn  10s

User should see "Total Opportunity","Number Of opportunities","UpComing Opportunities($)","Upcoming Opportunities(#)" fields on spine
       wait until element is visible  spine  20s
       ${text}  get text  ${total_oppor_text}
       should be equal  ${text}  TOTAL OPPORTUNITY
       ${text1}  get text  ${number_of_oppor_text}
       should be equal  ${text1}  NUMBER OF OPPORTUNITIES
       ${text2}  get text  ${upcoming_oppor($)_text}
       should be equal  ${text2}  UPCOMING OPPORTUNITIES ($)
       ${text3}  get text  ${upcoming_oppor(#)_text}
       should be equal  ${text3}  UPCOMING OPPORTUNITIES (#)

User select Quarter View
    wait until element is visible  //div[@id='dropcell']//span[contains(normalize-space(), 'Month')]   10s
    click element  //div[@id='dropcell']//span[contains(normalize-space(), 'Month')]
    wait until element is visible  //ul[@id='list']//li[contains(normalize-space(), 'Quarter')]   10s
    click element  //ul[@id='list']//li[contains(normalize-space(), 'Quarter')]
    sleep  3s

User Remove old ReceiptOptimizationQuarter.xlsx excel file
    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    #file may or may not exist, so thats why im running keyword and returing status, otherwise the whole test suite would break and fail
    run keyword and return status  remove file  ${path}/Downloads/ReceiptOptimizationQuarter.xlsx

User click "Export to Excel"
    wait until element is visible  ${Export to Excel Quarter Data Table}  10s
    click element  ${Export to Excel Quarter Data Table}
    sleep  3s

Total Opportunity Amount should equal excel sheet Sum("Open PO Amount") in current selected Quarter
    #Get the Open PO Amount value from the spine
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


Total Opportunity Amount should equal excel sheet Sum ("Open Po Amount") in the next Quarter.
    #Get the Open PO Amount value from the spine
    ${open_po_amount} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
    ${open_po_amount} =  fetch from right  ${open_po_amount}  $
    ${open_po_amount} =	 Convert To Number  ${open_po_amount}

    #Get The appropriate excel column index based on the quarter (Q1, Q2, Q3, or Q4)
    ${quarter} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
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
    ${column_sum}=  get excel column sum  ${path}/Downloads/ReceiptOptimizationQuarter.xlsx   ${excel_column}
    ${column_sum} =	Convert To Number  ${column_sum}

    #Get the unit next to the PO amount from the spine (either K, thousands, or M, millions)
    ${units}=  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
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


Number of Opportunities in current Quarter of spine should be the same as in the Database
    wait until element is visible   ${number_of_oppor_number_text}  10s
    ${num_of_opp_spine} =  get text  ${number_of_oppor_number_text}

    #Get the quarter and year for the apporpriate query
    ${quarter} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    ${quarter} =  fetch from right  ${quarter}  (
    ${quarter} =  Get Substring	 ${quarter}  0  2

    ${year} =  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[2]
    ${year} =  fetch from right  ${year}  (
    ${year} =  Get Substring  ${year}  3  7

    log  ${quarter}
    log  ${year}

    connect to database  dbConfigFile=${dbfile}
    ${queryResults}  QUERY  select COUNT(CASE WHEN estimated_pay_quarter='${quarter}' AND estimated_pay_year='${year}' THEN net_open_value_usd ELSE null END) AS "currentNumber" FROM "receipt_optimization_v" AS "receipt_optimization" WHERE "receipt_optimization"."opportunity" = 'opportunity'
    ${num_of_opp_db}  convert to string  ${queryResults[0]}

    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  \\(  ${EMPTY}
    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  \\)  ${EMPTY}
    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  ,  ${EMPTY}
    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  L  ${EMPTY}

    should be equal as numbers  ${num_of_opp_spine}   ${num_of_opp_db}


Number of Upcoming Opportunities in next Quarter of spine should be the same as in the Database
    wait until element is visible   ${number_of_upcoming_oppor_number_text}  10s
    ${num_of_opp_spine} =  get text  ${number_of_upcoming_oppor_number_text}

    #Get the quarter and year for the apporpriate query

    ${quarter} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
    ${quarter} =  fetch from right  ${quarter}  (
    ${quarter} =  Get Substring	 ${quarter}  0  2

    ${year} =  get text  //*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/span
    ${year} =  fetch from right  ${year}  (
    ${year} =  Get Substring  ${year}  3  7

    log  ${quarter}
    log  ${year}

    connect to database  dbConfigFile=${dbfile}
    ${queryResults}  QUERY  select COUNT(CASE WHEN estimated_pay_quarter='${quarter}' AND estimated_pay_year='${year}' THEN net_open_value_usd ELSE null END) AS "nextNumber" FROM "receipt_optimization_v" AS "receipt_optimization" WHERE "receipt_optimization"."opportunity" = 'opportunity'
    ${num_of_opp_db}  convert to string  ${queryResults[0]}

    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  \\(  ${EMPTY}
    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  \\)  ${EMPTY}
    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  ,  ${EMPTY}
    ${num_of_opp_db} =  replace string using regexp  ${num_of_opp_db}  L  ${EMPTY}

    should be equal as numbers  ${num_of_opp_spine}   ${num_of_opp_db}


Hover over "i" icon next to TOTAL OPPORTUNITY in Spine
    mouse over  //*[@id="spine-container"]/div/div[1]/div/div/span[1]/px-spine-tooltip/div/span/i
    wait until element is visible  //*[@id="spine-container"]/div/div[1]/div/div/span[1]/px-spine-tooltip/div/div/div[2]  2s
#    should be equal as strings  ${hover_text}   "Total Opportunity represents the sum of open PO amounts that fall within 10 days of the next upcoming critical push date. These POs have the opportunity to move from the current quarter into the next quarter."

User should see TOTAL OPPORTUNITY pop up message
    [Arguments]  ${expected_string}
    ${hover_text}=  get text  //*[@id="spine-container"]/div/div[1]/div/div/span[1]/px-spine-tooltip/div/div/div[2]
    log  ${hover_text}
    should be equal as strings  ${hover_text}   ${expected_string}


Hover over "i" icon next to OPPORTUNITIES BY
    mouse over  //*[@id="ro-info"]
    wait until element is visible  //*[@id="ro-tooltip"]  2s


User should see OPPORTUNITIES BY message
    [Arguments]  ${expected_string}
    ${hover_text}=  get text  //div[@id='tooltip-message']//p[contains(normalize-space(), '${expected_string}')]
    should be equal as strings  ${hover_text}   ${expected_string}