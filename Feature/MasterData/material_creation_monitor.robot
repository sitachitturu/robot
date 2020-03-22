*** Settings ***
Resource         ../../StepDefinition/Common/database_step.robot
Resource         ../../StepDefinition/Common/login_steps.robot
Resource         ../../StepDefinition/MasterData/masterdata_step.robot
Resource         ../../StepDefinition/MasterData/material_creation_monitor_steps.robot

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***
Verify material creation navigation
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then User should see material creation monitor

Verify plant sp matl statuses
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then User should see proper plant sp matl statuses

Verify inconsistencies types
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then User should see proper inconsistencies

Verify column names
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then User should see proper columns for plant sp matl status
    And User should see proper columns for inconsistencies

Verify grid for plant sp matl status
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Click random view in plant sp matl status and verify grid

Verify grid for inconsistency type
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Click random view in inconsistency type and verify grid

Verify spine labels
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then User should see proper labels in spine

Verify Edit filters labels
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    When User click on edit filter
    Then User should see proper option labels in edit filters
    And User click on edit filter cancel

#Yet to complete
#Verify details grid columns for Plant spl Matl Status
#    [Tags]  R
#    When User click master data icon
#    And User click on mcm button
#    And Click on view button in plant spl matl status
#    Then Click show hide button
    #And Verify the show hide list labels

Verify Overdue values in spine
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Validate Over due count

Verify Due Today count in spine
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Validate Due today count

Verify Due Current Week value in spine
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Validate Due current week count

Verify Due seven days value in spine
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Validate Due seven days count

Verify if material type filter is applied
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    When User click on edit filter
    Then Check if filter got applied

Validate descriptions for material status
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    Then Verify material status description

Validate descriptions for material type
    [Tags]  Regression
    When User click master data icon
    And User click on mcm button
    When User click on edit filter
    And Click material type filter
    And Click filter continue button
    Then Click material type dropdown
    Then Verify material type descriptions