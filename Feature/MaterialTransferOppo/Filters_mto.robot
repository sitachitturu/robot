*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/MaterialTransferOppo/Filters_mto_step.robot

*** Test Cases ***
Check Default Filters on Material Tranfer Opportunities Module
    Given User access "/secure/material-transfer" module
    Then User should see "Plant" filter
    Then User should see "Plant Business" filter
    Then User should see "Order Type" filter
    Then User should see "Buyer / Purchasing Group" filter
    And User should see "Material SKU" filter
    And User should see "Planner / MRP Controller" filter
    And click "Edit Filter(s)"
    Then User should see "Plant Business" "Plant" "order Type" and "Buyer" and "sku" and "mrpc" and "profit_center" filters in edit filters list
    And User click on profit_center filter in edit filter user should see profit_center filter in UI

Verify newly added feature "Clear filter" option
    Given User access "/secure/material-transfer" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify clear filter option by selecting all filters from edit filters and select data from all filters
    When User access "/secure/master-data" module
    And select all filters from edit filters
    And select data from all filters and click clearFilterBtn
    Then User should not see any filters except default filters 'Plant'"plant business""order type"

