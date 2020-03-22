*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/API/Exe_summary_purchasing_score_card_step.robot

*** Test Cases ***
Verify On-time PR in purchase requisitions score card by selecting different plants (Health Care)
    Then User should see right number for On-Time PR in purchase requisitions score card for business(Health care)

Verify No Source,AVG OVD Days in purchase requisitions score card by selecting different plants (Health Care)
    Then User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (Health care)
    And clear the selected business from business filters by click clearfilterbtn

Verify On-time PR in purchase requisitions score card by selecting different plants (MMF)
    Then User should see right number for On-Time PR in purchase requisitions score card for business(MMF)

Verify No Source,AVG OVD Days in purchase requisitions score card by selecting different plants (MMF)
    Then User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (MMF)
    And clear the selected business from business filters by click clearfilterbtn

#Verify On-time PR in purchase requisitions score card by selecting different plants (OIL&GAS)
#    Then User should see right number for On-Time PR in purchase requisitions score card for business(OIL&GAS)
#
#Verify No Source,AVG OVD Days in purchase requisitions score card by selecting different plants (OIL&GAS)
#    Then User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (OIL&GAS)
#    And clear the selected business from business filters by click clearfilterbtn

Verify On-time PR in purchase requisitions score card by selecting different plants (POWER)
    Then User should see right number for On-Time PR in purchase requisitions score card for business(POWER)

Verify No Source,AVG OVD Days in purchase requisitions score card by selecting different plants (POWER)
    Then User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (POWER)
    And clear the selected business from business filters by click clearfilterbtn

Verify On-time PR in purchase requisitions score card by selecting different plants (Renewables)
    Then User should see right number for On-Time PR in purchase requisitions score card for business(Renewables)

Verify No Source,AVG OVD Days in purchase requisitions score card by selecting different plants (Renewables)
    Then User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (Renewables)
    And clear the selected business from business filters by click clearfilterbtn
#
#Verify On-time PR in purchase requisitions score card by selecting different plants (Transportation)
#    Then User should see right number for On-Time PR in purchase requisitions score card for business(Transportation)
#
#Verify No Source,AVG OVD Days in purchase requisitions score card by selecting different plants (Transportation)
#    Then User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (Transportation)
#    And clear the selected business from business filters by click clearfilterbtn