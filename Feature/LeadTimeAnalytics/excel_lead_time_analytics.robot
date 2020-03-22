7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/LeadTimeAnalytics/excel_lead_time_analytics_step.robot
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns - Details View
    Given User access "/secure/lead-time-analytics" module
    And User Narrow Down Results
    And Remove old excel file   LeadTimeDetails.xlsx
    And scroll page to location  0  1000000
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  6s
    Then Verify Excel Column Headers  LeadTimeDetails.xlsx   ${lead_time_details_view_show/hide_list}

Verify Excel File Columns - Aggregated View
    Given User access "/secure/lead-time-analytics" module
    And User Narrow Down Results
    And Remove old excel file   LeadTimeVendor.xlsx
    And scroll page to location  0  10000
    And User click "Aggregated"
    And sleep  10s
    And User click "Export to Excel"  ${export_excel_btn_aggregated}
    And sleep  15s
    Then Verify Excel Column Headers  LeadTimeVendor.xlsx   ${lead_time_aggregated_view_show/hide_list}

Verify Record Count in Heap Map with Excel Record Count
    Given User access "/secure/lead-time-analytics" module
    And User Click First Source/Vendor in Heat Map
    Then Heat map record count should match number of rows in excel