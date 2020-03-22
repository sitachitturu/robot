*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access "${link}" module
    click link   ${link}

click "Edit Filter(s)"
    wait until element is not visible  ${Page Spinner}  10s
    wait until element is visible  addFilterBtn  10s
    click button  addFilterBtn

User check check box with "Order Status" name
    wait until element is visible  ${Order Status filter}  20s
    click element  ${Order Status filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see Order Status Filter
    element should be visible  status  20s
    ${Text}  get text  status
    log  ${Text}
