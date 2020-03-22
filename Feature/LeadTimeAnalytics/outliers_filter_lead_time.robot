*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/LeadTimeAnalytics/outliers_filter_lead_time_step.robot

*** Test Cases ***
Scenario: Display the Lead Time -Outliers as default filter
        Given User access Lead Time Analytics module
        Then User should see "Outliers" filter on landing page of lead time analytics module
        And User should see restriced outlier filter in lead_time_analytics landing page

Verify Total Daily Opportunity,fullfillment risk,Total Opportunity,Total Daily Opportunity,system lt and actual lt in spine and grid by selecting "Significant Outlier" from outlier filter
        When user select "Significant outlier" from outlier filter and should see correct numbers for Total Daily opportunity in spine
        And user select outlier col from show/hide col
        Then user should see data showing "Significant Outlier" in outlier column

Verify Total Fullfillment Risk in spine and grid by selecting "Significant Outlier" from outlier filter
        When user select "Significant outlier" from outlier filter and should see correct numbers for Total Fullfillment Risk in spine

Verify Total Opportunity in spine and grid by selecting "Significant Outlier" from outlier filter
        And select "Significant outlier" from outlier filter and User should see correct numbers for Total Opportunity in spine

Verify Total Daily Fullfillment Risk in spine in spine and grid by selecting "Significant Outlier" from outlier filter
        When select "Significant outlier" from outlier filter and User should see correct numbers for Total Daily Fullfillment Risk in spine

Verify System LT in spine in spine and grid by selecting "Significant Outlier" from outlier filter
        When user select "Significant outlier" from outlier filter And User should see correct numbers for System Lt in spine

Verify Actual LT in spine in spine and grid by selecting "Significant Outlier" from outlier filter
        When user select "Significant outlier" from outlier filter And User should see correct numbers for Actual Lt in spine

####\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Verify Total Daily Opportunity in spine and grid by selecting "Within 1 Std Deviation" from outlier filter
        Given User access Lead Time Analytics module
        When user select "Within 1 Std Deviation" from outlier filter and user should see correct numbers for Total Daily opportunity in spine
        And user select outlier col from show/hide col
        Then user should see data showing "Within 1 Std Deviation" in outlier column

Verify Total Fullfillment Risk in spine and grid by selecting "Within 1 Std Deviation" from outlier filter
        When user select "Within 1 Std Deviation" from outlier filter and user should see correct numbers for Total Fullfillment Risk in spine for "Within 1 Std Deviation"

Verify Total Opportunity in spine and grid by selecting "Within 1 Std Deviation" from outlier filter
        When user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for Total Opportunity in spine for "Within 1 Std Deviation"

Verify Total Daily Fullfillment Risk in spine in spine and grid by selecting "Within 1 Std Deviation" from outlier filter
        When user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for Total Daily Fullfillment Risk in spine for "Within 1 Std Deviation"

Verify System LT in spine in spine and grid by selecting "Within 1 Std Deviation" from outlier filter
        When user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for System Lt in spine for "Within 1 Std Deviation"

Verify Actual LT in spine in spine and grid by selecting "Within 1 Std Deviation" from outlier filter
        When user select "Within 1 Std Deviation" from outlier filter and User should see correct numbers for Actual Lt in spine for "Within 1 Std Deviation"
#
######//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Verify Total Daily Opportunity in spine and grid by selecting "Within 2 Std Deviation" from outlier filter
        Given User access Lead Time Analytics module
        When user select "Within 2 Std Deviation" from outlier filter and user should see correct numbers for Total Daily opportunity in spine for "Within 2 Std Deviation"
        And user select outlier col from show/hide col
        Then user should see data showing "Within 2 Std Deviation" in outlier column

Verify Total Fullfillment Risk in spine and grid by selecting "Within 2 Std Deviation" from outlier filter
        When user select "Within 2 Std Deviation" from outlier filter and user should see correct numbers for Total Fullfillment Risk in spine for "Within 2 Std Deviation"

Verify Total Opportunity in spine and grid by selecting "Within 2 Std Deviation" from outlier filter
        When user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for Total Opportunity in spine for "Within 2 Std Deviation"

Verify Total Daily Fullfillment Risk in spine in spine and grid by selecting "Within 2 Std Deviation" from outlier filter
        When user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for Total Daily Fullfillment Risk in spine for "Within 2 Std Deviation"

Verify System LT in spine in spine and grid by selecting "Within 2 Std Deviation" from outlier filter
        When user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for System Lt in spine for "Within 2 Std Deviation"

Verify Actual LT in spine in spine and grid by selecting "Within 2 Std Deviation" from outlier filter
        When user select "Within 2 Std Deviation" from outlier filter and User should see correct numbers for Actual Lt in spine for "Within 2 Std Deviation"

Verify data Grid lables by selecting newly added columns
       Given User access Lead Time Analytics module
       And user select newly added col from show/hide col
       Then User should see "Actual LT" col "Actual LT Avg" col "Actual LT Std Dev" col "Actual LT +1 Std Dev" col "Actual LT -1 Std Dev" col " col "Actual LT +2 Std Dev" col "Actual LT -2 Std Dev" col "Outlier" col
