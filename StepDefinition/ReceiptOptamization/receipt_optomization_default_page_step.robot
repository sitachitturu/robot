6/26/2017
212590906
*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  DatabaseLibrary
Library  Collections
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
      click link   ${link}
      sleep  15s
      wait until page contains  addFilterBtn  10s

User should see "Receipt Optimization"
      wait until element is visible  ${Receipt optamization title}  10s
      ${title}  get text  ${Receipt optamization title}
      log  ${title}
      should be equal  ${title}  Receipt Optimization
      [Return]  ${title}

User should see "OPPORTUNITIES BY MONTH"
      wait until element is visible  receipt_title  10s
      ${title}  get text  receipt_title
      log  ${title}
      should be equal  ${title}  OPPORTUNITIES BY
      [Return]  ${title}

User should see Show/Hide Columns button
      wait until element is visible  ${show/hide column}  10s
      ${title}  get text  ${show/hide column}
      log  ${title}
      should be equal  ${title}  Show/Hide Columns
      [Return]  ${title}

User should see following column "${test1}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column "${test8}"
     wait until element is visible  xpath=//*[@id="content"]/div/span[text()='${test1}']  30s
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test2}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test3}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test4}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test5}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test6}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test7}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test8}']

User see Excel to Export option on Receipt optamization landing page
     wait until element is visible  ${Export to Excel defoult page}  10s
     ${title}  get text  ${Export to Excel defoult page}
     log  ${title}
     click element  ${Export to Excel defoult page}
     should be equal  ${title}  Export to Excel
     [Return]  ${title}

User should see default month "current month" on Opportunities By Month option button
      ${currentMonth}  execute javascript  var month =new Date().toLocaleString("en-us", {month: "long"});return month;
      log  ${currentMonth}
      wait until element is visible  receipt_title  20s
      click element  //div[2]/div/div/mo-filter-context/mo-receipt-optimization/div/div/div[2]/px-dropdown
      wait until element is visible  //ul[@id="list"]/li[2]  20s
      click element  //ul[@id="list"]/li[2]
      ${text}  get text  //div[2]/div/div/mo-filter-context/mo-receipt-optimization/div/div/div[2]/px-dropdown/div/px-dropdown-text
      log  ${text}
      should be equal  ${text}  ${currentMonth}

verify planned date with po number in db
      wait until element is visible  plant  20s
      click element  plant
      click element  product-DE1 - IO Manufacturing Germany
      sleep  3s
      wait until element is visible  ApplyBtn  20s
      click element  ApplyBtn
      sleep  10s
      ${text1}  get text  ${planned_date_col}
      log  ${text1}
      ${text2}  get text  ${po_number_cxol}
      log  ${text2}
      ${Results}  replace string using regexp  ${text2}  \\-|\,  ${EMPTY}
      ${bbb..}  execute javascript  var string = "${Results}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${bbb..}
      connect to database  dbConfigFile=${dbfile}
      ${db_value}  query  select promised_date from public.receipt_optimization_v where plant_code='DE1' AND push_days <= '10' and opportunity = 'opportunity' and estimated_pay_year = '2017' and planned_date_month = '9' AND po_purchase_order_number ='${text1}';
      log  ${db_value}
      ${convert}  convert to string  ${db_value}
      log  ${convert}
      ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\.|\,  ${EMPTY}
      log  ${queryResults}
      ${bbb}  execute javascript  var string = "${queryResults}"; var returnStr = string.split(" ",1); return returnStr;
      log  ${bbb}
      ${convert}  convert to string  ${bbb}
      log  ${convert}
      ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
      ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
      ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
      log  ${queryResults..}

User click on push days drop down user should see "<10""<20""<30"">=30"
     wait until element is visible  ${push_days_dropdown}   20s
     click element  ${push_days_dropdown}
     sleep  3s
     element should be visible  ${<10_pushdays}
     element should be visible  ${<20_pushdays}
     element should be visible  ${<30_pushdays}
     element should be visible  ${>30+_pushdays}
     click element  ${push_days_dropdown}

user should see push days drop down with default ALL push days on it .
     wait until element is visible  ${push_days_dropdown}  20s
     ${text1}  get text  ${push_days_dropdown}
     should be equal  ${text1}  All

default number in push days for <10 should show less than 10 days in grid.
     click element  ${push_days_dropdown}
     CLICK ELEMENT  //px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[1]
     ${text1}  get text  //vaadin-grid-table/table/thead/tr/th[9]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
     should be equal  ${text1}  Push Days
     double click element  //vaadin-grid-table/table/thead/tr/th[9]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
     sleep  5s
     ${text2}  get text  //vaadin-grid-table/table/tbody/tr[1]/td[9]/vaadin-grid-cell-content/mo-column/div
     log  ${text2}
     evaluate  ${text2}<10

user selects <20 from push days drop down
     click element  ${push_days_dropdown}
     sleep  2s
     click element  ${<20_pushdays}
     sleep  10s

user should see <20 days in grid
     ${text2}  get text  //vaadin-grid-table/table/tbody/tr[1]/td[7]/vaadin-grid-cell-content/mo-column/div
     log  ${text2}
     evaluate  ${text2}<20

