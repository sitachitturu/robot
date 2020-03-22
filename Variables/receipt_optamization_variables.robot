*** Variables ***
${Receipt optamization title}  xpath=//*[@id="topBar"]/span
${Receipt Optimization Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/receipt-optimization']
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column for quarter view}  xpath=//mo-receipt-optimization/div[3]/mo-grid[2]/div/div[4]/mo-show-hide/div/button

${show/hide column list}  xpath=//*[@id="gridContainer"]/ul
${receipt_opt_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/receipt_optamization_show_hide_list.txt
${receipt_opt_quarter_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/receipt_optimization_quarter_show_hide_list.txt
${Export to Excel defoult page}  xpath=//mo-grid[@id='receiptDataTable']//a[contains(normalize-space(), 'Export to Excel')]
${Export to Excel Quarter Data Table}  xpath=//mo-grid[@id='receiptQuarterDataTable']//a[contains(normalize-space(), 'Export to Excel')]
${total_oppor_text}  xpath=//*[@id='spine-container']//span[contains(normalize-space(), 'TOTAL OPPORTUNITY')]
${number_of_oppor_text}  xpath=//*[@id='spine-container']//span[contains(normalize-space(), 'NUMBER OF OPPORTUNITIES')]
${number_of_oppor_number_text}  xpath=//*[@id="spine-container"]/div/div[2]/div/div/span[2]/span[1]
${upcoming_oppor($)_text}  xpath=//*[@id='spine-container']//span[contains(normalize-space(), 'UPCOMING OPPORTUNITIES ($)')]
${upcoming_oppor(#)_text}  xpath=//*[@id='spine-container']//span[contains(normalize-space(), 'UPCOMING OPPORTUNITIES (#)')]
${ui_total_opp_spine_value}  xpath=//*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[1]
${ui_no_of_opp_spine_value}  xpath=//*[@id="spine-container"]/div/div[2]/div/div/span[2]/span[1]
${number_of_upcoming_oppor_number_text}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
${2nd month button}  xpath=//div[2]/div/div/mo-filter-context/mo-receipt-optimization/div/div/div[2]/px-dropdown/div/px-dropdown-text
${vendor_apply_button}  xpath=//*[@id="source"]//button[@id="ApplyBtn"]
${buyer_apply_button}  xpath=//*[@id="pgroup"]//button[@id="ApplyBtn"]
${Push Days}  //div[@id="content"]//span[contains(normalize-space(), "Push Days")]
${highest value from the grid}  //tr[@style="transform: translate(0px, 0px);"]//td[@style="width: 100px; order: 70000000;"]//div[@class="mo-column-content without-hover style-scope mo-column"]
${receipt_opt_plant_filter_data}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/receipt_opt_plant_filter_data.txt

${planned_date_col}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[3]/vaadin-grid-cell-content/mo-column/div
${po_number_cxol}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[5]/vaadin-grid-cell-content/mo-column/div
${push_days_dropdown}  xpath=//px-dropdown[2]/div/px-dropdown-text
${<20_pushdays}  xpath=//px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
${<30_pushdays}  xpath=//px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[3]
${>30+_pushdays}  xpath=//px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[4]
${<10_pushdays}  xpath=//px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[1]

${search_input_plant}  xpath=//*[@id="search-input"]
${receipt_optimization_plant_code}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/receipt_plant_code_data.txt
