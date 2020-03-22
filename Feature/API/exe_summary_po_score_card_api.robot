*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/API/exe_summary_po_score_card_api_step.robot

*** Test Cases ***
Verify Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card by selecting different plants (Health Care)
    Then User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(Health care)
    And clear the selected business from business filters by click clearfilterbtn

Verify Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card by selecting different plants (MMF)
    Then Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(MMF)
    And clear the selected business from business filters by click clearfilterbtn

##    Then User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(OIL&GAS)
##    And clear the selected business from business filters by click clearfilterbtn

Verify Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card by selecting different plants (POWER)
    Then User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(POWER)
    And clear the selected business from business filters by click clearfilterbtn

Verify Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card by selecting different plants (Renewables)
    Then User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(Renewables)
    And clear the selected business from business filters by click clearfilterbtn

##Verify Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card by selecting different plants (Transportation)
##    Then User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(Transportation)
# #   And clear the selected business from business filters by click clearfilterbtn