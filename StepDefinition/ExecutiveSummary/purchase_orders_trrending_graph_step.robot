*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  DatabaseLibrary
Library  OperatingSystem
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "executive-summary" module
      click link  /secure/executive-summary
      sleep  10s

click on trending icon in executive summary score card
      wait until element is visible  ${purchase orders score card}  20s
      ${title}  get text  ${purchase orders score card}
      log  ${title}
      click element  ${purchase orders score card}
      wait until element is visible  trend_title  20s

user should navigate to trending page and by default page should display "Purchase Orders - All Plants"
      wait until element is visible  ${Plants/plant Title}  10s
      ${title}  get text  ${Plants/plant Title}
      log  ${title}
      should be equal  ${title}  Purchase Orders - All Plants
      [Return]  ${title}

User should be able to see information displaying when hover the trending icon
      wait until element is visible  ${purchase orders score card}  20s
      wait until element is visible  ${trend icon for PO}  10s
      Mouse Over  ${trend icon for PO}
      wait until element is visible  ${purchase orders toltip}  40s
      element should be visible  ${purchase orders toltip}  30s
      ${title}  get text  ${purchase orders toltip}
      log  ${title}
      should be equal  ${title}  View Purchase Order Trends
      [Return]  ${title}

click on plant filter and select plant "0010-charlottesville"
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  20s
      input text  search-input  0010
      wait until element is visible  product-0010 - Charlottesville  20s
      click element  product-0010 - Charlottesville
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      
User should see the purchase order trending page and page should display "0010 - Charlottesville - Purchase Orders"
      wait until element is visible  ${Plants/plant Title}  10s
      page should contain element  ${Plants/plant Title}  1
      ${title}  get text  ${Plants/plant Title}
      log  ${title}
      should be equal  ${title}  0010 - Charlottesville - Purchase Orders
      [Return]  ${title}


click on plant filter and select plant 0010-charlottesville,3018-pco leonding,3071-csh Hong Kong and click on apply button
      wait until element is visible  plant  30s
      click element  plant
      wait until element is visible  search-input  20s
      input text  search-input  0010
      wait until element is visible  product-0010 - Charlottesville  10s
      click element  product-0010 - Charlottesville
      wait until element is visible  search-input  10s
      input text  search-input  3018
      wait until element is visible  product-3018 - PCO Leonding  10s
      click element  product-3018 - PCO Leonding
      wait until element is visible  search-input  10s
      input text  search-input  3071
      wait until element is visible  product-3071 - CSH Hong Kong  10s
      click element  product-3071 - CSH Hong Kong
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}

user should navigate to trending page and by page should display "Purchase Orders - Selected Plants"
      wait until element is visible  ${Plants/plant Title}  20s
      page should contain element  ${Plants/plant Title}  1
      ${title}  get text  ${Plants/plant Title}
      log  ${title}
      should be equal  ${title}  Purchase Orders - Selected Plants
      [Return]  ${title}

User should see tool tip which shows data for reschedule in, reschedule out,cancellations,overdue
      ${tooltip}  click element at coordinates  ${tootip}  800  300
      capture page screenshot

User should see %no. in On-Time-Open-PO view and it should be same as the no. in purchase order score card
      wait until element is visible  ${On-time-open-PO trending}  20s
      ${number}  get text  //*[@id="item2"]/mo-mid-bar/div/div/span
      log  ${number}
      ${value}  get text  ${On-time-open-PO trending}
      log  ${value}
      ${value..}  replace string using regexp  ${value}  \\%|\,  ${EMPTY}
      wait until element is not visible  ${Page Spinner}
      wait until element is visible  backChev  20s
      click element  backChev
      wait until element is visible  ${On-Time-Open-PO}  20s
      ${score card no.}  get text  ${On-Time-Open-PO}
      log   ${score card no.}
      ${test}  should match regexp  ${value..}  ${score card no.}
      log  ${test}
scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

User should see following column "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column
      wait until element is visible  ${show/hide column}  20s
      wait until element is visible  xpath=//*[@id="content"]/div/span[text()='${test}']  30s
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test2}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test3}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test4}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test5}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test6}']

User should be able to see number in Date Range view in trending page
      wait until element is visible  //*[@id="item1"]/div/div  10s
      ${text}  get text  //*[@id="item1"]/div/div
      log  ${text}
      ${value}  get text  ${date range value}
      log  ${value}
      #should be equal  ${value}  42

