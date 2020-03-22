*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/API/master_data_spine_step.robot

*** Test Cases ***
Master Data
    When User click Master Data icon
    Then User should see "Master Data"

Verify Today Value on the spine for master data module
    When User click Master Data icon
    Then User should see Today(consistencies) text with right numbers(total sum of quantity) on the spine

##Verify Grid Sum With Spine Values for Each Inconsistency
##    When User click Master Data icon
##    Then Priority 1 Change-Day-over-Day Column Sum Should Match Corresponding Spine Value
##    Then Priority 2 Change-Day-over-Day Column Sum Should Match Corresponding Spine Value
##    Then Priority 3 Change-Day-over-Day Column Sum Should Match Corresponding Spine Value
##    Then Change-Day-over-Day Column Sum Should Match Total Spine Value

Verify master_data spine Cost/Inventory-impacting,customer-impacting,Data Consistency value in api with ui
   Then compare Cost/Inventory-impacting,customer-impacting,Data Consistency value in spine in ui with api


