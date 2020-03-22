*** Variables ***
${Purchase Orders Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/purchase-orders']
${PO_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/purchase_orders_show_hide_col_list.txt
${PO_SHOW/HIDE_col_excel_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/purchase_orders_excel_show_hide.txt
${show/hide column}  //div[@id='showHide']//button[@class='showHideButton style-scope mo-show-hide']
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul
${exp-requi-action}  //label[@class='style-scope mm-add-remove-filters']//input[@value='exp_action']
${editfilterlist}  //*[@id="filterlist"]
${exception requires action filter}  xpath=//*[@id='filterlist']//input[@value='exp_action']
${exception requires action filter list}  xpath=//*[@id='exp_action']//*[@id="availableFilterList"]
${apply button for exp_req_act}  xpath=//*[@id='exp_action']//button[@id="ApplyBtn"]
${exp_req_action_col_show/hide}  xpath=//*[@id="gridContainer"]/ul/li[79]
${Exception col}  xpath=//table/thead//th//span[text()='Exception']
${PO Number col}  xpath=//table/thead//th//span[text()='PO Number']
${Material SKU col}  xpath=//table/thead//th//span[text()='Material SKU']
${OrderQ col}  xpath=//table/thead//th//span[text()='Order Q.']
${Open Q. col}  xpath=//table/thead//th//span[text()='Open Q.']
${sour/vendor col}  xpath=//table/thead//th//span[text()='Source/Vendor']
${Excep_req_action col_ui}  xpath=//table/thead//th//span[text()='Exception Requires Action']
${creation date col}  //*[@id="gridContainer"]/ul/li[8]
${delivery date col}  //*[@id="gridContainer"]/ul/li[7]
${ab confirm col}   //*[@id="gridContainer"]/ul/li[9]
${export_excel_btn}  xpath=//*[@id="mos-xls-button"]/a
${first_show/hide_element}  //div[@id='checkboxLabel']//div[@class='style-scope mo-show-hide']
${purchase_order_items_by_dropdown}  //px-dropdown-text[@class='style-scope px-dropdown x-scope px-dropdown-text-0']

${purch_group_cancel_button}  xpath=//*[@id='pgroup']//button[@id='cancelBtn']
${purch_group_search_input}  xpath=//mm-filter[2]/px-filter/div/div[2]/div[2]/input
${purch_group_Apply Button}  xpath=//*[@id='pgroup']//button[@id='ApplyBtn']
${planner_search_input}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[2]/input
${planner_Apply Button}  xpath=//*[@id='mrpc']//button[@id='ApplyBtn']
${vendor_search_input}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[2]/input
${vendor_apply_button}  xpath=//*[@id='source']//button[@id='ApplyBtn']
${business_apply_button}  xpath=//*[@id='business']//button[@id='ApplyBtn']

${plant filter check box}  xpath=//div[@id='filterContent']//div[@id='checkboxContainer']
${Age Classification button}  //div[@id='dropcell']//span[contains(normalize-space(), 'Age Classification')]
${Count(#)}  //div[@id='tabsContent']//div[contains(normalize-space(), 'Count (#)')]
${search input}  xpath=//*[@id='plant']//input[@id="search-input"]
${First dropdown button}  //px-dropdown[@dropdownindex='0']
${Second dropdown button}  //px-dropdown[@dropdownindex='1']
${Buyer}  //ul[@id='list']//li[contains(normalize-space(), 'Buyer')]
${Vendor}  //ul[@id='list']//li[contains(normalize-space(), 'Vendor')]
${Planner}  //ul[@id='list']//li[contains(normalize-space(), 'Planner')]
${Material}  //ul[@id='list']//li[contains(normalize-space(), 'Material')]
${Plant}  //ul[@id='list']//li[contains(normalize-space(), 'Plant')]
${Exception Message}  //ul[@id='list']//li[contains(normalize-space(), 'Exception Message')]
${Age Classification}  //ul[@id='list']//li[contains(normalize-space(), 'Age Classification')]
${Button Buyer}  //div[@id='dropcell']//span[contains(normalize-space(), 'Buyer')]
${Button Vendor}  //div[@id='dropcell']//span[contains(normalize-space(), 'Vendor')]
${Button Planner}  //div[@id='dropcell']//span[contains(normalize-space(), 'Planner')]
${Button Material}  //div[@id='dropcell']//span[contains(normalize-space(), 'Material')]
${Button Plant}  //div[@id='dropcell']//span[contains(normalize-space(), 'Plant')]
${Button Exception Message}  //div[@id='dropcell']//span[contains(normalize-space(), 'Exception Message')]
${Button Age Classification}  //div[@id='dropcell']//span[contains(normalize-space(), 'Age Classification')]
${plant_count..}
${Vendor table header}  //mo-grid[@id='purchaseOrdsHeatMap']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Vendor')]
${Buyer table header}  //mo-grid[@id='purchaseOrdsHeatMap']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Buyer')]
${Material table header}  //mo-grid[@id='purchaseOrdsHeatMap']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Material')]
${Plant table header}  //mo-grid[@id='purchaseOrdsHeatMap']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Plant')]
${Planner table header}  //mo-grid[@id='purchaseOrdsHeatMap']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Planner')]
${short cycle indicator}
${cancellation_col}  xpath=//vaadin-grid-table/table/thead/tr/th[3]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${reschedule_in_col}  xpath=//vaadin-grid-table/table/thead/tr/th[4]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${reschedule_out_col}  xpath=//vaadin-grid-table/table/thead/tr/th[5]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${other_exceptions_col}  xpath=//vaadin-grid-table/table/thead/tr/th[6]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${cancellation_asc}  xpath=//tbody/tr/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
${cancellation_desc}  xpath=//table/tbody/tr/td[3]/vaadin-grid-cell-content/mo-bar-column/div/div
${reschedule_asc}  xpath=//tbody/tr/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
${reschedule_in_desc}  xpath=//table/tbody/tr/td[4]/vaadin-grid-cell-content/mo-bar-column/div/div
${resc.out_asc}  xpath=//tbody/tr/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
${resch.out_desc}  xpath=//table/tbody/tr/td[5]/vaadin-grid-cell-content/mo-bar-column/div/div
${other_excep_asc}  xpath=//tbody/tr/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
${other_excep_desc}  xpath=//table/tbody/tr/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
${ageclassification_dropdown}  xpath=//mo-grid/div/px-dropdown[2]/div/px-dropdown-text
${exception_message}  xpath=//px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
${buyer_dropdown}  xpath=//mo-grid/div/px-dropdown/div/px-dropdown-text
${vendor_from_buyer_dropdown}  xpath=//mo-grid/div/px-dropdown/div[2]/px-dropdown-content/div/ul/li[2]
${planner_from_buyer_dropdown}  xpath=//mo-grid/div/px-dropdown/div[2]/px-dropdown-content/div/ul/li[3]
${material_from_buyer_dropdown}  xpath=//mo-grid/div/px-dropdown/div[2]/px-dropdown-content/div/ul/li[4]
${value_tab}  xpath=//div[@id='mos-tabs']/paper-tabs/div[@id='tabsContainer']/div/paper-tab[2]
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${business_filter}  xpath=//*[@id='filterlist']//input[@value='business']
${aging_bucket_apply button}  xpath=//*[@id='ovd_days_range']//button[@id='ApplyBtn']
${po_created_username_col_show/hide}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'PO Created By Username')]
${po_created_show_selected_only}  xpath=//mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[2]/div/span
${po_created_selected_text}  xpath=//mm-global-filter/mm-filter[3]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
${po_actions_dropdown}  xpath=(//div[@id='drop-down'])[1]/select
${po_actions_dropdown_options}  xpath=(//select[@id='columnValuesList'])[9]/option
${text_from_po_username_col}  xpath=//mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr/td[29]/vaadin-grid-cell-content/mo-column/div
${po_created_filter_apply_button}  xpath=//*[@id='po_created_by_username']//button[@id='ApplyBtn']

${Plant filter}  xpath=//mm-filter[@id='plant']//button[@id='filterBtn'][1]
${Search_box}  search-input
${Value in plant filter}  xpath=//paper-checkbox[@name-id='$']/div
${Apply_button}  ApplyBtn
${Show_Comment_icon}  (//tr[@is='vaadin-grid-table-row']//div[@id='show-comment'])[1]
${Action_icon_comment}  (//div[@id='add-comment'])[1]
${Add_Comment_icon}  (//tr[@is='vaadin-grid-table-row']//div[@id='add-comment'])[1]
${Comment_column}  (//div[@id='commentCol'])[1]
${Modal_box_comment}  //section[@role='region']//h3[@id='myModal-title']
${PO_number_Modal_box}  (//div[@class ='style-scope mo-comments']/span)[1]
${Material_sku_Modal_box}  (//div[@class ='style-scope mo-comments']/span)[3]
${P0_line_Modal_box}  (//div[@class ='style-scope mo-comments']/span)[5]
${Source/Vendor_Modal_box}  (//div[@class ='style-scope mo-comments']/span)[7]
${Close_button_Modal_box}  //span[@class='close-button style-scope mo-comments-modal']

${Edit filter button}  xpath=//button[@id='addFilterBtn']
${Final Exception Message}  xpath=//label[@id='exp']
${Continue button}  xpath=//button[@id='continue']
${Final exp message filter}  xpath=//button[@id='filterBtn']/span[text()=' Final Exception Message']
${Cancel process filter option}  xpath=//div[@id='checkboxLabel']/span[text()='Cancel process']
${Apply btn final exp msg}  xpath=//mm-filter[@id='exp']/px-filter/div/div[@id='filterContent']/div[@class='availableFilterBtns style-scope px-filter']/button[@id='ApplyBtn']
${Cancellation sum heatmap}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[3]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${Net open value(usd) show hide}  xpath=//div[@id='checkboxLabel']/div[text()='Net Open Value (USD)']
${reschedule-in filter option}  xpath=//div[@id='checkboxLabel']/span[text()='Reschedule in']
${reschedule-out filter option}  xpath=//div[@id='checkboxLabel']/span[text()='Reschedule out']
${reschedule-in sum heatmap}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[4]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${reschedule-out sum heatmap}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[5]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${no exception filter option}  xpath=//div[@id='checkboxLabel']/span[text()='No Exception']
${overdue filter option}  xpath=//div[@id='checkboxLabel']/span[text()='Overdue']
${no exception sum heatmap}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[7]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${overdue sum heatmap}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[6]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']

${Modal_box_comment}  //div[@class ='comment-box-wrap style-scope mo-comment-box']//textarea[@placeholder='Add a comment']
${Post_comment_button}  //span[text()=' Post']
${no exception sum from heatmap}
${reschedule-out sum from heatmap}
${reschedule-in sum from heatmap}
${cancellation sum from heatmap}
${overdue sum from heatmap}
${60+days heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[2]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${30+days heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[3]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${<30days heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[4]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${Futureraw heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[6]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${onhold_raw heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[5]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']