#Date:6-7-2017
#Modified by :sita chitturu(spine calculations changed)
#Modified by :olga radziwon(PO calculations changed)
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  Collections
Library  OperatingSystem
Library	 HttpLibrary.HTTP
Library	 RequestsLibrary
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User click Executive Summary icon
      click element  ${Executive-Summary Iicon}
      sleep  25s
User can see Selected Plant Score at Executive Summary page
      wait until element does not contain  accuracyContainer  --  60s
      sleep  15s
      ${selected_plant_score}  get text  xpath=//div[@id='spine']//span[@id='accuracy']
      log to console  Value in Selected Plant Score: [${selected_plant_score}]
      set global variable  ${selected_plant_score}
      ${Procurement-On Time Reqs}  get text  xpath=//div[@id='div1']//span[@id='accuracy']
      log to console  Value in Procurement-On Time Reqs: [${Procurement-On Time Reqs}]
      set global variable  ${Procurement-On Time Reqs}
      ${Scheduling-Scheduling Accuracy}  get text  xpath=//div[@id='div4']//span[@id='accuracy']
      log to console  Value in Scheduling-Scheduling Accuracy: [${Scheduling-Scheduling Accuracy}]
      set global variable  ${Scheduling-Scheduling Accuracy}

User access Purchase orders
      click element  ${purchase_orders icon}
      sleep  15s

User select Action Required from Exception Requires Action filter
      click element  ${Exception Requires Action filter}
      click button  continue
      click element  ${Exception Requires Action filter button}
      wait until element is visible  ${exception_requires_action_filter}  10s
      click element  ${action_required}
      click element  ${exp_apply_button}
      wait until element is not visible  ${Page Spinner}  50s

select "Exception Message" from "PURCHASE ORDER ITEMS BY"
      wait until element is not visible  pageSpinner  30s
      click element  ${age_classification_button}
#     click element  xpath=//px-dropdown[2]/div[contains(@class,'flex')]
      wait until element is visible  ${exception_message}  10s
      wait until element is not visible  pageSpinner  40s
      click element  ${exception_message}
      sleep  20s

change view to "Value ($)"
      wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
      click element  ${value$_tab}

User select Action Required from Exception Requires Action filter from edit filters
       sleep  20s
       click button  addFilterBtn
       click element  ${exception_require_action_filter_editfilters}
       wait until element is visible  continue  20s
       click element  continue
       click element  exp_action
       sleep  23s
       click element  product-Action Required
       wait until element is visible  ${exp_requires_action_apply}  20s
       click element  ${exp_requires_action_apply}
       sleep  15s

