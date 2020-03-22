8/15/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/filter_set_steps.robot

*** Test Cases ***
Check "Apply/Create Filter Set" on Executive Summary module
    Given User access "/secure/executive-summary" module
    And User should see "Apply/Create Filter Set" button
    When User click at "Apply/Create Filter Set"
    Then User should see "Clear All Filters","Save Current Filter Selections","Cancel" and "Save" buttons
    And User click Cancel to hide pop-up

Verify Update Option in Apply/create filter set in Executive Summary module
    Then Verify Update Option

Verify Edit Option in Apply/create filter set in Executive Summary module
    Then Edit filter set title and observe udpated title

Verify default Option in Apply/create filter set in Executive Summary module
    Then User Verify Default Filterset "/secure/executive-summary"

Verify cancel button in Apply/create filter set in Executive Summary module (negative test)
    And Verify cancel button

Delete All Bookmarks
    Then Delete All Bookmarks  /secure/executive-summary