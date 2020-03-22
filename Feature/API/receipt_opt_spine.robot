6/26/2017
212590906
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/API/receipt_opt_spine_step.robot

*** Test Cases ***
Verify spine in receipt optamization module
    Given User access "/secure/receipt-optimization" module
    Then User should see "Total Opportunity","Number Of opportunities","UpComing Opportunities($)","Upcoming Opportunities(#)" fields on spine

#Verify Total Opportunity by selecting Vendor for November in UI as well as Database for < 10 push days
#    Then Select vendor name from source/vendor filter and validate and compare value for "Total Opportunity" in spine with data base query for November month for "<10" push days
#
#Verify Number Of Opportunities by selecting Vendor from vendor filter and by selecting November in UI as well as Database for < 10 push days
#    Then validate and compare value for "Number Of Opportunities" in spine with data base query for Selected vendor and for selected November month for "<10" push days
#
#Verify UpComing Opportunities($) by selecting November in UI as well as Database for selected vendor for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for November month andfor selected vendor for "<10" push days
#
#Verify UpComing Opportunities(#) by selecting November in UI as well as Database for selected vendor for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for November month and for selected vendor for "<10" push days
#
#Verify Total Opportunity by selecting different buyer names for November in UI as well as Database for < 10 push days
#    Then Select different buyers names from buyer filter and validate and compare value for "Total Opportunity" in spine with data base query for November month for "<10" push days
#
#Verify Number Of Opportunities by selecting different buyer names from purchasing group filter and by selecting November in UI as well as Database for < 10 push days
#    Then validate and compare value for "Number Of Opportunities" in spine with data base query for Selected buyer names and for selected November month for "<10" push days
#
#Verify UpComing Opportunities($) by selecting November in UI as well as Database for selected buyer names for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for November month andfor selected buyer names for "<10" push days
#
#Verify UpComing Opportunities(#) by selecting November in UI as well as Database for selected different buyers for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for November month and for selected buyers for "<10" push days
#
#Verify Total Opportunity by selecting Vendor for Ocotober in UI as well as Database for < 10 push days
#    Then Select vendor name from source/vendor filter and validate and compare value for "Total Opportunity" in spine with data base query for Ocotober month for "<10" push days
#
#Verify Number Of Opportunities by selecting Vendor from vendor filter and by selecting Ocotober in UI as well as Database for < 10 push days
#    Then validate and compare value for "Number Of Opportunities" in spine with data base query for Selected vendor and for selected Ocotober month for "<10" push days
#
#Verify UpComing Opportunities($) by selecting Ocotober in UI as well as Database for selected vendor for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for Ocotober month andfor selected vendor for "<10" push days
#
#Verify UpComing Opportunities(#) by selecting Ocotober in UI as well as Database for selected vendor for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for Ocotober month and for selected vendor for "<10" push days
#
#Verify Total Opportunity by selecting different buyer names for Ocotober in UI as well as Database for < 10 push days
#    Then Select different buyers names from buyer filter and validate and compare value for "Total Opportunity" in spine with data base query for Ocotober month for "<10" push days
#
#Verify Number Of Opportunities by selecting different buyer names from purchasing group filter and by selecting Ocotober in UI as well as Database for < 10 push days
#    Then validate and compare value for "Number Of Opportunities" in spine with data base query for Selected buyer names and for selected Ocotober month for "<10" push days
#
#Verify UpComing Opportunities($) by selecting Ocotober in UI as well as Database for selected buyer names for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES ($)" in spine with data base query for Ocotober month andfor selected buyer names for "<10" push days
#
#Verify UpComing Opportunities(#) by selecting Ocotober in UI as well as Database for selected different buyers for < 10 push days
#    Then validate and compare value for "UPCOMING OPPORTUNITIES (#)" in spine with data base query for Ocotober month and for selected buyers for "<10" push days


Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for default_view and for <10days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for <10)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for october_view and for <10days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for <10)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for november_view and for <10days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for <10)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for december_view and for <10days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for <10)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for default_view and for <20days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for <20)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for october_view and for <20days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for <20)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for november_view and for <20days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for <20)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for december_view and for <20days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for <20)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for default_view and for <30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for <30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for october_view and for <30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for <30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for november_view and for <30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for <30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for december_view and for <30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for <30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for default_view and for >=30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for default_viewand for >=30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for october_view and for >=30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for october_viewand for >=30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for november_view and for >=30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for november_viewand for >=30)

Verify receipt optimization spine Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in api with ui(for december_view and for >=30days)
   Then compare Total Opportunity,Number of opportunities,Upcoming opportunities($),Upcoming opportunities?(#) value in spine in ui with api(for december_viewand for >=30)
