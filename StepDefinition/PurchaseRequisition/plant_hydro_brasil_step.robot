*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot

*** Keywords ***
User access Purchase Requisitions module
    #wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
    click element  ${Requisitions (incl. Planned) icon}
      sleep  20s
User select 5600 - Plant Hydro Taubate from Plant filter and hit apply
    #wait until element is visible  plant  10s
    click element  plant
    wait until element is visible  search-input  10s
    input text  search-input  5600
    click element  ${lazy_loading_search_icon_filter}
    sleep  4s
    click element  5600 - Plant Hydro Taubate
    wait until element is visible  ${Apply Button}  10s
    click button  ${Apply Button}

Manufacturing from Plant Category filter
    #wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
    wait until element is visible  addFilterBtn  20s
    click button  addFilterBtn
    click element   ${plant category filter}
    click button  continue
    wait until element is visible  pcat  10s
    click element  pcat
    wait until element is visible  ${Manufacturing}  10s
    click element  ${Manufacturing}
    wait until element is visible  ${Apply button for plant category filter}  10s
    click element  ${Apply button for plant category filter}
    wait until element is not visible  xpath=//div[@id='pageSpinner']  100s

User select Hydro from Plant business filter
    #wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
    click button  addFilterBtn
    wait until element is visible  ${sub_business_filter}  10s
    click element   ${sub_business_filter}
    click button  continue
    wait until element is visible  sub_business  10s
    click element  sub_business
    wait until element is visible  ${Hydro}  10s
    click element  ${Hydro}
    wait until element is visible  ${sub_business_apply_button}  10s
    click element  ${sub_business_apply_button}
    wait until element is not visible  xpath=//div[@id='pageSpinner']  50s

LATAM from Plant Region filter
    #wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
    click button  addFilterBtn
    wait until element is visible  ${plant region filter}  10s
    click element   ${plant region filter}
    click button  continue
    wait until element is visible  region  10s
    click element  region
    wait until element is visible  ${LATAM}  10s
    click element  ${LATAM}
    wait until element is visible  ${Apply button for plant region filter}  10s
    click element  ${Apply button for plant region filter}
    wait until element is not visible  xpath=//div[@id='pageSpinner']  50s

#User should be able to select Plant Hydro Taubate from Plant filter
#    click element  plant
#    wait until element is visible  search-input  10s
#    input text  search-input  5600
#    wait until element is visible  product-5600 - Plant Hydro Taubate  10s
#    click element  ${Taubate plant}
#    wait until element is visible  ${Apply Button}  10s
#    sleep  6s
#    click button  ${Apply Button}
#    wait until element is not visible  xpath=//div[@id='pageSpinner']  10s

#Then the heat map and Data grid should show the data for Hydro, matching from ERP & datalake extracts
#    wait until element is not visible  xpath=//div[@id='pageSpinner']  10s
#    element should be visible  xpath=//vaadin-grid[@id='purchaseHeatMap']//span[contains(text(),'HP-FIXAÇÃO')]
