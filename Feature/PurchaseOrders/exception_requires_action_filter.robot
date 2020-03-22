*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/exception_requires_action_filter_step.robot

*** Test Cases ***
Verify Exception Requires Action Filter in Edit Filters button
     Given User access "/secure/purchase-orders" module
     Then User click on Edit filters button and User should see Exception Requires Action filter in the edit filters list

To see Exception Requires Action filter on UI user should select filters from edit filters list
      Given User access "/secure/purchase-orders" module
      And select exception requires action filter and click continue
      Then click exception requires filter and User shoiuild see "Action Required" and "No Error" and click cancel button

Verify "Action Required" and "No Error" in exception requires action filter by selecting them
      Given User access "/secure/purchase-orders" module
      And select exception requires action filter and click continue
      Then click exception requires filter and User shoiuld be able to select "Action Required" and "No Error" and click apply button

Verify Exception Requires Action column in show/hide columns
       Given User access "/secure/purchase-orders" module
       When User click on show/hide columns button and scroll page
       And User should be able to see "Exception Requires Action" column on the UI