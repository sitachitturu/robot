*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User access "executive-summary" module
      click link  /secure/executive-summary
      wait until element is visible  ${scheduling scorecard}  10s

click on trending icon in executive summary score card
      wait until element is visible  ${scheduling scorecard}  10s
      ${title}  get text  ${scheduling scorecard}
      log  ${title}
      sleep  2s
      click element  scd-trend
      wait until element is visible  trend_title  20s

user should navigate to trending page and by default page should display "Scheduling - All Plants"
      wait until element is visible  ${Plants/plant Title}  10s
      ${title}  get text  ${Plants/plant Title}
      log  ${title}
      should be equal  ${title}  Scheduling - All Plants
      [Return]  ${title}

User should be able to see information displaying when hover the trending icon
      wait until element is visible  ${scheduling scorecard}  20s
      wait until element is visible  ${trend icon}  20s
      Mouse Over  ${trend icon}
      wait until element is visible   ${scheduling toltip}  30s
      element should be visible  ${scheduling toltip}  30s
      ${title}  get text  ${scheduling toltip}
      log  ${title}
      should be equal  ${title}  View Schedule Trends
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
      sleep  4s


User should see the trending page and page should display "Scheduling-0010-charlottesville"
      sleep  5s
      wait until element is visible  ${Plants/plant Title}  30s
      page should contain element  ${Plants/plant Title}  1
      sleep  4s
      ${title}  get text  ${Plants/plant Title}
      log  ${title}
      should be equal  ${title}  0010 - Charlottesville - Scheduling
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
      sleep  2s

user should navigate to trending page and by page should display "Scheduling-Selected Plants"
      wait until element is visible  ${Plants/plant Title}  20s
      page should contain element  ${Plants/plant Title}  1
      ${title}  get text  ${Plants/plant Title}
      log  ${title}
      should be equal  ${title}  Scheduling - Selected Plants
      [Return]  ${title}

User should see tool tip which shows data for reschedule in, reschedule out,cancellations,overdue
      ${tooltip}  click element at coordinates  ${tootip}  800  300
      sleep  2s
      capture page screenshot

User should see %no. in scheduling accuracy view and it should be same as the no. in scheduling score card
      wait until element is visible  ${moscheduling accuracy trending}  20s
      ${number}  get text  ${scheduling accuracy}
      log  ${number}
      ${value}  get text  ${moscheduling accuracy trending}
      log  ${value}
      wait until element is not visible  ${Page Spinner}
      wait until element is visible  backChev  20s
      click element  backChev
      wait until element is visible  ${MoScheduling Accuracy}  20s
      ${score card no.}  get text  ${MoScheduling Accuracy}
      log   ${score card no.}
      ${test}  should match regexp  ${value}  ${score card no.}
      log  ${test}

User should see following column "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column
      wait until element is visible  ${show/hide column}  20s
      wait until element is visible  xpath=//*[@id="content"]/div/span[text()='${test}']  30s
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test2}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test3}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test4}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test5}']
      element should be visible  xpath=//*[@id="content"]/div/span[text()='${test6}']



User should be able to see default number in Date Range view in trending page
      wait until element is visible  //*[@id="item1"]/div/div  10s
      ${text}  get text  //*[@id="item1"]/div/div
      log  ${text}
      ${value}  get text  ${date range value}
      log  ${value}
      #should be equal  ${value}  42

User see Excel to Export option on scheduling scorecard trending page
      wait until element is visible  ${Export to Excel}  10s
      ${title}  get text  ${Export to Excel}
      log  ${title}
      should be equal  ${title}  Export to Excel
      [Return]  ${title}

User should be able to see Date fields (From and To)
      wait until element is visible  trend_title  10s
      page should contain element  //*[@id="dateTime"]
      ${text}  get text  //*[@id="dateTime"]
      log  ${text}


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
      input text  search-input  326B
      wait until element is visible  product-326B - PCP-SUBD01 ALSTOM T&D India Ltd.-PCP 2  10s
      click element  product-326B - PCP-SUBD01 ALSTOM T&D India Ltd.-PCP 2
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
      input text  search-input  5250
      wait until element is visible  product-5250 - Greenville  10s
      click element  product-5250 - Greenville
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      sleep  2s

click show/hide column button and user should see list of columns in show/hide columns
     wait until element is visible  table  10s
     click element  ${show/hide column}
     wait until element is visible  //div[@id='checkboxLabel']//div[contains(normalize-space(), 'Plant Code Plant Short Name')]  30s
     ${list}  get text  ${show/hide column list}
     log to console  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${Scheduling_trending_show/hide_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
