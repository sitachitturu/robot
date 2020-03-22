*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/Scheduling/scheduling_scattorplots_icon_steps.robot

*** Test Cases ***
Scheduling
    When User click Scheduling icon
    And sleep  3s
    Then user should see scattorplot title "PRODUCTION ORDERS"

Verify the icons in scattorplot in scheduling module
    And sleep  3s
    Then user should see four icons when user mouse over on scattorplot

Verify Auto Scale icon in scattor plot for scheduling module
    And sleep  3s
    When user change yesr in filters current finish and ideal finish filter and click apply
    And sleep  3s
    Then user can see scattor plot and scatterplot can be refreshed to default view by clicking autoscale icon and filters need to be unselected