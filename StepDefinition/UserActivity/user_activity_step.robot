*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/user_activity_variables.robot
*** Keywords ***
User click User Activity icon
    click element  ${Secure Notification Icon}
    sleep  1s
    click element  ${User Activity Icon}

User should see "User Activity"
    wait until element is visible  ${User Activity Title}  5s