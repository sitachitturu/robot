*** Settings ***
Library           Selenium2Library
Library           OperatingSystem
Resource         ../../StepDefinition/CycleCounting/cycle_counting_step.robot
Resource         ../../StepDefinition/CommonFeatures/database_step.robot
Resource         ../../StepDefinition/CommonFeatures/login_steps.robot

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***
Cycle Counting Smoke Test
    When Click on main_module_tab
    When User click Cycle Counting icon
    Then User should see "Cycle Counting"

Verify static labels
    [Tags]  Regression
    When User click Cycle Counting icon
    Then User should see all static labels  Material Optimization  2018 General Electric  Cycle Counting

Validate contents under the Cycle Counting tab
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should see following option under "Cycle Counting" tab  ${Cycle_counting_Accuracy}
    then User should see following option under "Cycle Counting" tab  ${Cycle_counting_Barchart}
    then User should see following option under "Cycle Counting" tab  ${Cycle_counting_showhide_button}

Validate the default business filter under Cycle counting
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should see following business filter  ${Plant filter}
    then User should see following business filter  ${date_filter_from}
    then User should see following business filter  ${date_filter_to}

Validate UI grid data for plant under cycle counting
    [Tags]  Regression
    When User click Cycle Counting icon
    When User click plant filter
    And User click a value in plant filter  2490 - GE Wind France SAS - St. Nazaire
    And User click apply for plant filter
    Then Verify the selected plant from grid from UI  GE Wind France SAS - St. Nazaire

Verify the from and to fields under date filter
    [Tags]  Regression
    When User click Cycle Counting icon
    Then Verify the from and to fields under date filter

Validate Accuracy and On time tabs under Cycle
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should see following business filter  ${Accuracy_tab}
    then User should see following business filter  ${On_time_tab}

Verify the bar graphs under 'Accuracy' tab
    When User click Cycle Counting icon
    then User should be able to view the gaph by Plant code
    then User should be able to view the gaph by Rolling

Validate the functionality for Edit Filter button
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should be able to click on Edit Filter button
    then User should be able to see other filter options  plant
    then User should be able to see other filter options  count_date
    then User should be able to see other filter options  pcat
    then User should be able to see other filter options  region
    then click "Continue"

Validate the functionality for cancel button
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then click "Cancel" button
    then User should see the default business filter under Cycle Counting page

Validate all business filter in the Cycle Counting page
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then click "Continue"
    then User should see all business filter under Cycle Counting page

Verify the business filter - Plant
    [Tags]  Regression
    When User click Cycle Counting icon
    And User should click on Plant name
    then Verify apply button in plant  plant
    then Verify show selected in plant  plant


Verify the business filter - Plant Category
    [Tags]  Regression
    When User click Cycle Counting icon
    And User should be able to click on Edit Filter button
    And Select plant filters  pcat
    then click "Continue"
    then User should click on Plant category
    then Verify apply button in plant  pcat
    then Verify show selected in plant  pcat

Verify the business filter - Plant region
    [Tags]  Regression
    When User click Cycle Counting icon
    And User should be able to click on Edit Filter button
    And Select plant filters  region
    then click "Continue"
    then User should click on Plant region
    then Verify apply button in plant  region
    then Verify show selected in plant  region

Verify the business filter -Date filter
    [Tags]  Regression
    When User click Cycle Counting icon
    then User should able to click on options  ${Icon_date_filter_from}
    then Verify all contents under date filter
    then Click on Cancel button under date picker
    then User should able to click on options  ${Icon_date_filter_to}
    then Verify all contents under date filter

Verify the bar chart title under 'Accuracy' tab
    When User click Cycle Counting icon
    then User should see the title under current page  Cycle Count On-Time by Plant code
    then User should see the title under current page  Cycle Count Accuracy by Rolling 30 Days

Verify the bar chart title under 'On Time' tab
    [Tags]  Regression
    When User click Cycle Counting icon
    then User click on 'On-Time' tab
    then User should see the title under current page  Cycle Count On-Time by Plant code
    then User should see the title under current page  Count of Bins by ABCD and Aging Weeks

