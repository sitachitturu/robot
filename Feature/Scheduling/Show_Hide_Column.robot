*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/show_hide_columns_step.robot

*** Test Cases ***

Verify newly added column SCRAP QUANTITY column in show/hide list
     And sleep  3s
     Given scroll page to location  1000000  0
     And sleep  3s
     When User access "/secure/scheduling" module
     And click on show/hide column in products page and user should see newly added column "scrap quantity column" and select it
     And sleep  3s
     Then user should see Ui with "Scrap Quantity column with data

Verify text "parking lot" in material sku column in db
    And sleep  3s
    Then user should not see "parking lot" in materiaal description in db

Verify scheduling module whether the copyright is changed 2017 to 2018 or not
    And sleep  3s
    When user enters module and scroll page down
    And sleep  3s
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"