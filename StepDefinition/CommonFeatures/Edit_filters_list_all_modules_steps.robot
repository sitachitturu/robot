*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  RequestsLibrary
Library  DatabaseLibrary
Library  Process
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/cycle_counting_variables.robot
Resource  ../../Variables/stock_policy_variables.robot
Resource  ../../Variables/bcc_variables.robot

*** Keywords ***
User access "${link}" module
      click link  ${link}
      sleep  40s

User should see Add Filters button
      ${addFilterBtn..}  execute javascript  var a=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('header > div > button.filter--controls-add');return a;
      log  ${addFilterBtn..}
      set global variable  ${addFilterBtn..}
      wait until element is visible  ${addFilterBtn..}

edit filters list for scheduling
      ${Expected labels for edit filter checkboxes}=  create list  Plant  Final Exception Message  Exception Requires Action  Planner / MRP Controller  Buyer / Purchasing Group  Order Type  Plant Category  Plant Region  Plant Business  Sub Business  Product Hierarchy  Procurement Type  Material Description   Order Status  Storage Location  Current Finish Date   Ideal Finish Date  Profit Center  Project Code  Project Name  Account Assign. Category  Special Procurement   Material Type / Item Type   Material SKU  Action
      set global variable  ${Expected labels for edit filter checkboxes}
      @{labels from edit filter checkboxes}=  get webelements  ${Edit filters checkbox labels}
      set global variable  @{labels from edit filter checkboxes}
      ${Edit filters checkbox strings}  create list
      set global variable  ${Edit filters checkbox strings}

User should see proper labels in editfilters
        ${i}  set variable  0
        :FOR  ${i}  IN  @{labels from edit filter checkboxes}
        \   ${str}=  get text  ${i}
        \   log to console  ${str}
        \   append to list  ${Edit filters checkbox strings}  ${str}

        ${j}  set variable  0
        :FOR  ${j}  IN  ${Expected labels for edit filter checkboxes}
        \   should contain  ${Edit filters checkbox strings}  ${j}

