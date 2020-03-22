*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/MasterData/power_max_plants_steps.robot

*** Test Cases ***
Verify master data module with Power max plants which should show only "MMDC16,MMDC36,MMDC11,MMDC17,MMDC45" inconsistencies
    When User click Master Data icon
    And select power max plants one by one from plant filter and hit apply button
    Then user should see selected plants belongs to "MMDC16,MMDC36,MMDC11,MMDC17,MMDC45" inconsistencies with spefied prioritys
