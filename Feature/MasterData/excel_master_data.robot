7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/MasterData/excel_master_data_step.robot
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
###==================The following scripts commented because there is bug in masterdata which causes failure in existing scripts, until that defect got fixed this scripts will be commented"=========

Verify excel no.of rows with quantity col record count for "Planned Delivery Time (LT) = 0 for Purchased Materials"
    Given User access "/secure/master-data" module
    And User Click Inconsistency mmdc53
    And Remove old excel file   MasterData.xlsx
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  5s
    Then open excel file for mmdc53  MasterData.xlsx

Verify excel no.of rows with quantity col record count for "Stor. Loc. for EP ‘Non Relevant’ for MRP"
    Given User access "/secure/master-data" module
    And User Click Inconsistency mmdc16
    And Remove old excel file   MasterData.xlsx
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  5s
    Then open excel file for mmdc16  MasterData.xlsx
#
Verify excel no.of rows with quantity col record count for "Missing Work Scheduling Extension"
    Given User access "/secure/master-data" module
    And User Click Inconsistency  ${MMDC33}
    And sleep  10s
    And Remove old excel file   MasterData.xlsx
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  10s
    Then open excel file for mmdc33  MasterData.xlsx

