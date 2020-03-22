8/10/2017
212613237

*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PlantComparison/performance_indicator_plant_comparison_step.robot

*** Test Cases ***
Validate Performance Indicator in Plant Comparison Module
    Given User access "/secure/plant-comparison" module
    sleep  15s
    Then Verify All Plants Indicator Color/Value