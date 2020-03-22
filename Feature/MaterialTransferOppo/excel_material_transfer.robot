*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/MaterialTransferOppo/excel_material_transfer_step.robot
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Library   ../../Utilities/utility.py

*** Test Cases ***

Verify waiting for action count and amount value for selling opportunities spine ui =count and sum of total opportunities in excel
    Given User access "/secure/material-transfer" module
    And click element  clearFilterBtn
    And sleep  5s
    And get count of total opportunities from spine
    And get value of total opportunities from spine
    And run keyword and continue on failure  Remove old excel file  MegaDepleteSellingOpportunities.xlsx
    And click on export to excel(export checklist) in waiting for action grid for total opportunities
    And sleep  28s
    Then open excel file for opportuinities grid  MegaDepleteSellingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for selling opportunities  MegaDepleteSellingOpportunities.xlsx
    And count and values from spine for waiting for action should be equal to count and value of total opportunities in excel
    And click element  //*[@id="sellingOpp"]//*[@id="exportExcel"]

Verify IN PROCESS count and amount value for selling opportunities spine ui =count and sum of IN PROCESS(total opprtunities column) in excel
    ##Given User access "/secure/material-transfer" module
    ##And click element  clearFilterBtn
    And get count of IN PROCESS from spine
    And get value of IN PROCESS from spine
    And run keyword and continue on failure  Remove old excel file  MegaDepleteSellingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="sellingOpp"]//*[@id="tabsContent"]/paper-tab[2]/div
    And click on export to excel(export checklist) in "IN PROCESS" grid
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteSellingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for selling opportunities  MegaDepleteSellingOpportunities.xlsx
    And count and values from spine for IN PROCESS should be equal to count and value of total opportunities in excel
    And click element  //*[@id="sellingOpp"]//*[@id="exportExcel"]


Verify ACCEPTED count and amount value for selling opportunities spine ui =count and sum of ACCEPTED(total opprtunities column) in excel
    ##Given User access "/secure/material-transfer" module
    ##And click element  clearFilterBtn
    And get count of ACCEPTED from spine
    And get value of ACCEPTED from spine
    And run keyword and continue on failure  Remove old excel file  MegaDepleteSellingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="sellingOpp"]//*[@id="tabsContent"]/paper-tab[3]/div
    And click on export to excel(export checklist) in "ACCEPTED" grid
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteSellingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for selling opportunities  MegaDepleteSellingOpportunities.xlsx
#    And count and values from spine for ACCEPTED should be equal to count and value of total opportunities in excel
#    And click element  //*[@id="sellingOpp"]//*[@id="exportExcel"]

Verify EXECUTED count and amount value for selling opportunities spine ui =count and sum of EXECUTED(total opprtunities column) in excel
    Given User access "/secure/material-transfer" module
    And click element  clearFilterBtn
    And get count of EXECUTED from spine
    And get value of EXECUTED from spine
    And run keyword and continue on failure  Remove old excel file  MegaDepleteSellingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="sellingOpp"]//*[@id="tabsContent"]/paper-tab[4]/div
    And sleep  5s
    And click on export to excel(export checklist) in EXECUTED grid
    And sleep  30s
    Then open excel file for opportuinities grid  MegaDepleteSellingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for selling opportunities  MegaDepleteSellingOpportunities.xlsx
    And count and values from spine for EXECUTED should be equal to count and value of total opportunities in excel

Verify REJECTED count and amount value for selling opportunities spine ui =count and sum of REJECTED(total opprtunities column) in excel
    ##Given User access "/secure/material-transfer" module
    ##And click element  clearFilterBtn
    And get count of REJECTED from spine
    And get value of REJECTED from spine
    And run keyword and continue on failure  Remove old excel file  MegaDepleteSellingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="sellingOpp"]//*[@id="tabsContent"]/paper-tab[5]/div
    And sleep  7s
    And click element  //*[@id="sellingOpp"]//mo-grid-lite[@id='materialTransferSellingRejectTable']/div/div/div/mo-export-excel/div[@id='exportExcel']
    And sleep  3s
    And click element  //*[@id="sellingOpp"]//mo-grid-lite[@id='materialTransferSellingRejectTable']//*[@id="newXlsExport"]/div[2]/div/a
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteSellingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for selling opportunities  MegaDepleteSellingOpportunities.xlsx
    And count and values from spine for REJECTED should be equal to count and value of total opportunities in excel
    And click element  //*[@id="sellingOpp"]//mo-grid-lite[@id='materialTransferSellingRejectTable']/div/div/div/mo-export-excel/div[@id='exportExcel']

