5/26/2017
212595411
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/MasterData/quantity_step.robot

*** Test Cases ***
Check if quantity in all plants view is alway more or equal than for a view for one plant
    Given User access Master Data module
    And User should see "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed" inconsistency
    And User see should see a Quantity number for this inconsistency
    Then User select plant and should see that quantity for this inconsitency should be lover or equal to quantity for all plants view

#Check if quantity column values should be equal to no. of records in view
#    Given User access Master Data module
#    And get the value in quantity coulmn for inconsiistency And user click on inconsistency "Planned Delivery Time (LT) = 0 for Purchased Materials"
#    And sleep  5s
#    Then user should see number in quantity col. for that insistency should be equal to no. of records in view page