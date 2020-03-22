8/9/2017
212613237






*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CycleCounting/performance_indicator_cycle_counting_step.robot

*** Test Cases ***
Validate Purchase Requisitions Performance Indicator in Executive Summary Module
    Given User access "/secure/cycle-counting" module
    sleep  45s
    Then Verify Accuracy Performance Indicator Color/Value
    Then Verify On-Time Performance Indicator Color/Value