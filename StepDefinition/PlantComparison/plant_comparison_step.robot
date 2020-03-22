*** Settings ***
Library     Selenium2Library
Library     String
Library     Collections
Library     ../../Utilities/utility.py
Resource    ../../Variables/plant_comparison_variables.robot
Resource    ../../StepDefinition/Common/database_step.robot

*** Keywords ***
User click Plant Comparison icon
    sleep  3s
    Click Element  ${Plant Comparison Icon}
    sleep  3s

User should see "Plant Comparison"
    wait until element is visible  ${Plant Comparison Page Title}
    ${plant-comparison-label}  Get Text  ${Plant Comparison Page Title}
    log  ${plant-comparison-label}
    should be equal  ${plant-comparison-label}  Plant Comparison  Either plant comaprison label is absent or incorrect. Please check!
    location should contain  plant-comparison

User click plant filter
    wait until element is visible  ${Plant filter}
    click element  ${Plant filter}
    sleep  3s

User click a value in plant filter
    [Arguments]  ${plant-name-plant-short-code}
    ${constructed xpath}  construct_string_with_argument  ${Value in plant filter}  ${plant-name-plant-short-code}
    click element  ${constructed xpath}

User click apply for plant filter
    wait until element is visible  ${Plant filter apply button}
    click element  ${Plant filter apply button}
    sleep  3s

User should see selected plant for plant filter
    [Arguments]  ${plant-name-plant-short-code}
    sleep  5s
    wait until element is visible  ${Plant name grid}  10s
    ${plant name from grid}  get text  ${Plant name grid}
    should be equal  ${plant name from grid}  ${plant-name-plant-short-code}

Extract data from grid for metrics scores
    ${grid data}  create list
    ${ps}  get text  ${grid plant scores}
    ${float plant score}  evaluate  float($ps[0:-1])
    append to list  ${grid data}  ${float plant score}
    ${ss}  get text  ${grid scheduling score}
    ${float scheduling score}  evaluate  float($ss[0:-1])
    append to list  ${grid data}  ${float scheduling score}
    ${pos}  get text  ${grid Purchase orders score}
    ${float purchase order score}  evaluate  float($pos[0:-1])
    append to list  ${grid data}  ${float purchase order score}
    ${rs}  get text  ${grid Requisitions score}
    ${float requisition score}  evaluate  float($rs[0:-1])
    append to list  ${grid data}  ${float requisition score}
    log  ${grid data}
    [Return]  ${grid data}

Extract data from db for metrics scores
    [Arguments]  ${plant code plant short name}
    ${db data}  create list
    User should be able to connect to database
    ${q}=  set variable  select plant_score, scheduling, purchase_orders, requisitions from plant_comparison_trend_v where plant_code_plant_short_name='$' order by processed_timestamp desc limit 1
    ${query}  construct_string_with_argument  ${q}  ${plant code plant short name}
    ${queryResults}  QUERY  ${query}
    ${i}  set variable  0
    :for  ${i}  in range  4
    \   ${val}=  evaluate  round(${queryResults[0][${i}]},1)
#    \   log to console  ${queryResults[0][${i}]}
#    \   ${strVal}=  evaluate  str(${queryResults[0][${i}]})[:4]
#    \   log to console  ${strVal}
#    \   ${val}=  evaluate  float(${strVal})
#    \   log to console  ${val}
    \   append to list  ${db data}  ${val}
    [Return]  ${db data}

Validate plant metrics data
    [Arguments]  ${plant code plant short name}
    ${list from grid}  Extract data from grid for metrics scores
    ${list from db}  Extract data from db for metrics scores  ${plant code plant short name}
    log to console  Logging list from grid....
    log to console  ${list from grid}
    log to console  Logging list from db....
    log to console  ${list from db}
    should be equal  ${list from grid}  ${list from db}

User should see all static labels
    [Arguments]  ${mo-header}  ${footer-text}  ${plant-comparison-text}
    ${Extracted mo header}  get text  ${mo header}
    should contain  ${Extracted mo header}  ${mo-header}
    ${Extracted footer text}  get text  ${footer}
    should contain  ${Extracted footer text}  ${footer-text}
    element should be visible  ${predix image}
    ${Extracted plant comparison text}  get text  ${Plant Comparison Page Title}
    should contain  ${Extracted plant comparison text}  ${plant-comparison-text}

User click business filter
    wait until element is visible  ${Plant business filter}
    click element  ${Plant business filter}
    sleep  5s

User click a value in business filter
    [Arguments]  ${business}
    ${constructed xpath}  construct_string_with_argument  ${Value in business filter}  ${business}
    #click element  ${constructed xpath}
    click element  product-MMF
    sleep  3s

User click apply on business filter
    wait until element is visible  ${Business filter apply button}
    click element  ${Business filter apply button}
    sleep  3s

Extract plant names from grid
    @{plant_names_list}  create list
    @{plant_names}=  get webelements  ${Plant name grid}
    :for  ${i}  in  @{plant_names}
    \  ${txt}=  get text  ${i}
    \  log to console  ${txt}
    \  append to list  @{plant_names_list}  ${txt}
    [Return]  @{plant_names_list}

