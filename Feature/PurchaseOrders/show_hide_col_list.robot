*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/show_hide_col_list_step.robot

*** Test Cases ***

Verify Purchase orders. module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"
