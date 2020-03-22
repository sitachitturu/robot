*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/MasterData/filters_master_data_step.robot

*** Test Cases ***
Check Filters on Master Data
    Given User access "/secure/master-data" module
    Then User should see "Plant" filter
    And click "Edit Filter(s)"
    When User check check box with "Plant Category" name
    When User check check box with "Plant Business" name
    When User check check box with "Plant Region" name
    When User check check box with "Material Type" name
    When User check check box with "Sub Business" name

    And click "Continue"
    Then User should be able to see Plant Business Filter
    Then User should be able to see Plan Category Filter
    Then User should be able to see Plant Region Filter
    Then User should be able to see sub_business Filter
    Then Count sums of all filters should equal the sum of records for corresponding plant

Verify Edit Filters labels
    When User access "/secure/master-data" module
    When click "Edit Filter(s)"
    Then User should see proper option labels in edit filters
    And User click on edit filter cancel

Verify newly added feature "Clear filter" option
    Given User access "/secure/master-data" module
    Then user should see "clear filter" option

Verify the behaviour of "Clear Filter" option
    #Given User access "/secure/master-data" module
    And delete the existing fileld from filter set
    And set filter set and select filters and click on "clear filter" option
    Then User should see all filters unselcted and filter set text should be "apply/create filter set"
    And delete the existing fileld from filter set

Verify clear filter option by selecting all filters from edit filters and select data from all filters
    When User access "/secure/master-data" module
    And select all filters from edit filters
    And select data from all filters and click clearFilterBtn
    Then User should not see any filters except default filters 'Plant'



Verify Master data. module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"