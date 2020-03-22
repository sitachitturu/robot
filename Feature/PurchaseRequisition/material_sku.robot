6/2/2017
212595411
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseRequisition/material_sku_step.robot
*** Test Cases ***
Material SKU filter at Purchase req
    Given User access "/secure/purchasing" module
    And click "Edit Filter(s)"
    When User check check box with "Material SKU" name in po
    And click "Continue"
    When User select plant from plant filter for pr
    Then User select data from Material SKU filter in Purchase Req and User see correct data in Purchase Req grid

Material SKU filter at Lead time
    Given User access "/secure/lead-time-analytics" module
    When User select plant from plant filter
    Then User select data from Material SKU filter in Lead Time Analytics and User see correct data in Lead Time Analytics