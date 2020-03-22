*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/receipt_optamization_variables.robot
*** Keywords ***
User click Receipt Optimization icon
    click element  ${Receipt Optimization Icon}
     sleep  10s
User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1