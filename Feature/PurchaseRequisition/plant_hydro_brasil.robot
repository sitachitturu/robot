*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/PurchaseRequisition/plant_hydro_brasil_step.robot
*** Test Cases ***
#Feature: US76297 As a Buyer, want to see data for Taubate plant in Renewables Hydro Business in the Heat map and the grid so that I see data for Taubate to take timely action to improve on time delivery.

Scenario: Plant Hydro Taubate data should be visible at Purchase Requisitions & Plant Region. Plant Category, PLan Busines for Plant Hydro Taubate
    Given User access Purchase Requisitions module
    When User select 5600 - Plant Hydro Taubate from Plant filter and hit apply
    And Manufacturing from Plant Category filter
    And LATAM from Plant Region filter
    And User select Hydro from Plant business filter
 #   Then the heat map and Data grid should show the data for Hydro, matching from ERP & datalake extracts