11/7/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access purchase orders module
    click element  ${Purchase Orders Icon}

User should see ContactUs button
    wait until element is visible  contactUs  20s

User click ContactUs button
    sleep  15s
    click element  contactUs

User should see Log An Issue link
    page should contain link  //*/a[text() = "Log an Issue"]  Log An Issue link does not exist

User should see Yammer link
    page should contain link  //*/a[text() = "Yammer"]  Yammer Link does not exist

User should see Feedback link
    page should contain link  //*/a[text() = "Feedback"]  Feedback link does not exist

User should see New Ideas link
    page should contain link  //*/a [text () = "New Ideas"]  New ideas link does not exist

User should see "Please provide your feedback here. Include details that help us understand the situation as much as possible."
    sleep  20s
    select window  url=http://surveys.ge.com/create/212122
    log location
    wait until element is visible  xpath=//label[@class='control-label js-display-name wordbreak multibyte-content label-bold']//span[contains(normalize-space(), 'Please provide your feedback here. Include details that help us understand the situation as much as possible.')]  20s
User should see Privacy Policy link
    select window  url=${WELCOME.URL}/secure/purchase-orders
    wait until element is visible  privacy  30s
User click Privacy Policy link
    click element  privacy
User should see "Web Privacy Policy"
    select window  url=https://www.ge.com/privacy
    page should contain  Privacy Policy

