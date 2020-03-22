7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py
Resource  ../../Library/filter_library.robot


*** Keywords ***
User access "${link}" module
       click link   ${link}
       wait until page contains  addFilterBtn  10s

User Narrow Down Results
#Narrow down results to make the excel file smaller and take less time to download
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    wait until element is visible  ${first_plant}  20s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  3s

    ${first_plant}=  mm-get first element from filter list  pgroup
    click element  pgroup
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='pgroup']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  3s