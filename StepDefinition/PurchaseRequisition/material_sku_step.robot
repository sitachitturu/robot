6/2/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  20s
click "Edit Filter(s)"
    click element  addFilterBtn
User check check box with "Material SKU" name in po
    wait until element is visible  ${Material SKU filter}  5s
    click element  ${Material SKU filter}
    sleep  3s
User check check box with "Material SKU" name in ltp
    click element  //*[@id="filterlist"]/label[5]
    ${filter_text}  get text  //*[@id="filterlist"]/label[5]
    should be equal  ${filter_text}  Material SKU
click "Continue"
    click element  continue
User should see tooltip
    mouse over  ${MKU icon}
    element should be visible  inactive-menu-tooltip

User select plant from plant filter for pr
    wait until element is visible  ${Plant filter button}  15s
    click element  ${Plant filter button}
    sleep  4s
    click element  ${plant_filter_checkbox_pr}
    wait until element is visible  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]  15s
    click element  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]

User select plant from plant filter
    wait until element is visible  ${Plant filter button}  15s
    click element  ${Plant filter button}
    sleep  4s
    click element  ${plant_filter_checkbox}
    wait until element is visible  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]  15s
    click element  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]

User select data from Material SKU filter in Purchase Req and User see correct data in Purchase Req grid
    sleep  14s  #filter material sku need to load checkbox
    click element  //mm-filter[@id='sku']
    sleep  5s
    click element  xpath=//mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[2]/paper-checkbox/div
    sleep  2s
    click element  ${checkbox_material_sku}
    sleep  2s
    ${text}  get text  ${selected_checbox_material_sku}
    log  ${text}
    click element  xpath=//*[@id="sku"]//button[@id="ApplyBtn"]
    sleep  15s
    ${text1}  get text  //vaadin-grid-table/table/tbody/tr[1]/td[3]/vaadin-grid-cell-content/mo-column/div
    should be equal  ${text1}  ${text}

User select data from Material SKU filter in Lead Time Analytics and User see correct data in Lead Time Analytics
    sleep  13s  #filter material sku need to load checkbox
    click element  //mm-filter[@id='sku']
    sleep  5s
    click element  ${material_sku_selecting_checkbox_LTP}
    sleep  2s
    click element  ${CHECKBOX_MATERIAL_SKU_LTP}
    sleep  3s
    ${text}  get text  ${selected_checbox_material_sku_LTP}
    log  ${text}
    click element  xpath=//*[@id="sku"]//button[@id="ApplyBtn"]
    run keyword  scroll page to location  0  10000000
    sleep  18s
   ${text2}  get text  //mo-lead-time/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr/td[9]/vaadin-grid-cell-content/mo-column/div
    should be equal  ${text2}  ${text}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript  window.scrollTo(${x_location},${y_location})
