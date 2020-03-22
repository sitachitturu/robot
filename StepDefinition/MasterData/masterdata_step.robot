*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot

*** Keywords ***
User click Master Data icon
    click element  ${Master Data Icon}

User should see "Master Data"
    element should be visible  ${Master Data Page Title}