*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Variables/receipt_optamization_variables.robot
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource    ../../Variables/plant_comparison_variables.robot
Resource  ../../Variables/cycle_counting_variables.robot
Resource  ../../Variables/stock_policy_dashboard_variables.robot
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/inventory_entitlement_variables.robot
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Variables/consumption_issues_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
      click link  ${link}
      sleep  20s
    # wait until element is visible  ${show/hide column}  10s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

show/hide list from ui show/hide columns
      ${show/hide col. ui}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#safetyStockTable').shadowRoot.querySelector('#oppRejGrid').shadowRoot.querySelector('#showHideModule').shadowRoot.querySelector('#mos-show-hide-container > button');return x;
      log  ${show/hide col. ui}
      set global variable  ${show/hide col. ui}
      #wait until element is visible  ${show/hide col. ui}  40s
      click element  ${show/hide col. ui}          #${show/hide column}
      sleep  5s
      ${show/hide column list..}  execute javascript  var s=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#safetyStockTable').shadowRoot.querySelector('#oppRejGrid').shadowRoot.querySelector('#showHideModule').shadowRoot.querySelector('#gridContainer > ul');return s;
      log  ${show/hide column list..}
      ${list}  get text  ${show/hide column list..}
      log  ${list}
      set global variable  ${list}
      click element  ${show/hide col. ui}


click show/hide column button and user should see list of columns for products in show/hide columns in scheduling module
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     RUN KEYWORD  scroll page to location  0  100000
     sleep  5s
     ${show/hide_content}  get text  ${show/hide column list}
     log  ${show/hide_content}
     [Tags]    test text
     ${TextFileContent}  get file  ${Scheduling_products_show/hide_col}
     log  ${TextFileContent}
     should be equal  ${show/hide_content}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s

