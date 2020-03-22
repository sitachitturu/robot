8/15/2017
212613237
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/CommonFeatures/filter_set_steps.robot

*** Test Cases ***
Check "Apply/Create Filter Set" on Purchase Orders module
    Given User access "/secure/purchase-orders" module
    And User should see "Apply/Create Filter Set" button
    When User click at "Apply/Create Filter Set"
    Then User should see "Clear All Filters","Save Current Filter Selections","Cancel" and "Save" buttons
    And User click Cancel to hide pop-up

Verify Update Option in Apply/create filter set in Purchase Orders module
    Then Verify Update Option

Verify Edit Option in Apply/create filter set in Purchase Orders module
    Then Edit filter set title and observe udpated title

Verify default Option in Apply/create filter set in Purchase Orders module
    Then User Verify Default Filterset "/secure/purchase-orders"

Verify cancel button in Apply/create filter set in Purchase Orders module (negative test)
    And Verify cancel button

Delete All Bookmarks
    Then Delete All Bookmarks  /secure/purchase-orders