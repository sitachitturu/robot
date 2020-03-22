*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot

*** Keywords ***
User access "${link}" module
     click link   ${link}
     sleep  15s

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