select all existing filters from editfilters and click continue button for scheduling
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${Procurement Type filter}
    run keyword and continue on failure  click element  ${Material Description filter}
    run keyword and continue on failure  click element  ${Order Status filter}
    run keyword and continue on failure  click element  ${Storage Location filter}
    run keyword and continue on failure  click element  ${Current Finish Date filter}
    run keyword and continue on failure  click element  ${Ideal Finish Date filter}
    run keyword and continue on failure  click element  ${Profit Center filter}
    run keyword and continue on failure  click element  ${project_name_filter}
    run keyword and continue on failure  click element  ${project_code_filter}
    run keyword and continue on failure  click element  ${acct_assign_cat_filter_Sched}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${Special Procurement filter}
    run keyword and continue on failure  click element  ${Material Type / Item Type filter}
    run keyword and continue on failure  click element  ${Product Hierarchy filter}
    run keyword and continue on failure  click element  ${Material SKU filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue
    sleep  4s

user should see all selected filters from edit filters in ui for scheduling module
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  exp_action
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  record_type
     run keyword and continue on failure  element should be visible  profit_center
     run keyword and continue on failure  element should be visible  user_actions
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  ptype
     run keyword and continue on failure  element should be visible  material_descr
     run keyword and continue on failure  element should be visible  status
     run keyword and continue on failure  element should be visible  sloc
     run keyword and continue on failure  element should be visible  cfd
     run keyword and continue on failure  element should be visible  ifd
     run keyword and continue on failure  element should be visible  profit_center
     run keyword and continue on failure  element should be visible  project_code
     run keyword and continue on failure  element should be visible  project_name
     run keyword and continue on failure  element should be visible  acct_assign_cat
     run keyword and continue on failure  element should be visible  special_procurement
     run keyword and continue on failure  element should be visible  material_type
     run keyword and continue on failure  element should be visible  //mm-global-filter[@id='globalFilter']/mm-filter[@id='sku']
     run keyword and continue on failure  element should be visible  //mm-global-filter[@id='globalFilter']/mm-filter[@id='hierarchy']
     run keyword and continue on failure  element should be visible  user_actions

open edit filters and click cancel button user should not see edit filters popup from ui
     click element  ${add filter button}
     ${cancel_button_edit_filters_polymer}  execute javascript  var cancel=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#addRemoveOverlay').shadowRoot.querySelector('#cancel');return cancel;
     set global variable  ${cancel_button_edit_filters_polymer}
     click button  ${cancel_button_edit_filters_polymer}
     ${edit filters overlay}  execute javascript  var overlay=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#addRemoveOverlay');return overlay;
     set global variable  ${edit filters overlay}
     sleep  3s
     element should not be visible  ${edit filters overlay}

edit filters list for purchasing
     @{Expected labels for edit filter checkboxes}=  create list  Plant  Buyer / Purchasing Group  Source/Vendor  Planner / MRP Controller  Material SKU  Plant Category  Plant Region  Plant Business  Sub Business  Project Code  Short Cycle  Procurement Type  Profit Center  Aging Buckets  Order Type  Purchase Org Code  WBS Element  Purchase Org Name  Account Assign. Category  Account Assign. Category  Authorization Status  PR Type  Requisition Date
      @{labels from edit filter checkboxes}=  get webelements  ${Edit filters checkbox labels}
      ${Edit filters checkbox strings}  create list
      set global variable  ${Edit filters checkbox strings}

select all existing filters from editfilters and click continue button for purchasing
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${Source/Vendor filter}
    run keyword and continue on failure  click element  ${Material SKU filter}
    run keyword and continue on failure  click element  ${planner/Mrp Controller filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${Project Code filter}
    run keyword and continue on failure  click element  ${Short Cycle filter}
    run keyword and continue on failure  click element  ${Procurement Type filter}
    run keyword and continue on failure  click element  ${Profit Center filter}
    run keyword and continue on failure  click element  ${Aging Bucket filter}
    run keyword and continue on failure  click element  ${porg_name_filter}
    run keyword and continue on failure  click element  ${Purchase Org Code filter}
    run keyword and continue on failure  click element  ${Authorization Status filter}
    run keyword and continue on failure  click element  ${wbs_filter}
    run keyword and continue on failure  click element  ${acct_assign_cat_filter}
    run keyword and continue on failure  click element  ${pr_type filter_edit_filters}
    run keyword and continue on failure  click element  ${Requisition Date filter}

    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

User check check box with "PR Type" name
    wait until element is visible  ${pr_type_filter}  10s
    click element  ${pr_type_filter}

click "Continue"
    wait until element is visible  continue  10s
    click button  continue

user should see all selected filters from edit filters in ui for purchasing module
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  source
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  sku
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  order_type
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  project_code
     run keyword and continue on failure  element should be visible  porg_code
     run keyword and continue on failure  element should be visible  porg_name
     run keyword and continue on failure  element should be visible  wbs
     run keyword and continue on failure  element should be visible  account_cat
     run keyword and continue on failure  element should be visible  authorization_status
     run keyword and continue on failure  element should be visible  pr_type
     run keyword and continue on failure  element should be visible  requisition_created_date

edit filters list for purchase orders
     @{Expected labels for edit filter checkboxes}=  create list  Plant  Buyer / Purchasing Group  PO Created By Username  Source/Vendor  Final Exception Message  Planner / MRP Controller  Plant Category  Plant Region  Plant Business  Sub Business  Exception Requires Action  Short Cycle  Procurement Type  Ideal Finish Date  Profit Center  Aging Buckets  Project Code  Purchase Org Code  WBS Element  Purchase Org Name   Project Name  Account Assign. Category  Purchasing Document Type  PO Type  PO Action  PO Line Status   Material SKU  Production / Work Order  PO Number  Incoterms – Header   Incoterms – Line
      @{labels from edit filter checkboxes}=  get webelements  ${Edit filters checkbox labels}
      ${Edit filters checkbox strings}  create list
      set global variable  ${Edit filters checkbox strings}

select all existing filters from editfilters and click continue button for purchase orders
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${Source/Vendor filter}
    run keyword and continue on failure  click element  ${PO Created By Username filter}
    run keyword and continue on failure  click element  ${final_exception_message_filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${Exception Requires Action filter}
    run keyword and continue on failure  click element  ${Short Cycle filter}
    run keyword and continue on failure  click element  ${Procurement Type filter}
    run keyword and continue on failure  click element  ${PO Ideal Finish Date filter}
    run keyword and continue on failure  click element  ${Aging Bucket filter PO}
    run keyword and continue on failure  click element  ${Purchase Org Code filter}
    run keyword and continue on failure  click element  ${Purchase Org Name filter}
    run keyword and continue on failure  click element  ${Project Code filter}
    run keyword and continue on failure  click element  ${Project Name filter}
    run keyword and continue on failure  click element  ${WBS Element filter}
    run keyword and continue on failure  click element  ${Account Assign. Category filter}
    run keyword and continue on failure  click element  ${Purchasing Document Type filter}
    run keyword and continue on failure  click element  ${PO Type filter}
    run keyword and continue on failure  click element  ${PO Line Status filter}
    run keyword and continue on failure  click element  ${Material SKU filter}
    run keyword and continue on failure  click element  ${Production / Work Order filter}
    run keyword and continue on failure  click element  ${Incoterms – Header filter}
    run keyword and continue on failure  click element  ${Incoterms – Line filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for purchase orders
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  po_created_by_username
     run keyword and continue on failure  element should be visible  source
     run keyword and continue on failure  element should be visible  exp
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  sku
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  exp_action
     run keyword and continue on failure  element should be visible  sc
     run keyword and continue on failure  element should be visible  ptype
     run keyword and continue on failure  element should be visible  processed_date
     run keyword and continue on failure  element should be visible  profit_center
     run keyword and continue on failure  element should be visible  ovd_days_range
     run keyword and continue on failure  element should be visible  project_code
     run keyword and continue on failure  element should be visible  porg_code
     run keyword and continue on failure  element should be visible  porg_name
     run keyword and continue on failure  element should be visible  project_name
     run keyword and continue on failure  element should be visible  po_wbs
     run keyword and continue on failure  element should be visible  account_assign_cat
     run keyword and continue on failure  element should be visible  purchasing_document_type
     run keyword and continue on failure  element should be visible  po_type
     run keyword and continue on failure  element should be visible  //mm-global-filter[@id='globalFilter']/mm-filter[@id='action_description']
     run keyword and continue on failure  element should be visible  //mm-global-filter[@id='globalFilter']/mm-filter[@id='code']
     run keyword and continue on failure  element should be visible  order_number
     run keyword and continue on failure  element should be visible  //mm-global-filter[@id='globalFilter']/mm-filter[@id='purchase_order_number']
     run keyword and continue on failure  element should be visible  incoterms_header
     run keyword and continue on failure  element should be visible  incoterms_line

select all existing filters from editfilters and click continue button for plant-comparison
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for "${module}"
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business

select all existing filters from editfilters and click continue button for executive_summary
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

select all existing filters from editfilters and click continue button for receipt-optimization
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for receipt-optimization
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  pgroup
   run keyword and continue on failure  element should be visible  source
   run keyword and continue on failure  element should be visible  profit_center
   run keyword and continue on failure  element should be visible  mrpc

select all existing filters from editfilters and click continue button for Master_Data
   click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${Material Type / Item Type filter}
    run keyword and continue on failure  click element  ${Plant Sp Matl Status filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for Master_Data
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  material_type
   run keyword and continue on failure  element should be visible  psms

select all existing filters from editfilters and click continue button for material_creation_monitor
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${material_type_filter_mcm}
    run keyword and continue on failure  click element  ${Plant Sp Matl Status filter}
    run keyword and continue on failure  click element  ${Aging Bucket filter_mcm}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${planner/Mrp Controller filter}
    run keyword and continue on failure  click element  ${Buyer/Purch.Group filter}
    run keyword and continue on failure  click element  ${Production Supervisor filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for material_creation_monitor
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  pgroup
   run keyword and continue on failure  element should be visible  mrpc
   run keyword and continue on failure  element should be visible  type
   run keyword and continue on failure  element should be visible  psms
   run keyword and continue on failure  element should be visible  supervisor
   run keyword and continue on failure  element should be visible  bucket

select all existing filters from editfilters and click continue button for cycle-counting_accuracy
    click element  addFilterBtn
    sleep  3s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${Storage Location filter_cycle_counting}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  element should be visible  ${count_date_filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for cycle-counting_accuracy
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  pgroup
   run keyword and continue on failure  element should be visible  mrpc
   run keyword and continue on failure  element should be visible  location
   run keyword and continue on failure  element should be visible  profit_center

User click ontime tab in cycle counting module
     wait until element is visible  ${ontime_tab}  10s
     click element  ${ontime_tab}
     sleep  3s

select all existing filters from editfilters and click continue button for cycle-counting_Ontime
     click element  addFilterBtn
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${Storage Location filter_cycle_counting}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  element should be visible  ${count_date_filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue


user should see all selected filters from edit filters in ui for cycle-counting_Ontime
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  pgroup
   run keyword and continue on failure  element should be visible  mrpc
   run keyword and continue on failure  element should be visible  location
   run keyword and continue on failure  element should be visible  profit_center

select all existing filters from editfilters and click continue button for stock-policy-dashboard
     ${add filter button}  execute javascript  var x=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('header > div > button.filter--controls-add');return x;
     log  ${add filter button}
     set global variable  ${add filter button}
     click element  ${add filter button}
      sleep  4s
      ${continue button from edit filters}  execute javascript  var v=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#addRemoveOverlay').shadowRoot.querySelector('#continue');return v;
      log  ${continue button from edit filters}
      set global variable  ${continue button from edit filters}
     run keyword and continue on failure  click button  ${continue button from edit filters}

user should see all selected filters from edit filters in ui for stock-policy-dashboard
    ${plant_polymer}  execute javascript  var plant=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#plant').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return plant;
    set global variable  ${plant_polymer}
    ${plant_region_polymer}  execute javascript  var region=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#region').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return region;
    set global variable  ${plant_region_polymer}
    ${plant_business_polymer}  execute javascript  var business=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return business;
    set global variable  ${plant_business_polymer}
    ${sub_business_polymer}  execute javascript  var sub=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#sub_business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return sub;
    set global variable  ${sub_business_polymer}
    ${buyer/purch.group_polymer}  execute javascript  var buyer=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#pgroup').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return buyer;
    set global variable  ${buyer/purch.group_polymer}
    ${planner/mrp_polymer}  execute javascript  var planner=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#mrpc').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return planner;
    set global variable  ${planner/mrp_polymer}
    ${profit_center_polymer}  execute javascript  var profit=document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#pcenter').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span');return profit;
    set global variable  ${profit_center_polymer}
    run keyword and continue on failure  element should be visible  ${plant_polymer}
    run keyword and continue on failure  element should be visible  ${plant_region_polymer}
    run keyword and continue on failure  element should be visible  ${plant_business_polymer}
    run keyword and continue on failure  element should be visible  ${sub_business_polymer}
    run keyword and continue on failure  element should be visible  ${buyer/purch.group_polymer}
    run keyword and continue on failure  element should be visible  ${planner/mrp_polymer}
    run keyword and continue on failure  element should be visible  ${profit_center_polymer}

select all existing filters from editfilters and click continue button for "${details_page}" in stock policy
   click element  ${add filter button}
   sleep  8s
    #run keyword and continue on failure  click element  ${vendor_name filter}
    #run keyword and continue on failure  click element  ${Spend - Frequency filter}
    wait until element is visible  ${continue button from edit filters}  10s
    run keyword and continue on failure  click button  ${continue button from edit filters}

user should see all selected filters from edit filters in ui for "${details}" in stock policy
    run keyword and continue on failure  element should be visible  ${plant_polymer}
    run keyword and continue on failure  element should be visible  ${plant_region_polymer}
    run keyword and continue on failure  element should be visible  ${plant_business_polymer}
    run keyword and continue on failure  element should be visible  ${sub_business_polymer}
    run keyword and continue on failure  element should be visible  ${buyer/purch.group_polymer}
    run keyword and continue on failure  element should be visible  ${planner/mrp_polymer}
    run keyword and continue on failure  element should be visible  ${profit_center_polymer}
   #run keyword and continue on failure  element should be visible  sku
   #run keyword and continue on failure  element should be visible  vendorName
   #run keyword and continue on failure  element should be visible  categorization

User click safety stock details veiw all
     ${view_details for ss}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(3) > h2 > a');return x;
      log  ${view_details for ss}
      click element  ${view_details for ss}  #${view_details for ss}
      sleep  13s

User click ROP opportunities details veiw all
    ${view_details for rop..}  execute javascript  var s=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(4) > h2 > a');return s;
    click element  ${view_details for rop..}
    sleep  10s

User click moq opportunities details veiw all
    ${view_details for MOQ..}  execute javascript  var s=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(5) > h2 > a');return s;
    click element  ${view_details for MOQ..}
    sleep  10s

User click ABC opportunities details veiw all
    ${view_details for ABC...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('section:nth-child(6) > h2 > a');return x;
    click element  ${view_details for ABC...}
    sleep  10s

click back button SS Dashboard from SS oppo
    ${back button SS Dashboard from ss oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
    CLICK ELEMENT  ${back button SS Dashboard from ss oppo...}

click back button SS Dashboard from rop oppo
    ${back button SS Dashboard from rop oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
     click element  ${back button SS Dashboard from rop oppo...}

click back button SS Dashboard from MOQ oppo
    ${back button SS Dashboard from MOQ oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
     click element  ${back button SS Dashboard from MOQ oppo...}

click back button SS Dashboard from ABC oppo
    ${back button SS Dashboard from ABC oppo...}  execute javascript  var x=document.querySelector('body > mos-module-stock-policy-dashboard > div > div > mo-stock-policy-dashboard').shadowRoot.querySelector('mo-safety-stock-opp').shadowRoot.querySelector('#backToDashBtn');return x;
     click element  ${back button SS Dashboard from ABC oppo...}

User should see Edit filters button
    wait until element is visible  addFilterBtn  20s
select all existing filters from editfilters and click continue button for material-transfer
    click element  addFilterBtn
    run keyword and continue on failure  element should be visible  ${plant Business filter}
   run keyword and continue on failure  element should be visible  ${sub_business_filter}
   run keyword and continue on failure  element should be visible  ${plant filter}
   run keyword and continue on failure  element should be visible  ${order_type_mto}
   run keyword and continue on failure  element should be visible  ${planner/Mrp Controller filter}
   run keyword and continue on failure  element should be visible  buyer
   run keyword and continue on failure  click element  ${Profit Center filter}
   run keyword and continue on failure  element should be visible  ${Material SKU filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for material-transfer
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  order_type
   run keyword and continue on failure  element should be visible  buyer
   run keyword and continue on failure  element should be visible  sku
   run keyword and continue on failure  element should be visible  mrpc
   run keyword and continue on failure  element should be visible  profit_center

select all existing filters from editfilters and click continue button for inventory-entitlement
   click element  addFilterBtn
   run keyword and continue on failure  click element  ${sub_business_filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for inventory-entitlement
   run keyword and continue on failure  element should be visible  plant
   run keyword and continue on failure  element should be visible  business
   run keyword and continue on failure  element should be visible  pcat
   run keyword and continue on failure  element should be visible  sub_business
   run keyword and continue on failure  element should be visible  pgroup
   run keyword and continue on failure  element should be visible  sku
   run keyword and continue on failure  element should be visible  mrpc
   run keyword and continue on failure  element should be visible  region
   run keyword and continue on failure  element should be visible  pcenter

select all existing filters from editfilters and click continue button for Lead-Time-Analytics
    click element  addFilterBtn
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for Lead-Time-Analytics
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  sku
     run keyword and continue on failure  element should be visible  source_vendor
     run keyword and continue on failure  element should be visible  outlier
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  mrpc

select all existing filters from editfilters and click continue button for consumption-issues
    click element  addFilterBtn
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${Plant Sp Matl Status filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for consumption-issues
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  profit_center
     run keyword and continue on failure  element should be visible  psms
     run keyword and continue on failure  element should be visible  pgroup

select all existing filters from editfilters and click continue button for buyer_control_center
    click element  addFilterBtn
    sleep  2s
    run keyword and continue on failure  click element  ${sub_business_filter}
    ##run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${Source/Vendor filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for buyer_control_center
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  exp_action
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  source
     run keyword and continue on failure  element should be visible  profit_center

User click on view all tab on po summary grid
     wait until element is visible  ${po_summary_grid_view_all}  20s
     click element  ${po_summary_grid_view_all}
     sleep  4s

select all existing filters from editfilters and click continue button for BCC-"${details page}"
     RUN KEYWORD  SCROLL PAGE TO LOCATION  1000000  0
     click element  addFilterBtn
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  ${Source/Vendor filter}
    run keyword and continue on failure  click element  ${po action filter bcc}
    run keyword and continue on failure  click element  ${PO Created By Username filter bcc}
    run keyword and continue on failure  click element  ${PO Promise Exception filter}
    run keyword and continue on failure  click element  ${Procurement Type filter}
    run keyword and continue on failure  click element  ${PO Ideal Finish Date filter}
    run keyword and continue on failure  click element  ${aging bucket filter po}
    run keyword and continue on failure  click element  ${porg_code_filter}
    run keyword and continue on failure  click element  ${project_name_filter}
    run keyword and continue on failure  click element  ${acct_assign_cat_filter_PO}
    run keyword and continue on failure  click element  ${Purchasing Document Type filter}
    run keyword and continue on failure  click element  ${Material SKU filter}
    run keyword and continue on failure  click element  ${product/workorder filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for BCC-"${details page}"
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  exp_action
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  source
     run keyword and continue on failure  element should be visible  profit_center
     run keyword and continue on failure  element should be visible  po_action
     run keyword and continue on failure  element should be visible  po_created_by
     run keyword and continue on failure  element should be visible  exp
     run keyword and continue on failure  element should be visible  po_promise_exception
     run keyword and continue on failure  element should be visible  ptype
     run keyword and continue on failure  element should be visible  processed_date
     run keyword and continue on failure  element should be visible  ovd_days_range
     run keyword and continue on failure  element should be visible  project_name
     run keyword and continue on failure  element should be visible  porg_code
     run keyword and continue on failure  element should be visible  account_assign_cat
     run keyword and continue on failure  element should be visible  purchasing_document_type
     run keyword and continue on failure  element should be visible  sku
     run keyword and continue on failure  element should be visible  prod_order_number
     run keyword and continue on failure  element should be visible  purchase_order_number

User click on view all tab on INVENTORY & CASH OPPORUNITIES grid
     wait until element is visible  ${inventory&cash opportunities view all button}  10s
     click element  ${inventory&cash opportunities view all button}
     sleep  3s

User click on view all tab on RISK: OVERDUE + RESCHEDULE IN grid
     wait until element is visible  ${OVERDUE + RESCHEDULE IN view all button}  10s
     click element  ${OVERDUE + RESCHEDULE IN view all button}
     sleep  13s

User click on view all tab on RISK: REQUISITIONS grid
     wait until element is visible  ${REQUISITIONS view all button}  10s
     click element  ${REQUISITIONS view all button}
     sleep  3s

select all existing filters from editfilters and click continue button for BCC-REQUISITIONS
    RUN KEYWORD  scroll page to location  1000000  0
    click element  addFilterBtn
    sleep  6s
    run keyword and continue on failure  click element  ${plant catagory filter}
    run keyword and continue on failure  click element  ${sub_business_filter}
    run keyword and continue on failure  click element  ${plant Business filter}
    run keyword and continue on failure  click element  ${plant Region filter}
    run keyword and continue on failure  click element  //mm-global-filter[@id='globalFilter']/mm-add-remove-filters[@id='addRemoveOverlay']/div[@id='panel']/div[@id='filterlist']/label[@id='source']
    run keyword and continue on failure  click element  //mm-global-filter[@id='globalFilter']/mm-add-remove-filters[@id='addRemoveOverlay']/div[@id='panel']/div[@id='filterlist']/label[@id='project_code']
    run keyword and continue on failure  click element  ${Procurement Type filter}
    run keyword and continue on failure  click element  ${Purchase Org Code filter}
    run keyword and continue on failure  click element  ${Purchase Org Name filter}
    run keyword and continue on failure  click element  ${WBS Element filter}
    run keyword and continue on failure  click element  ${Account Assign. Category filter}
    run keyword and continue on failure  click element  ${Authorization Status filter}
    run keyword and continue on failure  click element  ${Material SKU filter}
    run keyword and continue on failure  click element  ${short_cycle filter}
    run keyword and continue on failure  click element  ${pr_type filter}
    run keyword and continue on failure  click element  ${Requisition Date filter}
    wait until element is visible  continue  10s
    run keyword and continue on failure  click button  continue

user should see all selected filters from edit filters in ui for BCC-REQUISITIONS
     run keyword and continue on failure  element should be visible  plant
     run keyword and continue on failure  element should be visible  pgroup
     run keyword and continue on failure  element should be visible  mrpc
     run keyword and continue on failure  element should be visible  region
     run keyword and continue on failure  element should be visible  business
     run keyword and continue on failure  element should be visible  sub_business
     run keyword and continue on failure  element should be visible  pcat
     run keyword and continue on failure  element should be visible  source
     run keyword and continue on failure  element should be visible  sku
     run keyword and continue on failure  element should be visible  project_code
     run keyword and continue on failure  element should be visible  sc
     run keyword and continue on failure  element should be visible  ptype
     run keyword and continue on failure  element should be visible  profit_center
     run keyword and continue on failure  element should be visible  age_bucket
     run keyword and continue on failure  element should be visible  order_type
     run keyword and continue on failure  element should be visible  porg_code
     run keyword and continue on failure  element should be visible  porg_name
     run keyword and continue on failure  element should be visible  wbs
     run keyword and continue on failure  element should be visible  account_cat
     run keyword and continue on failure  element should be visible  authorization_status
     run keyword and continue on failure  element should be visible  pr_type
     run keyword and continue on failure  element should be visible  requisition_created_date

User click on view all tab on PO ACCEPTANCE grid
     wait until element is visible  ${PO ACCEPTANCE opportunities view all button}  10s
     click element  ${PO ACCEPTANCE opportunities view all button}
     sleep  3s

User click on view all tab on EARLY RELEASE grid
     wait until element is visible  ${EARLY RELEASE opportunities view all button}  10s
     click element  ${EARLY RELEASE opportunities view all button}
     sleep  3s

User click on view all tab on AGING PROMISE DATE grid
     wait until element is visible  ${AGING PROMISE DATE opportunities view all button}  10s
     click element  ${AGING PROMISE DATE opportunities view all button}
     sleep  3s

User click on view all tab on AGING(BACKLOG) grid
     wait until element is visible  ${AGING(BACKLOG) opportunities view all button}  10s
     click element  ${AGING(BACKLOG) opportunities view all button}
     sleep  3s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})