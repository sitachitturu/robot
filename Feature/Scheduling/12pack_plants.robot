*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/Scheduling/12pack_plants_step.robot

*** Test Cases ***
Verify exceptions "Cancel Process" and "OverDue" and "Reschedule In" and "reschedule out" for products view by selecting Greenville plant 5250
        When User access "/secure/scheduling" module
        Then User should able to verify "Reschedule In" and "reschedule out" exceptions by selecting plant by selecting Greenville plant 5250 from plant filter for product view

Verify exceptions "Cancel Process" and "OverDue" for projects view by selecting plant by plant
        When User access "/secure/scheduling" module
        Then User should able to verify "Reschedule In" and "reschedule out" exceptions by selecting by selecting Greenville plant 5250 from plant filter for projects view


