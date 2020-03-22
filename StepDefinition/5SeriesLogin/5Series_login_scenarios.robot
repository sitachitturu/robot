*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections

Resource          ../../StepDefinition/CommonFeatures/login_steps.robot
Resource          ../../Variables/CommonFeatures/VariablesCommon/common_variables.robot

*** Keywords ***
User open welcome page for 5Series User
    ${chrome_options}=    Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go to    ${5SeriesWELCOME.URL}
    Set Window Size     1920      1080
    Maximize Browser Window
    ##click link  /secure
    wait until element is visible  ${SSO.Login}  40s

5Series User provide cridentials for Authorized User
    input text  ${SSO.Login}  ${USER-AUTHORIZED}
    sleep  1s
    input text  ${SSO.Password}  ${PASSWORD-AUTHORIZED}

5Series User provide cridentials for Admin-Authorized User
    input text  ${SSO.Login}  ${USER-AUTHORIZED-ADMIN}
    sleep  1s
    input text  ${SSO.Password}  ${PASSWORD2-Admin}

5Series User provide cridentials for UnAuthorized User
    input text  ${SSO.Login}  ${USER-UNAUTHORIZED}
    sleep  1s
    input text  ${SSO.Password}  ${PASSWORD-UNAUTHORIZED}

5Series User click Submit button
    click element  ${SSO.Submit}
    Sleep  3s
    #Sometimes we get hung up on the "Zscaler authentication - Please wait a moment..." page.
    #Just to make sure let's check if we're there and click the "Click here" link to continue on.
    ${FoundClickHere}=  Run Keyword And Return Status  Element Should Be Visible  ${SSO.ClickHere}
    Run Keyword If  ${FoundClickHere}  Click Link  ${SSO.ClickHere}

5Series User should see Material Optimization
    element should be visible  xpath=//header//h1[contains(text(),'Material Optimization')]

5Series User should be redirected to MOS request access
    element should be visible  xpath=//*/h1[contains (text (), "Request for MOS access")]

5Series User should see Admin link under main menu
    element should be visible  xpath=//*/a/span[text() = 'Admin']