*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User click Executive Summary icon
    click element  ${Executive-Summary Iicon}

User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()="${title}"]  1
