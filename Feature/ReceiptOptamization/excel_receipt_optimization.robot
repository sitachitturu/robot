7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ReceiptOptamization/excel_receipt_optimization_step.robot
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Library/excel_library.robot

*** Test Cases ***
#The "INDIVIDUAL PLANTS" test scripts check the excel file for one plant at a time, as requested by the product owners
Verify spine values with excel file - Month View - INDIVIDUAL PLANTS
    Given User access "/secure/receipt-optimization" module
    And Remove old excel file  ReceiptOptimization.xlsx
    Then Total Opportunity Amount should equal excel sheet Sum("Total Opportunity col.") in current selected Month - INDIVIDUAL PLANTS  ReceiptOptimization.xlsx

Verify spine values with excel file - Quarter View - INDIVIDUAL PLANTS
    Given User access "/secure/receipt-optimization" module
    And User select Quarter View
    Then Total Opportunity Amount should equal excel sheet Sum("Open PO Amount") in current selected Quarter - INDIVIDUAL PLANTS  ReceiptOptimizationQuarter.xlsx

Verify spine values with excel file for Upcoming Quarter - Quarter View
    Given User access "/secure/receipt-optimization" module
    And User select Quarter View
    And Remove old excel file  ReceiptOptimizationQuarter.xlsx
    And sleep  8s
    And Ensure Appropriate Year Selected
    And User click "Export to Excel"  ${Export to Excel Quarter Data Table}
    Then Total Opportunity Amount should equal excel sheet Sum ("Open Po Amount") in the next Quarter  ReceiptOptimizationQuarter.xlsx
#
#


#The commented out scripts below would check the excel files in comparison to the spine for ALL plants, not individually.

Verify spine values with excel file - Month View
    Given User access "/secure/receipt-optimization" module
    And Remove old excel file  ReceiptOptimization.xlsx
    And sleep  8s
    And User click "Export to Excel"  ${Export to Excel defoult page}
    Then Verify Excel Column Headers  ReceiptOptimization.xlsx   ${receipt_opt_show/hide_list}
    Then Total Opportunity Amount should equal excel sheet Sum("Total Opportunity col.") in current selected Month - INDIVIDUAL PLANTS  ReceiptOptimization.xlsx


Verify spine values with excel file - Quarter View
    Given User access "/secure/receipt-optimization" module
    And User select Quarter View
    And Remove old excel file  ReceiptOptimizationQuarter.xlsx
    And sleep  8s
    And User click "Export to Excel"  ${Export to Excel Quarter Data Table}
    Then Verify Excel Column Headers  ReceiptOptimizationQuarter.xlsx   ${receipt_opt_quarter_show/hide_list}
    Then Total Opportunity Amount should equal excel sheet Sum("Open PO Amount") in current selected Quarter - INDIVIDUAL PLANTS  ReceiptOptimizationQuarter.xlsx

    And Remove old excel file  ReceiptOptimizationQuarter.xlsx
    And sleep  8s
    And Ensure Appropriate Year Selected
    And User click "Export to Excel"  ${Export to Excel Quarter Data Table}
    Then Total Opportunity Amount should equal excel sheet Sum ("Open Po Amount") in the next Quarter  ReceiptOptimizationQuarter.xlsx
#
