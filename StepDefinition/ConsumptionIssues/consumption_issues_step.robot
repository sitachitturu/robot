*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  ../../Utilities/utility.py
Resource  ../../Variables/consumption_issues_variables.robot
Resource  ../../StepDefinition/Common/database_step.robot


*** Keywords ***
User click Consumption issues icon
    sleep  3s
    Execute JavaScript  window.scrollTo(0, 1500)
    click element  ${Consumption_Issues_Icon}

User should see "Consumption Issues"
    wait until element is visible  ${Consumption_Issues_Page_Title}
    ${Consumption-issues-label}  Get Text  ${Consumption_Issues_Page_Title}
    log  ${Consumption-issues-label}
    should be equal  ${Consumption-issues-label}  Consumption Issues  Either Cycle Counting label is absent or incorrect. Please check!
    location should contain  consumption-issues

Click on main_module_tab
    click element  ${Main_Module_Tab}

User should see all static labels
    [Arguments]  ${mo-header}  ${footer-text}  ${text}
    ${Extracted mo header}  get text  ${mo header}
    should contain  ${Extracted mo header}  ${mo-header}
    ${Extracted footer text}  get text  ${footer}
    should contain  ${Extracted footer text}  ${footer-text}
    Execute JavaScript  window.scrollTo(15000, 0)
    element should be visible  ${predix image}
    ${Extracted_text}  get text  ${Consumption_Issues_Page_Title}
    should contain  ${Extracted_text}  ${text}

User should see following option under "Consumption Issues" tab
    [Arguments]  ${options}
    sleep  4s
    wait until element is visible  ${options}

User should see following business filter
    [Arguments]  ${options}
    wait until element is visible  ${options}
    sleep  2s

User click plant filter
    wait until element is visible  ${Plant filter}
    click element  ${Plant filter}
    sleep  3s

User click a value in plant filter
    [Arguments]  ${plant-name-plant-short-code}
    ${const_xpath}  construct_string_with_argument  ${Value in plant filter}  ${plant-name-plant-short-code}
    sleep  20s
    log to console  ${const_xpath}
    sleep  5s
    Click Element  ${const_xpath}

User click apply for plant filter
    wait until element is visible  ${Plant filter apply button}
    Click Element  ${Plant filter apply button}
    sleep  3s

Verify the selected plant from grid from UI
    [Arguments]  ${plant-name}
    ${const_xp}  construct_string_with_argument  ${Selected_plant}  ${plant-name}
    sleep  5s
    log to console  ${const_xp}
    wait until element is visible  ${const_xp}  50s

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

User should see the default business filter under Consumption Issues page
    wait until element is visible  ${Plant filter}
    sleep  2s
    Page Should Not Contain Element   ${Planner_MRP_Filter}
    sleep  2s
    Page Should Not Contain Element  ${Plant_Category_Filter}
    sleep  2s
    Page Should Not Contain Element  ${Plant_Business_Filter}
    sleep  2s
    Page Should Not Contain Element  ${Plant_Region_Filter}
    sleep  2s
    Page Should Not Contain Element  ${Plant_Profit_Center_Filter}
    sleep  2s

User should see all business filter under Consumption Issues page
    wait until element is visible  ${Plant_Business_Filter}
    sleep  2s
    wait until element is visible  ${Plant_Filter}
    sleep  2s
    wait until element is visible   ${Plant_Category_Filter}
    sleep  2s
    wait until element is visible   ${Plant_Region_Filter}
    sleep  2s
    wait until element is visible   ${Planner_MRP_Filter}
    sleep  2s
    wait until element is visible   ${Plant_Profit_Center_Filter}
    sleep  2s

User should able to click on options
    [Arguments]  ${Options}
    sleep  5s
    wait until element is visible  ${Options}  30s
    Click Element  ${Options}
    capture page screenshot
    sleep  5s

Verify apply button in plant
    [Arguments]  ${Filter_params}
    ${params}  construct_string_with_argument  ${Apply_Button}  ${Filter_params}
    wait until element is visible   ${params}

Verify show selected in plant
    [Arguments]  ${Filter_contents}
    ${contents}  construct_string_with_argument  ${Show_Selected}  ${Filter_contents}

Validate the Consumption issues and COGI/Hold tabs
    sleep  2s
    wait until element is visible  ${Tab_Consumption_Issues}
    sleep  2s
    wait until element is visible   ${Tab_COGI}

Validate the tabs count and Value under Consumption Issues tab
    sleep  2s
    wait until element is visible  ${Tab_Count_Consumption_Issues}
    sleep  2s
    wait until element is visible   ${Tab_Value_Consumption_Issues}

Validate the tabs count and Value under COGI/Hold tab
    sleep  2s
    wait until element is visible  ${Tab_Count_COGI}
    sleep  2s
    wait until element is visible   ${Tab_Value_COGI}

Verify the "Export to Excel" button under Consumption Issues tab
    sleep  2s
    wait until element is visible  ${Export_Excel_Button_Consumption_issues}
    sleep  2s

#Verify the "Export to Excel" button under tab
#    [Arguments]  ${tab_name}
#    ${Export_button}  construct_string_with_argument  ${Export_Excel_Button}  ${tab_name}
#    wait until element is visible   ${Export_button}

Verify the "Export to Excel" button under tab
    [Arguments]  ${Options}
    sleep  5s
    wait until element is visible  ${Options}
    sleep  2s