User see Excel to Export option on purchase order scorecard trending page
      wait until element is visible  ${Export to Excel}  10s
      ${title}  get text  ${Export to Excel}
      log  ${title}
      should be equal  ${title}  Export to Excel
      [Return]  ${title}

User should be able to see Date fields (From and To)
      wait until element is visible  trend_title  20s
      page should contain element  //*[@id="fromDate"]
      wait until element is not visible  ${Page Spinner}
      click element  //*[@id="icon"]
      click element  //*[@id="calendar"]/div[4]/div[4]/px-calendar-cell/div/button
      ${text}  get text  //*[@id="calendar"]/div[4]/div[4]/px-calendar-cell/div/button
      log   ${text}
      ${text}  get text  //*[@id="calendar"]/div[1]/span
      log  ${text}
      click element  submitButton
      page should contain element  //*[@id="toDate"]
      wait until element is not visible  ${Page Spinner}
      click element  //*[@id="icon"]
      click element  //*[@id="calendar"]/div[6]/div[4]/px-calendar-cell/div/button
      ${text}  get text  //*[@id="calendar"]/div[6]/div[4]/px-calendar-cell/div/button
      log   ${text}
      ${text}  get text  //*[@id="calendar"]/div[1]/span
      log  ${text}
      wait until element is visible  submitButton  20s
      click button  submitButton
      wait until element is visible  //*[@id="item1"]/div/div  20s

User selects plants 0010,3000,3060 in trending page
      wait until element is visible  plant  30s
      click element  plant
      wait until element is visible  search-input  20s
      input text  search-input  0010
      wait until element is visible  product-0010 - Charlottesville  10s
      click element  product-0010 - Charlottesville
      wait until element is visible  search-input  10s
      input text  search-input  3000
      wait until element is visible  product-3000 - GE IP India Factory  10s
      click element  product-3000 - GE IP India Factory
      wait until element is visible  search-input  10s
      input text  search-input  326A
      wait until element is visible  product-326A - PCP Chennai (Pallavaram)  30s
      click element  product-326A - PCP Chennai (Pallavaram)
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      sleep  2s

User selects plants 326d,3273,3333,3361 in trending page
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  20s
      input text  search-input  326d
      wait until element is visible  product-326D - PCP-SUBD03 ALSTOM T&D India Ltd.*  10s
      click element  product-326D - PCP-SUBD03 ALSTOM T&D India Ltd.*
      wait until element is visible  search-input  10s
      input text  search-input  3273
      wait until element is visible  product-3273 - PTI Naini  10s
      click element  product-3273 - PTI Naini
      wait until element is visible  search-input  10s
      input text  search-input  3333
      wait until element is visible  product-3333 - TDN Oslo  10s
      click element  product-3333 - TDN Oslo
      wait until element is visible  search-input  10s
      input text  search-input  3361
      wait until element is visible  product-3361 - SEE Madrid  10s
      click element  product-3361 - SEE Madrid
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}

User selects plants 0020,2490 in trending page
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  20s
      input text  search-input  0020
      wait until element is visible  product-0020 - After Sales and R&R  10s
      click element  product-0020 - After Sales and R&R
      wait until element is visible  search-input  10s
      input text  search-input  2490
      wait until element is visible  product-2490 - GE Wind France SAS - St. Nazaire  10s
      click element  product-2490 - GE Wind France SAS - St. Nazaire
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      sleep  4s

click on calander icon and select 1 Month Ago option on presets
     wait until element is visible  trend_title  20s
     page should contain element  //*[@id="fromDate"]
     wait until element is not visible  ${Page Spinner}
     click element  //*[@id="icon"]
     click element  //*[@id="presets"]/ul/li[1]/span
     wait until element is visible  submitButton  20s
     click button  submitButton
     sleep  2s
     wait until element is visible  //*[@id="item1"]/div/div  20

User should be able to see number of days in Date Range for 1 Month Ago option
     wait until element is visible  //*[@id="item1"]/div/div  10s
     ${text}  get text  //*[@id="item1"]/div/div
     log  ${text}
     ${value}  get text  ${date range value}
     log  ${value}
      ${result}  Set variable  31
      ${result}  set variable  28
      ${result}  set variable  29
      ${result}  set variable  30
      Run keyword if  ${value} == "28"  or  ${value} == "31"  or  ${value} == "29"  or  ${value} == "30"


click on calander icon and select 2 Month Ago option on presets
    wait until element is visible  trend_title  20s
     page should contain element  //*[@id="fromDate"]
     click element  //*[@id="icon"]
     click element  //*[@id="presets"]/ul/li[2]/span
     wait until element is visible  submitButton  20s
     click button  submitButton
     sleep  2s
     wait until element is visible  //*[@id="item1"]/div/div  20

