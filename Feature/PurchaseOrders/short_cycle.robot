10/12/2017
212595411
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/short_cycle_step.robot

Documentation    This test will validate column Short Cycle Days And Short Cycle Days Indicator

*** Test Cases ***
User should see Only "No" value in column Short Cycle if Short Cycle days column is showing "0"
    Given User access Purchase Orders module
    And User should select "Short Cycle Indicator" column and "Short Cycle Days" column from Show/Hide Columns
    Then User Should see only "No" value in "Short Cycle Indicator" column if "Short Cycle Days" column is showing value equal to "0"
