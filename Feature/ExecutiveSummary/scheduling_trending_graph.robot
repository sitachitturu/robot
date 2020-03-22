*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ExecutiveSummary/scheduling_trending_graph_step.robot

*** Test Cases ***
Verify the mouse hover on trending icon for scheduling score card
    Given User access "executive-summary" module
    Then User should be able to see information displaying when hover the trending icon

Verify the title of details view page by selecting plant "Scheduling-0010-charlottesville"
    Given User access "executive-summary" module
    And click on plant filter and select plant "0010-charlottesville"
    And click on trending icon in executive summary score card
    Then User should see the trending page and page should display "Scheduling-0010-charlottesville"

Verify page title for trending by selecting 3plants(0010,3018,3071) and page should display "Scheduling - Selected Plants"
    Given User access "executive-summary" module
    And click on plant filter and select plant 0010-charlottesville,3018-pco leonding,3071-csh Hong Kong and click on apply button
    And click on trending icon in executive summary score card
    Then user should navigate to trending page and by page should display "Scheduling-Selected Plants"

Verify tool tip for trending graph
    Given User access "executive-summary" module
    And click on plant filter and select plant "0010-charlottesville"
    And click on trending icon in executive summary score card
    Then User should see tool tip which shows data for reschedule in, reschedule out,cancellations,overdue

Verify Scheduling Accuracy in trending page for scheduling scorecard
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should see %no. in scheduling accuracy view and it should be same as the no. in scheduling score card

Verify default columns on scheduling trending page
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should see following column "Plant Code Plant Short Name" column "Cancel" column "Overdue" column "Schedule In" column "Schedule Out" column "Processed Date" column

Verify Date Range(calendar Days) view with default number
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should be able to see default number in Date Range view in trending page

Verify Export To Excel option on scheduling score card trending page
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User see Excel to Export option on scheduling scorecard trending page

Verify Date filelds on scheduling trending page
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then User should be able to see Date fields (From and To)

Verify Scheduling Accuracy on trending page by selecting plants 0010,3000,3060,
    Given User access "executive-summary" module
    When User selects plants 0010,3000,3060 in trending page
    And click on trending icon in executive summary score card
    Then User should see %no. in scheduling accuracy view and it should be same as the no. in scheduling score card

Verify Scheduling Accuracy on trending page by selecting plants with no data(326d,3273,3333,3361) should display Zero
    Given User access "executive-summary" module
    When User selects plants 326d,3273,3333,3361 in trending page
    And click on trending icon in executive summary score card
    Then User should see %no. in scheduling accuracy view and it should be same as the no. in scheduling score card

Verify Trending Icon in scheduling scorecard for executive summary module
    Given User access "executive-summary" module
    And click on trending icon in executive summary score card
    Then user should navigate to trending page and by default page should display "Scheduling - All Plants"
