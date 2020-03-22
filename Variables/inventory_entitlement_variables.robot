*** Variables ***
${Inventory Entitlement Page Title}  xpath=//div[@id='topBar']//span[text()='Inventory Entitlement']
${Inventory Entitlement icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/inventory-entitlement']
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul
${InvEntitlement_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/Inventory_Entitlement_show_hide_list.text
${PLANT COLUMN}  xpath=//*[@id="content"]/div/span[text()='Plant']
${On Hand Column}  xpath=//*[@id="content"]/div/span[text()='On Hand']
${Standard Inventory Column}  xpath=//*[@id="content"]/div/span[text()='Standard Inventory']
${Slow Moving Inv column}  xpath=//*[@id="content"]/div/span[text()='Slow Moving Inv']
${Active Inv column}  xpath=//*[@id="content"]/div/span[text()='Active Inv']
${Entitlement Inv column}  xpath=//*[@id="content"]/div/span[text()='Entitlement Inv']
${- Var to Entitlement Column}  xpath=//*[@id="content"]/div/span[text()='- Var to Entitlement']
${+ Var to Entitlement Column}  xpath=//*[@id="content"]/div/span[text()='+ Var to Entitlement']
${Entitlement Variation column}  xpath=//*[@id="content"]/div/span[text()='Entitlement Variation']
${Total Outputs column}  xpath=//*[@id="content"]/div/span[text()='Total Outputs']
${Firm Inputs column}  xpath=//*[@id="content"]/div/span[text()='Firm Inputs']
${Export to Excel}  //*[@id="mos-xls-button"]
${count(#)}  xpath=//*[@id="tabsContent"]/paper-tab[1]/div
${TotalStockUSD_spine}  xpath=//*[@id="spine-container"]/div/div[1]/div/div/span[1]/span
${ActiveUSD_spine}  xpath=//*[@id="spine-container"]/div/div[2]/div[1]/div/div/span[1]
${SMI>12 MM USD_spine}  xpath=//*[@id="spine-container"]/div/div[2]/div[2]/div/div/span[1]
${EntitlemntInv_spine}  xpath=//*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[1]
${Total_QTRInput_spine}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[1]
${EndOfQTR_Inv_spine}  xpath=//*[@id="spine-container"]/div/div[5]/div[1]/div/div/span[1]
${QTR_I/O_Difference_spine}  xpath=//*[@id="spine-container"]/div/div[5]/div[2]/div/div/span[1]
${+Var_To_Entitlement_spine}  xpath=//*[@id="spine-container"]/div/div[4]/div[1]/div/div/span[1]
${Total_QTR_output_Usd_spine}  xpath=//*[@id="spine-container"]/div/div[4]/div[2]/div/div/span[1]

${Total_stock_Usd_spine_value}  xpath=//*[@id="spine-container"]/div/div[1]/div/div/span[2]
${TotalStock_usd_value_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[3]/vaadin-grid-cell-content/mo-column/div

${Active_Usd_spine_value}  xpath=//*[@id="spine-container"]/div/div[2]/div[1]/div/div/span[2]
${Active_Usd_spine_grid_value}  xpath=//vaadin-grid-table/table/tbody/tr/td[11]/vaadin-grid-cell-content/mo-column/div

${smi>12mm_usd_spine_value}  xpath=//*[@id="spine-container"]/div/div[2]/div[2]/div/div/span[2]
${smi>12mm_usd_spine_grid_value}  xpath=//vaadin-grid-table/table/tbody/tr/td[9]/vaadin-grid-cell-content/mo-column/div

${entitlement_inv_spine_value}  xpath=//*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]
${entitlement_inv_spine_grid_value}  xpath=//vaadin-grid-table/table/tbody/tr/td[13]/vaadin-grid-cell-content/mo-column/div

${Total_Qtr_Input_usd_value}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]

${+VarToEntitlement_spine_value}  xpath=//*[@id="spine-container"]/div/div[4]/div[1]/div/div/span[2]
${+VarToEntitlement_spine_grid_value}  xpath=//vaadin-grid-table/table/tbody/tr/td[17]/vaadin-grid-cell-content/mo-column/div

${Total_Qtr_Output_usd_spine_value}  xpath=//*[@id="spine-container"]/div/div[4]/div[2]/div/div/span[2]
${EndOfQtrInv_spine_value}  xpath=//*[@id="spine-container"]/div/div[5]/div[1]/div/div/span[2]
${Qtr_I/O_Diff_spine_value}  xpath=//*[@id="spine-container"]/div/div[5]/div[2]/div/div/span[2]
${indicator}  xpath=//div[contains(@class,'px-performance-indicator') and @id='spine-container']
${smi_performance_indicator}  xpath=//*[@id="spine-container"]/div/div[2]/div[2]/div/div/span[2]/px-performance-indicator
${+var_to_entitlement_per_indicator}  xpath=//*[@id="spine-container"]/div/div[4]/div[1]/div/div/span[2]/px-performance-indicator/div
${qtr_i/o_diff_perf_indicator}  xpath=//*[@id="spine-container"]/div/div[5]/div[2]/div/div/span[2]/px-performance-indicator/div
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${tree map title toltip}  xpath=//div[contains(@class,' mo-inventory-entitlement') and @id='tooltip-title']//span[contains(text(),' SIZE AND COLOR')]
${tool tip message for title}  xpath=//div[contains(@class,' mo-inventory-entitlement') and @id='tooltip-message']
${tol tip equation for title}  xpath=//div[contains(@class,' mo-inventory-entitlement') and @id='tooltip-eq']
${grid_value_onhand}  xpath=//*[@id="dataTableGrid"]/div/div[3]/table/tbody/tr/td[2]
${inv_entitlement_plant_filter_data_text}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/Inv_Entitlement_plant_filter_data.txt
${plant_tree_tab_title}  xpath=//*[@id="tabtitle"]
${Value ($)}  xpath=//mo-grid/div[1]/div[3]/paper-tabs/div/div/paper-tab[2]/div
${Quantity (#)}  xpath=//paper-tab/div[contains(.,'Quantity (#)')]

${onhand_col_row1}  xpath=//vaadin-grid-table/table/tbody/tr[1]/td[3]/vaadin-grid-cell-content/mo-column/div
${onhand_col_row2}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[3]/vaadin-grid-cell-content/mo-column/div
${onhand_col_row3}  xpath=//vaadin-grid-table/table/tbody/tr[3]/td[3]/vaadin-grid-cell-content/mo-column/div

${plant_tree_tab_title}  xpath=//*[@id="tabtitle"]

${active_usd_col_row1}  xpath=//vaadin-grid-table/table/tbody/tr[1]/td[11]/vaadin-grid-cell-content/mo-column/div
${active_usd_col_row2}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[11]/vaadin-grid-cell-content/mo-column/div
${active_usd_col_row3}  xpath=//vaadin-grid-table/table/tbody/tr[3]/td[11]/vaadin-grid-cell-content/mo-column/div

${smi_usd_column_row1}  xpath=//vaadin-grid-table/table/tbody/tr[1]/td[9]/vaadin-grid-cell-content/mo-column/div
${smi_usd_column_row2}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[9]/vaadin-grid-cell-content/mo-column/div
${smi_usd_column_row3}  xpath=//vaadin-grid-table/table/tbody/tr[3]/td[9]/vaadin-grid-cell-content/mo-column/div

${Entitlement_inv_column_row1}  xpath=//vaadin-grid-table/table/tbody/tr[1]/td[13]/vaadin-grid-cell-content/mo-column/div
${Entitlement_inv_column_row2}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[13]/vaadin-grid-cell-content/mo-column/div
${Entitlement_inv_column_row3}  xpath=//vaadin-grid-table/table/tbody/tr[3]/td[13]/vaadin-grid-cell-content/mo-column/div

${+var_to_entitlement_column_row1}  xpath=//vaadin-grid-table/table/tbody/tr[1]/td[17]/vaadin-grid-cell-content/mo-column/div
${+var_to_entitlement_column_row2}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td[17]/vaadin-grid-cell-content/mo-column/div
${+var_to_entitlement_column_row3}  xpath=//vaadin-grid-table/table/tbody/tr[3]/td[17]/vaadin-grid-cell-content/mo-column/div

${test_scroll_bar}  xpath=//*[@id="dataTableGrid"]/div/div[2]/div
${ELEMENT SOURSE}  xpath=//*[@id="treemap"]/div/div/svg[2]/g[1]/g[4]
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${Material SKU Title}  xpath=//span[contains(@class,'mo-inventory-entitlement') and @id='tree-title']
${purchasing group title}  xpath=//span[contains(@class,'mo-inventory-entitlement') and @id='tree-title']
${text_file}  ../Data/All_Mod_Show_Hide_Col_Text_Files/plant_filter_validation list.text
${text_buisiness}  ../Data/All_Mod_Show_Hide_Col_Text_Files/business file.text
${region_text}  ../Data/All_Mod_Show_Hide_Col_Text_Files/region.text
