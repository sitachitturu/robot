7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/excel_executive_summary_step.robot
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns Executive Summary Scheduling
    Given User access "/secure/executive-summary" module
    And User Click Scheduling Area of Plant Scorecard
    And Remove old excel file   ProductionOrdersTrend.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${Export to Excel}
    And sleep  15s
    Then Verify Excel Column Headers  ProductionOrdersTrend.xlsx   ${Scheduling_trending_show/hide_list}

Verify Excel File Columns Executive Summary Purchase Orders
    Given User access "/secure/executive-summary" module
    And User Click Purchase Orders Area of Plant Scorecard
    And Remove old excel file   PurchaseOrdersTrend.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${Export to Excel}
    And sleep  15s
    Then Verify Excel Column Headers  PurchaseOrdersTrend.xlsx   ${Purchase_Orders_trending_show/hide_list}
