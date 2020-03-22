8/8/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/performance_indicator_executive_summary_step.robot
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Test Cases ***
Validate Purchase Requisitions Performance Indicator in Executive Summary Module
    Given User access "/secure/executive-summary" module
    sleep  45s
    Then Verify Purchase Requisitions Performance Indicator Color/Value
    Then Verify Purchase Orders Performance Indicator Color/Value
    Then Verify Scheduling Performance Indicator Color/Value
    Then Verify Spine Performance Indicator Color/Value