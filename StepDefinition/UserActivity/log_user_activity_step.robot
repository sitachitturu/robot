*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Resource  ../../Variables/user_activity_variables.robot
*** Keywords ***
User should be able to see User Activity module icon and click on User Activity icon
    wait until element is not visible  ${Page Spinner}  10s
    click element  ${Secure Notification Icon}
    sleep  1s
    wait until element is visible  ${User Activity Icon}  10s
    click element  ${User Activity Icon}
    wait until element is visible  ${User Activity Title}  10s
#    click element  xpath=//px-app-nav[@id='app-nav']//button[@class='btn btn--bare btn--svg style-scope px-app-nav']
User should be able to see columns:"${column1}","${column2}","${column3}","${column4}","${column5}","${column6}" with data
    wait until element is not visible  ${Page Spinner}  10s
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column1}']
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column2}']
    #Scroll grid horizontaly 700px
    sleep  1s
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column3}']
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column4}']
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column5}']
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column6}']
    element should be visible  xpath=//*[@id="content"]/div/span[text()='${column7}']
User should be able to see Show/Hide Columns and Export to Excel button
    wait until element is not visible  ${Page Spinner}  10s
    element should be visible  showHide
    element should be visible  xlsLink

Scroll grid horizontaly ${right}px
    execute javascript    $("vaadin-grid > div > div").get(1).scrollRight=${right}
