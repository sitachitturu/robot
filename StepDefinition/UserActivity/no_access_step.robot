*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/user_activity_variables.robot
*** Keywords ***
User should not be able to see User Activity module icon
    wait until element is not visible  ${Page Spinner}  10s
    element should not be visible  ${Secure Notification Icon}
    element should not be visible  ${User Activity Icon}
User acces URL "${link}"
    go to  ${link}
User should see "${text}"
    wait until page contains  ${text}  10s
    element should not be visible  ${User Activity Title}