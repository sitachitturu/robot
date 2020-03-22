7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseRequisition/excel_purchase_requisition_step.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns
    Given User access "/secure/purchasing" module
    And User Narrow Down Results
    And Remove old excel file   PurchaseReqs.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${Export to Excel}
    And sleep  6s
    Then Verify Excel Column Headers  PurchaseReqs.xlsx   ${purchase_requi_excel_col_list}
