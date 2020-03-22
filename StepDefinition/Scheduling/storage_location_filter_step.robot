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

User check check box with "Storage Location" name
    wait until element is visible  ${Storage Location filter}  20s
    click element  ${Storage Location filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

User should be able to see Storage Location Filter
    element should be visible  sloc  20s
    ${Text}  get text  sloc
    log  ${Text}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})
