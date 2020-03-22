7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Library/filter_library.robot

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  10s
       wait until page contains  addFilterBtn  10s

User Narrow Down Results
#Narrow down results to make the excel file smaller and take less time to download
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    wait until element is visible  ${first_plant}  20s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  3s


User Click "Projects"
    wait until element is visible  ${projects}  10s
    click element  ${projects}
