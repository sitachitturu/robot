
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User follow "${link}"
    click link   ${link}
    sleep  2s

User should see Transaction+Coming+Soon.png
    wait until element is visible  ${Transaction Comming soon}  20s