user selects <30 from push days drop down
     click element  ${push_days_dropdown}
     sleep  2s
     click element  ${<30_pushdays}
     sleep  10s

user should see <30 days in grid
     ${text2}  get text  //vaadin-grid-table/table/tbody/tr[1]/td[7]/vaadin-grid-cell-content/mo-column/div
     log  ${text2}
     evaluate  ${text2}<30

user selects +30 days from push days drop down
     click element  ${push_days_dropdown}
     sleep  2s
     click element  ${>30+_pushdays}
     sleep  10s

user should see more than 30 days in grid
     ${text2}  get text  //vaadin-grid-table/table/tbody/tr[1]/td[7]/vaadin-grid-cell-content/mo-column/div
     log  ${text2}
     evaluate  ${text2}>30

User selects "Material sku" and "Material Description" from show/hide columns
     click element  ${show/hide column}
     sleep  4s
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Buyer Name')]
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Source/Vendor')]
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Open Qty')]
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Buyer / Purchasing Group')]
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Material Description')]
     click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Material SKU')]
     click element  ${show/hide column}
     sleep  4s
User should see "Material sku" and "Material Description" in ui with data on that column
     ${currentMonth}  execute javascript  var month = (new Date()).getMonth() + 1; return month;
     log  ${currentMonth}
     ${currentYear}  execute javascript  var year = (new Date()).getFullYear(); return year;
     log  ${currentYear}
     ${text1}  get text  //vaadin-grid-table/table/thead/tr/th[22]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
     log  ${text1}
     should be equal  ${text1}  Material Description
     ${text2}  get text  //vaadin-grid-table/table/thead/tr/th[23]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
     log  ${text2}
     should be equal  ${text2}  Material SKU
     :FOR  ${i}  IN RANGE  1  10
        \  mouse over  //vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[3]/vaadin-grid-cell-content/mo-column/div
        \  ${po_number}  get text  //vaadin-grid/vaadin-grid-table/table/tbody/tr[${i}]/td[5]/vaadin-grid-cell-content/mo-column/div
        \  log  ${po_number}
        \  ${material_sku_from_col}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[23]/vaadin-grid-cell-content/mo-column/div
        \  log  ${material_sku_from_col}
        \  connect to database  dbConfigFile=${dbfile}
        \  ${material_sku_col_db}  QUERY  SELECT material_sku FROM public.receipt_optimization_v where planned_date_month = '${currentMonth}' and planned_date_year='${currentYear}' and po_purchase_order_number='${po_number}' and "push_days"<10;
        \  log  ${material_sku_col_db}
        \  ${convert}  convert to string  ${material_sku_col_db}
        \  log  ${convert}
        \  ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
        \  ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
        \  ${po_number_col_db1}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
        \  ${po_number_col_db2}  replace string using regexp  ${po_number_col_db1}  \\'|\,  ${EMPTY}
        \  log  ${po_number_col_db2}
        \  run keyword and continue on failure  should be equal  ${material_sku_from_col}  ${po_number_col_db2}
        \  ${meterial_dis_from_col}  get text  //vaadin-grid-table/table/tbody/tr[${i}]/td[22]/vaadin-grid-cell-content/mo-column/div
        \  connect to database  dbConfigFile=${dbfile}
        \  ${material_dis_col_db}  QUERY  SELECT material_sku FROM public.receipt_optimization_v where planned_date_month = '${currentMonth}' and planned_date_year='${currentYear}' and po_purchase_order_number='${po_number}' and "push_days"<10;
        \  log  ${material_dis_col_db}
        \  ${convert}  convert to string  ${material_dis_col_db}
        \  log  ${convert}
        \  ${queryResults1}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
        \  ${queryResults1}  replace string using regexp  ${queryResults1}  \\)|\,  ${EMPTY}
        \  ${queryResults1}  replace string using regexp  ${queryResults1}  \\[|\,  ${EMPTY}
        \  ${queryResults1}  replace string using regexp  ${queryResults1}  \\]|\,  ${EMPTY}
        \  ${material_dis_col_db1}  replace string using regexp  ${queryResults1}  \\'|\,  ${EMPTY}
        \  log  ${material_dis_col_db1}
        \  ${material_disc._col_db}  replace string using regexp  ${material_dis_col_db1}  \\'|\,  ${EMPTY}
        \  run keyword and continue on failure  should be equal  ${material_dis_col_db1}  ${material_disc._col_db}

Select plant "DE1" from plant filter
        wait until element is visible  plant  20s
        click element  plant
        click element  product-DE1 - IO Manufacturing Germany
        wait until element is visible  ApplyBtn  20s
        click element  ApplyBtn
        sleep  3s

Select plant "DE4" from plant filter
        wait until element is visible  plant  20s
        click element  plant
        click element  product-DE4 - IO Central Warehouse Germany
        wait until element is visible  ApplyBtn  20s
        click element  ApplyBtn
        sleep  3s

Select plant "PNS" from plant filter
       wait until element is visible  plant  20s
        click element  plant
        click element  product-PNS - IO Pensacola (Factory LLC)
        wait until element is visible  ApplyBtn  20s
        click element  ApplyBtn
        sleep  3s


