11/7/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/stock_policy_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access Stock Policy module
    click element  ${Stock Policy Icon}
User should see Feedback button
    wait until element is visible  feedback-button  20s
User click feedback button
    sleep  10s
    click element  feedback-button
User should see "Please provide your feedback here. Include details that help us understand the situation as much as possible."
    sleep  10s
    select window  url=http://surveys.ge.com/create/212122
    log location
    wait until element is visible  xpath=//label[@class='control-label js-display-name wordbreak multibyte-content label-bold']//span[contains(normalize-space(), 'Please provide your feedback here. Include details that help us understand the situation as much as possible.')]  20s
User should see Privacy Policy link
    select window  url=${WELCOME.URL}/secure/stock-policy
    wait until element is visible  privacy  30s
User click Privacy Policy link
    click element  privacy
User should see "Web Privacy Policy"
    select window  url=https://www.ge.com/privacy
    page should contain  Privacy Policy

