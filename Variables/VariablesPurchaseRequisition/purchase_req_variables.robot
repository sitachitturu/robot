*** Variables ***
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${plant busines filter}  xpath=//*[@id='filterlist']//input[@value='business']
${Apply button for plant busines filter}  xpath=//*[@id='business']//button[@id='ApplyBtn']
${plant region filter}  xpath=//*[@id='filterlist']//input[@value='region']
${Apply button for plant region filter}  xpath=//*[@id='region']//button[@id='ApplyBtn']
${plant category filter}  xpath=//*[@id='filterlist']//input[@value='pcat']
${Apply button for plant category filter}  xpath=//*[@id='pcat']//button[@id='ApplyBtn']
${Manufacturing}  xpath=//*[@id='pcat']//paper-checkbox[@id='product-Manufacturing']
${Hydro}  xpath=//*[@id='sub_business']//paper-checkbox[@id='product-Hydro']
${LATAM}  xpath=//*[@id='region']//paper-checkbox[@id='product-LA']
${Taubate plant}  xpath=//*[@id='plant']//paper-checkbox[@id='product-5600 - Plant Hydro Taubate']
${Purchase Requisition title}  xpath=//*[@id="topBar"]/span
${purchase_req_items_by}  xpath=//div[2]/div/div/mo-filter-context/mm-purchasereqs/div/div/mo-grid/div/span
${buyer dropdown}  //mm-purchasereqs/div/div/mo-grid/div/px-dropdown/div/px-dropdown-text
${Buyer List}  //*[@id="dropdown"]/ul

${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul

${Age Bucket column}  //*[@id="gridContainer"]/ul/li[1]
${Delivery Date}  //*[@id="gridContainer"]/ul/li[2]
${Material SKU}  //*[@id="gridContainer"]/ul/li[3]
${Value(USD)}  //*[@id="gridContainer"]/ul/li[4]
${PR Number}  //*[@id="gridContainer"]/ul/li[5]
${Export to Excel}  //*[@id="mos-xls-button"]/a
${search input}  xpath=//*[@id='plant']//input[@id="search-input"]
${value($)}  //*[@id="tabsContent"]/paper-tab[2]/div
${purchase_requi_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/purchase_requi_module_show_hide_list.text
${purchase_requi_excel_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/purchase_req_excel_col_list.txt
${Requisitions (incl. Planned) icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/purchasing']
${first_show/hide_element}  //div[@id='checkboxLabel']//div[@class='style-scope mo-show-hide']
${purch_group_cancel_button}  xpath=//*[@id='pgroup']//button[@id='cancelBtn']
${purch_group_search_input}  xpath=//mm-filter[2]/px-filter/div/div[2]/div[2]/input
${purch_group_Apply Button}  xpath=//*[@id='pgroup']//button[@id='ApplyBtn']
${planner_search_input}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[2]/input
${planner_Apply Button}  xpath=//*[@id='mrpc']//button[@id='ApplyBtn']
${Material_search_input}  xpath=//mm-filter[4]/px-filter/div/div[2]/div[2]/input
${Material_apply_button}  xpath=//*[@id='sku']//button[@id='ApplyBtn']
${vendor_search_input}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[2]/input
${vendor_apply_button}  xpath=//*[@id='source']//button[@id='ApplyBtn']
${purchase_requisions_plant_filter_data}  ../Data/All_Mod_Show_Hide_Col_Text_Files/purchasing_plant_filter_data_list.txt

${business_apply_button}  xpath=//*[@id='business']//button[@id='ApplyBtn']
${sub_business_apply_button}  xpath=//*[@id='sub_business']//button[@id='ApplyBtn']
${plant_business_list}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/plant_business_executive_summary.txt
${SHOW_SELECTED_BUSINESS}  xpath=//mm-filter[5]/px-filter/div/div[2]/div[2]/div/span
${paper_checkbox_business}  xpath=//mm-filter[5]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div
${Buyer table header}  //mo-grid[@id='purchaseOrdsHeatMap']//th[@is='vaadin-grid-table-header-cell']//span[contains(normalize-space(), 'Buyer')]
${short cycle}
${short cycle days}
${sub_business_filter}  //*[@id='filterlist']//input[@value='sub_business']
${plant_search_input}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[2]/input
${buyer_dropdown}  xpath=//px-dropdown/div/px-dropdown-text
${select_plant_from_buyerdropdown}  xpath=//px-dropdown/div[2]/px-dropdown-content/div/ul/li[5]
${requistion_date_filter}  //*[@id='filterlist']//input[@value='requisition_created_date']
${created by column from show/hide}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(),'Created By')]
${order type from show/hide}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(),'Order Type')]
${processing_status col from show/hide}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(),'Processing Status')]
${lazy_loading_search_icon_filter}  xpath=//*[@id="searchAction"]
${5+heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[2]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${3-4heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[3]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']
${<0heatmap total value}  xpath=//tr[@is='vaadin-grid-table-footer-row']/td[5]/vaadin-grid-cell-content/mo-column/div[@id='moColValue']