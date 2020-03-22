*** Settings ***
Library           Selenium2Library
Resource  ../../StepDefinition/Admin/lta_opportunities_steps.robot
Resource  ../../StepDefinition/LeadTimeAnalytics/filter_set_steps.robot

*** Test Cases ***

Verify Lead Time Reccomendations under Admin
      Given User access "/secure/lead-time-details" module
      Then User should see "Lead Time Recommendations"

Verify List of filters in edit filters option
       When User click on Edit Filters
       Then User should see list of filters in edit filters
       And click element  continue
       And click element  addFilterBtn
       And click element  cancel

Verify Default Filters list in Lead time recommendations default page
       Then user should see "Plant Business" "Sub Business" "Plant Region" "Plant" "Source/vendor" as default filters

Verify Static labels in lead time recommendations module
       Then User should see all static labels  Material Optimization  Privacy Policy

Verify Clear filter option in Lead time recommendations default page
       When user see "clear filter" option and beheviour of clear filter
       And delete the existing fileld from filter set
       And delete the existing fileld from filter set
       And set filter set and select filters and click on "clear filter" option
       Then User should see all filters unselcted and filter set text should be "apply/create filter set"
       And delete the existing fileld from filter set

Check "Apply/Create Filter Set" on lead time recommendations module
       Given User access "/secure/lead-time-details" module
       And User should see "Apply/Create Filter Set" button
       When User click at "Apply/Create Filter Set"
       Then User should see "Clear All Filters","Save Current Filter Selections","Cancel" and "Save" buttons
       And User click Cancel to hide pop-up

Verify Update Option in Apply/create filter set in Scheduling module
       Then Verify Update Option
       And sleep  5s
       And Verify Update Option

##Verify Edit Option in Apply/create filter set in Scheduling module
##    Then Edit filter set title and observe udpated title

Verify default Option in Apply/create filter set in Scheduling module
     Then User Verify Default Filterset "/secure/lead-time-details"

Verify cancel button in Apply/create filter set in Scheduling module (negative test)
     And Verify cancel button

Delete All Bookmarks
    Then Delete All Bookmarks  /secure/lead-time-details

