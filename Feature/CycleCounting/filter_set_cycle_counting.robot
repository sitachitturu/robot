8/15/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/filter_set_steps.robot
*** Test Cases ***
Check "Apply/Create Filter Set" on Cycle Counting module
    Given User access "/secure/cycle-counting" module
    And User should see "Apply/Create Filter Set" button
    When User click at "Apply/Create Filter Set"
    Then User should see "Clear All Filters","Save Current Filter Selections","Cancel" and "Save" buttons
    And User click Cancel to hide pop-up

Verify Update Option in Apply/create filter set in Cycle Counting module
    Then Verify Update Option

Verify Edit Option in Apply/create filter set in Cycle Counting module
    Then Edit filter set title and observe udpated title

Verify default Option in Apply/create filter set in Cycle Counting module
    Then User Verify Default Filterset "/secure/cycle-counting"

Verify cancel button in Apply/create filter set in Cycle Counting module (negative test)
    And Verify cancel button

Delete All Bookmarks
    Then Delete All Bookmarks  /secure/cycle-counting

Verify newly added feature "Clear filter" option
    Given User access "/secure/cycle-counting" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    Given User access "/secure/cycle-counting" module
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set
