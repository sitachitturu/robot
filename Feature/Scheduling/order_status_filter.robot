*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/order_status_filter_step.robot


*** Test Cases ***
In order to see Order Status Filter user should be able to select Order Status Filter from Filters list at Scheduling page
    Given User access "/secure/scheduling" module
    And click "Edit Filter(s)"
    When User check check box with "Order Status" name
    And click "Continue"
    Then User should be able to see Order Status Filter
