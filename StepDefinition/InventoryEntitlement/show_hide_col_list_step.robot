*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/inventory_entitlement_variables.robot

*** Keywords ***
User access "${link}" module
     click link   ${link}
     #wait until element is visible  ${show/hide column}  10s
     sleep  13s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

user enters module and scroll page down
     sleep  3s
     RUN KEYWORD  scroll page to location  0  1000000

User should see "© 2017 General Electric" changed to "© 2018 General Electric"
    ${Copyright text}  get text  //div[2]/mo-footer/footer/span/span
    log  ${Copyright text}
    should be equal  ${Copyright text}  © 2018 General Electric