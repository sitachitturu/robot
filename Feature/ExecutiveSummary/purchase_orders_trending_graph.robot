*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/purchase_orders_trrending_graph_step.robot

*** Test Cases ***
Verify the title of details view page by selecting plant "0010 - Charlottesville - Purchase Orders"
    Given User access "executive-summary" module
    And click on plant filter and select plant "0010-charlottesville"
    And click on trending icon in executive summary score card
    Then User should see the purchase order trending page and page should display "0010 - Charlottesville - Purchase Orders"

Verify the mouse hover on trending icon for purchase order score card
    Given User access "executive-summary" module
    Then User should be able to see information displaying when hover the trending icon

Verify page title for trending by selecting 3plants(0010,3018,3071) and page should display "Purchase Orders - Selected Plants"
    Given User access "executive-summary" module
    And click on plant filter and select plant 0010-charlottesville,3018-pco leonding,3071-csh Hong Kong and click on apply button
    And click on trending icon in executive summary score card
    Then user should navigate to trending page and by page should display "Purchase Orders - Selected Plants"

Verify tool tip for purchase order trending graph
    Given User access "executive-summary" module
    And click on plant filter and select plant "0010-charlottesville"
    And click on trending icon in executive summary score card
    Then User should see tool tip which shows data for reschedule in, reschedule out,cancellations,overdue

Verify On-Time-Open-PO in trending page for Purchase order scorecard
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should see %no. in On-Time-Open-PO view and it should be same as the no. in purchase order score card

Verify default columns on purchase order trending page
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    And scroll page to location  0  100000
    Then User should see following column "Plant Code Plant Short Name" column "Cancel" column "Overdue" column "Schedule In" column "Schedule Out" column "Processed Date" column

Verify Date Range(calendar Days) view with default number
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should be able to see number in Date Range view in trending page

Verify Export To Excel option on purchase order score card trending page
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User see Excel to Export option on purchase order scorecard trending page

Verify Date filelds on purchase order trending page
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should be able to see Date fields (From and To)
    And User should be able to see number in Date Range view in trending page

Verify On-Time-Open-PO on trending page by selecting plants 0010,3000,3060,
    Given User access "executive-summary" module
    When User selects plants 0010,3000,3060 in trending page
    And click on trending icon in executive summary score card
    Then User should see %no. in On-Time-Open-PO view and it should be same as the no. in purchase order score card

Verify On-Time-Open-PO on trending page by selecting plants with no data(0020,2490) should display Zero
    Given User access "executive-summary" module
    When User selects plants 0020,2490 in trending page
    And click on trending icon in executive summary score card
    Then User should see %no. in On-Time-Open-PO view and it should be same as the no. in purchase order score card

Verify Trending Icon in purchase order scorecard for executive summary module
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then user should navigate to trending page and by default page should display "Purchase Orders - All Plants"

Verify Presets in calander for date range by selecting 1 Month Ago option
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    And click on calander icon and select 1 Month Ago option on presets
    Then User should be able to see number of days in Date Range for 1 Month Ago option

Verify Presets in calander for date range by selecting 2 Months Ago option
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    And click on calander icon and select 2 Month Ago option on presets
    Then User should be able to see number of days in Date Range for 2 Month Ago option

Verify Presets in calander for date range by selecting 3 Months Ago option
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    And click on calander icon and select 3 Months Ago option on presets
    Then User should be able to see number of days in Date Range for 3 Months Ago option

Verify Presets in calander for date range by selecting 6 Months Ago option
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    And click on calander icon and select 6 Months Ago option on presets
    Then User should be able to see number of days in Date Range for 6 Months Ago option

Verify Presets in calander for date range by selecting 1 Year Ago option
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    And click on calander icon and select 1 Year Ago option on presets
    Then User should be able to see number of days in Date Range for 1 Year Ago option

Verify data Available from - to option on purchasing trending page
   Given User access "executive-summary" module
   And click on trending icon in executive summary score card
   Then user should see "Data Available From - To" date option with Icon with exclamation symbol
