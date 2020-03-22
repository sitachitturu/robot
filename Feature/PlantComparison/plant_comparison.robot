*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PlantComparison/plant_comparison_step.robot
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***
Plant Comparison smoke test
    [Tags]  Regression
    When User click Plant Comparison icon
    Then User should see "Plant Comparison"

Verify plant comaprison navigation
    [Tags]  Regression
    When User click Plant Comparison icon
    Then User should see "Plant Comparison"

Verify static labels
    [Tags]  Regression
    Given User click Plant Comparison icon
    Then User should see all static labels  Material Optimization  2018 General Electric  Plant Comparison

Validate grid data
    [Tags]  Regression
    Given User click Plant Comparison icon
    When User click plant filter
    And User click a value in plant filter  0010 - Charlottesville
    And User click apply for plant filter
    Then User should see selected plant for plant filter  0010 - Charlottesville
    Then Validate plant metrics data  0010 - Charlottesville

Validate Plant filter
    [Tags]  Regression
    Given User click Plant Comparison icon
    When User click plant filter
    And User click a value in plant filter  0010 - Charlottesville
    And User click apply for plant filter
    Then User should see selected plant for plant filter  0010 - Charlottesville

Validate Business filter
    [Tags]  Regression
    Given User click Plant Comparison icon
    When User click business filter
    And User click a value in business filter  MMF
    And User click apply on business filter
    Then Validate plants filtered by business  MMF

Validate contents under the plant comparison tab
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    then Verify all plant score in plant comparison page
    then Verify the percent icon under the Plant comparison page
    #then User should see both Score and Opportunity tabs


Validate the default business filter
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    then User should see the default business filter under Plant Comparison page


Validate the functionality for Edit Filter button
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    then User should be able to click on Edit Filter button
    then User should be able to see other filter options  business
    then User should be able to see other filter options  plant
    then User should be able to see other filter options  pcat
    then User should be able to see other filter options  region
    then click "Continue"

Validate the functionality for cancel button
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then click "Cancel" button
    then User should see the default business filter under Plant Comparison page

Validate all business filter in the plant comparison page
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then click "Continue"
    then User should see all business filter under Plant Comparison page

Verify the business filter - Plant business
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    And User should click on Plant business
    then Verify apply button in plant  business
    then Verify show selected in plant  business

Verify the business filter - Plant
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    And User should click on Plant name
    then Verify apply button in plant  plant
    then Verify show selected in plant  plant

Verify the business filter - Plant Category
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    And User should be able to click on Edit Filter button
    And Select plant filters  pcat
    then click "Continue"
    then User should click on Plant category
    then Verify apply button in plant  pcat
    then Verify show selected in plant  pcat

Verify the business filter - Plant region
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    And User should be able to click on Edit Filter button
    And Select plant filters  region
    then click "Continue"
    then User should click on Plant region
    then Verify apply button in plant  region
    then Verify show selected in plant  region

Verify the list of column name under Show hide Column button -Score tab
    [Tags]  Regression
    When Click on main_module_tab
    When User click Plant Comparison icon
    then Click on Showhide column tab
    then User should able to see list of columns in show/hide columns button-Score tab

#Verify the list of column name under Show hide column button- Opportunity tab
#    [Tags]  Regression
#    When Click on main_module_tab
#    When User click Plant Comparison icon
#    then Click on Opportunity tab
#    then User should able to see list of columns in show/hide columns button-Opportunity tab






