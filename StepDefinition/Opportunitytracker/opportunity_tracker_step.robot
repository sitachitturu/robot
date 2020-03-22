*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  ../../Utilities/utility.py
Resource  ../../Variables/opportunity_tracker_variable.robot
Resource  ../../StepDefinition/Common/database_step.robot


*** Keywords ***

Click on main_module_tab
    click element  ${Main_Module_Tab}

User click Opportunity tracker icon
    sleep  3s
    Execute JavaScript  window.scrollTo(0, 1500)
    wait until element is visible  ${Opportunity_Tracker_Icon}
    click element  ${Opportunity_Tracker_Icon}

User should see "Opportunity tracker"
    wait until element is visible  ${Opportunity_Tracker_Page_Title}
    ${Opportunity-tracker}  Get Text  ${Opportunity_Tracker_Page_Title}
    log  ${Opportunity-tracker}
    should be equal  ${Opportunity-tracker}   Opportunity Tracker  Either Opportunity Tracker label is absent or incorrect. Please check!
    location should contain  opportunity-tracker


User should see all static labels
    [Arguments]  ${mo-header}  ${footer-text}  ${text}
    ${Extracted mo header}  get text  ${mo header}
    should contain  ${Extracted mo header}  ${mo-header}
#    ${Extracted footer text}  get text  ${footer}
#    should contain  ${Extracted footer text}  ${footer-text}
#    element should be visible  ${predix image}
    ${Extracted_text}  get text  ${Opportunity_Tracker_Page_Title}
    should contain  ${Extracted_text}  ${text}

User should see following business filter
    [Arguments]  ${options}
    wait until element is visible  ${options}
    sleep  2s

User should be able to click on Edit Filter button
    wait until element is visible  ${Edit_Filter_Button}
    sleep  2s
    click element  ${Edit_Filter_Button}

User should be able to see other filter options
    [Arguments]  ${Filter_values}
    ${filter_option}  construct_string_with_argument  ${Edit_Filter_Options}  ${Filter_values}
    wait until element is visible  ${filter_option}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

Select plant filters
    [Arguments]  ${Filter_values}
    ${plant_filter}  construct_string_with_argument  ${Edit_Filter_Options}  ${Filter_values}
    click element  ${plant_filter}

click "Cancel" button
    wait until element is visible  cancel  10s
    click button  cancel

User should see all business filter under Opportunity tracker
    wait until element is visible  ${Plant filter}
    sleep  2s
    wait until element is visible  ${Sub_Business_filter}
    sleep  2s
    wait until element is visible  ${Plant_Business_filter}
    sleep  2s
    wait until element is visible   ${Plant_Category_filter}
    sleep  2s
    wait until element is visible   ${Plant_Region_filter}
    sleep  2s
    wait until element is visible   ${Plant_Modules_filter}
    sleep  2s

User should click on Plant category
    wait until element is visible  ${Plant_Category_Filter}
    sleep  2s
    click element  ${Plant_Category_Filter}

Verify apply button in plant
    [Arguments]  ${Filter_params}
    ${params}  construct_string_with_argument  ${Apply_Button}  ${Filter_params}
    wait until element is visible   ${params}

Verify show selected in plant
    [Arguments]  ${Filter_contents}
    ${contents}  construct_string_with_argument  ${Show_Selected}  ${Filter_contents}

User should click on Plant region
    wait until element is visible  ${Plant_Region_Filter}
    sleep  2s
    click element  ${Plant_Region_Filter}

User should click on Mudules filter
    wait until element is visible  ${Plant_Modules_filter}
    sleep  2s
    click element  ${Plant_Modules_filter}

User should be able to click on Clear Filter button
    wait until element is visible  ${Clear_Filter_Button}
    sleep  2s
    click element  ${Clear_Filter_Button}

User should see only default business filter
    wait until element is visible  ${Plant filter}
    sleep  2s
    wait until element is visible  ${Sub_Business_filter}
    sleep  2s
    wait until element is visible  ${Plant_Business_filter}
    sleep  2s

User should be able to view the export to excel button
    sleep  2s
    wait until element is visible  ${Export_Excel_Button}

