5/25/2017
212595411
new scripts added by 212590906 #date:6/12/2017
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/LeadTimeAnalytics/spine_lead_time_steps.robot
*** Test Cases ***
Scenario: US123838 LTA :Display the Lead Time -Spine
        Given User access Lead Time Analytics module
        Then User should see Lead Time -Spine
        And User should see "TOTAL OPPORTUNITY"
        And User should see "ACTUAL LT"
        And User should see "SYSTEM LT"
        And User should see "TOTAL DAILY OPPORTUNITY"
        And User should see "TOTAL DAILY FULFILLMENT RISK"
        #And User should see "TOTAL FULFILLMENT RISK"
        And User should see "+AVERAGE DAYS PUSH"
        And User should see "-AVERAGE DAYS PUSH"
        And User should see "ORIG. PO Lt"

Validation data for "total_opportunity" in spine with data base for "<=5" and "-5"
        #Given User access Lead Time Analytics module
        Then validate and comapre value for "Total Opportunity" in spine with data base query for "<=5" "and" ">=-5"

Validation data for "Total Fullfillment Risk" in spine with data base for "<=5" and "-5"
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Fullfillment Risk" in spine with data base query for "<=5" "and" ">=-5"

Validation data for "Total Daily Oppertunity" in spine with data base for "<=5" and "-5"
       # Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Oppertunity" in spine with data base query for "<=5" "and" ">=-5"

Validation data for "Total Daily Fulfillment Risk" in spine with data base for "<=5" and "-5"
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for "<=5" "and" ">=-5"

Validate Actual Lt value in spine and as well as with database for "<=5" and "-5"
       #Given User access Lead Time Analytics module
       Then validate and compare value for "Actual Lt" in spine with data base query for "<=5" "and" ">=-5"

Validate System Lt Value in spine and as well as database for "<=5" and "-5"
       #Given User access Lead Time Analytics module
       Then validate and compare value for "System Lt" in spine with data base query for "<=5" "and" ">=-5"

Validate PO LT value in spine with database for "<=5" and "-5"
      Then verify spine value for PO LT with data base and compare both ui with database for "<=5" "and" ">=-5"
####======================================================================================================================================================================================================
#
Select less tahn +/- 12 days from dropdown
      #Given User access Lead Time Analytics module
       When user see +/-5 days dropdown and click that dropdown and user should select +/- 12 days from dropdown

Validation data for "total_opportunity" in spine with data base for "<=12" "or" "-12"
        #Given User access Lead Time Analytics module
        Then validate and comapre value for "Total Opportunity" in spine with data base query for ">12" "or" "<-12"

Validation data for "Total Fullfillment Risk" in spine with data base for ">12" "or" "<-12"
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Fullfillment Risk" in spine with data base query for ">12" "or" "<-12"

Validation data for "Total Daily Oppertunity" in spine with data base for ">12" "or" "<-12"
       # Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Oppertunity" in spine with data base query for ">12" "or" "<-12"

Validation data for "Total Daily Fulfillment Risk" in spine with data base for ">12" "or" "<-12"
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for ">12" "or" "<-12"

Validate Actual Lt value in spine and as well as with database for ">12" "or" "<-12"
       #Given User access Lead Time Analytics module
       Then validate and compare value for "Actual Lt" in spine with data base query for ">12" "or" "<-12"

Validate System Lt Value in spine and as well as database for ">12" "or" "<-12"
       #Given User access Lead Time Analytics module
        Then validate and compare value for "System Lt" in spine with data base query for ">12" "or" "<-12"

Validate PO LT value in spine with database for ">12" "or" "<-12"
        Then verify spine value for PO LT with data base and compare both ui with database for ">12" "or" "<-12"

##========================================================================================================================================================
Select ALL from dropdown
       #Given User access Lead Time Analytics module
       When user see +/-5 days dropdown and click that dropdown and user should select All from dropdown

Validation data for "total_opportunity" in spine with data base for All
        #Given User access Lead Time Analytics module
        Then validate and comapre value for "Total Opportunity" in spine with data base query for All

Validation data for "Total Fullfillment Risk" in spine with data base for All
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Fullfillment Risk" in spine with data base query for All

Validation data for "Total Daily Oppertunity" in spine with data base for All
       # Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Oppertunity" in spine with data base query for All

Validation data for "Total Daily Fulfillment Risk" in spine with data base for All
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for All

Validate Actual Lt value in spine and as well as with database for All
       #Given User access Lead Time Analytics module
       Then validate and compare value for "Actual Lt" in spine with data base query for All

Validate System Lt Value in spine and as well as database for All
       #Given User access Lead Time Analytics module
        Then validate and compare value for "System Lt" in spine with data base query for All

Validate PO LT value in spine with database for All
        Then verify spine value for PO LT with data base and compare both ui with database for All

