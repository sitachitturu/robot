*** Settings ***
Library     Selenium2Library
Library     String
Library     Collections
Library     ../../Utilities/utility.py
Resource    ../../Variables/VariablesAdmin/notifications_variables.robot
Resource    ../../StepDefinition/Common/database_step.robot

*** Keywords ***
User click Admin icon
    #execute javascript  window.scrollTo(0, 2500)
    #sleep  3s
    #wait until element is visible  ${Admin icon}  10s
    #click element  ${Admin icon}
    go to  https://mos-dev-3.run.aws-usw02-pr.ice.predix.io/secure/notification

User click notification icon
    wait until element is visible  ${Notification icon}  10s
    click button  ${Notification icon}

User click notification label
    wait until element is visible  ${Notification page label}  10s
    click element  ${Notification page label}

User should see notification page
    wait until element is visible  ${Notification page label}
    ${page label}=  get text  ${Notification page label}
    log  ${page label}
    should be equal  ${page label}  Notification  Either Notification label is incorrect or absent. Please check!
    location should contain  notification


Get text from notification label dropdown
    click element  ${Notification page label}
    wait until element is visible  ${Notification label dropdown text}  10s
    @{dropdown elements}=  get webelements  ${Notification label dropdown text}
    ${dropdown text}  create list
    ${var}  set variable  0
    :FOR  ${var}  IN  @{dropdown elements}
    \   ${str}=  get text  ${var}
    \   log to console  ${str}
    \   append to list  ${dropdown text}  ${str}
    [Return]  ${dropdown text}

Verify notification label dropdown items
    @{dropdown items}=  Get text from notification label dropdown
    ${expected texts}=  create list  Notification  User Activity  Data Validation
    ${j}  set variable  0
    :FOR  ${j}  IN  @{dropdown items}
    \   should contain  ${expected texts}  ${j}

Get labels from notifications grid
    wait until element is visible  ${Grid columns}  10s
    @{grid column elements}=  get webelements  ${Grid columns}
    ${grid column label texts}  create list
    ${var}  set variable  0
    :FOR  ${var}  IN  @{grid column elements}
    \   ${str}=  get text  ${var}
    \   log to console  ${str}
    \   append to list  ${grid column label texts}  ${str}
    [Return]  ${grid column label texts}

Verify Notification grid column labels
    @{column labels}=  Get labels from notifications grid
    ${expected grid labels}=  create list  Notification Type  Title  Message  Start Date/Time  End Date/Time  Status  Created By  Updated By  Action
    ${j}  set variable  0
    :FOR  ${j}  IN  @{column labels}
    \   should contain  ${expected grid labels}  ${j}

Click create button
    wait until element is visible  ${Create button}  10s
    click button  ${Create button}

Click general radio button
    wait until element is visible  ${General radio button}  10s
    click element  ${General radio button}

Click outage radio button
    wait until element is visible  ${Outage radio button}   10s
    click element  ${Outage radio button}

Input title for notification
    [Arguments]  ${title}
    wait until element is visible  ${Notification title textbox}
    input text  ${Notification title textbox}  ${title}

Select status from dropdown
    wait until element is visible  ${Status dropdown}  10s
    select from list by value  ${Status dropdown}  Active

Input message for notification
    [Arguments]  ${message}
    wait until element is visible  ${Notification message textbox}  10s
    input text  ${Notification message textbox}  ${message}

Click publish button
    wait until element is visible  ${Publish button}  10s
    click element  ${Publish button}

User clicks on create button
    Click create button

User should see notification creation form
    wait until element is visible  ${Notification creation form}

User input notification title
    [Arguments]  ${title}
    wait until element is visible  ${Notification title textbox}
    input text  ${Notification title textbox}  ${title}

User selects status for notification
    wait until element is visible  ${status dropdown}
    click element  ${active status}

User inputs message for notification
    [Arguments]  ${message}
    wait until element is visible  ${Notification message textbox}
    input text  ${Notification message textbox}  ${message}

User clicks on publish
    wait until element is visible  ${publish button}
    click element  ${publish button}

Create general notification
    Click create button
    Click general radio button
    User input notification title
    User selects status for notification
    User inputs message for notification
    User clicks on publish

User should see the created notification in grid
    wait until element is visible  ${latest notification}








