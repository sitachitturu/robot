*** Settings ***
Library           Selenium2Library
Resource          ../../StepDefinition/CommonFeatures/logout_steps.robot
Test Teardown     Close All Browsers
Suite Teardown     Close All Browsers

*** Test Cases ***
User log out
   Then User should be able to log out