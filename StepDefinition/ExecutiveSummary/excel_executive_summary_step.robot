7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User access "${link}" module
       click link   ${link}
       wait until page contains  addFilterBtn  10s

User Click Scheduling Area of Plant Scorecard
    wait until element is visible  ${scheduling scorecard}
    click element  ${scheduling scorecard}

User Click Purchase Orders Area of Plant Scorecard
    wait until element is visible  ${purchase orders score card}
    click element  ${purchase orders score card}