User should be able to see number of days in Date Range for 2 Month Ago option
     wait until element is visible  //*[@id="item1"]/div/div  10s
     ${text}  get text  //*[@id="item1"]/div/div
     log  ${text}
     ${value}  get text  ${date range value}
     log  ${value}
     ${result}  Set variable  59
     ${result}  set variable  60
     ${result}  set variable  61
     ${result}  set variable  62
     Run keyword if  ${value} == "59"  or  ${value} == "60"  or  ${value} == "61"  or  ${value} == "62"

click on calander icon and select 3 Months Ago option on presets
      wait until element is visible  trend_title  20s
     page should contain element  //*[@id="fromDate"]
     click element  //*[@id="icon"]
     click element  //*[@id="presets"]/ul/li[3]/span
     wait until element is visible  submitButton  20s
     click button  submitButton
     sleep  2s
     wait until element is visible  //*[@id="item1"]/div/div  20

User should be able to see number of days in Date Range for 3 Months Ago option
     wait until element is visible  //*[@id="item1"]/div/div  10s
     ${text}  get text  //*[@id="item1"]/div/div
     log  ${text}
     ${value}  get text  ${date range value}
     log  ${value}
     ${result}  Set variable  90
     ${result}  set variable  89
     ${result}  set variable  92
     ${result}  set variable  91
     ${result}  set variable  93
     Run keyword if  ${value} == "90"  or  ${value} == "89"  or  ${value} == "92"  or  ${value} == "91"  or  ${value} == "93"

click on calander icon and select 6 Months Ago option on presets
      wait until element is visible  trend_title  20s
     page should contain element  //*[@id="fromDate"]
     click element  //*[@id="icon"]
     click element  //*[@id="presets"]/ul/li[4]/span
     wait until element is visible  submitButton  20s
     click button  submitButton
     sleep  2s
     wait until element is visible  //*[@id="item1"]/div/div  20

User should be able to see number of days in Date Range for 6 Months Ago option
     wait until element is visible  //*[@id="item1"]/div/div  10s
     ${text}  get text  //*[@id="item1"]/div/div
     log  ${text}
     ${value}  get text  ${date range value}
     log  ${value}
     #should be equal  ${value}  182
     ${result}  Set variable  182
     ${result}  set variable  181
     ${result}  set variable  184
     ${result}  set variable  183
     ${result}  set variable  211
     Run keyword if  ${value} == "182"  or  ${value} == "181"  or  ${value} == "184"  or   ${value} == "183"  or   ${value} == "211"

click on calander icon and select 1 Year Ago option on presets
     wait until element is visible  trend_title  20s
     page should contain element  //*[@id="fromDate"]
     click element  //*[@id="icon"]
     click element  //*[@id="presets"]/ul/li[5]/span
     wait until element is visible  submitButton  20s
     click button  submitButton
     sleep  2s
     wait until element is visible  //*[@id="item1"]/div/div  20

User should be able to see number of days in Date Range for 1 Year Ago option
     wait until element is visible  //*[@id="item1"]/div/div  10s
     ${text}  get text  //*[@id="item1"]/div/div
     log  ${text}
     ${value}  get text  ${date range value}
     log  ${value}
     should be equal  ${value}  365
     ${result}  set variable  365
     ${result}  set variable  366
     Run keyword if  ${value} == "365"  or  ${value} == "366"

user should see "Data Available From - To" date option with Icon with exclamation symbol
     wait until element is visible  trend_title  20s
     ${text1}  get text  trend_title
     log  ${text1}
     wait until element is visible  //div[2]/mo-trending/div/div[2]/div/div/div[2]/span/span  20s
     ${text2}  get text  //div[2]/mo-trending/div/div[2]/div/div/div[2]/span/span
     log  ${text2}
     connect to database  dbConfigFile=${dbfile}
     ${data-query}  QUERY  select MIN(processed_timestamp) from purchase_reqs_trend_v
     ${convert}  convert to string  ${data-query}
     log  ${convert}
     ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\.|\,  ${EMPTY}
     ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
     log  ${queryResults..}
     ${project_count}  execute javascript  var string = "${queryResults..}"; var returnStr = string.split(' ',3); return returnStr;
     log  ${project_count}
     ${convert}  convert to string  ${project_count}
     ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
     ${queryResults}  replace string using regexp  ${queryResults}  \\.|\,  ${EMPTY}
     ${queryResults1..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
     log  ${queryResults1..}

