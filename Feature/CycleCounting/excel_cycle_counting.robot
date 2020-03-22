7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CycleCounting/excel_cycle_counting_step.robot
Resource  ../../Variables/cycle_counting_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot

*** Test Cases ***
Verify Excel File Columns - Accuracy View
    Given User access "/secure/cycle-counting" module
    And User Narrow Down Results
    And Remove old excel file   CycleCountingAccuracyReport.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  17s
    Then Verify Excel Column Headers  CycleCountingAccuracyReport.xlsx   ../Data/All_Mod_Show_Hide_Col_Text_Files/cycle_counting_accuracy_show_hide_list.txt

Verify Excel File Columns - On Time View
    Given User access "/secure/cycle-counting" module
    And User Narrow Down Results
    And Remove old excel file   CycleCountingOnTimeReport.xlsx
    And User click "On-Time"
    And scroll page to location  0  10000
    And sleep  8s
    And User click "Export to Excel"  ${export_excel_btn_on_time}
    And sleep  17s
    Then Verify Excel Column Headers  CycleCountingOnTimeReport.xlsx   ../Data/All_Mod_Show_Hide_Col_Text_Files/cycle_counting_on_time_show_hide_list.txt

Verify cycle counting. module whether the copyright is changed 2017 to 2018 or not
    When scroll page to location  0  10000
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"
