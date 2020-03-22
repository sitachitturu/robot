*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library	 HttpLibrary.HTTP
Library	 RequestsLibrary
Library  Process
Library  ../../Utilities/utility.py
Resource  ../../Variables/cycle_counting_variables.robot
Resource  ../../StepDefinition/CommonFeatures/database_step.robot


*** Keywords ***
User click Cycle Counting icon
    sleep  5s
    click element  ${Cycle_Counting_Icon}

User should see "Cycle Counting"
    wait until element is visible  ${Cycle_Counting_Page_Title}
    ${Cycle-counting-label}  Get Text  ${Cycle_Counting_Page_Title}
    log  ${Cycle-counting-label}
    should be equal  ${Cycle-counting-label}  Cycle Counting  Either Cycle Counting label is absent or incorrect. Please check!
    location should contain  cycle-counting

Click on main_module_tab
    click element  ${Main_Module_Tab}

User should see all static labels
    [Arguments]  ${mo-header}  ${footer-text}  ${text}
    ${Extracted mo header}  get text  ${mo header}
    should contain  ${Extracted mo header}  ${mo-header}
    ${Extracted footer text}  get text  ${footer}
    should contain  ${Extracted footer text}  ${footer-text}
    element should be visible  ${predix image}
    ${Extracted plant comparison text}  get text  ${Cycle_Counting_Page_Title}
    should contain  ${Extracted plant comparison text}  ${text}

User click plant filter
    wait until element is visible  ${Plant filter}
    click element  ${Plant filter}
    sleep  5s

User click a value in plant filter
    [Arguments]  ${plant-name-plant-short-code}
    ${const_xpath}  construct_string_with_argument  ${Value in plant filter}  ${plant-name-plant-short-code}
    sleep  20s
    log to console  ${const_xpath}
    sleep  10s
    Click Element  ${const_xpath}

User click apply for plant filter
    wait until element is visible  ${Plant filter apply button}
    Click Element  ${Plant filter apply button}
    sleep  5s

User should see selected plant for plant filter
    [Arguments]  ${plant-name-plant-short-code}
    ${plant name from grid}  Get Text  ${Plant name grid}
    log to console  ${plant name from grid}
    should be equal  ${plant name from grid}  ${plant-name-plant-short-code}

Verify the from and to fields under date filter
    wait until element is visible  ${date_filter_from}
    sleep  6s
    wait until element is visible  ${date_filter_from}

Verify the selected plant from grid from UI
    [Arguments]  ${plant-name}
    ${const_xp}  construct_string_with_argument  ${Selected_plant}  ${plant-name}
    sleep  5s
    wait until element is visible  ${const_xp}

User should be able to click on Edit Filter button
    wait until element is visible  ${Edit_Filter_Button}
    sleep  6s
    click element  ${Edit_Filter_Button}

User should see following option under "Cycle Counting" tab
    [Arguments]  ${options}
    sleep  6s
    wait until element is visible  ${options}

User should see following business filter
    [Arguments]  ${options}
    wait until element is visible  ${options}
    sleep  6s

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

User should see the default business filter under Cycle Counting page
    wait until element is visible  ${Plant filter}
    sleep  6s
    wait until element is visible  ${date_filter_from}
    sleep  6s
    wait until element is visible  ${date_filter_to}
    sleep  6s
    Page Should Not Contain Element  ${Plant_Category_Filter}
    sleep  6s
    Page Should Not Contain Element  ${Plant_Region_Filter}
    sleep  6s

User should see all business filter under Cycle Counting page
    wait until element is visible  ${Plant filter}
    sleep  6s
    wait until element is visible  ${date_filter_from}
    sleep  6s
    wait until element is visible  ${date_filter_to}
    sleep  6s
    wait until element is visible   ${Plant_Category_Filter}
    sleep  2s
    wait until element is visible   ${Plant_Region_Filter}
    sleep  6s

User should click on Plant name
    wait until element is visible  ${Plant_Filter}
    sleep  6s
    click element  ${Plant_Filter}

Verify apply button in plant
    [Arguments]  ${Filter_params}
    ${params}  construct_string_with_argument  ${Apply_Button}  ${Filter_params}
    wait until element is visible   ${params}

Verify show selected in plant
    [Arguments]  ${Filter_contents}
    ${contents}  construct_string_with_argument  ${Show_Selected}  ${Filter_contents}

User should click on Plant category
    wait until element is visible  ${Plant_Category_Filter}
    sleep  6s
    click element  ${Plant_Category_Filter}

User should click on Plant region
    wait until element is visible  ${Plant_Region_Filter}
    sleep  6s
    click element  ${Plant_Region_Filter}

Click on Showhide column tab
    Wait Until Element Is Visible  ${Plant_Show_hide_button}  30s
    Click Element  ${Plant_Show_hide_button}
    sleep  6s

User should able to click on options
    [Arguments]  ${Options}
    sleep  6s
    Click Element  ${Options}

User should see the option under date filter
    [Arguments]  ${Date_Filter_values}
    ${filter_option}  construct_string_with_argument  ${Contents_date_filter}  ${Date_Filter_values}

Verify all contents under date filter
    User should see the option under date filter  Current Year
    User should see the option under date filter  Current Quarter
    User should see the option under date filter  1 Quarter Ago
    User should see the option under date filter  2 Quarters Ago
    User should see the option under date filter  3 Quarters Ago
    User should see the option under date filter  4 Quarters Ago
    User should see the option under date filter  Last Calender year

Click on Cancel button under date picker
    click element  ${Button_Cancel_date}

User should see the title under current page
    [Arguments]  ${tilte_values}
    ${Val}  construct_string_with_argument  ${Bar_chart_title_ON_time}  ${tilte_values}

User click on 'On-Time' tab
    Click Element  ${On_time_tab}
    sleep  6s
User should be able to view the gaph by Plant code
    wait until element is visible  ${Bar_graph_by_Plant_code}
    sleep  6s

User should be able to view the gaph by Rolling
    wait until element is visible  ${Bar_graph_by_Rolling}
    sleep  6s

scroll page to location
         [Arguments]  ${x_location}  ${y_location}
         Execute JavaScript  window.scrollTo(${x_location},${y_location})


Verify for years data are present
    connect to database  dbConfigFile=${dbfile}
    ${query1}=  set variable  select count_date from cycle_count_v order by count_date desc limit 1;
    ${queryResults1}  QUERY  ${query1}
    #${latest year}=  ${queryResults1[0][0]}
    #log to console  ${latest year}
    ${query2}=  set variable  select count_date from cycle_count_v order by count_date asc limit 1;
    ${queryResults2}  QUERY  ${query2}
    #${start year}=  ${queryResults2[0][0]}
    #log to console  ${start year}
    log to console  ${queryResults1[0]}
    log to console  ${queryResults2[0]}

    ${diff}  evaluate  ${queryResults1[0]}-${queryResults2[0]}
    log to console  ${diff}




