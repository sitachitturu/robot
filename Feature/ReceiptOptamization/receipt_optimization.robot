*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ReceiptOptamization/receipt_optimization_step.robot
*** Test Cases ***
Receipt Optimization smoke test
    When User click Receipt Optimization Icon
    Then User should see "Receipt Optimization"
