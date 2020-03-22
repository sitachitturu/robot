*** Settings ***
Library  Selenium2Library
Resource  ../../Variables/VariablesCommon/common_variables.robot
Library  String
Library  Collections

*** Keywords ***
User open welcome page
    ${chrome_options}=    Evaluate      sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${chrome_options}    add_argument    test-type
    Call Method    ${chrome_options}    add_argument    --disable-extensions
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Go to    ${WELCOME.URL}
    Set Window Size     1920      1080
    Maximize Browser Window
    ###click link  /secure
    wait until element is visible  ${SSO.Login}  40s

User provide cridentials
    input text  ${SSO.Login}  ${user}
    sleep  1s
    input text  ${SSO.Password}  ${password}

User click Submit button
    click element  ${SSO.Submit}
    Sleep  3s
    #Sometimes we get hung up on the "Zscaler authentication - Please wait a moment..." page.
    #Just to make sure let's check if we're there and click the "Click here" link to continue on.
    ${FoundClickHere}=  Run Keyword And Return Status  Element Should Be Visible  ${SSO.ClickHere}
    Run Keyword If  ${FoundClickHere}  Click Link  ${SSO.ClickHere}

User should see Material Optimization
    ${application name}  execute javascript  var title=document.querySelector('body > mos-module-stock-policy-dashboard > div > mo-app-nav').shadowRoot.querySelector('h1 > span.brand--text').innerText;return title;
    log  ${application name}
    set global variable  ${application name}
    ${text1 from ui}  get text  ${application name}
    log  ${text1 from ui}
    should be equal  ${text1 from ui}  Material Optimization


User should see prompt saying "Action Required"
    run keyword and ignore error  element should be visible  //*[@id="profile-modal"]/div/div[1]
    run keyword and ignore error  element should contain  ${prompt}  ${Not now button}
    run keyword and ignore error  element should contain  ${prompt}  ${ok button from prompt}

User should click "Not Now" option
    run keyword and ignore error  click element  ${Not now button}
    sleep  6s