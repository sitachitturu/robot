*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/StockPolicy/stock_policy_spine_step.robot

*** Test Cases ***
Stock Policy smoke test
    When User follow "/secure/stock-policy"
    Then User should see "Stock Policy"

verify Suggested Standard in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Suggested Standard" on spine (Suggested Standard=suggested standard(usd)col)

verify Current Safety Stock in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Current Safety Stock" on spine (Current Safety Stock=safety stock value col)

verify Suggested Safety Stock in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Suggested Safety Stock" on spine (Suggested Safety Stock=Suggested SS col)

verify Current Order Quantity in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Current Order Quantity" on spine (Current Order Quantity=Order Quantity(usd) col)

verify Suggested Order Quantity in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Suggested Order Quantity" on spine (Suggested Order Quantity=Order Quantity(usd) col)

verify Standard Inventory in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Standard Inventory" on spine (Standard Inventory=Standard Inventory Value col)

Verify Total Opportunity in spine by selecting plant from plant filter
   When User follow "/secure/stock-policy"
   And click on plant filter and select plant and click apply button
   Then User should see correct values for "Total Opportunity" on spine (Total Opportunity=Decrease of Suggested Safety Stock)

Verify value for Standard Inventory in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Standard Inventory" on spine with database

Verify value for Suggested Standard in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Suggested Standard " on spine with database

Verify value for Current Safety Stock in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Current Safety Stock" on spine with database

Verify value for Suggested Safety Stock in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Suggested Safety Stock" on spine with database

Verify value for Current Order Quantity in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Current Order Quantity" on spine with database

Verify value for Suggested Order Quantity in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Suggested Order Quantity" on spine with database

Verify value for Total Opportunity in spine in landing page
   When User follow "/secure/stock-policy"
   Then Verify value for "Total Opportunity" on spine with database

