*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot

*** Keywords ***
User access Master Data page
    click element  ${Master Data Icon}
    sleep  15s
User should see "${incosistency_name}"
    wait until element contains  dataTableContent  ${incosistency_name}  30s

User click "View" details page for "Planned Delivery Time (LT) = 0 for Purchased Materials" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC53']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Planned Delivery Time (LT) = 0 for Purchased Materials" inconsistency
        sleep  3s
    wait until element is visible  ${MMDC53}  20s
    click element  ${MMDC53}
    sleep  14s
User should see following column "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}"
    wait until element is visible  xpath=//*[@id='content']/div/span[text()='${test}']  30s
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test2}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test3}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test4}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test5}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test6}']
    #Scroll grid horizontaly 700px
    element should be visible  xpath=//table/thead//th//span[text()='${test7}']

User click "View" details page for "Open Sales Order Validation" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC39']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Open Sales Order Validation" inconsistency
        sleep  3s
    click element  ${MMDC39}
    sleep  16s
User click "View" details page for "Stor. Loc. for EP ‘Non Relevant’ for MRP" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC16']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Stor. Loc. for EP ‘Non Relevant’ for MRP" inconsistency
        sleep  3s
    click element  ${MMDC16}
    sleep  16s
User click "View" details page for "Conflicting Ind./Col. Indicator and Safety Stock" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC36']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Conflicting Ind./Col. Indicator and Safety Stock" inconsistency
        sleep  3s
    click element  ${MMDC36}
     sleep  16s
User click "View" details page for "Missing Work Scheduling Extension" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC33']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing Work Scheduling Extension" inconsistency
        sleep  3s
    click element  ${MMDC33}
    sleep  16s
User click "View" details page for "In-House Prod. Time = 0" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC15']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "In-House Prod. Time = 0"
        click element  ${MMDC15}
    sleep  16s

User click "View" details page for "Missing MRP Controller" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC17']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing MRP Controller"
        sleep  3s
    click element  ${MMDC17}
     sleep  16s
User click "View" details page for "In-House Prod. Time > Total LT" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC13']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "In-House Prod. Time > Total LT"
        sleep  3s
    click element  ${MMDC13}
     wait until element is visible  ${Message title}  30s
     sleep  16s
User click "View" details page for "Missing BOM and/or Routing" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC11']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing BOM and/or Routing"
        sleep  3s
    click element  ${MMDC11}
    sleep  16s
User click "View" details page for "Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC32']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials"

    click element  ${MMDC32}
    sleep  16s
User click "View" details page for "Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC50']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials"
        sleep  3s
    click element  ${MMDC50}
    sleep  16s

User click "View" details page for "Missing Purchasing Group" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC45']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing Purchasing Group"
        sleep  3s
    click element  ${MMDC45}
   sleep  16s

User click "View" details page for "Materials Missing a Profit Center Assignment" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC61']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Materials Missing a Profit Center Assignment"
        sleep  3s
    click element  ${MMDC61}
     sleep  16s
User click "View" details page for "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC54']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed"
        sleep  3s
    click element  ${MMDC54}
    sleep  16s

User should see following column "Plant Code - Name" column "Material Sku" column "Material Type" column "Profit Center" column "Mrp Controller" column "Mrp Type" column
#vendor_name column was removed as part of US60766 because of this we have only 6columns
    sleep  5s
    wait until element is visible  ${PLANT COLUMN}  30s
    element should be visible  ${Material SKU Column}
    element should be visible  ${Material Type Column}
    element should be visible  ${Profit Center column}
    element should be visible  ${Mrp Controller column}
    element should be visible  ${Mrp Type column}
    sleep  12s

User click "View" details page for "Missing Storage Location Extension" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC18']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing Storage Location Extension"
        sleep  3s
    click element  ${MMDC18}
     sleep  16s

User click "View" details page for "Source List MRP Relevancy Recommendation" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC52']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Source List MRP Relevancy Recommendation"
        wait until element is visible  ${MMDC52}  20s
    sleep  3s
    click element  ${MMDC52}
    sleep  10s

User should see "${details_title}" title at the top of the details page
    wait until element is visible  ${Message title}  30s
    page should contain element  ${Message title}  1
    page should contain  ${details_title}
    wait until element is visible  ${Message title}  10s
    ${title}  get text  ${Message title}
    log  ${title}
    log  ${details_title}
    should be equal  ${title}  ${details_title}

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})


Scroll grid horizontaly ${left}px
    execute javascript    $("vaadin-grid > div > div").get(1).scrollLeft=${left}


PageSpinner
    wait until page does not contain element  ${Page Spinner}  10s

User should be able to see list of columns in show/hide columns option(mmdc53)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC53_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc39)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC39_show/hide}
     Log    ${TextFileContent}
     should be equal   ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc16)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC16_show/hide}
     Log    ${TextFileContent}
     should be equal   ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc36)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC36_show/hide}
     Log    ${TextFileContent}
     should be equal   ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc33)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC33_show/hide}
     Log    ${TextFileContent}
     should be equal   ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc15)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC15_show/hide}
     Log    ${TextFileContent}
     should be equal   ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc17)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC17_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc13)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC13_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc11)
      wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC11_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns(list1) in show/hide columns option(mmdc32)
      wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC32_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc50)
      wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC50_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc45)
      wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC45_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc18)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC18_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns(list1) in show/hide columns option(mmdc52)
      wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC52_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc61)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC61_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc54)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC54_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Purchased to Stock materials with no Source List" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC51']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Purchased to Stock materials with no Source List"
        click element  ${MMDC51}
    sleep  15s
User click "View" details page for "Missing Source List Flag MM" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC72']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing Source List Flag MM"
        click element  ${MMDC72}
     sleep  15s
