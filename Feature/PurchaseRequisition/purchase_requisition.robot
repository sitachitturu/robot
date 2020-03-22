*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseRequisition/purchase_requisition_step.robot
*** Test Cases ***
Requisitions (incl. Planned) smoke test
    When User click Requisitions (incl. Planned) icon
    Then User should see "Requisitions (incl. Planned)"
