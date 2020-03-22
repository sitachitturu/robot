7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/excel_scheduling_step.robot
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns Scheduling - Products
    Given User access "/secure/scheduling" module
    And Remove old excel file   ProductionOrders.xlsx
    And User Narrow Down Results
    And scroll page to location  0  10000
    And sleep  18s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  16s
    Then Verify Excel Column Headers  ProductionOrders.xlsx   ${Scheduling_products_excel_col}
    Then Verify Production/Work Order Column  ProductionOrders.xlsx

Verify Excel File Columns Scheduling - Projects
    Given User access "/secure/scheduling" module
    And User Click "Projects"
    And Remove old excel file   ProjectActivity.xlsx
    And User Narrow Down Results
    And scroll page to location  0  10000
    And sleep  18s
    And User click "Export to Excel"  ${export_excel_btn_Projects}
    And sleep  25s
    Then Verify Excel Column Headers  ProjectActivity.xlsx   ${Scheduling_projects_excel_col}
