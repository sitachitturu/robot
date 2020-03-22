*** Settings ***
Library           Selenium2Library
Resource          ../../StepDefinition/CommonFeatures/login_steps.robot

*** Test Cases ***
In order to log in User have to provide correct cridentials
    Given User open welcome page
    When User provide cridentials
    And User click Submit button
    #Then User should see Material Optimization


In order to do activities in module user need to set user profile or click on not now option
    When User should see prompt saying "Action Required"
    Then User should click "Not Now" option