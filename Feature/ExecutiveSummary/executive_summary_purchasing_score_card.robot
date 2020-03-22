*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/executive_summary_purchasing_score_card_step.robot

*** Test Cases ***
Verify purchase requisitions score card on executive summary landing page
    Given User access "/secure/executive-summary" module
    Then User should see "purchase Requisitions" score card with "Purchase Requisitions" title,"On-time PR","NO Source","Avg OVD Days" on it

Verify On-time PR in purchase requisitions score card for default page
    Given User access "/secure/executive-summary" module
    Then User should see right number for On-Time PR in purchase requisitions score card

Verify No-Source in purchase requisitions score card for default page
    Given User access "/secure/executive-summary" module
    Then User should see right number for No Source in purchase requisitions score card

Verify AVG OVD days purchase requisitions score card for default page
    Given User access "/secure/executive-summary" module
    Then User should see right number for AVG OVD in purchase requisitions score card

verify AVG OVD days purchase requisitions score card for default page by selecting business by business in database with ui
   Then select one by one business from plant business filter then the number in Avg Ovd days in PR score card should match to the PR query in db