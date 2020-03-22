7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py
Resource  ../../Library/filter_library.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
    wait until element is not visible  ${Page Spinner}  60s
    click link   ${link}
     wait until page contains  addFilterBtn  10s

User Narrow Down Results
#Narrow down results to make the excel file smaller and take less time to download
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    wait until element is visible  ${first_plant}  15s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  3s

User click "On-Time"
    wait until element is visible  //*[@id="tabsContent"]/paper-tab[2]/div  15s
    click element  //*[@id="tabsContent"]/paper-tab[2]/div
    sleep  3s

User should see "© 2017 General Electric" changed to "© 2018 General Electric"
    ${Copyright text}  get text  //div[2]/mo-footer/footer/span/span
    log  ${Copyright text}
    should be equal  ${Copyright text}  © 2018 General Electric
