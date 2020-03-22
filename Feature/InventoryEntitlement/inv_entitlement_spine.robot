*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/InventoryEntitlement/inv_entitlement_spine_step.robot

*** Test Cases ***

Verify all plants one by one in plant filter and verify values for each plant in "+ VARIATION TO ENTITLEMENT","Active USD","Total Stock USD","SMI > 12 MM USD","ENTITLEMENT INVENTORY" on spine
     When User click Inventory Entitlement icon
     Then User should see correct value in spine for "+ VARIATION TO ENTITLEMENT","Active USD","Total Stock USD","SMI > 12 MM USD","ENTITLEMENT INVENTORY" after user round values taken from grid

Verify plants FU03,E5WD,RF01 values in "SMI > 12 MM USD" on spine
     When User click Inventory Entitlement icon
     Then User should select plants FU03,E5WD,RF01
     And scroll page to location  0  10000000
     And sleep  3s
     Then User should see correct values for "SMI > 12 MM USD" on spine ("SMI > 12 MM USD"=Slow Moving Inv(usd) col) for plants FU03,E5WD,RF01

Inventory Entitlement
    When User click Inventory Entitlement icon
    Then User should see "Inventory Entitlement"

Verify Spine in inventory entitlement landing page
    When User click Inventory Entitlement icon
    Then User should see spine with text fileds "Total Stock USD" ,"Active USD", "Entitlement Inventory","Variation To Entitlement" etc
    And User should see "$" sign for the values in spine
    And User should see performance indicators for "smi>12mm usd","+var to entitlement","qtr i/o diff"

Verify plants FU03,E5WD,RF01 values in "Total Stock USD" on spine
     When User click Inventory Entitlement icon
     Then User should select plants FU03,E5WD,RF01
     And scroll page to location  0  10000000
     And sleep  3s
     Then User should see correct values for "Total Stock Usd" on spine (Total Stock Usd=On Hand col) for plants FU03,E5WD,RF01

Verify plants FU03,E5WD,RF01 values in ""ACTIVE USD"" on spine
     When User click Inventory Entitlement icon
     Then User should select plants FU03,E5WD,RF01
     And scroll page to location  0  100000000
     And sleep  3s
     Then User should see correct values for ""ACTIVE USD"" on spine ("ACTIVE USD"=Active Inv(usd)col) for plants FU03,E5WD,RF01

Verify plants FU03,E5WD,RF01 values in "ENTITLEMENT INVENTORY" on spine
     When User click Inventory Entitlement icon
     Then User should select plants FU03,E5WD,RF01
     And scroll page to location  0  10000000
     And sleep  3s
     Then User should see correct values for "ENTITLEMENT INVENTORY" on spine ("ENTITLEMENT INVENTORY"=Entitlement Inv(usd) col) for plants FU03,E5WD,RF01

Verify plants FU03,E5WD,RF01 values in "+ VARIATION TO ENTITLEMENT" on spine
     When User click Inventory Entitlement icon
     Then User should select plants FU03,E5WD,RF01
     And scroll page to location  0  10000000
     And sleep  3s
     Then User should see correct values for "+ VARIATION TO ENTITLEMENT" on spine ("+ VARIATION TO ENTITLEMENT"=+Var to Entitlement(usd) col) for plants FU03,E5WD,RF01
