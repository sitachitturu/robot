*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/lead_time_variables.robot
*** Keywords ***
User click Lead Time Analytics icon
    click element  ${Lead Time Analytics Icon}
     sleep  15s
User should see "${title}"
    wait until element is visible  xpath=//div[@id='topBar']/span[text()='${title}']  20s
#    xpath should match x times  xpath=//div[@id='topBar'])/span[text()='${title}']  1