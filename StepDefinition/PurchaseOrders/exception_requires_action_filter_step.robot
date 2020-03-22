*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot

*** Keywords ***
User access "${link}" module
     click link   ${link}
     sleep  20s
     wait until element is visible  addFilterBtn  40s

User click on Edit filters button and User should see Exception Requires Action filter in the edit filters list
      wait until element is visible  addFilterBtn  20s
      click element  addFilterBtn
      ${text}  get text  ${editfilterlist}
      log  ${text}
      should contain  ${text}  Exception Requires Action
      ${text1}  get text  ${exp-requi-action}
      log  ${text1}
      click element  continue

select exception requires action filter and click continue
      wait until element is visible  addFilterBtn  20s
      click element  addFilterBtn
      wait until element is visible  ${exp-requi-action}  10s
      click element  ${exp-requi-action}
      wait until element is visible  continue  10s
      click element  continue

click exception requires filter and User shoiuild see "Action Required" and "No Error" and click cancel button
       ${text1}  get text  exp_action
       log  ${text1}
       click element  exp_action
       sleep  5s
       ${text}  get text  ${exception requires action filter list}
       log  ${text}
       wait until element is visible  product-Action Required  10s
       wait until element is visible  product-No Error  20s

click exception requires filter and User shoiuld be able to select "Action Required" and "No Error" and click apply button
      wait until element is visible  exp_action  20s
      click element  exp_action
      wait until element is visible  product-Action Required  10s
      click element  product-Action Required
      click element  product-No Error
      wait until element is visible  ${apply button for exp_req_act}  10s
      click element  ${apply button for exp_req_act}
      sleep  3s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

User click on show/hide columns button and scroll page
       wait until element is visible  ${show/hide column}  10s
       click element  ${show/hide column}
       run keyword  scroll page to location  0  10000000
       sleep  10s
       click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Exception Requires Action')]
       click element  //div[@id='gridContainer']//div[contains(normalize-space(), 'Ideal Need / Req. Del. Date')]
       sleep  4s
       click element  ${show/hide column}
       sleep  10s
       capture page screenshot

User should be able to see "Exception Requires Action" column on the UI
      wait until element is visible  ${Exception col}  30s
      element should be visible  ${PO Number col}
      element should be visible  ${Material SKU col}
      element should be visible  ${Open Q. col}
      element should be visible  ${sour/vendor col}
      element should be visible  ${Excep_req_action col_ui}