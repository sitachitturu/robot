6/15/2017
sita chitturu
*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/products_projects_step.robot

*** Test Cases ***
Verify Plant' filter should show the TOTAL COUNT count for Products and Projects toggle
    Given scroll page to location  1000000  0
    And sleep  4s
    When User access "/secure/scheduling" module
    And sleep  3s
    Then click on plant filter and select plants and user should see total count for the plant should be equal to sum of products and projects
    And sleep  3s

Verify Default Columns for products view
    Given scroll page to location  1000000  0
    And sleep  4s
    When User access "/secure/scheduling" module
    Then User should see following column "Exception" column "Material SKU" column "Material Description" column "Standard Open Value (USD)" column "Current Finish Date" column "Ideal Finish Date" column "Production / Work Order" column
    And sleep  3s

Verify Default Columns for projects view
    Given scroll page to location  1000000  0
    And sleep  4s
    When User access "/secure/scheduling" module
    And sleep  3s
    And click on projects toggle button
    And sleep  3s
    Then User should see following column "Exception" column "Project Code" column "WBS Element" column "Network Number" column "OP Activity Number" column "Operation Description" column "Latest Scheduled Finish Execution" column "Open Resb (USD)" column "Activity Status" column in projects view

