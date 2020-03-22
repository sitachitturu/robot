7/13/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ReceiptOptamization/receipt_opt_spine_quarter_step.robot

*** Test Cases ***
#Verify "TOTAL OPPORTUNITY" Hover Icon Text
#    Given User access "/secure/receipt-optimization" module
#    When User select Quarter View
#    And Hover over "i" icon next to TOTAL OPPORTUNITY in Spine
#    Then User should see TOTAL OPPORTUNITY pop up message  Total Opportunity represents the sum of open PO amounts that fall within 10 days of the next upcoming critical push date. These PO's have the opportunity to move from the current quarter into the next quarter.
#    Then User should see TOTAL OPPORTUNITY pop up message

Verify "OPPORTUNITIES BY" Hover Icon Text
    Given User access "/secure/receipt-optimization" module
    When User select Quarter View
    And Hover over "i" icon next to OPPORTUNITIES BY
    Then User should see OPPORTUNITIES BY message  Select a method for grouping receipt opportunities by Month & Quarter to gain insights into key actions.
    Then User should see OPPORTUNITIES BY message  By Month, you can see recommended opportunities < 10 days from a critical date to push payment into the next quarter.
#    Then User should see OPPORTUNITIES BY message  By Quarter, you can see the negotiated cash out date thresholds by Vendor.
