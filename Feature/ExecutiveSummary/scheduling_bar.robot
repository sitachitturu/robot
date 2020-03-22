*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ExecutiveSummary/scheduling_bar_step.robot
*** Test Cases ***
Data validation in Scheduling bar at Executive Summary page - Schedule Accuracy rate
    Then User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules

Data validation in Scheduling bar at Executive Summary page - Cancellations rate
    Then User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"

Data validation in Scheduling bar at Executive Summary page - Reschedule In
    Then User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"

Data validation in Scheduling bar at Executive Summary page - Reschedule Out
    Then User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"

Data validation in Scheduling bar at Executive Summary page - Overdue
    Then User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"

Data validation in scheduling bar at executive summary page business "Renewables"
    When User select business from business filter for "Renewables"
    And User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "Renewables"
    And User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    And User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    And User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    And User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    And User click on clear filters button to clear the old selection

Data validation in scheduling bar at executive summary page business "Power"
    When User select business from business filter for "Power"
    And User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "Power"
    And User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    And User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    And User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    And User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    And User click on clear filters button to clear the old selection

Data validation in scheduling bar at executive summary page business "O&G"
    When User select business from business filter for "O&G"
    And User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "O&G"
    And User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    And User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    And User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    And User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    And User click on clear filters button to clear the old selection

Data validation in scheduling bar at executive summary page business "Transportation"
    When User select business from business filter for "Transportation"
    And User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "Transportation"
    And User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    And User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    And User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    And User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    And User click on clear filters button to clear the old selection

Data validation in scheduling bar at executive summary page business "Healthcare"
    When User select business from business filter for "Healthcare"
    And User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "Healthcare"
    And User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    And User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    And User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    And User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    And User click on clear filters button to clear the old selection

Data validation in scheduling bar at executive summary page business "MMF"
    When User select business from business filter for "MMF"
    And User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "MMF"
    And User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    And User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    And User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    And User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    And User click on clear filters button to clear the old selection

