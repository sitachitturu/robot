*** Variables ***
${Exception Requires Action filter}  xpath=//*[@id='filterlist']//input[@value='exp_action']
${Order Status filter}  xpath=//*[@id='filterlist']//input[@value='status']
${Product Hierarchy filter}  xpath=//*[@id='filterlist']//input[@value='hierarchy']
${scheduling title}  xpath=//div[@id='topBar']/span[text()='Scheduling']
${Storage Location filter}  xpath=//*[@id='filterlist']//input[@value='sloc']
${CurrentFinishDate filter}  xpath=//*[@id='filterlist']//input[@value='cfd']
${IdealFinishDate filter}  xpath=//*[@id='filterlist']//input[@value='ifd']
${Scheduling_products_show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_module_products_show_hide.text

${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul
${show/hide col list for ontime_cycle}  xpath=//mo-grid[@id='onTimeGrid']/div[@id='gridBtn']/div[@id='showHide']/mo-show-hide[@id='showHideModule']/div[@id='mos-show-hide-container']/div[@id='gridContainer']/ul[@class='tableGrid style-scope mo-show-hide']
${show/hide column_po_scorecard}  xpath= //*[@id="mos-show-hide-container"]/button

${Scheduling Page Title}  xpath=//div[@id='topBar']//span[text()='Scheduling']
${Scheduling icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/scheduling']

${plant_filter_data_textfile}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_plant_filter_data_list.txt
${health_care_plants_textfile}  ../Data/health_care_plants.txt
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${Final_exception_message_filter}  xpath=//*[@id='exp']//button[@id='filterBtn']
${exp_filter_available_list}  xpath=//div[contains(@class,'px-filter') and @id='availableFilterList']
${exp_action_Apply Button}  xpath=//*[@id="exp_action"]//button[@id="ApplyBtn"]
${Scheduling_projects_show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_module_projects_show_hide_list.text
${Scheduling_products_excel_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_excel_columns_products.txt
${Scheduling_projects_excel_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/scheduling_projects_excel_col.txt
${plant catogory filter}
${oil_and_gas_plant_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/oil_and_gas_plant_data_list
${projects}  xpath=//paper-tabs/div/div/paper-tab[2]/div
${projects_accuracy}  xpath=//mo-metrics-plot[2]//p[@id='accuracy_text']
${products_tab}  xpath=//*[@id="tabsContent"]/paper-tab[1]
${product_accuracy}  xpath=//mo-metrics-plot//p[@id='accuracy_text']
${scrapped_quantity_col_show/hide}  //div[@id='checkboxLabel']//div[contains(normalize-space(), 'Scrapped Quantity')]
${scrapped_quantity_grid_col}  xpath=//*[@id="content"]/div/span[text()='Scrapped Quantity']
${export_excel_btn}  xpath=//*[@id="mos-xls-button"]/a
${export_excel_btn_Projects}  xpath=//*[@id="oldXlsExport"]
${show/selected_scheduling}  xpath=//mm-filter/px-filter/div/div[2]/div[2]/div/span
${paper_checkbox_plant}  xpath=//px-filter/div/div[2]/div[3]/div/paper-checkbox/div

${business_apply_button}  xpath=//*[@id='business']//button[@id='ApplyBtn']
${plant_business_list}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/plant_business_executive_summary.txt
${SHOW_SELECTED_BUSINESS}  xpath=//mm-filter[5]/px-filter/div/div[2]/div[2]/div/span
${paper_checkbox_business}  xpath=//mm-filter[5]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div
${Planner / MRP Contr. filter button scheduling}  xpath=//header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Planner / MRP Controller')]
${current_finish_date_year}  xpath=//mm-filter[7]/daterange-filter/div/div[2]/div/div[2]/px-datetime-field/div/px-datetime-entry/div/div/px-datetime-entry-cell/input
${current_finish_date_apply_button}  xpath=//*[@id='cfd']//button[@id='ApplyBtn']
${ideal_finish_date_year}  xpath=//mm-filter[8]/daterange-filter/div/div[2]/div/div/px-datetime-field/div/px-datetime-entry/div/div/px-datetime-entry-cell/input
${ideal_finish_date_apply_button}  xpath=//*[@id='ifd']//button[@id='ApplyBtn']
${bioprod_erp_textfile}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/bioprod_erp_plats.txt
${project code col from show/hide}  xpath=//div[@id='checkboxLabel']//div[contains(normalize-space(), 'Project Code')]
${project name col from show/hide}  xpath=//div[@id='checkboxLabel']//div[contains(normalize-space(), 'Project Name')]
${Material Description col from show/hide}  xpath=//div[@id='checkboxLabel']//div[contains(normalize-space(), 'Material Description')]
${Production / Work Order col from show/hide}  xpath=//div[@id='checkboxLabel']//div[contains(normalize-space(), 'Production / Work Order')]
${Open Reservation Value col from show/hide}  xpath=//div[@id='checkboxLabel']//div[contains(normalize-space(), 'Open Reservation Value')]
${business from settings}  xpath=//mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div/mo-settings-item-list/div/span
${region from settings}  xpath=//mo-settings/div[2]/div/px-accordion/section/iron-collapse/div/div/mo-settings-item-list[4]/div/span
${search_input_plant}  xpath=//*[@id="search-input"]
${db_search_path}  public
