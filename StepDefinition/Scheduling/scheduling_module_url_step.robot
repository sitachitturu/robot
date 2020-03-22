*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
*** Keywords ***
User click Scheduling icon
    click element  ${Scheduling icon}
    wait until element is visible  addFilterBtn  10s

User should see "${title}"
    wait until element is visible  addFilterBtn  20s
    #xpath should match x times  (//div[@id='topBar'])/span[text()="${title}"]  1
    element should be visible  ${Scheduling Page Title}
    ${text}  get text  ${Scheduling Page Title}
    log  ${text}
    should be equal  ${text}  Scheduling