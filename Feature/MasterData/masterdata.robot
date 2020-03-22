*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/MasterData/masterdata_step.robot
*** Test Cases ***
Master Data
    When User click Master Data icon
    Then User should see "Master Data"