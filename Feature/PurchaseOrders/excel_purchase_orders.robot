7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/excel_purchase_orders_step.robot
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns
    Given User access "/secure/purchase-orders" module
    And User Narrow Down Results
    And Remove old excel file   PurchaseOrders.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  6s
    Then Verify Excel Column Headers  PurchaseOrders.xlsx   ${PO_SHOW/HIDE_col_excel_list}
