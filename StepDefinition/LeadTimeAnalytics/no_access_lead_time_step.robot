*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/lead_time_variables.robot
*** Keywords ***
User should not be able to see User Activity module icon
    wait until element is not visible  ${Page Spinner}  50s
    element should not be visible  ${Lead Time Analytics Icon}

User acces URL "${link}"
    go to  ${link}
     sleep  15s
User should see "${text}"
    wait until page contains  ${text}  40s
    element should not be visible  ${Lead Time Analytics Icon}