##========================================================================================================================================================================
Select open po placement from reducrtion opportunity dropdown
        Given User access Lead Time Analytics module
        When user click on ltreduction opportunity dropdown user should be able to select open po placement from dropdown

Validation data for "total_opportunity" in spine with data base for "<=5" and "-5" for open po placement
        #Given User access Lead Time Analytics module
        Then validate and comapre value for "Total Opportunity" in spine with data base query for "<=5" "and" ">=-5" for open po placement

Validation data for "Total Fullfillment Risk" in spine with data base for "<=5" and "-5" for open po placement
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Fullfillment Risk" in spine with data base query for "<=5" "and" ">=-5" for open po placement

Validation data for "Total Daily Oppertunity" in spine with data base for "<=5" and "-5" for open po placement
       # Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Oppertunity" in spine with data base query for "<=5" "and" ">=-5" for open po placement

Validation data for "Total Daily Fulfillment Risk" in spine with data base for "<=5" and "-5" for open po placement
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for "<=5" "and" ">=-5" for open po placement

Validate Actual Lt value in spine and as well as with database for "<=5" and "-5" for open po placement
       #Given User access Lead Time Analytics module
       Then validate and compare value for "Actual Lt" in spine with data base query for "<=5" "and" ">=-5" for open po placement

Validate System Lt Value in spine and as well as database for "<=5" and "-5" for open po placement
       #Given User access Lead Time Analytics module
       Then validate and compare value for "System Lt" in spine with data base query for "<=5" "and" ">=-5" for open po placement

Validate PO LT value in spine with database for "<=5" and "-5" for open po placement
      Then verify spine value for PO LT with data base and compare both ui with database for "<=5" "and" ">=-5" for open po placement
#
####=================================================================================================================================================
Select less tahn +/- 12 days from dropdown for open po placement
       #Given User access Lead Time Analytics module
       When user see +/-5 days dropdown and click that dropdown and user should select +/- 12 days from dropdown

Validation data for "total_opportunity" in spine with data base for "<=12" "or" "-12" for open po placement
        #Given User access Lead Time Analytics module
        Then validate and comapre value for "Total Opportunity" in spine with data base query for ">12" "or" "<-12" for open po placement

Validation data for "Total Fullfillment Risk" in spine with data base for ">12" "or" "<-12" for open po placement
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Fullfillment Risk" in spine with data base query for ">12" "or" "<-12" for open po placement

Validation data for "Total Daily Oppertunity" in spine with data base for ">12" "or" "<-12" for open po placement
       # Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Oppertunity" in spine with data base query for ">12" "or" "<-12" for open po placement

Validation data for "Total Daily Fulfillment Risk" in spine with data base for ">12" "or" "<-12" for open po placement
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for ">12" "or" "<-12" for open po placement

Validate Actual Lt value in spine and as well as with database for ">12" "or" "<-12" for open po placement
       #Given User access Lead Time Analytics module
       Then validate and compare value for "Actual Lt" in spine with data base query for ">12" "or" "<-12" for open po placement

Validate System Lt Value in spine and as well as database for ">12" "or" "<-12" for open po placement
       #Given User access Lead Time Analytics module
        Then validate and compare value for "System Lt" in spine with data base query for ">12" "or" "<-12" for open po placement

Validate PO LT value in spine with database for ">12" "or" "<-12" for open po placement
        Then verify spine value for PO LT with data base and compare both ui with database for ">12" "or" "<-12" for open po placement

#####==================================================================================================================================================
Select ALL from dropdown
       #Given User access Lead Time Analytics module
       #And user click on ltreduction opportunity dropdown user should be able to select open po placement from dropdown
       When user see +/-5 days dropdown and click that dropdown and user should select All from dropdown

Validation data for "total_opportunity" in spine with data base for All for open po placement
        #Given User access Lead Time Analytics module
        Then validate and comapre value for "Total Opportunity" in spine with data base query for All for open po placement

Validation data for "Total Fullfillment Risk" in spine with data base for All for open po placement
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Fullfillment Risk" in spine with data base query for All for open po placement

Validation data for "Total Daily Oppertunity" in spine with data base for All for open po placement
       # Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Oppertunity" in spine with data base query for All for open po placement

Validation data for "Total Daily Fulfillment Risk" in spine with data base for All for open po placement
        #Given User access Lead Time Analytics module
        Then validate and compare value for "Total Daily Fulfillment Risk" in spine with data base query for All for open po placement

Validate Actual Lt value in spine and as well as with database for All for open po placement
       #Given User access Lead Time Analytics module
       Then validate and compare value for "Actual Lt" in spine with data base query for All for open po placement

Validate System Lt Value in spine and as well as database for All for open po placement
       #Given User access Lead Time Analytics module
        Then validate and compare value for "System Lt" in spine with data base query for All for open po placement

Validate PO LT value in spine with database for All for open po placement
        Then verify spine value for PO LT with data base and compare both ui with database for All for open po placement
##=====================================================================================================================================================================================================================================