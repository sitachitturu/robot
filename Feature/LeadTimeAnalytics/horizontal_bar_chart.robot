5/25/2017
212595411
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/LeadTimeAnalytics/horizontal_bar_chart_step.robot

*** Test Cases ***
#Scenario: LTA : US123889: LTA : Display the Lead Time -Horizontal Bar Chart-Dynamic feature
#    Given User access Lead Time Analitics module
#    When User click in on LT Difference graph for Source Vendor
#    And data will load in a grid
#    Then User should see correct data for this source vendor