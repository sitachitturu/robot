
*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ExecutiveSummary/comming_soon_step.robot

*** Test Cases ***
Feature US76697: As a user I ahould be able to see to see the transnational rigor and inventory i metrics in light gray so the display looks good for the product.
    When User follow "/secure/executive-summary"
    Then User should see Transaction+Coming+Soon.png

