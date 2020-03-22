
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/sum_values_heat_map_step.robot
Documentation    User should see corect value in Overall for sum of values in all heat map columns

*** Test Cases ***
Total Value should be equal to sum all values in columns in Heat map for Age clasification view
        Given User access Purchase orders module
        And User select plant 0010
        And User click Value button
        When User select Plant view
        Then sum off all iteams in column 60+ Days Old should be equal to number in Total
        And sum off all iteams in column 30+ Days Old should be equal to number in Total
        And sum off all iteams in column <30 Days Old should be equal to number in Total
        And sum off all iteams in column On Hold should be equal to number in Total
        And sum off all iteams in column Future should be equal to number in Total
        And sum off all iteams in column Total should be equal to number in Total

Total Value should be equal to sum all values in columns in Heat map for Exeption Message view
        Given User select Exeption Message view
        Then sum off all iteams in column Cancellation should be equal to number in Overall
        And sum off all iteams in column Reschedule In should be equal to number in Overall
        And sum off all iteams in column Reschedule Out should be equal to number in Overall
        And sum off all iteams in column No Exception should be equal to number in Overall
        And sum off all iteams in column Other Exceptions should be equal to number in Overall

##verify the heatmap column names for exception message view in purchase order module
##        Given User select Exeption Message view
##        Then User should see heatmap columns in order "Buyer" col. "Plant" col. "Cancellation" col. "Reschedule In" col. "Reschedule Out" col. "Overdue" col. "No Exception" col.
##        And Swith view to value($) view also
##        Then User should see heatmap columns in order "Buyer" col. "Plant" col. "Cancellation" col. "Reschedule In" col. "Reschedule Out" col. "Overdue" col. "No Exception" col.


