
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}
    wait until element is visible  addFilterBtn  20s

click "Edit Filter(s)"
    wait until element is not visible  ${Page Spinner}  10s
    wait until element is visible  addFilterBtn  10s
    click button  addFilterBtn

User check check box with "Product Hierarchy" name
    wait until element is visible  ${Product Hierarchy filter}  20s
    click element  ${Product Hierarchy filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue
    sleep  3s
User should be able to see Product Hierarchy Filter
    click element  hierarchy
    ${Text}  get text  hierarchy
    log  ${Text}
