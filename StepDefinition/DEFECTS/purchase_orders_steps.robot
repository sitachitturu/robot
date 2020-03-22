*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/Variable_defects.robot

*** Keywords ***
User click Purchase Orders icon
       click element  ${Purchase Orders Icon}
       sleep  10s

click on Value($) tab and get the totals in all columns and percentage in all columns should not be more than 100%
       wait until element is visible  ${value_tab_pr_module}  10s
       click element  ${value_tab_pr_module}
       sleep  5s
       ${significantly aged %}  get text