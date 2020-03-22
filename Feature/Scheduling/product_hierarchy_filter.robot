*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/product_hierarchy_filter_step.robot


*** Test Cases ***
In order to see Product Hierarchy Filter user should be able to select Product Hierarchy Filter from Filters list at Scheduling page
    Given User access "/secure/scheduling" module
    And click "Edit Filter(s)"
    When User check check box with "Product Hierarchy" name
    And click "Continue"