User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
       wait until element is visible  ${value_tab}  20s
       click element  ${value_tab}
       #wait until element is visible  //*[@id="purchaseHeatMap"]/div/div[3]/table/tfoot/tr/td[7]/div/span/div/span  20s
       sleep  13s
       ${total_value}  get text  ${total_col_grid}
       log  ${total_value}
       #set global variable  ${total_value}
       ${TempString3}  replace string  ${total_value}  |  ${EMPTY}
       ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString3..}
       ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text3..}
       ${convert}  convert to string  ${text3..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_col_value}

       set global variable  ${Total_col_value}
       run keyword  User select Action Required from Exception Requires Action filter from edit filters
       run keyword  select "Exception Message" from "PURCHASE ORDER ITEMS BY"
       wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
       wait until element is visible  ${value_tab}  20s
       click element  ${value_tab}
       sleep  13s

       ${cancellation}  get text  ${cancellation_col}
       log  ${cancellation}
       ${TempString3}  replace string  ${cancellation}  |  ${EMPTY}
       ${TempString..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString..}
       ${text..}  execute javascript  var string = "${TempString..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text..}
       ${convert}  convert to string  ${text..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_cancellation_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_cancellation_col_value}

       ${reschedule_in}  get text  ${reschedule_in_col}
       log  ${reschedule_in}
       ${TempString}  replace string  ${reschedule_in}  |  ${EMPTY}
       ${TempString1..}  replace string  ${TempString}  ,  ${EMPTY}
       log  ${TempString1..}
       ${text1..}  execute javascript  var string = "${TempString1..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text1..}
       ${convert}  convert to string  ${text1..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_reschedule_in_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_reschedule_in_col_value}

       ${reschedule_out}  get text  ${reschedule_out_col}
       log  ${reschedule_out}
       ${TempString1}  replace string  ${reschedule_out}  |  ${EMPTY}
       ${TempString2..}  replace string  ${TempString1}  ,  ${EMPTY}
       log  ${TempString2..}
       ${text2..}  execute javascript  var string = "${TempString2..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text2..}
       ${convert}  convert to string  ${text2..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_reschedule_out_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_reschedule_out_col_value}

       ${ff}  execute javascript  var x = `${Total_cancellation_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${ff}
       ${gg}  execute javascript  var x = `${Total_reschedule_in_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${gg}
       ${hh}  execute javascript  var x = `${Total_reschedule_out_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${hh}

       ${inverse for Procurement-Short Cycle}  execute javascript  var y = `${Procurement-Short Cycle}`; return (100 - y)*0.50
       ${inverse for Procurement-Cancellations}  execute javascript  var y = `${ff}`;var z = (100 - y)*4 ; return z
       ${inverse for Procurement-Reschedule Ins}  execute javascript  var y = `${gg}`;var z = (100 - y)*3 ; return z
       ${inverse for Procurement-Reschedule Outs}  execute javascript  var y = `${hh}`;var z = (100 - y)*3 ; return z

    ${sum product Procurement-On Time Reqs}  evaluate  ${Procurement-On Time Reqs} * 3
    log to console  ${sum product Procurement-On Time Reqs}

    ${sum product Procurement-On Time Pos}  evaluate  ${Procurement-On Time Pos} * 2
    log to console  ${sum product Procurement-On Time Pos}
    ${sum product Scheduling-Scheduling Accuracy}  evaluate  ${Scheduling-Scheduling Accuracy} * 3
    log to console  ${sum product Scheduling-Scheduling Accuracy}

    ${sumproduct}  evaluate  ${sum product Procurement-On Time Reqs}+${sum product Procurement-On Time Pos}+ (0 if ${Procurement-Short Cycle} == 0 else ${inverse for Procurement-Short Cycle}) + (0 if ${ff} == 0 else ${inverse for Procurement-Cancellations}) + (0 if ${gg} == 0 else ${inverse for Procurement-Reschedule Ins}) + (0 if ${hh} == 0 else ${inverse for Procurement-Reschedule Outs}) + ${sum product Scheduling-Scheduling Accuracy}

    ${weight}  evaluate   (3 if ${sum product Procurement-On Time Reqs} == 0 else 3) + (0 if ${sum product Procurement-On Time Pos} == 0 else 2) + (0 if ${inverse for Procurement-Short Cycle} == 50 else 0.5) + (0 if ${inverse for Procurement-Cancellations} == 400 else 4) + (0 if ${inverse for Procurement-Reschedule Ins} == 300 else 3) + (0 if ${inverse for Procurement-Reschedule Outs} == 300 else 3) + (0 if ${sum product Scheduling-Scheduling Accuracy} == 0 else 3)


    log to console  ${weight}
    log to console  ${sumproduct}
    set global variable  ${sumproduct}

    ${raw calculated score}  evaluate  ${sumproduct} / ${weight}
    ${number calculated score} =  Convert To Number  ${raw calculated score}  1
    ${calculated score}  convert to string  ${number calculated score}
    set global variable  ${calculated score}

substracting without Procurement-On Time Reqs
    ${raw calculated score}  evaluate  ${sumproduct} / 15.5
    set global variable  ${raw calculated score}
substracting without Procurement-On Time Pos
    ${raw calculated score}  evaluate  ${sumproduct} / 16.5
    set global variable  ${raw calculated score}
substracting without Procurement-Short Cycle
    ${raw calculated score}  evaluate  ${sumproduct} / 18
    set global variable  ${raw calculated score}
substracting without Procurement-Cancellations
    ${raw calculated score}  evaluate  ${sumproduct} / 14.5
    set global variable  ${raw calculated score}
substracting without Procurement-Reschedule Ins
    ${raw calculated score}  evaluate  ${sumproduct} / 15.5
    set global variable  ${raw calculated score}
substracting without Procurement-Reschedule Outs
    ${raw calculated score}  evaluate  ${sumproduct} / 15.5
    set global variable  ${raw calculated score}
substracting without Scheduling-Scheduling Accuracy
    ${raw calculated score}  evaluate  ${sumproduct} / 15.5
    set global variable  ${raw calculated score}

selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal
    should be equal  ${selected_plant_score}  ${calculated score}

User click on plant filter and select plant "${plant code}"
    wait until element is visible  plant  20s
    click element  plant
    wait until element is visible  search-input  10s
    input text  search-input  ${plant code}
    click element  //mm-filter[@id='plant']//paper-checkbox[1]
    click element  ${Apply Button}
    sleep  60s

select plants 7000,2490,5251 and 5250 greenville
    wait until element is visible  plant  20s
    click element  plant
    wait until element is visible  search-input  10s
    input text  search-input  110H
    wait until element is visible  product-110H - Power Services HGP  20s
    click element  product-110H - Power Services HGP
    input text  search-input  110t
    wait until element is visible  product-110T - Birr Factory  10s
    click element  product-110T - Birr Factory
    input text  search-input  200B
    wait until element is visible  product-200B - Belfort Steam Turbines  10s
    click element  product-200B - Belfort Steam Turbines
    input text  search-input  110W
    wait until element is visible  product-110W - PS X-Fleet  20s
    click element  product-110W - PS X-Fleet
    input text  search-input  200C
    wait until element is visible  product-200C - Belfort Generators  20s
    click element  product-200C - Belfort Generators
    input text  search-input  2203
    wait until element is visible  product-2203 - Alstom Power Service  20s
    click element  product-2203 - Alstom Power Service
    input text  search-input  5001
    wait until element is visible  product-5001 - USHGP  20s
    click element  product-5001 - USHGP
    input text  search-input  5250
    wait until element is visible  product-5250 - Greenville  20s
    click element  product-5250 - Greenville
    click element  ${Apply Button}
    sleep  16s

verify spine calculations if cancellation,reschedule in,reschedule out is "null(--)" with only short cycle,pr,po
       click element  ${purchase_orders icon}
       sleep  25s
       wait until element is visible  ${value_tab}  20s
       click element  ${value_tab}
       #wait until element is visible  //*[@id="purchaseHeatMap"]/div/div[3]/table/tfoot/tr/td[7]/div/span/div/span  20s
       sleep  23s
       ${total_value}  get text  ${total_col_grid}
       log  ${total_value}
       #set global variable  ${total_value}
       ${TempString3}  replace string  ${total_value}  |  ${EMPTY}
       ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString3..}
       ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text3..}
       ${convert}  convert to string  ${text3..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_col_value}

       run keyword  User click on plant filter and select plant 0020 and click apply
       run keyword  User select Action Required from Exception Requires Action filter from edit filters
       run keyword  select "Exception Message" from "PURCHASE ORDER ITEMS BY"
       wait until element is not visible  xpath=//div[@id='pageSpinner']  10s

       ${cancellation}  get text  ${cancellation_col}
       log  ${cancellation}
       ${TempString3}  replace string  ${cancellation}  |  ${EMPTY}
       ${TempString..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString..}
       ${text..}  execute javascript  var string = "${TempString..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text..}
       ${convert}  convert to string  ${text..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_cancellation_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_cancellation_col_value}

       ${reschedule_in}  get text  ${reschedule_in_col}
       log  ${reschedule_in}
       ${TempString}  replace string  ${reschedule_in}  |  ${EMPTY}
       ${TempString1..}  replace string  ${TempString}  ,  ${EMPTY}
       log  ${TempString1..}
       ${text1..}  execute javascript  var string = "${TempString1..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text1..}
       ${convert}  convert to string  ${text1..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_reschedule_in_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_reschedule_in_col_value}

       ${reschedule_out}  get text  ${reschedule_out_col}
       log  ${reschedule_out}
       ${TempString1}  replace string  ${reschedule_out}  |  ${EMPTY}
       ${TempString2..}  replace string  ${TempString1}  ,  ${EMPTY}
       log  ${TempString2..}
       ${text2..}  execute javascript  var string = "${TempString1..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text2..}
       ${convert}  convert to string  ${text2..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_reschedule_out_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_reschedule_out_col_value}

       ${ff}  execute javascript  var x = `${Total_cancellation_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${ff}
       ${gg}  execute javascript  var x = `${Total_reschedule_in_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${gg}
       ${hh}  execute javascript  var x = `${Total_reschedule_out_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${hh}


       ${inverse for Procurement-Short Cycle}  execute javascript  var y = `${Procurement-Short Cycle}`;var z = (100 - y)*0.50; return z
       ${inverse for Procurement-Cancellations}  execute javascript  var y = `${ff}`;var z = (100 - y)*0 ; return z
       ${inverse for Procurement-Reschedule Ins}  execute javascript  var y = `${gg}`;var z = (100 - y)*0 ; return z
       ${inverse for Procurement-Reschedule Outs}  execute javascript  var y = `${hh}`;var z = (100 - y)*0 ; return z

       ${sum product Procurement-On Time Reqs}  evaluate  ${Procurement-On Time Reqs} * 3
       log to console  ${sum product Procurement-On Time Reqs}

       ${sum product Procurement-On Time Pos}  evaluate  ${Procurement-On Time Pos} * 2
       log to console  ${sum product Procurement-On Time Pos}

       ${sum product Scheduling-Scheduling Accuracy}  evaluate  ${Scheduling-Scheduling Accuracy} * 0
       log to console  ${sum product Scheduling-Scheduling Accuracy}

       ${sumproduct}  evaluate  ${sum product Procurement-On Time Reqs}+${sum product Procurement-On Time Pos}+${inverse for Procurement-Short Cycle}+${inverse for Procurement-Cancellations}+${inverse for Procurement-Reschedule Ins}+${inverse for Procurement-Reschedule Outs}+${sum product Scheduling-Scheduling Accuracy}

       ${totalWeight}  evaluate  ${}
       log to console  ${sumproduct}

       ${raw calculated score}  evaluate  ${sumproduct} / 5.5
       ${number calculated score} =  Convert To Number  ${raw calculated score}  1
       ${calculated score}  convert to string  ${number calculated score}
       set global variable  ${calculated score}

User click on plant filter and select plant 0020 and click apply
       wait until element is visible  plant  20s
       click element  plant
       wait until element is visible  search-input  10s
       input text  //*[@id="search-input"]  U03
       click element  //*[@id="searchAction"]
       wait until element is visible  U03 - IO Central Warehouse US  20s
       click element  U03 - IO Central Warehouse US
       wait until element is visible  ${Apply Button}  10s
       click button  ${Apply Button}
       sleep  23s

verify spine calculations if cancellation,reschedule in,reschedule out,PR,PO,SCHEDULING is "0" with only short cycle has value
       click element  ${purchase_orders icon}
       sleep  25s
       wait until element is visible  ${value_tab}  20s
       click element  ${value_tab}
       #wait until element is visible  //*[@id="purchaseHeatMap"]/div/div[3]/table/tfoot/tr/td[7]/div/span/div/span  20s
       sleep  23s
       ${total_value}  get text  ${total_col_grid}
       log  ${total_value}
       #set global variable  ${total_value}
       ${TempString3}  replace string  ${total_value}  |  ${EMPTY}
       ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString3..}
       ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text3..}
       ${convert}  convert to string  ${text3..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_col_value}

       run keyword  User click on plant filter and select plant 0020 and click apply
       run keyword  User select Action Required from Exception Requires Action filter from edit filters
       run keyword  select "Exception Message" from "PURCHASE ORDER ITEMS BY"
       wait until element is not visible  xpath=//div[@id='pageSpinner']  10s

          ${cancellation}  get text  ${cancellation_col}
       log  ${cancellation}
       ${TempString3}  replace string  ${cancellation}  |  ${EMPTY}
       ${TempString..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString..}
       ${text..}  execute javascript  var string = "${TempString..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text..}
       ${convert}  convert to string  ${text..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_cancellation_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_cancellation_col_value}

       ${reschedule_in}  get text  ${reschedule_in_col}
       log  ${reschedule_in}
       ${TempString}  replace string  ${reschedule_in}  |  ${EMPTY}
       ${TempString1..}  replace string  ${TempString}  ,  ${EMPTY}
       log  ${TempString1..}
       ${text1..}  execute javascript  var string = "${TempString1..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text1..}
       ${convert}  convert to string  ${text1..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_reschedule_in_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_reschedule_in_col_value}

       ${reschedule_out}  get text  ${reschedule_out_col}
       log  ${reschedule_out}
       ${TempString1}  replace string  ${reschedule_out}  |  ${EMPTY}
       ${TempString2..}  replace string  ${TempString1}  ,  ${EMPTY}
       log  ${TempString2..}
       ${text2..}  execute javascript  var string = "${TempString1..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text2..}
       ${convert}  convert to string  ${text2..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${Total_reschedule_out_col_value}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
       log  ${Total_reschedule_out_col_value}

       ${ff}  execute javascript  var x = `${Total_cancellation_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${ff}
       ${gg}  execute javascript  var x = `${Total_reschedule_in_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${gg}
       ${hh}  execute javascript  var x = `${Total_reschedule_out_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${hh}

       ${inverse for Procurement-Short Cycle}  execute javascript  var y = `${Procurement-Short Cycle}`;var z = (100 - y)*0.50 ; return z
       ${inverse for Procurement-Cancellations}  execute javascript  var y = `${ff}`;var z = (100 - y)*0 ; return z
       ${inverse for Procurement-Reschedule Ins}  execute javascript  var y = `${gg}`;var z = (100 - y)*0 ; return z
       ${inverse for Procurement-Reschedule Outs}  execute javascript  var y = `${hh}`;var z = (100 - y)*0 ; return z

       ${sum product Procurement-On Time Reqs}  evaluate  ${Procurement-On Time Reqs} * 0
       log to console  ${sum product Procurement-On Time Reqs}

       ${sum product Procurement-On Time Pos}  evaluate  ${Procurement-On Time Pos} * 0
       log to console  ${sum product Procurement-On Time Pos}

       ${sum product Scheduling-Scheduling Accuracy}  evaluate  ${Scheduling-Scheduling Accuracy} * 0
       log to console  ${sum product Scheduling-Scheduling Accuracy}

       ${sumproduct}  evaluate  ${sum product Procurement-On Time Reqs}+${sum product Procurement-On Time Pos}+${inverse for Procurement-Short Cycle}+${inverse for Procurement-Cancellations}+${inverse for Procurement-Reschedule Ins}+${inverse for Procurement-Reschedule Outs}+${sum product Scheduling-Scheduling Accuracy}
       log to console  ${sumproduct}

       ${raw calculated score}  evaluate  ${sumproduct} / 0.50
       ${number calculated score} =  Convert To Number  ${raw calculated score}  1
       ${calculated score}  convert to string  ${number calculated score}
       set global variable  ${calculated score}

select business transpotation from business filter
       wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        SLEEP  5S
        click element  //*[@id='filterlist']//input[@value='business']
        wait until element is visible  continue  20s
        click element  continue
        click element  business
        sleep  5s
        wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/input  20s
        input text  //mm-filter[2]/px-filter/div/div[2]/div[2]/input  Transportation
        ${text1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        should be equal  ${text1}  Transportation
        click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        click element  ${business_Apply Button}
        sleep  20s

select business Renewables from business filter
        wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        SLEEP  5S
        click element  //*[@id='filterlist']//input[@value='business']
        wait until element is visible  continue  20s
        click element  continue
        click element  business
        sleep  5s
        wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/input  20s
        input text  //mm-filter[2]/px-filter/div/div[2]/div[2]/input  Renewables
        ${text1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        should be equal  ${text1}  Renewables
        click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        click element  ${business_Apply Button}
        sleep  20s

select business Onshore Wind from business filter
       wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        SLEEP  5S
        click element  //*[@id='filterlist']//input[@value='sub_business']
        wait until element is visible  continue  20s
        click element  continue
        click element  sub_business
        sleep  5s
        wait until element is visible  //mm-filter[2]/px-filter/div/div[2]/div[2]/input  20s
        input text  //mm-filter[2]/px-filter/div/div[2]/div[2]/input  Onshore Wind
        ${text1}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        should be equal  ${text1}  Onshore Wind
        click element  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        click element  ${sub_business_Apply Button}
        sleep  20s

User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions" for business "Onshore Wind"
       click element  ${purchase_orders icon}
       sleep  50s
       wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        SLEEP  5S
        click element  //*[@id='filterlist']//input[@value='sub_business']
        wait until element is visible  continue  20s
        click element  continue
       wait until element is visible  business  20s
        click element  sub_business
        sleep  4s
        wait until element is visible  //mm-filter[3]/px-filter/div/div[2]/div[2]/input  20s
        input text  //mm-filter[3]/px-filter/div/div[2]/div[2]/input  Onshore Wind
        ${text1}  get text  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        should be equal  ${text1}  Onshore Wind
        click element  //mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
        click element  ${sub_business_Apply Button}
        sleep  20s
        run keyword  plant score from cancellation ,reschedule in etc..


User calculate ON Time PO value
        ${text3}  get text  ${future_total}
        ${TempString3}  replace string  ${text3}  |  ${EMPTY}
        ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
        log  ${TempString3..}
        ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
        log  ${text3..}
        ${convert}  convert to string  ${text3..}
        ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
        ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
        ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
        ${future_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
        log  ${future_col_value}
        ${text1}  get text  ${total_total}
        ${TempString3}  replace string  ${text1}  |  ${EMPTY}
        ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
        log  ${TempString3..}
        ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
        log  ${text3..}
        ${convert}  convert to string  ${text3..}
        ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
        ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
        ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
        ${Total_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
        log  ${Total_col_value}
        ${output}  execute javascript  var x = `${future_col_value}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
        log  ${output}
        ${Procurement-On Time Pos}  execute javascript  if (`${output}` == '0.00' || `${output}` == 'undefined' || `${output}` == 'null' ){ return '0';}; var num=0; if(${output} > 0 ){if(${output}> 999999999){num  = (${output}/1000000000).toFixed(1); return num;} else if(${output}> 999999){num  = (${output}/1000000).toFixed(1); return num;}  else if(${output}> 999){num  = (${output}/1000).toFixed(1); return num;}else if(${output}> 99){num  = (${output}/100).toFixed(1); return num;}else if(${output}> 9){num  = ((${output}*10)/10).toFixed(1); return num;}else if(${output}> 0){num  = (${output}).toFixed(1); return num;}else if(${output}< 0){return num;}};
        log to console  ${Procurement-On Time Pos} On time po
        set global variable  ${Procurement-On Time Pos}

User calculate Short cycle value
       click element  addFilterBtn
       wait until element is visible  //*[@id='filterlist']//input[@value='business']  20s
       click element  //*[@id='filterlist']//input[@value='sc']
       click button  continue
       click element  sc
       sleep  5s
       ${sourceValue}  Get Text  ${shortcycle_yes}
       ${TempString}  replace string  ${sourceValue}  (  ${EMPTY}
       ${TempString}  replace string  ${TempString}  )  ${EMPTY}
       ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
       ${TempInteger}  convert to integer  ${TempString}
       log  ${TempInteger}
       click element  ${short_cycle_Apply Button}
       sleep  10s
       ${text3}  get text  ${total_total}
       ${TempString3}  replace string  ${text3}  |  ${EMPTY}
       ${TempString3..}  replace string  ${TempString3}  ,  ${EMPTY}
       log  ${TempString3..}
       ${text3..}  execute javascript  var string = "${TempString3..}"; var returnStr = string.split(" ",1); return returnStr;
       log  ${text3..}
       ${convert}  convert to string  ${text3..}
       ${aa}  replace string using regexp  ${convert}  \\[|\,  ${EMPTY}
       ${bb}  replace string using regexp  ${aa}  \\]|\,  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${Total_col_value}  replace string using regexp  ${cc}  \'|\,  ${EMPTY}
       log  ${Total_col_value}
       ${output}  execute javascript  var x = `${TempInteger}`;var y = `${Total_col_value}`;var z = ((x / y)*100); return z
       log  ${output}
       ${Procurement-Short Cycle}  execute javascript  if (`${output}` == '0.00' || `${output}` == 'undefined' || `${output}` == 'null' ){ return '0';}; var num=0; if(${output} > 0 ){if(${output}> 999999999){num  = (${output}/1000000000).toFixed(1); return num;} else if(${output}> 999999){num  = (${output}/1000000).toFixed(1); return num;}  else if(${output}> 999){num  = (${output}/1000).toFixed(1); return num;}else if(${output}> 99){num  = (${output}/100).toFixed(1); return num;}else if(${output}> 9){num  = ((${output}*10)/10).toFixed(1); return num;}else if(${output}> 0){num  = (${output}).toFixed(1); return num;}else if(${output}< 0){return num;}} else {return "0"};
       log to console  ${Procurement-Short Cycle} Short Cycle
       set global variable  ${Procurement-Short Cycle}

select first business from Plant Business filter
    click element  addFilterBtn
    wait until element is visible  //*[@id='filterlist']//input[@value='business']  20s
    click element  //*[@id='filterlist']//input[@value='business']
    click button  continue
    click element  business
    sleep  15s
    click element  product-Healthcare
    click element  product-MMF
    click element  product-Power
    click element  product-Renewables
    click element  product-Transportation
    click element  //mm-filter[@id='business']//button[@id='ApplyBtn']
    sleep  5s
select first category from Plant Category filter
    click element  addFilterBtn
    wait until element is visible  //*[@id='filterlist']//input[@value='pcat']  20s
    click element  //*[@id='filterlist']//input[@value='pcat']
    click button  continue
    click element  pcat
    sleep  5s
    click element  //mm-filter[@id='pcat']//div[@id='checkboxContainer']
    click element  //mm-filter[@id='pcat']//button[@id='ApplyBtn']
    sleep  5s
select first region from Plant Region filter
    click element  addFilterBtn
    wait until element is visible  //*[@id='filterlist']//input[@value='region']  20s
    click element  //*[@id='filterlist']//input[@value='region']
    click button  continue
    click element  region
    sleep  5s
    click element  product-ASIA
    click element  //mm-filter[@id='region']//button[@id='ApplyBtn']
    sleep  5s
select first sub-business from Sub-Business filter
    click element  addFilterBtn
    wait until element is visible  //*[@id='filterlist']//input[@value='sub_business']  20s
    click element  //*[@id='filterlist']//input[@value='sub_business']
    click button  continue
    click element  sub_business
    sleep  5s
    click element  //mm-filter[@id='sub_business']//div[@id='checkboxContainer'][1]
    click element  //mm-filter[@id='sub_business']//button[@id='ApplyBtn']
    sleep  5s

Verify the numbers in total plant score in ui by taking values from plant comparison trending
      wait until element is visible  plant  20s
       click element  plant
       wait until element is visible  search-input  10s
       input text  //*[@id="search-input"]  U03
       click element  //*[@id="searchAction"]
       wait until element is visible  U03 - IO Central Warehouse US  20s
       click element  U03 - IO Central Warehouse US
       wait until element is visible  ${Apply Button}  10s
       click button  ${Apply Button}
       sleep  23s
      connect to database  dbConfigFile=${dbfile}
      ${Accuracy_Rate_scheduling}  QUERY  select (sum(noerrors_count) *100)/ sum(production_orders_count) where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${Accuracy_Rate_scheduling}
          ${convert}  convert to string  ${Accuracy_Rate_scheduling}
          log  ${convert}
          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${Accuracy_Rate_scheduling..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${Accuracy_Rate_scheduling..}

      ${ontime-pr_purchase req.}  QUERY  select 100-(sum(significant_count) *100)/ sum(future_thirty_count) where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${ontime-pr_purchase req.}
          ${convert1}  convert to string  ${ontime-pr_purchase req.}
          log  ${convert1}
          ${queryResults1}  replace string using regexp  ${convert1}  \\(|\,  ${EMPTY}
          ${queryResults1.}  replace string using regexp  ${queryResults1}  \\)|\,  ${EMPTY}
          ${queryResults1..}  replace string using regexp  ${queryResults1.}  \\[|\,  ${EMPTY}
          ${queryResults11}  replace string using regexp  ${queryResults1..}  \\]|\,  ${EMPTY}
          ${queryResults11..}  replace string using regexp  ${queryResults11}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults11..}
          ${queryResultLength1}  execute javascript  return String(${queryResults11..}).length;
          log  ${queryResultLength1}
          ${ontime-pr_purchase req..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults11..}};
          log  ${ontime-pr_purchase req..}

      ${cancellation_value_in_po}  QUERY  select (sum(cancellation_value) *100)/ sum(totalexp) where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${cancellation_value_in_po}
          ${convert2}  convert to string  ${cancellation_value_in_po}
          log  ${convert2}
          ${queryResults2}  replace string using regexp  ${convert2}  \\(|\,  ${EMPTY}
          ${queryResults2.}  replace string using regexp  ${queryResults2}  \\)|\,  ${EMPTY}
          ${queryResults2..}  replace string using regexp  ${queryResults2.}  \\[|\,  ${EMPTY}
          ${queryResults22}  replace string using regexp  ${queryResults2..}  \\]|\,  ${EMPTY}
          ${queryResults22..}  replace string using regexp  ${queryResults22}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults22..}
          ${queryResultLength2}  execute javascript  return String(${queryResults22..}).length;
          log  ${queryResultLength2}
          ${cancellation_value_in_po..}  execute javascript  if( ${queryResultLength2} == 0){return 0}else {return ${queryResults22..}};
          log  ${cancellation_value_in_po..}

      ${reschedule_in_po}  query  select (sum(reschedule_in_value) *100)/ sum(totalexp) where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${reschedule_in_po}
          ${convert3}  convert to string  ${reschedule_in_po}
          log  ${convert3}
          ${queryResults3}  replace string using regexp  ${convert3}  \\(|\,  ${EMPTY}
          ${queryResults3.}  replace string using regexp  ${queryResults3}  \\)|\,  ${EMPTY}
          ${queryResults3..}  replace string using regexp  ${queryResults3.}  \\[|\,  ${EMPTY}
          ${queryResults33}  replace string using regexp  ${queryResults3..}  \\]|\,  ${EMPTY}
          ${queryResults33..}  replace string using regexp  ${queryResults33}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults33..}
          ${queryResultLength3}  execute javascript  return String(${queryResults33..}).length;
          log  ${queryResultLength3}
          ${reschedule_in_po..}  execute javascript  if( ${queryResultLength3} == 0){return 0}else {return ${queryResults33..}};
          log  ${reschedule_in_po..}

      ${reschedule_out_po}  query  select (sum(reschedule_out_value) *100)/ sum(totalexp) where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${reschedule_out_po}
          ${convert4}  convert to string  ${reschedule_out_po}
          log  ${convert4}
          ${queryResults4}  replace string using regexp  ${convert4}  \\(|\,  ${EMPTY}
          ${queryResults4.}  replace string using regexp  ${queryResults4}  \\)|\,  ${EMPTY}
          ${queryResults4..}  replace string using regexp  ${queryResults4.}  \\[|\,  ${EMPTY}
          ${queryResults44}  replace string using regexp  ${queryResults4..}  \\]|\,  ${EMPTY}
          ${queryResults44..}  replace string using regexp  ${queryResults44}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults44..}
          ${queryResultLength4}  execute javascript  return String(${queryResults44..}).length;
          log  ${queryResultLength4}
          ${reschedule_out_po..}  execute javascript  if( ${queryResultLength4} == 0){return 0}else {return ${queryResults44..}};
          log  ${reschedule_out_po..}

      ${overdue_po}  query  select (sum(overdue_value) )/ sum(total_count) *100 where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${overdue_po}
          ${convert5}  convert to string  ${overdue_po}
          log  ${convert5}
          ${queryResults5}  replace string using regexp  ${convert5}  \\(|\,  ${EMPTY}
          ${queryResults5.}  replace string using regexp  ${queryResults5}  \\)|\,  ${EMPTY}
          ${queryResults5..}  replace string using regexp  ${queryResults5.}  \\[|\,  ${EMPTY}
          ${queryResults5}  replace string using regexp  ${queryResults5..}  \\]|\,  ${EMPTY}
          ${queryResults55..}  replace string using regexp  ${queryResults5}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults55..}
          ${queryResultLength5}  execute javascript  return String(${queryResults55..}).length;
          log  ${queryResultLength5}
          ${overdue_po..}  execute javascript  if( ${queryResultLength5} == 0){return 0}else {return ${queryResults55..}};
          log  ${overdue_po..}

      ${short_cycle_po}  query  select (sum(short_cycle_orders_in_bucket) )/ sum(total_count) *100 where plant_code_plant_short_name='U03 - IO Central Warehouse US' FROM public.plant_comparison_trend_latest_v;
      log  ${short_cycle_po}
          ${convert6}  convert to string  ${short_cycle_po}
          log  ${convert6}
          ${queryResults6}  replace string using regexp  ${convert6}  \\(|\,  ${EMPTY}
          ${queryResults6.}  replace string using regexp  ${queryResults6}  \\)|\,  ${EMPTY}
          ${queryResults6..}  replace string using regexp  ${queryResults6.}  \\[|\,  ${EMPTY}
          ${queryResults6}  replace string using regexp  ${queryResults6..}  \\]|\,  ${EMPTY}
          ${queryResults66..}  replace string using regexp  ${queryResults6}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults66..}
          ${queryResultLength6}  execute javascript  return String(${queryResults66..}).length;
          log  ${queryResultLength6}
          ${short_cycle_po..}  execute javascript  if( ${queryResultLength6} == 0){return 0}else {return ${queryResults66..}};
          log  ${short_cycle_po..}

       ${po_accuracy}  execute javascript  var x=${short_cycle_po..}; var y=${cancellation_value_in_po..}; var z=${reschedule_in_po..}; var xx=${reschedule_out_po..}; var yy=${overdue_po..}; var result=((x * (x > 0 ? 0.5 : 0)) + (100 - y * (y > 0 ? 4 : 0)) + (100 - z * (z > 0 ? 3 : 0)) + (100 - xx * (xx > 0 ? 3 : 0)) + (yy * (yy > 0 ? 2 : 0))) / ((x > 0 ? 0.5 : 0)+ (y > 0 ? 4 : 0) + (z * (z > 0 ? 3 : 0)) + (xx * (xx > 0 ? 3 : 0)) + (yy * (yy > 0 ? 2 : 0))); return result;
       log  ${po_accuracy}

       ${sum product Procurement-On Time Reqs}  evaluate  ${ontime-pr_purchase req..} * 3
            log to console  ${sum product Procurement-On Time Reqs}

       ${sum product Procurement-On Time Pos}  evaluate  ${po_accuracy} * 2
            log to console  ${sum product Procurement-On Time Pos}
            ${sum product Scheduling-Scheduling Accuracy}  evaluate  ${Accuracy_Rate_scheduling..} * 3
            log to console  ${sum product Scheduling-Scheduling Accuracy}

       ${inverse for Procurement-Short Cycle}  execute javascript  var y = `${short_cycle_po..}`; return (100 - y)*0.50
       ${inverse for Procurement-Cancellations}  execute javascript  var y = `${cancellation_value_in_po..}`;var z = (100 - y)*4 ; return z
       ${inverse for Procurement-Reschedule Ins}  execute javascript  var y = `${reschedule_in_po..}`;var z = (100 - y)*3 ; return z
       ${inverse for Procurement-Reschedule Outs}  execute javascript  var y = `${reschedule_out_po..}`;var z = (100 - y)*3 ; return z
        ${sumproduct}  evaluate  ${sum product Procurement-On Time Reqs}+${sum product Procurement-On Time Pos}+ (0 if ${short_cycle_po..} == 0 else ${inverse for Procurement-Short Cycle}) + (0 if ${cancellation_value_in_po..} == 0 else ${inverse for Procurement-Cancellations}) + (0 if ${reschedule_in_po..} == 0 else ${inverse for Procurement-Reschedule Ins}) + (0 if ${reschedule_out_po..} == 0 else ${inverse for Procurement-Reschedule Outs}) + ${sum product Scheduling-Scheduling Accuracy}

        ${weight}  execute javascript  var x=`${ontime-pr_purchase req..}`;var y=`${po_accuracy}`;var z=`${short_cycle_po..}`;var xx=`${cancellation_value_in_po..}`;var yy=`${reschedule_in_po..}`; var zz=`${reschedule_out_po..}`;var xy=`${Accuracy_Rate_scheduling..}`;var result=((x==0)?3:0) + ((y==0)?0:2) + ((z==0)?0:0.5) +  ((xx==0)?0:4) + ((yy==0)?0:3) + ((zz==0)?0:3) + ((xy==0)?0:3);return result;
        log  ${weight}
       log to console  ${weight}
        log to console  ${sumproduct}
        set global variable  ${sumproduct}

        ${raw calculated score}  evaluate  ${sumproduct} / ${weight}
       ${number calculated score} =  Convert To Number  ${raw calculated score}  1
       ${calculated score}  convert to string  ${number calculated score}
       set global variable  ${calculated score}