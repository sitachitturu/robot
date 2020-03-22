*** Variables ***
#SSO Login Related Objects
${SSO.Login}  username
${SSO.Password}  password
${SSO.Submit}  submitFrm
${SSO.ClickHere}  link=Click here
${BROWSER}  googlechrome
${DELAY}          0
${WELCOME.URL}
${USER}  502698987
${PASSWORD}  Mos2018password
${buttonname}  addFilterBtn
${MYURL}
${USER2}  502692833
${PASSWORD2}  Tcoe00pw
${dbfile}

#5Series User credentials
${5SeriesWELCOME.URL}  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io

${USER-UNAUTHORIZED}  502715510
${PASSWORD-UNAUTHORIZED}  D2g2t@lM0S

${USER-AUTHORIZED}  502698987
${PASSWORD-AUTHORIZED}  E1l2e3c4t5r6i7c

${USER-AUTHORIZED-ADMIN}  502715512
${PASSWORD2-Admin}  D2g2t@lM0S

${db_search_path}  public
#################
#URL
#${DEV1 URL}  https://mos-dev-1.run.aws-usw02-pr.ice.predix.io
#${DEV2 URL}  https://mos-dev-1.run.aws-usw02-pr.ice.predix.io
#${DEV3 URL}  https://mos-dev-1.run.aws-usw02-pr.ice.predix.io
#${QA1 URL}  https://mos-qa-1.run.aws-usw02-pr.ice.predix.io
#${QA2 URL}  https://mos-qa-2.run.aws-usw02-pr.ice.predix.io
#${QA3 URL}  https://mos-qa-3.run.aws-usw02-pr.ice.predix.io
#${PRODUCTION URL}  https://material-optimization.run.aws-usw02-pr.ice.predix.io

${addremove overlay}  xpath=//*[@id="addRemoveOverlay"]/h3


