*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
     wait until page contains  addFilterBtn  10s

click "Edit Filter(s)"
    wait until element is not visible  ${Page Spinner}  10s
    wait until element is visible  addFilterBtn  10s
    click button  addFilterBtn

User check check box with "Current Finish Date" name
    wait until element is visible  ${CurrentFinishDate filter}  20s
    click element  ${CurrentFinishDate filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see Current Finish Date Filter
    element should be visible  cfd  20s
    ${Text}  get text  cfd
    log  ${Text}