Extract plant names from db for business
    [Arguments]  ${business_name}
    ${plant_names_list_db}  create list
    User should be able to connect to database
    ${q}=  set variable  select distinct plant_code_plant_short_name from plant_comparison_trend_v where plant_business='$'
    ${query}=  construct string with argument  ${q}  ${business_name}
    ${queryResults}  QUERY  ${query}
    ${len_query_res}  get length  ${queryResults}
    log to console  ${len_query_res}
    ${i}  set variable  0
    :for  ${i}  in range  ${len_query_res}
    \  append to list  ${plant_names_list_db}  ${queryResults[${i}][0]}
    log to console  ${plant_names_list_db}
    [Return]  ${plant_names_list_db}

Validate plants filtered by business
    [Arguments]  ${business_name}
    ${list_from_grid}=  Extract plant names from grid
    ${list_from_db}=  Extract plant names from db for business  ${business_name}
    ${grid_list_len}=  get length  ${list_from_grid}
    ${db_list_length}=  get length  ${list_from_db}
    #${i}  set variable  0
    #:for  ${i}  in range  ${grid_list_len}
    #\  list should contain value  ${list_from_db}  ${list_from_grid}[${i}]
    list should contain sub list  ${list_from_db}  ${list_from_grid}

Click on main_module_tab
    click element  ${Main_Module_Tab}

Verify all plant score in plant comparison page
    wait until element is visible  ${All_Plant_Score}
    sleep  3s

Verify the percent icon under the Plant comparison page
    wait until element is visible  ${Percent_icon}
    sleep  3s

User should see both Score and Opportunity tabs
    wait until element is visible  ${Score_Opportunity_tab_Present}
    sleep  3s

User should see the default business filter under Plant Comparison page
    wait until element is visible  ${Plant_Business_Filter}
    sleep  2s
    wait until element is visible  ${Plant_Filter}
    sleep  2s
    Page Should Not Contain Element  ${Plant_Category_Filter}
    sleep  2s
    Page Should Not Contain Element  ${Plant_Region_Filter}
    sleep  2s

User should see all business filter under Plant Comparison page
    wait until element is visible  ${Plant_Business_Filter}
    sleep  2s
    wait until element is visible  ${Plant_Filter}
    sleep  2s
    wait until element is visible   ${Plant_Category_Filter}
    sleep  2s
    wait until element is visible   ${Plant_Region_Filter}
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

Verify apply button in plant
    [Arguments]  ${Filter_params}
    ${params}  construct_string_with_argument  ${Apply_Button}  ${Filter_params}
    wait until element is visible   ${params}

Verify show selected in plant
    [Arguments]  ${Filter_contents}
    ${contents}  construct_string_with_argument  ${Show_Selected}  ${Filter_contents}

User should click on Plant business
    wait until element is visible  ${Plant_Business_Filter}
    sleep  2s
    click element  ${Plant_Business_Filter}

User should click on Plant name
    wait until element is visible  ${Plant_Filter}
    sleep  2s
    click element  ${Plant_Filter}

User should click on Plant category
    wait until element is visible  ${Plant_Category_Filter}
    sleep  2s
    click element  ${Plant_Category_Filter}

User should click on Plant region
    wait until element is visible  ${Plant_Region_Filter}
    sleep  2s
    click element  ${Plant_Region_Filter}

Click on Score tab
    Wait Until Element Is Visible  ${Plant_Score_Show_Hide_Button}
    Click Element  ${Plant_Score_Show_Hide_Button}
    sleep  2s

Click on Opportunity tab
    Wait Until Element Is Visible  ${Plant_Opportunity_Show_Hide_Button}
    Click Element  ${Plant_Opportunity_Show_Hide_Button}
    sleep  2s

Click on Showhide column tab
    Wait Until Element Is Visible  ${Plant_Show_hide_button}
    Click Element  ${Plant_Show_hide_button}
    sleep  2s

User should able to see list of columns in show/hide columns button-Score tab
    element should be visible  ${showhide_PlantName}
    element should be visible  ${showhide_PlantScore}
    element should be visible  ${Score_showhide_Scheduling}
    element should be visible  ${Score_showhide_PurchaseOrders}
    element should be visible  ${Score_showhide_Requisitions}
    element should be visible  ${Score_showhide_12-month-smi}
    element should be visible  ${Score_showhide_Variation_to_entitlement}
    element should be visible  ${Score_showhide_CC Accuracy}
    element should be visible  ${Score_showhide_CC Ontime}
    #element should be visible  ${Score_showhide_MasterData}
    #element should be visible  ${Score_showhide_Inventory}  These label doesn't exist anymore.
    #element should be visible  ${Score_showhide_Trending}

User should able to see list of columns in show/hide columns button-Opportunity tab
    Wait Until Element Is Visible  ${Opportunity_showhide_button}
    Click Element  ${Opportunity_showhide_button}
    sleep  2s
    element should be visible  ${showhide_PlantName}
    element should be visible  ${showhide_PlantScore}
    element should be visible  ${Opportunity_purchase_order_live_opp}
    element should be visible  ${Opportunity_purchased_order_realized_opp}
    element should be visible  ${Opportunity_purchase_order_missed}
    element should be visible  ${Opportunity_scheduling_live_opp}
    element should be visible  ${Opportunity_scheduling_missed_opp}
    element should be visible  ${Opportunity_scheduling_realized_opp}
    element should be visible  ${Opportunity_total_live_opp}















