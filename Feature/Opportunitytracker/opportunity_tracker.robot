*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/Opportunitytracker/opportunity_tracker_step.robot
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser



*** Test Cases ***

Opportunity tracker Smoke Test
    When User click Opportunity tracker icon
    Then User should see "Opportunity tracker"

Verify static labels
    [Tags]  Regression
    When User click Opportunity tracker icon
    Then User should see all static labels  Material Optimization  2017 General Electric  Opportunity Tracker
#
Validate the default business filter under Opportunity
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should see following business filter  ${Plant filter}
    then User should see following business filter  ${Sub_Business_filter}
    then User should see following business filter  ${Plant_Business_filter}


Validate the functionality for Edit Filter button
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    then User should be able to see other filter options  business
    then User should be able to see other filter options  plant
    then User should be able to see other filter options  plant_sub_business
    then User should be able to see other filter options  region
    then User should be able to see other filter options  pcat
    then User should be able to see other filter options  module
    then click "Continue"
#

Validate the functionality for cancel button
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then Select plant filters  module
    then click "Cancel" button


Validate all business filter in the Opportunity tracker
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then Select plant filters  module
    then click "Continue"
    then User should see all business filter under Opportunity tracker


Verify the business filter - Plant Category
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    And Select plant filters  pcat
    then click "Continue"
    then User should click on Plant category
    then Verify apply button in plant  pcat
    then Verify show selected in plant  pcat

Verify the business filter - Plant region
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    And Select plant filters  region
    then click "Continue"
    then User should click on Plant region
    then Verify apply button in plant  region
    then Verify show selected in plant  region

Verify the business filter - Modules
    [Tags]  Regression
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    And Select plant filters  module
    then click "Continue"
    then User should click on Mudules filter
    then Verify apply button in plant  module
    then Verify show selected in plant  module

Verify the functionality for Clear filter button
    When User click Opportunity tracker icon
    then User should be able to click on Edit Filter button
    then Select plant filters  pcat
    then Select plant filters  region
    then Select plant filters  module
    then click "Continue"
    then User should see all business filter under Opportunity tracker
    Then User should be able to click on Clear Filter button
    Then User should see only default business filter

Verify the presence of Export to excel button
    When User click Opportunity tracker icon
    then User should be able to view the export to excel button

