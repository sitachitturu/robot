*** Settings ***
Library  Selenium2Library
Resource  ../../Variables/VariablesCommon/common_variables.robot
Library  String
Library  Collections

*** Keywords ***
User open welcome page
    open browser  ${WELCOME.URL}  ${BROWSER}
    Maximize Browser Window
    click link  /secure
    wait until element is visible  ${SSO.Login}  20s

User provide cridentials
    input text  ${SSO.Login}  ${user2}
    input text  ${SSO.Password}  ${password2}

User click Submit button
    click element  ${SSO.Submit}
    Sleep  3s
    #Sometimes we get hung up on the "Zscaler authentication - Please wait a moment..." page.
    #Just to make sure let's check if we're there and click the "Click here" link to continue on.
    ${FoundClickHere}=  Run Keyword And Return Status  Element Should Be Visible  ${SSO.ClickHere}
    Run Keyword If  ${FoundClickHere}  Click Link  ${SSO.ClickHere}

User should see Material Optimization
    element should be visible  xpath=//header//h1[contains(text(),'Material Optimization')]