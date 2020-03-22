9/13/2017
212595411

*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  ../../Utilities/utility.py
Resource  ../../Variables/alerts_variables.robot


*** Keywords ***
User click at Alerts icon
    wait until element is visible  ${alers icon}
    click element  ${alers icon}
    wait until element is visible  ${Alerts & Recommendations}
User should see "Alerts & Recommendations" header
    element should be visible  ${Alerts & Recommendations}
User should see gear icon
    element should be visible  ${gear icon}
User should see message "No alerts to show"
    element should be visible  ${message}

User click gear icon
    click element  ${gear icon}
    wait until element is visible  ${Configure Alerts Preferences?}
User should see "Configure Alerts Preferences?" header
    element should be visible  ${Configure Alerts Preferences?}
User should see mesaage "Our alerts feature allows users to receive key insights catered to their needs. Would you like to get started?"
    element should be visible  ${cofigure message}
User should see "Opt out", "Later", "Let's go" button
    element should be visible  ${Opt out}
    element should be visible  ${Later}
    element should be visible  ${Let's go}

User click Let's go button
    click element  ${Let's go}
User should see "Alerts Preferences" header
    element should be visible  ${Alerts Preferences}
User should see "Interest", "Criteria" and "Frequency" tab
    element should be visible  ${Interests}
    element should be visible  ${Criteria}
    element should be visible  ${Frequency}
User should see message "Content Coming Soon"
    element should be visible  ${preference message}
User should see "Alerts on" switch
    element should be visible  ${alers switch}  ${Alerts On}
User should see "Save" and "Apply button"
    element should be visible  ${Save}  ${Continue}
User should see "Close" icon
    element should be visible  ${close}

User click "Alerts on" switch
    element should be visible  ${Alerts On}
    click element  ${alers switch}
User should see "Alerts Off"
    element should be visible  ${alers switch}
    element should be visible  ${Alerts Off}
User Should see "Apply button"
    element should be visible  ${Apply}
    element should not be visible  ${Save}
User click "Apply button"
    click element  ${Apply}
"Alerts Preferences" should not be visible
    element should not be visible  ${Alerts Preferences}

User access "Alerts Preferences"
    click element  ${alers icon}
    click element  ${gear icon}
    click element  ${Let's go}
User click close icon
    click element  ${close}
User should see "Are you sure?" header
    element should be visible  ${Are you sure?}
User should see message "If you exit now, you're changes won't be saved. To turn off alerts, use the slider at the bottom of this modal."
    element should be visible  ${close message}
#    ${message1}  get text  //div[@id='dialog']//div[@id='message']/p
#    log to console  ${message1}
#    should be equal  ${message1}  ${close message}
User click "Cancel Button"
    click element  ${Cancel}
User should see "Alerts Preferences"
    element should be visible  ${Alerts Preferences}
User click "Exit"
    click element  ${close}
    click element  ${Exit}
User should not see "Are you sure?" or "Alerts Preferences"
    element should not be visible  ${Are you sure?}  ${Alerts Preferences}
    element should not be visible  ${Configure Alerts Preferences?}  ${Alerts & Recommendations}
