*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/DEFECTS/purchase_orders_steps.robot
*** Test Cases ***
Purchase Orders smoke test
    When User click Purchase Orders icon
    And click on Value($) tab and get the totals in all columns and percentage in all columns should not be more than 100%