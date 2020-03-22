6/26/2017
212590906
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/ReceiptOptamization/receipt_optomization_default_page_step.robot

*** Test Cases ***
Verify the title "OPPORTUNITIES BY MONTH" in Receipt Optamization module
    Given User access "/secure/receipt-optimization" module
    Then User should see "Receipt Optimization"
    And User should see "OPPORTUNITIES BY MONTH"

Verify the receipt_optimization page with list of default columns should be displayed
    Given User access "/secure/receipt-optimization" module
    And click element  clearFilterBtn
    And sleep  4s
    Then User should see following column "Buyer Name" column "Source/Vendor" column "PO Number" column "Open Qty" column "Planned Date" column "Recommended Date" column "Push Days" column "Total Opportunity"

Verify Export to Excel option and verify the columns list displaying on excel
    Given User access "/secure/receipt-optimization" module
    Then User see Excel to Export option on Receipt optamization landing page

Verify default month should display on Opportunities By Month option button
   Given User access "/secure/receipt-optimization" module
   Then User should see default month "current month" on Opportunities By Month option button

Verify receipt optimazation columns planned date for po number in db
    Given User access "/secure/receipt-optimization" module
    Then verify planned date with po number in db

Verify receipt optimization module with push days drop down
    Given User access "/secure/receipt-optimization" module
    Then user should see push days drop down with default ALL push days on it .
    When User click on push days drop down user should see "<10""<20""<30"">=30"
    And default number in push days for <10 should show less than 10 days in grid.
    When user selects <20 from push days drop down
    Then user should see <20 days in grid
    When user selects <30 from push days drop down
    Then user should see <30 days in grid
    When user selects +30 days from push days drop down
    Then user should see more than 30 days in grid

Verify Material sku and material description in receipt optimization module for plant "de1"
     Given User access "/secure/receipt-optimization" module
     And Select plant "DE1" from plant filter
     When User selects "Material sku" and "Material Description" from show/hide columns
     Then User should see "Material sku" and "Material Description" in ui with data on that column

Verify Material sku and material description in receipt optimization module for plant "de4"
     Given User access "/secure/receipt-optimization" module
     And Select plant "DE4" from plant filter
     When User selects "Material sku" and "Material Description" from show/hide columns
     Then User should see "Material sku" and "Material Description" in ui with data on that column

Verify Material sku and material description in receipt optimization module for plant "PNS"
     Given User access "/secure/receipt-optimization" module
     And Select plant "PNS" from plant filter
     When User selects "Material sku" and "Material Description" from show/hide columns
     Then User should see "Material sku" and "Material Description" in ui with data on that column