User should be able to see list of columns in show/hide columns option(mmdc51)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC51_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should be able to see list of columns in show/hide columns option(mmdc72)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC72_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Items missing a Lead Time" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC98']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Item Missing a Lead Time"
    click element  ${MMDC98}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc98)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC98_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Missing BOM for Make Items" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC99']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing BOM for Make Items"
        sleep  3s
    click element  ${MMDC99}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc99)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC99_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     capture page screenshot

User click "View" details page for "Items missing Approved Supplier List" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC101']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Items missing Approved Supplier List"
    sleep  3s
    click element  ${MMDC101}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc101)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC101_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Missing Routings for Make Items" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC100']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Missing Routings for Make Items"
        sleep  3s
    click element  ${MMDC100}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc100)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC100_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Inactive BOM Components" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC102']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Inactive BOM Components"
        sleep  3s
    click element  ${MMDC102}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc102)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC102_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Purchase Order Has A Past Due Promise Date" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC20']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Purchase Order Has A Past Due Promise Date"
        sleep  3s
    click element  ${MMDC20}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc20)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC20_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should see 11 columns: column "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column "${test8}" column "${test9}" column "${test10}" column "${test11}"
    wait until element is visible  xpath=//*[@id='content']/div/span[text()='${test}']  30s
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test2}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test3}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test4}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test5}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test6}']
    #Scroll grid horizontaly 700px
    element should be visible  xpath=//table/thead//th//span[text()='${test7}']
     element should be visible  xpath=//table/thead//th//span[text()='${test8}']
     element should be visible  xpath=//table/thead//th//span[text()='${test9}']
     element should be visible  xpath=//table/thead//th//span[text()='${test10}']
     element should be visible  xpath=//table/thead//th//span[text()='${test11}']
User click "View" details page for "Buyer Name On Item Does Not Match Purchase Order" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC21']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Buyer Name On Item Does Not Match Purchase Order"
    sleep  3s
    click element  ${MMDC21}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc21)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC21_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should see 13 columns: column "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column "${test8}" column "${test9}" column "${test10}" column "${test11}" column "${test12}" column "${test13}"
    wait until element is visible  xpath=//*[@id='content']/div/span[text()='${test}']  30s
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test2}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test3}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test4}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test5}']
    element should be visible  xpath=//*[@id='content']/div/span[text()='${test6}']
    #Scroll grid horizontaly 700px
    element should be visible  xpath=//table/thead//th//span[text()='${test7}']
    element should be visible  xpath=//table/thead//th//span[text()='${test8}']
    element should be visible  xpath=//table/thead//th//span[text()='${test9}']
    element should be visible  xpath=//table/thead//th//span[text()='${test10}']
    element should be visible  xpath=//table/thead//th//span[text()='${test11}']
    element should be visible  xpath=//table/thead//th//span[text()='${test12}']
    element should be visible  xpath=//table/thead//th//span[text()='${test13}']

User click "View" details page for "Purchase Order Is Missing a Promise Date" inconsistency
    ${quantity value}  get text  //mo-master-data-row[@id='MMDC19']//span[@class='style-scope mo-master-data-quantity-cell']
    run keyword if  '${quantity value}' == '0'  pass execution  "Purchase Order Is Missing a Promise Date"
    sleep  3s
    click element  ${MMDC19}
    sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc19)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
      ${TextFileContent}  get file  ${MD_MMDC19_show/hide}
      Log    ${TextFileContent}
      should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Item lead time is greater than 365 days" inconsistency
     ${quantity value}  get text  //mo-master-data-row[@id='MMDC106']//span[@class='style-scope mo-master-data-quantity-cell']
     run keyword if  '${quantity value}' == '0'  pass execution  "Item lead time is greater than 365 days"
          sleep  3s
     click element  ${MMDC106}
     sleep  15s

User should see 8 columns "${test}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column
     element should be visible  xpath=//*[@id='content']/div/span[text()='${test2}']
     element should be visible  xpath=//*[@id='content']/div/span[text()='${test3}']
     element should be visible  xpath=//*[@id='content']/div/span[text()='${test4}']
     element should be visible  xpath=//*[@id='content']/div/span[text()='${test5}']
     element should be visible  xpath=//*[@id='content']/div/span[text()='${test6}']
     #Scroll grid horizontaly 700px
     element should be visible  xpath=//table/thead//th//span[text()='${test7}']

User should be able to see list of columns in show/hide columns option(mmdc106)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC106_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Item is having a dummy lead time value" inconsistency
     ${quantity value}  get text  //mo-master-data-row[@id='MMDC105']//span[@class='style-scope mo-master-data-quantity-cell']
     run keyword if  '${quantity value}' == '0'  pass execution  "Item lead time is greater than 365 days"

     sleep  3s
     click element  ${MMDC105}
     sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc105)
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC105_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click "View" details page for "Item is missing an approved supplier lead time" inconsistency
     ${quantity value}  get text  //mo-master-data-row[@id='MMDC105']//span[@class='style-scope mo-master-data-quantity-cell']
     run keyword if  '${quantity value}' == '0'  pass execution  "Item lead time is greater than 365 days"
     sleep  3s
     click element  ${MMDC104}
     sleep  15s

User should be able to see list of columns in show/hide columns option(mmdc104)
      wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     sleep  2s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MD_MMDC104_show/hide}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should not see "${incosistency_name1}"
     element should not contain  dataTableContent  ${incosistency_name1}

User click on Back button to see other inconsistencies
     wait until element is visible  //mo-master-data-grid/div[2]/paper-toolbar/div/span   10s
     click element  //mo-master-data-grid/div[2]/paper-toolbar/div/span
     sleep  3s