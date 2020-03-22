*** Settings ***
Library           Selenium2Library

Resource         ../../StepDefinition/5SeriesLogin/5Series_login_scenarios.robot

*** Test Cases ***

Verify unauthorized 5Series user is redirected when attempted to login
    Given User open welcome page for 5Series User
    When 5Series User provide cridentials for UnAuthorized User
    And 5Series User click Submit button
    Then 5Series User should be redirected to MOS request access



Verify the Authorized 5Series user successfully logs in
    Given User open welcome page for 5Series User
    When 5Series User provide cridentials for Authorized User
    And 5Series User click Submit button
    Then 5Series User should see Material Optimization


Verify the Authorized and Admin 5Series user successfully logs in
    Given User open welcome page for 5Series User
    When 5Series User provide cridentials for Admin-Authorized User
    And 5Series User click Submit button
    Then 5Series User should see Material Optimization
    Then 5Series User should see Admin link under main menu