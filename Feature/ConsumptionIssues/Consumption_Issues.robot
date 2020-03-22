*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ConsumptionIssues/consumption_issues_step.robot
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***

Consumption Issues Smoke Test
    When Click on main_module_tab
    When User click Consumption issues icon
    Then User should see "Consumption Issues"

Verify static labels
    [Tags]  Regression
    When User click Consumption issues icon
    Then User should see all static labels  Material Optimization  © 2018 General Electric  Consumption Issues

Validate contents under the Consumption Issues tab
    [Tags]  Regression
    When User click Consumption issues icon
    then User should see following option under "Consumption Issues" tab  ${Tab_Consumption_Issues}
    then User should see following option under "Consumption Issues" tab  ${Tab_COGI}
    then User should see following option under "Consumption Issues" tab  ${Tab_Count_Consumption_Issues}
    then User should see following option under "Consumption Issues" tab  ${Tab_Value_Consumption_Issues}

Validate the default business filter under Consumption Issues
    [Tags]  Regression
    When User click Consumption issues icon
    then User should see following business filter  ${Plant filter}

Validate the functionality for Edit Filter button
#    [Tags]  Regression
    When User click Consumption issues icon
    then User should be able to click on Edit Filter button
    then User should be able to see other filter options  mrpc
    then User should be able to see other filter options  plant
    then User should be able to see other filter options  pcat
    then User should be able to see other filter options  region
    then User should be able to see other filter options  profit_center
    then User should be able to see other filter options  business
    then User should be able to see other filter options  sub_business
    then User should be able to see other filter options  psms
    then click "Continue"

Validate UI grid data for plant under cycle counting
    [Tags]  Regression
    When User click Consumption issues icon
    When User click plant filter
    And User click a value in plant filter  3145 - AHT Villeurbanne
    And User click apply for plant filter
    Then Verify the selected plant from grid from UI  3145 - AHT Villeurbanne

Validate the functionality for cancel button
    [Tags]  Regression
    When User click Consumption issues icon
    then User should be able to click on Edit Filter button
    then Select plant filters  mrpc
    then Select plant filters  pcat
    then Select plant filters  region
    then Select plant filters  business
    then Select plant filters  profit_center
    then User should be able to see other filter options  sub_business
    then User should be able to see other filter options  psms
    then click "Cancel" button
    then User should see the default business filter under Consumption Issues page

Validate all business filter in the Cycle Counting page
    [Tags]  Regression
    When User click Consumption issues icon
    then User should be able to click on Edit Filter button
    then Select plant filters  mrpc
    then Select plant filters  pcat
    then Select plant filters  region
    then Select plant filters  business
    then Select plant filters  profit_center
    then User should be able to see other filter options  sub_business
    then User should be able to see other filter options  psms
    then click "Continue"
    then User should see all business filter under Consumption Issues page


Verify the business filter - Plant
    [Tags]  Regression
    When User click Consumption issues icon
    And User should able to click on options  ${Plant_Filter}
    then Verify apply button in plant  plant
    then Verify show selected in plant  plant

Verify the business filter - Plant MRP
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  mrpc
    then click "Continue"
    then User should able to click on options  ${Planner_MRP_Filter}
    then Verify apply button in plant  mrpc
    then Verify show selected in plant  mrpc

Verify the business filter - Plant Category
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  pcat
    then click "Continue"
    then User should able to click on options  ${Plant_Category_Filter}
    then Verify apply button in plant  pcat
    then Verify show selected in plant  pcat

Verify the business filter - Plant region
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  region
    then click "Continue"
    then User should able to click on options  ${Plant_Region_Filter}
    then Verify apply button in plant  region
    then Verify show selected in plant  region

Verify the business filter - Plant Business
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  business
    then click "Continue"
    then User should able to click on options  ${Plant_Business_Filter}
    then Verify apply button in plant  business
    then Verify show selected in plant  business

Verify the business filter - Plant Sub-business
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  sub_business
    then click "Continue"
    then User should able to click on options  ${Plant_Sub_business}
    then Verify apply button in plant  sub_business
    then Verify show selected in plant  sub_business

Verify the business filter - Profit_centre
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  profit_center
    then click "Continue"
    then User should able to click on options  ${Plant_Profit_Center_Filter}
    then Verify apply button in plant  profit_center
    then Verify show selected in plant  profit_center

Verify the business filter - Plant spl material status
    [Tags]  Regression
    When User click Consumption issues icon
    And User should be able to click on Edit Filter button
    And Select plant filters  psms
    then click "Continue"
    then User should able to click on options  ${Plant_spl_material_status}
    then Verify apply button in plant  psms
    then Verify show selected in plant  psms

Verify the presence of Consumption issues and COGI/Hold tabs
    When User click Consumption issues icon
    Then Validate the Consumption issues and COGI/Hold tabs

Verify the presence of tabs Count and Value under Consumption issues tab
    When User click Consumption issues icon
    Then User should able to click on options  ${Tab_Consumption_Issues}
    Then Validate the tabs count and Value under Consumption Issues tab

Verify the presence of tabs Count and Value under COGI/Hold tab
    When User click Consumption issues icon
    Then User should able to click on options  ${Tab_COGI}
    Then Validate the tabs count and Value under COGI/Hold tab

Verify the "Export to Excel" button present under Consumption issues tab
    When User click Consumption issues icon
    Then User should able to click on options  ${Tab_Consumption_Issues}
    then Verify the "Export to Excel" button under tab  ${Export_Excel_Button_Consumption_issues}

Verify the "Export to Excel" button present under COGI tab
    When User click Consumption issues icon
    #Then User should able to click on options  ${Tab_COGI}
    then Verify the "Export to Excel" button under tab  ${Export_Excel_Button_COGI}