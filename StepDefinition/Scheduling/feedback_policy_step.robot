11/7/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access Scheduling module
    sleep  10s
    click element  ${Scheduling icon}

User should see ContactUs button
    wait until element is visible  contactUs  20s

User click ContactUs button
    sleep  10s
    click element  contactUs

User should see Log An Issue link
    page should contain link  //*/a[text() = "Log an Issue"]  Log An Issue link does not exist

User should see Yammer link
    page should contain link  //*/a[text() = "Yammer"]  Yammer Link does not exist

User should see Feedback link
    page should contain link  //*/a[text() = "Feedback"]  Feedback link does not exist

User should see New Ideas link
    page should contain link  //*/a [text () = "New Ideas"]  New ideas link does not exist

User should click Log An Issue link
    click link  https://ez-triage-qa.run.aws-usw02-pr.ice.predix.io/secure/submit-ticket
    select window  url=https://ez-triage-qa.run.aws-usw02-pr.ice.predix.io/secure/submit-ticket

User should click Yammer link
    click link  //*/a[text() = "Yammer"]

User should see the MOS Yammer page
    sleep  10s
    wait until element is visible  xpath=//*[@id="threadsInGroup"]/div[1]/div[1]/div/div[2]/div[1]/h2/span[1]  Yammer page did not load

User should click Feedback link
    click link  //*/a[text() = "Feedback"]
    select window  url=http://surveys.ge.com/create/212122

User should see "Please provide your feedback here. Include details that help us understand the situation as much as possible."
    sleep  10s
    select window  url=http://surveys.ge.com/create/212122
    log location
    wait until element is visible  xpath=//*/span [contains (text(), "Please provide your feedback here. Include details that help us understand the situation as much as possible.")]


User should see all the contents on the feedback on GE survey page
    select window  url=http://surveys.ge.com/create/212122
    wait until element is visible  xpath=//*/span [contains (text(), "Please provide your feedback here. Include details that help us understand the situation as much as possible.")]
    wait until element is visible  xpath=//*/span [contains (text(), "Which areas of the application does this concern?")]
    wait until element is visible  xpath=//*/span [contains (text(), "(Optional) If you like, you can share a screenshot, email, or anything else that is helpful to attach so we can better understand this situation.")]
    wait until element is visible  xpath=//*/span [contains (text(), " RECOMMEND: How likely is it that you would recommend MOS (Material Optimization Suite) to a colleague?")]
    click element  btn-cancel

User should see Privacy Policy link
    select window  url=${WELCOME.URL}/secure/scheduling
    wait until element is visible  privacy  30s

User click Privacy Policy link
    click element  privacy

User should see "Web Privacy Policy"
    select window  url=https://www.ge.com/privacy
    page should contain  Privacy Policy
    #go to  url=${WELCOME.URL}/secure/scheduling
    select window  url=${WELCOME.URL}/secure/scheduling

User should redirect to service now page And User should see page Title "Enter a Service Now Ticket"
    sleep  5s
    #click element  contactUs
    click link  https://ez-triage.run.aws-usw02-pr.ice.predix.io/secure/submit-ticket
    sleep  5s
    select window  url=https://ez-triage.run.aws-usw02-pr.ice.predix.io/secure/submit-ticket
    element should be visible  //*/h1[text() = "Please tell us more about your MOS incident or change"]  ServiceNow page did not load

Input box with title "Please list Plant(s), Module(s), and/or ERP(s) impacted *"
    ${text1}  get text  //html/body/section/div/div/div/label
    log  ${text1}
    should be equal  ${text1}  Please list Plant(s), Module(s), and/or ERP(s) impacted *
    element should be visible  //html/body/section/div/div/div/input

Input box with title "Please enter description of the issue *"
    ${text2}  get text  //html/body/section/div/div/div[2]/label
    log  ${text2}
    #should be equal  ${text2}  Please tell us more about your MOS Incident or Change*
    should be equal  ${text2}  Description*
    element should be visible  //html/body/section/div/div/div[2]/textarea
Drop down box with title "Business "
    ${text3}  get text  //html/body/section/div/div/div[3]/label
    log  ${text3}
    should be equal  ${text3}  Business *
    element should be visible  //html/body/section/div/div/div[3]/select

Drop down with title "Urgency"
    ${text4}  get text  //html/body/section/div/div/div[4]/label
    log  ${text4}
    should be equal  ${text4}  Urgency
    element should be visible  //html/body/section/div/div/div[4]/select

User should be able to create service now ticket
    input text  //html/body/section/div/div/div/input  po
    input text  //html/body/section/div/div/div[2]/textarea  test testing
    click element  //html/body/section/div/div/div[3]/select
    sleep  3s
    click element  //*[@id='business']//option[@value='GE Healthcare']
    click element  //html/body/section/div/div/div[4]/select
    sleep  3s
    click element  //*[@id="urgency"]//option[@value='2']
    click button  submit
    sleep  14s
User should see service now ticket number with details onit
    element should be visible  //*[@id="details-modal"]/div/div/div[1]/h5
    element should be visible  //*[@id="ticket-number"]
    ${ticket_number}  get text  //*[@id="ticket-number"]
    log  ${ticket_number}
    element should be visible  //*[@id="modal-words"]
    click element  copy-button
    click element  //*[@id="details-modal"]/div/div/div[1]/button
    #element should be visible  //section[@class='section']//h1[contains(normalize-space(), 'Enter a Service Now Ticket')]
    element should be visible  //*/h1[text() = "Please tell us more about your MOS incident or change"]  ServiceNow page did not load

User should switch the focus to MOS
    select window  url=${WELCOME.URL}/secure/scheduling

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})