####====================================================================================================================================================================================================
Verify waiting for action count and amount value for Buying opportunities spine ui =count and sum of total opportunities in excel
    ##Given User access "/secure/material-transfer" module
    ##And click element  clearFilterBtn
    And sleep  5s
    And scroll page to location  0  1000000
    And get count of total opportunities from spine for buying grid
    And get value of total opportunities from spine for buying grid
    And run keyword and continue on failure  Remove old excel file  MegaDepleteBuyingOpportunities.xlsx
    And click on export to excel(export checklist) in waiting for action grid for total opportunities for buyer
    And sleep  28s
    Then open excel file for opportuinities grid  MegaDepleteBuyingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for buying opportunities  MegaDepleteBuyingOpportunities.xlsx
    And count and values from spine for waiting for action should be equal to count and value of total opportunities in excel for buying grid
    And click element  //*[@id="buyingOpp"]//*[@id="exportExcel"]

Verify IN PROCESS count and amount value for buying opportunities spine ui =count and sum of IN PROCESS(total opprtunities column) in excel
    ##Given User access "/secure/material-transfer" module
    ##And click element  clearFilterBtn
    And get count of IN PROCESS from spine for buying grid
    And get value of IN PROCESS from spine for buying grid
    And run keyword and continue on failure  Remove old excel file  MegaDepleteBuyingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="buyingOpp"]//*[@id="tabsContent"]/paper-tab[2]/div
    And click on export to excel(export checklist) in "IN PROCESS" buying grid
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteBuyingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for buying opportunities  MegaDepleteBuyingOpportunities.xlsx
    And count and values from spine for IN PROCESS should be equal to count and value of total opportunities in excel for buying grid
    And click element  //*[@id="buyingOpp"]//*[@id="exportExcel"]


Verify ACCEPTED count and amount value for buying opportunities spine ui =count and sum of ACCEPTED(total opprtunities column) in excel
    ##Given User access "/secure/material-transfer" module
    ##And click element  clearFilterBtn
    And get count of ACCEPTED from spine for buying grid
    And get value of ACCEPTED from spine for buying grid
    And run keyword and continue on failure  Remove old excel file  MegaDepleteBuyingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="buyingOpp"]//*[@id="tabsContent"]/paper-tab[3]/div
    And click on export to excel(export checklist) in "ACCEPTED" buying grid
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteBuyingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for buying opportunities  MegaDepleteBuyingOpportunities.xlsx
    And count and values from spine for ACCEPTED should be equal to count and value of total opportunities in excel for buying grid
    And click element  //*[@id="buyingOpp"]//*[@id="exportExcel"]

Verify EXECUTED count and amount value for buying opportunities spine ui =count and sum of EXECUTED(total opprtunities column) in excel
    Given User access "/secure/material-transfer" module
    And click element  clearFilterBtn
    And get count of EXECUTED from spine for buying grid
    And get value of EXECUTED from spine for buying grid
    And run keyword and continue on failure  Remove old excel file  MegaDepleteBuyingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="buyingOpp"]//*[@id="tabsContent"]/paper-tab[4]/div
    And click on export to excel(export checklist) in EXECUTED buying grid
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteBuyingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for buying opportunities  MegaDepleteBuyingOpportunities.xlsx
    And count and values from spine for EXECUTED should be equal to count and value of total opportunities in excel for buying grid

Verify REJECTED count and amount value for buying opportunities spine ui =count and sum of REJECTED(total opprtunities column) in excel
    Given User access "/secure/material-transfer" module
    And click element  clearFilterBtn
    And get count of REJECTED from spine for buying grid
    And get value of REJECTED from spine for buying grid
    And run keyword and continue on failure  Remove old excel file  MegaDepleteBuyingOpportunities.xlsx
    And sleep  8s
    And click element  //*[@id="buyingOpp"]//*[@id="tabsContent"]/paper-tab[5]/div
    And sleep  7s
    And click element  //*[@id="buyingOpp"]//mo-grid-lite[@id='materialTransferBuyingRejectTable']/div/div/div/mo-export-excel/div[@id='exportExcel']
    And sleep  3s
    And click element  //*[@id="buyingOpp"]//mo-grid-lite[@id='materialTransferBuyingRejectTable']//*[@id="newXlsExport"]/div[2]/div/a
    And sleep  20s
    Then open excel file for opportuinities grid  MegaDepleteBuyingOpportunities.xlsx
    And sleep  10s
    ${sum_from_excel}=  Gets the total opportunity total from excel for selling opportunities  MegaDepleteBuyingOpportunities.xlsx
    #And count and values from spine for REJECTED should be equal to count and value of total opportunities in excel for buying grid