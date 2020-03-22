*** Settings ***
Library           Selenium2Library
Resource          ../../StepDefinition/CommonFeatures/login_user2_step.robot
*** Test Cases ***
In order to log in User have to provide correct cridentials
    Given User open welcome page
    When User provide cridentials
    And User click Submit button
    Then User should see Material Optimization