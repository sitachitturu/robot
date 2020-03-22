*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/LeadTimeAnalytics/log_user_lead_time_step.robot
*** Test Cases ***
Scenario: Verify User Activity module
    Given User should be able to see Lead Time Analytics module icon and click on Lead Time Analytics icon
    Then User should be able to see columns:"PO Number","Purchasing Group Name Buyer Name","Plant Code","Line Number","Shipment Line Number","Release Number","Creation Date","Orig. Need By Date","Current Revision Number","Material SKU","Material Description","Source/Vendor","Actual LT","PO LT","Orig.PO LT","ASL LT","System LT","Preprocessing LT","Po Early/Late By days","Early/Late Receipt" with data
    And User should be able to see Show/Hide Columns and Export to Excel button

Verify grid by switching to aggregated view in lead time analytics landing page
    Then User should see Aggregated tab and grid should show columns "Source/Vendor","Material SKU","Material Description","PO Total Amount"," Actual LT","Weighted Average"

Verify lead time analytics module whether the copyright is changed 2017 to 2018 or not
    When user enters module and scroll page down
    Then User should see "© 2017 General Electric" changed to "© 2018 General Electric"