click show/hide column button and user should see list of columns for projects in show/hide columns in scheduling module
     run keyword  scroll page to location  100000  0
     wait until element is visible  //px-tab[@id='tab2']/div[@id='tabtitle']  20s
     click element  //px-tab[@id='tab2']/div[@id='tabtitle']
     sleep  5s
     wait until element is visible  ${show/hide column}  30s
     click element  ${show/hide column}
     RUN KEYWORD  scroll page to location  0  100000
     sleep  10s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${Scheduling_projects_show/hide_col}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns in purchase_req module
      run keyword  show/hide list from ui show/hide columns
      [Tags]    test text
     ${TextFileContent}  get file  ${purchase_requi_show/hide_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns in purchase orders module
     RUN KEYWORD  scroll page to location  0  1000000
     sleep  4s
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${PO_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should see Show/Hide Columns button
      wait until element is visible  ${show/hide col. ui}  10s
      ${title}  get text  ${show/hide col. ui}
      log  ${title}
      should be equal  ${title}  Show/Hide Columns
      [Return]  ${title}

user should see list of columns in show/hide columns for receipt_optimization module
     run keyword  show/hide list from ui show/hide columns
     [Tags]  test text
     ${TextFileContent}  get file  ${receipt_opt_show/hide_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click on trending icon in executive summary score card in executive summary module
      wait until element is visible  ${purchase orders score card}  20s
      ${title}  get text  ${purchase orders score card}
      log  ${title}
      click element  ${purchase orders score card}
      wait until element is visible  trend_title  20s

click show/hide column button and user should see list of columns in show/hide columns in executive summary module
      sleep  5s
      wait until element is visible  ${show/hide column}  40s
      scroll page to location  0  100000
      sleep  2s
      click element  ${show/hide column_po_scorecard}
      sleep  8s
      ${list}  get text  ${show/hide column list}
      log  ${list}
      set global variable  ${list}
      [Tags]    test text
      ${TextFileContent}  get file  ${PO-Score-Card-Show/hide-list}
      Log    ${TextFileContent}
      should be equal  ${list}  ${TextFileContent}

User should able to see list of columns in show/hide columns button-Score tab in plant comparison module
    click element  ${show/hide column}
    wait until element is visible  ${showhide_PlantName}  10s
    element should be visible  ${showhide_PlantName}
    element should be visible  ${showhide_PlantScore}
    element should be visible  ${Score_showhide_Scheduling}
    element should be visible  ${Score_showhide_PurchaseOrders}
    element should be visible  ${Score_showhide_Requisitions}
    element should be visible  ${Score_showhide_12-month-smi}
    element should be visible  ${Score_showhide_Variation_to_entitlement}
    element should be visible  ${Score_showhide_CC Accuracy}
    element should be visible  ${Score_showhide_CC Ontime}

click show/hide column button and user should see list of columns in show/hide columns in cycle counting module
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${accuracy_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User should click show/hide button in 'On-Time'
     Click Element  ${On_time_tab}
     sleep  10s
     wait until element is visible  ${on_time_Show_hide_button}  20s
     click element  ${on_time_Show_hide_button}
     sleep  15s

click show/hide column button and user should see list of columns in show/hide columns on-time
     ${list}  get text  ${show/hide col list for ontime_cycle}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${Show/Hide_col_On-time_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

User click on view detalis safety stock view details..
      #mouse over  //*[@id="totalOpportunities"]/h2
      #element should be visible  ${safety_stock bar chart}
      ${view_details for ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(3) > h2 > a');return x;
      log  ${view_details for ss}
      set global variable  ${view_details for ss}
      click element  ${view_details for ss}  #${view_details for ss}
      sleep  13s

User click on view detalis ROP view details..
     ${view_details for rop..}  execute javascript  var s=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(4) > h2 > a');return s;
     set global variable  ${view_details for rop..}

User click on view detalis MOQ view details..
    ${view_details for MOQ..}  execute javascript  var s=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(5) > h2 > a');return s;
     set global variable  ${view_details for MOQ..}

User click on view detalis ABC view details..
     ${view_details for ABC...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(6) > h2 > a');return x;
     set global variable  ${view_details for ABC...}

user should see list of columns in show/hide columns in "${oppo.page}" opportunities details page
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_oppo_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     ${rejected tab..}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#safetyStockTable').shadowRoot.querySelector('#oppRejGrid').shadowRoot.querySelector('#plain-tabs > paper-tab:nth-child(2)'); return x;
     set global variable  ${rejected tab..}

user see rejected tab for rop
    ${rejected tab.. for rop}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#safetyStockTable').shadowRoot.querySelector('#oppRejGrid').shadowRoot.querySelector('#plain-tabs > paper-tab:nth-child(2)'); return x;
     set global variable  ${rejected tab.. for rop}

user see rejected tab for MOQ
     ${rejected tab.. for moq}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#safetyStockTable').shadowRoot.querySelector('#oppRejGrid').shadowRoot.querySelector('#plain-tabs > paper-tab:nth-child(2)'); return x;
     set global variable  ${rejected tab.. for moq}

user see rejected tab for abc
     ${rejected tab.. for abc}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#safetyStockTable').shadowRoot.querySelector('#oppRejGrid').shadowRoot.querySelector('#plain-tabs > paper-tab:nth-child(2)'); return x;
     set global variable  ${rejected tab.. for abc}

user should see list of columns in show/hide columns in Rop opportunities details page
      run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_rop_oppo_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

user should see list of columns in show/hide columns in Rop opportunities details page for rejected
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_rop_rejected_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     ${back button SS Dashboard from rop oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
     set global variable  ${back button SS Dashboard from rop oppo...}

user should see list of columns in show/hide columns in "${oppo.page}" opportunities details page for rejected
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_oppo_rejected_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     ${back button SS Dashboard from SS oppo...}  execute javascript  var s=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return s;
     set global variable  ${back button SS Dashboard from SS oppo...}

user should see list of columns in show/hide columns in Moq opportunities details page
      run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_moq_oppo_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

user should see list of columns in show/hide columns in Moq opportunities details page for rejected
      run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_moq_rejected_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     ${back button SS Dashboard from MOQ oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
     set global variable  ${back button SS Dashboard from MOQ oppo...}

user should see list of columns in show/hide columns in ABC opportunities details page
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_ABC_oppo_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

user should see list of columns in show/hide columns in ABC opportunities details page for rejected
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${stock_policy_ABC_rejected_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     ${back button SS Dashboard from ABC oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
     set global variable  ${back button SS Dashboard from ABC oppo...}

click show/hide column button and verify list of columns in ui list with saved columns textfile for opportunities grid in MT module
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${MT_OPPO._show/hide_col}
     log  ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s

click show/hide column button and verify list of columns in ui list with saved columns textfile for opportunities grid in MT module for buying
     wait until element is visible  ${show/hide column for buying grid}  40s
      click element  ${show/hide column for buying grid}
      sleep  5s
      ${list}  get text  ${show/hide column list}
      log  ${list}
      set global variable  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MT_OPPO.buyer _show/hide_col}
     log  ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s

click show/hide column button and verify list of columns in ui list with saved columns textfile for Rejected grid in MT module
     sleep  4s
     wait until element is visible  ${show/hide column for rejectedfor seller/buyer}   30s
     click element  ${show/hide column for rejectedfor seller/buyer}
     sleep  4s
     ${list}  get text  ${show/hide column list for rejected for seller ui}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${show/hide column list for rejected for seller}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and verify list of columns in ui list with saved columns textfile for Rejected grid in MT module for buyer
     sleep  4s
     wait until element is visible  ${show/hide column for rejectedfor buyer}   30s
     click element  ${show/hide column for rejectedfor buyer}
     sleep  4s
     ${list}  get text  ${show/hide column list for rejected for buyer ui}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${MT_rejected.buyer _show/hide_col}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns for inventory module
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${InvEntitlement_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns on details view for LTA
    run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${lead_time_details_view_show/hide_list}
     Log    ${TextFileContent}
     click element  ${show/hide column}
     should be equal  ${list}  ${TextFileContent}

user should see aggregated tab and click on it and click show/hide column button and user should see list of columns in show/hide columns for Aggregated view for Lta
     scroll page to location  0  100000000
     click element  ${aggregated_btn}
#     click element  plant
#     input text  search-input  110g
#     click element  searchAction
#     sleep  12s
#     click element  110G - Birr Factory
#     wait until element is visible  ${plant_apply_button}  20s
#     click element  ${plant_apply_button}
#     sleep  40s
     scroll page to location  0  10000000
     sleep  45s
     click element  //mo-lead-time/div/mo-grid[2]/div/div[4]/mo-show-hide/div/button
     sleep  3s
     ${list}  get text  ${agregated_show_hide_list_ui}
      log  ${list}
      set global variable  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${lead_time_Aggregated_view_show/hide_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns under Consumption Issues tab
     sleep  4s
     scroll page to location  0  1000000
     sleep  4s
     ${list}  get text  ${show/hide column list}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${consumption_Show/Hide_col_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns under COGI/Hold tab
      sleep  5s
      scroll page to location  0  1000000
      sleep  4s
     ${list}  get text  ${show/hide column list_COGI}
     log  ${list}
     [Tags]    test text
     ${TextFileContent}  get file  ${PO_Show/Hide_col_COGI_list}
     Log    ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}

click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in purchase order summary view all "${tab}"
      run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${Bcc_po_summary_OPPO._show/hide_col}
     log  ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s

click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in Inventory&Cash Opportunities view all "${tab}"
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${Bcc_inventory_OPPO._show/hide_col}
     log  ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s

click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in overdue+resvhdeule in Opportunities view all "${tab}"
      run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${Bcc_ioverdue+resvhdeule in_OPPO._show/hide_col}
     log  ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s

click show/hide column button and user should see list of columns in show/hide columns in buyer-control-center module in requisitions Opportunities view all "${tab}"
     run keyword  show/hide list from ui show/hide columns
     [Tags]    test text
     ${TextFileContent}  get file  ${Bcc_requisitions_OPPO._show/hide_col}
     log  ${TextFileContent}
     should be equal  ${list}  ${TextFileContent}
     click element  ${show/hide column}
     sleep  3s