#${cancel button}  xpath=//*[@id='addFilterBtn']//button[@id="cancel"]
${Apply filter}  xpath=//*[@id="filterSetBtn"]
${Plant filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant')]
${Plant Business filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant Business')]
${Plant Category filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant Category')]
${Plant Region filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant Region')]
${Final Exception Message filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Final Exception Message')]
${Exception Requires Action filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Exception Requires Action')]
${Planner / MRP Contr. filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Planner / MRP Contr.')]
${Planner / MRP Controller filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Planner / MRP Controller')]
${Procurement Type filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Procurement Type')]
${Order Status filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Order Status')]
${Storage Location filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Storage Location')]
${Current Finish Date filter button}  xpath=//header[@role='banner']//button[contains(normalize-space(), 'Current Finish Date')]
${Ideal Finish Date filter button}  xpath=//header[@role='banner']//button[contains(normalize-space(), 'Ideal Finish Date')]
${PO Ideal Finish Date filter button}  xpath=//header[@role='banner']//button[contains(normalize-space(), 'Ideal Finish Date')]
${Profit Center filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Profit Center')]
${Product Hierarchy filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Product Hierarchy')]
${Buyer / Purch. Group filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Buyer / Purch. Group')]
${Source/Vendor filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Source/Vendor')]
${PO Created By Username filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Purchasing Document Type')]
${Planner / MRP Contr. Filter filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Planner / MRP Contr.')]
${Short Cycle filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Short Cycle')]
${Material SKU filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Material SKU')]
${Material SKU2 filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Material SKU')][1]
${Aging Bucket filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Aging Buckets')]
${porg_code filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Purchase Org Code')]
${porg_name filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Purchase Org Name')]
${wbs filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'WBS Element')]
${account_cat filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Account Assign. Category')]
${PO_line_status filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), ' PO Line Status')]
${pgroup_code filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Buyer / Purch. Group Code')]
${project_code filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Project Code')]
${project_name filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Project Name')]
${sub_business filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Sub Business')]
${order_type_filter_button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Order Type')]
${Material Description filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Material Description')]
${special procurement filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Special Procurement')]
${Purchasing Document Type filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Purchasing Document Type')]
${pr_type filter}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(),'PR Type')]
${PO_TYPE filter button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'PO Type')]s
${Material Type / Item Type button}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Material Type / Item Type')]


${MKU icon}  xpath=//header[@role='banner']//button[@id='filterBtn']//iron-icon[@id='inactive-menu-dropdown']
${planner/Mrp Controller filter}  xpath=//*[@id='filterlist']//input[@value='mrpc']
${plant Business filter}  xpath=//*[@id='filterlist']//input[@value='business']
${plant_business_apply_button}  xpath=//*[@id='business']//button[@id="ApplyBtn"]
${plant_business_show/selected}  xpath=//*[@id="business"]//*[@id="showSelected"]
${final_exception_filter_show/selected}  xpath=//*[@id="exp"]//*[@id="showSelected"]
${final_exception_filter_applybutton}  xpath=//*[@id="exp"]//*[@id="ApplyBtn"]
${ovd_days_range_filter_show/selected}  xpath=//*[@id="ovd_days_range"]//*[@id="showSelected"]
${count_business_filter_recods}  xpath=//mm-filter[@id='business']//div[@id='selectedFiltersList']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
${count_exp_action_filter_recods}  xpath=//mm-filter[@id='exp_action']//div[@id='selectedFiltersList']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
${count_exp_filter_recods}  xpath=//mm-filter[@id='exp']//div[@id='selectedFiltersList']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
${count_final_exception_filter_recods}  xpath=//mm-filter[@id='exp']//div[@id='selectedFiltersList']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
${count_ovd_days_range_filter_recods}  xpath=//mm-filter[@id='ovd_days_range']//div[@id='selectedFiltersList']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
${plant catagory filter}  xpath=//*[@id='filterlist']//input[@value='pcat']
${plant Region filter}  xpath=//*[@id='filterlist']//input[@value='region']
${Procurement Type filter}  xpath=//*[@id='filterlist']//input[@value='ptype']
${Purchase Org Code filter}  xpath=//*[@id='filterlist']//input[@value='porg_code']
${Material Type filter}  xpath=//*[@id='filterlist']//input[@value='material_type']
${pr_type filter}  xpath=//*[@id='filterlist']//input[@value='pr_type']
${material_type_filter_mcm}  xpath=//*[@id='filterlist']//input[@value='type']
${pr_type filter_edit_filters}  xpath=//*[@id='filterlist']//input[@value='pr_type']
${Purchase Org Name filter}  xpath=//*[@id='filterlist']//input[@value='porg_name']
${Product Hierarchy filter}  xpath=//*[@id='filterlist']//input[@value='hierarchy']
${WBS Element filter}  xpath=//*[@id='filterlist']//input[@value='po_wbs']
${Account Assign. Category filter}  xpath=//*[@id='filterlist']//input[@value='account_assign_cat']
${PO Action filter}  xpath=//*[@id='filterlist']//input[@value='action_description']
${po action filter bcc}  xpath=//*[@id='filterlist']//input[@value='po_action']
${PO Created By Username filter bcc}  xpath=//*[@id='filterlist']//input[@value='po_created_by']
${PO Promise Exception filter}  xpath=//*[@id='filterlist']//input[@value='po_promise_exception']

${Production / Work Order filter}  xpath=//*[@id='filterlist']//input[@value='order_number']
${PO Number filter}  xpath=//*[@id='filterlist']//input[@value='purchase_order_number']
${Incoterms – Header filter}  xpath=//*[@id='filterlist']//input[@value='incoterms_header']
${Order Type filter}  xpath=//*[@id='filterlist']//input[@value='order_type']
${Authorization Status filter}  xpath=//*[@id='filterlist']//input[@value='authorization_status']
${Requisition Date filter}  xpath=//*[@id='filterlist']//input[@value='requisition_created_date']
${Incoterms – Line filter}  xpath=//*[@id='filterlist']//input[@value='incoterms_line']
${Order Status filter}  xpath=//*[@id='filterlist']//input[@value='status']
${Storage Location filter}  xpath=//*[@id='filterlist']//input[@value='sloc']
${Current Finish Date filter}  xpath=//*[@id='filterlist']//input[@value='cfd']
${Ideal Finish Date filter}  xpath=//*[@id='filterlist']//input[@value='ifd']
${PO Ideal Finish Date filter}  xpath=//*[@id='filterlist']//input[@value='processed_date']
${Profit Center filter}  xpath=//*[@id='filterlist']//input[@value='profit_center']
${Buyer/Purch.Group filter}  xpath=//*[@id='filterlist']//input[@value='pgroup']
${Final Exception Message filter}  xpath=//*[@id='filterlist']//input[@value='exp']
${Source/Vendor filter}  xpath=//*[@id='filterlist']//input[@value='source']
${Source/Vendor filter2}  xpath=//*[@id='filterlist']//input[@value='source_vendor']
${Short Cycle filter}  xpath=//*[@id='filterlist']//input[@value='sc']
${Exception Requires Action filter}  xpath=//*[@id='filterlist']//input[@value='exp_action']
${Exception Requires Action filter_apply_button}  xpath=//*[@id="exp_action"]//*[@id="ApplyBtn"]
${exception_riquires_filter_show/selected}  xpath=//*[@id="exp_action"]//*[@id="showSelected"]
${Material SKU filter}  xpath=//*[@id='filterlist']//input[@value='sku']
${Aging Bucket filter}  xpath=//*[@id='filterlist']//input[@value='age_bucket']
${Aging Bucket filter_mcm}  xpath=//*[@id='filterlist']//input[@value='bucket']
${Storage Location filter_cycle_counting}  xpath=//*[@id='filterlist']//input[@value='location']
${Aging Bucket filter_apply_button}  xpath=//*[@id='age_bucket']//button[@id='ApplyBtn']
${aging bucket filter apply button_po}  xpath=//*[@id='ovd_days_range']//button[@id='ApplyBtn']
${Aging Bucket filter PO}  xpath=//*[@id='filterlist']//input[@value='ovd_days_range']
${Material Description filter}  xpath=//*[@id='filterlist']//input[@value='material_descr']
${PO Created By Username filter}  xpath=//*[@id='filterlist']//input[@value='po_created_by_username']
${Material Type / Item Type filter}  xpath=//*[@id='filterlist']//input[@value='material_type']
${count_date_filter}   xpath=//div[@id='filterlist']/label[@id='count_date']
${vendor_name filter}  xpath=//div[@id='filterlist']/label[@id='vendorName']
${Spend - Frequency filter}  xpath=//div[@id='filterlist']/label[@id='categorization']
${plant filter}  xpath=//*[@id='filterlist']/label[@id='plant']
${order_type_mto}  xpath=//*[@id='filterlist']/label[@id='order_type']

${porg_code_filter}  xpath=//*[@id='filterlist']//input[@value='porg_code']
${porg_name_filter}  xpath=//*[@id='filterlist']//input[@value='porg_name']
${project_code_filter}  xpath=//*[@id='filterlist']//input[@value='project_code']
${project_name_filter}   xpath=//*[@id='filterlist']//input[@value='project_name']
${pgroup_code_filter}  xpath=//*[@id='filterlist']//input[@value='pgroup_code']
${Special Procurement filter}  xpath=//*[@id='filterlist']//input[@value='special_procurement']
${Plant Sp Matl Status filter}  xpath=//*[@id='filterlist']//input[@value='psms']

${wbs_filter}  xpath=//*[@id='filterlist']//input[@value='wbs']
${wbs_filter_PO}  xpath=//*[@id='filterlist']//input[@value='po_wbs']
${acct_assign_cat_filter}  xpath=//*[@id='filterlist']//input[@value='account_cat']
${acct_assign_cat_filter_PO}  xpath=//*[@id='filterlist']//input[@value='account_assign_cat']
${acct_assign_cat_filter_Sched}  xpath=//*[@id='filterlist']//input[@value='acct_assign_cat']
${sub_business_filter}  xpath=//*[@id='filterlist']//input[@value='sub_business']
${pr_type_filter}  xpath=//*[@id='filterlist']//input[@value='pr_type']
${Purchasing Document Type filter}  xpath=//*[@id='filterlist']//input[@value='purchasing_document_type']
${po_type_filter}  xpath=//*[@id='filterlist']//input[@value='po_type']
${PO_line_status_filter}  xpath=//*[@id='filterlist']//input[@value='code']
${Production Supervisor filter}  xpath=//*[@id='filterlist']//input[@value='supervisor']
${product/workorder filter}  xpath=//*[@id='filterlist']//input[@value='prod_order_number']


${Page Spinner}  xpath=//div[@id='pageSpinner']

${plant_filter_data_textfile}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_plant_filter_data_list.txt
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${Final_exception_message_filter}  xpath=//*[@id='exp']//button[@id='filterBtn']
${exp_filter_available_list}  xpath=//div[contains(@class,'px-filter') and @id='availableFilterList']
${exp_Apply Button}  xpath=//*[@id="exp"]//button[@id="ApplyBtn"]
${scheduling_plantfilter_data_textfile}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_plant_filter_data_list.txt

${purchasing_plantfilter_data_textfile}  ../Data/All_Mod_Show_Hide_Col_Text_Files/purchasing_plant_filter_data_list.txt

${pgroup_Apply Button}  xpath=//*[@id="pgroup"]//button[@id="ApplyBtn"]
${pcat_Apply Button}  xpath=//*[@id="pcat"]//button[@id="ApplyBtn"]
${fusion_plants_data_textfile}  ../Data/All_Mod_Show_Hide_Col_Text_Files/fusion_plants_list.txt
${inv_entitlement_plant_filter_data_text_file}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/Inv_Entitlement_plant_filter_data.txt
${executive-summary-plant-filter-data-textfile}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/executive-summary-plant-filter-data.txt
${master-data-plant-filter-data-textfile}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/master-data-plant-filter-data.txt
${business_Apply_Button}  xpath=//*[@id="business"]//button[@id="ApplyBtn"]
${region_Apply_Button}  xpath=//*[@id="region"]//button[@id="ApplyBtn"]
${material_type_filter_apply_cutton}  xpath=//*[@id="material_type"]//button[@id="ApplyBtn"]

${delete}  xpath=//*[@id="filterSetItemContainer"]/div[2]/div[1]

${bookmark_name}  bookmark
${bookmark_name1}  bookmark
${bookmark_name_unique_value}

${plant filter check box}  xpath=//div[@id='filterContent']//div[@id='checkboxContainer']
${plant_filter_checkbox_pr}  xpath=//div[@id='items']//div[@id='checkboxContainer']

${material_sku_selecting_checkbox_PO}  xpath=//div[3]/div/header/mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div

${oil_and_gas_plant_list}  ../Suits/All_Mod_Show_Hide_Col_Text_Files/oil_and_gas_plant_data_list

${show_selected}  xpath=//div/header/mm-global-filter/mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
${checkbox_material_sku}  xpath=//mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
${selected_checbox_material_sku}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
${plant_filter_checkbox}  xpath=//mm-filter[@id='plant']//paper-checkbox[2]
${plant_category_filter_checkbox}  xpath=//mm-filter[@id='pcat']//paper-checkbox[2]
${region_filter_checkbox}  xpath=//mm-filter[@id='region']//paper-checkbox[2]
${material_type_filter_checkbox}  xpath=//mm-filter[@id='material_type']//paper-checkbox[2]
${spine_totall}
${grid_row_value for default view1}
${spine_total..}

${plant_business_filter_transp_checkbox}  xpath=//mm-filter[@id='business']//paper-checkbox
${plant_business_textbox}  xpath=//mm-filter[@id='business']//input[@id='search-input']

${material_sku_selecting_checkbox_LTP}  xpath=//mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[2]/paper-checkbox/div
${CHECKBOX_MATERIAL_SKU_LTP}  xpath=//mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
${selected_checbox_material_sku_LTP}  xpath=//mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
${Product Name unique value}
${Product Name unique value1}
${plant Material Type}  xpath=//*[@id='filterlist']//input[@value='material_type']
${plant Material Type}  xpath=//*[@id='filterlist']//input[@value='material_type']
${po_user_filter_checkbox}  xpath=//mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[3]/div[2]/span
${po_created_username_apply_button}  xpath=//*[@id="po_created_by_username"]//button[@id="ApplyBtn"]
${requistion_date_filter}  //*[@id='filterlist']//input[@value='requisition_created_date']
${requisition_date_filter_apply_button}  xpath=//*[@id="requisition_created_date"]//button[@id="ApplyBtn"]
${total_col_total_value}  xpath=//mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[6]/vaadin-grid-cell-content/mo-column/div
${text_in_requisition_date}  xpath=//mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr/td[6]/vaadin-grid-cell-content/mo-column/div
${Total_col_value_after_cahnging_year}
${filter_from_date}
${checkbox_for_project code filter}  xpath=//mm-global-filter/mm-filter[7]/px-filter/div/div[2]/div[3]/div[2]/px-lazy-load/iron-list/div/div[1]/paper-checkbox/div[2]/span[1]
${project_code apply button}  xpath=//*[@id="project_code"]//button[@id="ApplyBtn"]
${text of selected plant code}
${Edit filters checkbox labels}  //div[@id='filterlist']/label
${Edit filter cancel button}  //button[@id='cancel']
${navigation_icon}  xpath=//div[2]/mo-app-nav/px-app-nav/nav/button
${admin_in_navitemlist}  xpath=//div[2]/mo-app-nav/px-app-nav/nav/ul/li[15]/a/span
${stock_policy_dashboard}  xpath=//div[2]/mo-app-nav/px-app-nav/nav/ul/li[15]/ul/li[4]/a/span
${stock policy dashboard icon}  xpath=(//a[@href='/secure/stock-policy-dashboard'])
${stock_policy_dashboard module page label}  xpath=//span[@class='scheduling style-scope mo-tool-bar']
${plant_filter}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${purchase_order_score_card}  xpath=//*[@id="div2"]
${stock_policy_oppo_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_oppo_show_hide.txt
${stock_policy_rop_oppo_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_rop_oppo_show_hide_list.txt
${stock_policy_rop_rejected_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_rop_rejected_show_hide_list.txt
${stock_policy_oppo_rejected_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_oppo_rejected_show_hide_list.txt
${stock_policy_moq_oppo_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_moq_show_hide_list.txt
${stock_policy_moq_rejected_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_moq_rejected_show_hide_list.txt
${stock_policy_ABC_oppo_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_abc_oppo_show_hide_list.txt
${stock_policy_ABC_rejected_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_abc_rejected_show_hide_list.txt
${Bcc_po_summary_OPPO._show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/bcc_po_summary_show_hide_oppor_list.txt
${bcc_po_summary_view_all}  xpath=//*[@id="mo-po-summary-detail"]/div[1]/a
${bcc_rejected_tab}  xpath=//mo-po-exception-msgs/div/div/div[2]/div/div/mo-opp-rej-grid/div/mo-grid-lite-tabs/div[1]/div[2]/paper-tabs/div/div/paper-tab[2]/div
${bcc_Inventory&Cash Opportunities_view_all}  xpath=//*[@id="buyerControlCenter"]/div[1]/div[2]/mo-po-tabs/mo-po-daily/div[1]/h4/a
${Bcc_inventory_OPPO._show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/bcc_inventory_cash_oppo_show_hide_list.txt
${bcc_overdue+resvhdeule in Opportunities_view_all}  xpath=//*[@id="buyerControlCenter"]/div[1]/div[2]/mo-po-tabs/mo-po-daily/div[2]/h4/a
${Bcc_ioverdue+resvhdeule in_OPPO._show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/bcc_overdue_reschedule_in_show_hide_list.txt
${bcc_requisitions Opportunities_view_all}  xpath=//*[@id="buyerControlCenter"]/div[1]/div[2]/mo-po-tabs/mo-po-daily/div[3]/h4/a
${Bcc_requisitions_OPPO._show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/bcc_requisitions_show_hide_list.txt

###########################################################################################################################################################################################################################################################################
${Expand}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('button.filter--controls-expand')
${reset filters}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('button.filter--controls-reset')
${continue_button}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#addRemoveOverlay').shadowRoot.querySelector('#continue')
${Plant}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#plant').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn')

#======================================================================================================================================================================================
#==========================================================================================================================================================================
${environment_url}  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io  ####https://material-optimization.run.aws-usw02-pr.ice.predix.io
##https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
#${environment_url}  https://mos-qa-2b.run.aws-usw02-pr.ice.predix.io
#${api_token}  "%userprofile%\\Pictures\\Desktop\\curl-7.54.0-win64-mingw\\curl-7.54.0-win64-mingw\\curl-7.54.0-win64-mingw\\bin\\curl "https://a8a2ffc4-b04e-4ec1-bfed-7a51dd408725.predix-uaa.run.aws-usw02-pr.ice.predix.io/oauth/token" -H "authorization: Basic ZGlnaXRhbF9jYXNjYWRlX3NlZWRfcHJvZDprMXUxS2tKM2VHdW5uaDJE" -H "cache-control: no-cache" -H "content-type: application/x-www-form-urlencoded" -d "grant_type=client_credentials&client_id=digital_cascade_seed_prod&client_secret=predixsample""
${api_token}  curl "https://a8a2ffc4-b04e-4ec1-bfed-7a51dd408725.predix-uaa.run.aws-usw02-pr.ice.predix.io/oauth/token" -H "authorization: Basic ZGlnaXRhbF9jYXNjYWRlX3NlZWRfcHJvZDprMXUxS2tKM2VHdW5uaDJE" -H "cache-control: no-cache" -H "content-type: application/x-www-form-urlencoded" -d "grant_type=client_credentials&client_id=digital_cascade_seed_prod&client_secret=predixsample"
#=================================================================================================================================================================================
#=====================================================================================================================================================================================
${lazy_loading_search_icon_filter}  xpath=//*[@id="searchAction"]

${Not now button}  xpath=//*[@id="profile-modal"]/div/div[5]/button
${ok button from prompt}  xpath=//*[@id="profile-modal"]/div/div[5]/a/button
${prompt}  xpath=//div[2]/mo-header/header/div/mo-user/div/div
${icon for business filter got selcted}  xpath=//mm-global-filter/mm-filter[4]/px-filter/div/div[1]/button[1]/iron-icon[1]
${total_no.ofrows_excel for products}
${total_no.ofrows_excel for projects}
${grid_count_project}
${projects}  xpath=//paper-tabs/div/div/paper-tab[2]/div
${total_no.ofrows_excel}
${queryResults..}
${queryResults1..}
${convert}
${convert2}
${queryResults21..}
${queryResults2..}
${Dta_base_exception_value_from_grid}
${cancellation sum from excel..}
${reschedule-in sum from heatmap}
${overdue sum from excel..}
${no exception sum from excel..}
${reschedule-out sum from excel..}
${reschedule-in sum from excel..}
${reschedule-out sum from excel..}
${cancellation sum from db_grid}
${reschedule in sum from db_grid}
${reschedule out sum from db_grid}
${overdue sum from db_grid}
${No exception sum from db_grid}
${exception count from db_grid}
${api_grid_count}
${filter_record_count1..}
${cancellation sum from heatmap for count..}
${reschedule-in sum from heatmap for count..}
${reschedule-out sum from heatmap for count..}
${no exception sum from heatmap for count..}
${overdue sum from heatmap for count..}
${api_grid_count1}
${value tab}  xpath=//paper-tab[@role='tab']//div[contains(normalize-space(), 'Value ($)')]
${aging sum from excel..}
${aging sum from db_grid}
${60+raw sum from heatmap for count..}
${30+raw sum from heatmap for count..}
${<30raw sum from heatmap for count..}
${Futureraw sum from heatmap for count..}
${onhold_raw sum from heatmap for count..}
${age_clasiification count from db_grid}
${api_grid_count1 for <30}
${filter_business_record_count1..}
${grid_count_product}
${record count from db_grid}
${Total_from_heatmap_count1}
${5+Total_from_heatmap_count1}
${1-2Total_from_heatmap_count1}
${3-4Total_from_heatmap_count1}
${<0Total_from_heatmap_count1}
${filter_exp_requires_record_count2..}
${sum_of_productandproject_cancel}
${exception sum from db for prodcut}
${exception sum from db for project}
${sum_of_productdb_and_projectdb}
${filter_exp_record_count2..}
${total count of records from grid}
${total row count from excel}
${sum_of_productandproject_overdue}
${sum_of_productandproject_Reschedule_In}
${sum_of_productandproject_Reschedule_out}
${list}
${Edit filters checkbox strings}
@{labels from edit filter checkboxes}
${Expected labels for edit filter checkboxes}
${heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[6]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${1-2heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[4]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${material_creation_monitor_tab}  xpath=//*[@id="tabsContent"]/paper-tab[2]/div/a
${action_column}  xpath=//vaadin-grid-cell-content/div/span[text()='Action']
${Scheduling_actions dropdown list}  ../Data/All_modules_actions_list/scheduling_actions_list.txt
${PO ACTION col}  xpath=//vaadin-grid-cell-content/div/span[text()='PO Action']
${decision col}  xpath=//vaadin-grid-cell-content/div/span[text()='DECISION']
${buying grid decision col}  xpath=//mo-grid-lite[@id='materialTransferBuyingAcceptTable']//span[text()='DECISION']

##===========================================================================================================================================================================
#####polymer 3 js paths global variables#############
${expand_filter}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('button.filter--controls-expand')
${lable}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#titleSection > div.header--title > h1')
${add_filter}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('button.filter--controls-add')
${continue_button}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#addRemoveOverlay').shadowRoot.querySelector('#continue')
${plant_business}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#filterBtn > span')
${power_check_box}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#product-Power').shadowRoot.querySelector('#checkboxContainer')
${mmf_checkbox}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#product-MMF').shadowRoot.querySelector('#checkboxContainer')
${apply_button}  dom:document.querySelector('#ssdashboard').shadowRoot.querySelector('#mo-tool-bar').shadowRoot.querySelector('#globalFilter').shadowRoot.querySelector('#business').shadowRoot.querySelector('#pxFilter').shadowRoot.querySelector('#ApplyBtn')