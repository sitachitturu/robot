*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/LeadTimeAnalytics/filters_lead_time_analytics_step.robot

*** Test Cases ***
Check Filters on Lead Time Analytics
    Given User access "/secure/lead-time-analytics" module
    Then User should see "Plant" filter
    And click "Edit Filter(s)"
    When User check check box with "Plant Category" name
    When User check check box with "Plant Business" name
    When User check check box with "Plant Region" name
    #When User check check box with "Source/Vendor" name
    When User check check box with "Sub Business" name

    And click "Continue"
    Then User should be able to see Plant Business Filter
    Then User should be able to see Plan Category Filter
    Then User should be able to see Plant Region Filter
    Then User should be able to see sub_business Filter
    Then Count sums of all filters should equal the sum of records for corresponding plant



Verify newly added feature "Clear filter" option
    Given User access "/secure/lead-time-analytics" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    ##Given User access "/secure/lead-time-analytics" module
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify Lead Time analytics module: "plant","Source/Vendor","Material Sku" and Outliers filters should be as default filters
   ##Given User access "/secure/lead-time-analytics" module
   Then User should see default filters "plant","Source/Vendor","Material Sku" and Outliers" and with restricted icon
   And verify the performance of restricted icon by selecting plant and data from other filters
   And select col on heatmap and verify filters whether except source/vendor the other filters are restricted or not

