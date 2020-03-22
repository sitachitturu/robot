*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/purchase_orders_scorecard_step.robot

*** Test Cases ***
Verify purchase orders score card on executive summary landing page
    Given User access "/secure/executive-summary" module
    Then User should see "Purchase Orders" score card with "Purchase Orders" title,"Accuracy rate","Short Cycle","Cancellations","Reschedule In","Reschedule Out", "Overdue" on it

Verify Accuracy Rate in purchase orders score card for default page
    Given User should see Executive Summary
    And User should see Accuracy Rate value
    And User access Purchase Orders module
    And User gets Total Count
    And User gets Overdue Count
    And User gets Short Cycle Count
    And User gets Total value
    And User gets Cancellation value
    And User gets Reschedule in value
    And User gets Reschedule out value
    Then User should see correct value for Accuracy Rate in Purchase Orders score card

Verify "Short Cycle" value,"Cancellations" value,"Reschedule In" value,"Reschedule Out" value, "Overdue" value in purchase orders score card for default page
    Given User access "/secure/executive-summary" module
    And User should see correct value for Cancellations in purchase orders score card
    And User should see correct value for Reschedule In in purchase orders score card
    And User should see correct value for Reschedule Out in purchase orders score card
    And User should see correct value for Overdue in purchase orders score card
    And User should see correct value for Short Cycle in purchase orders score card

