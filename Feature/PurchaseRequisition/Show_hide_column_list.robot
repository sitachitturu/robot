212590906
10/24/2017
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseRequisition/show_hide_column_list_step.robot

*** Test Cases ***

Verify Hypercare:Renewables:PR module map the right filed to the MRP Controller from database
     Then execute database query for planner/mrp controller and buyer/purchasing group and create list of planner names,Buyer names and Planner names should not be same as buyer names

Verify Purchase Req. module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"

Verify "Created By" change in database with UI for Races plants
    Given User access "/secure/purchasing" module
    When User selects races plants from purchase requisition module
    And select created by column from show/hide list
    Then Run quesry in db and get po number from ui and compare the result
    And click element  clearFilterBtn
    And sleep  10s

Verify "Processing Status" change in database with UI for Races plants
    Given User access "/secure/purchasing" module
    When User selects power business from purchase requisition module and select processing from show/hide
    Then Run quesry in db and get Processing Status from ui and compare the result