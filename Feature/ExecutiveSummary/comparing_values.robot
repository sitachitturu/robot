8/8/2017
212595411
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ExecutiveSummary/comparing_values_step.robot
Documentation    User should see the same Values for all plants at Executive Summary module and Plant Comparison Module

*** Test Cases ***
User should see the same values in spine at Executive Summary module and Plant Comparison for all plants
    Given User access Executive summary and same values in spine at Executive Summary module and Plant Comparison for all plants



