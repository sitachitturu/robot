#DATE:6/9/2017
#Created By: Sita Chitturu
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/master_data_inconsistencies_score_card_step.robot

*** Test Cases ***
Verify purchase requisitions score card on executive summary landing page
    Given User access "/secure/executive-summary" module
    Then User should see "MasterData" score card with "Customer-impacting Inconsistencies" ,"Cost-impacting Inconsistencies","Replenishment Strategy Inconsistencies" fields

Verify Master Data score card Customer Impacting Inconsistencies calculations for default page
    Given User access "/secure/executive-summary" module
    Then User should see right number for Customer-impacting Inconsistencies in Master Data score card

Verify Master Data score card COST Impacting Inconsistencies calculations for default page
    Given User access "/secure/executive-summary" module
    Then User should see right number for COST Impacting Inconsistencies in Master Data score card

Verify Master Data score card Replenishment Strategy Inconsistencies calculations for default page
    Given User access "/secure/executive-summary" module
    Then User should see right number for Replenishment Strategy Inconsistencies in Master Data score card

Verify Master Data score card Customer Impacting Inconsistencies calculations by selecting different plants
    Given User access "/secure/executive-summary" module
    Then User should see right number for Customer-impacting Inconsistencies in Master Data score card by selecting different plants

Verify Master Data score card COST Impacting Inconsistencies calculations by selecting different plants
    Given User access "/secure/executive-summary" module
    Then User should see right number for COST Impacting Inconsistencies in Master Data score card by selecting different plants

Verify Master Data score card Replenishment Strategy Inconsistencies calculations by selecting different plants
    Given User access "/secure/executive-summary" module
    Then User should see right number for Replenishment Strategy Inconsistencies in Master Data score card by selecting different plants

Verify Master Data Score card Customer Impacting Inconsistencies calculations by selecting region fron region filter
     Given User access "/secure/executive-summary" module
     Then User should see right number for Customer-impacting Inconsistencies in Master Data score card by selecting region from region filter

Verify Master Data score card COST Impacting Inconsistencies calculations by selecting region fron region filter
    Given User access "/secure/executive-summary" module
    Then User should see right number for COST Impacting Inconsistencies in Master Data score card by selecting region fron region filter

Verify Master Data score card Replenishment Strategy Inconsistencies calculations by selecting region fron region filter
    Given User access "/secure/executive-summary" module
    Then User should see right number for Replenishment Strategy Inconsistencies in Master Data score card by selecting region fron region filter
