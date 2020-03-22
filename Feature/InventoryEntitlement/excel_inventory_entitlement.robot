7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/InventoryEntitlement/excel_inventory_entitlement_step.robot
Resource  ../../Variables/inventory_entitlement_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns
    Given User access "/secure/inventory-entitlement" module
    And Remove old excel file   InventoryEntitlement.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${Export to Excel}
    And sleep  6s
    Then Verify Excel Column Headers  InventoryEntitlement.xlsx   ${InvEntitlement_Show/Hide_col_list}
