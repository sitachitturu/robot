*** Variables ***
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Lead Time Analytics Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/lead-time-analytics']
${Lead Time Analytics Title}  xpath=//div[@id='topBar']//span[text()='Lead Time Analytics']

${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${agregated_show_hide_list_ui}  xpath=//mo-lead-time[@id='lead-time-module']/div[@id='mo-container']/mo-grid/div[@id='gridBtn']/div/mo-show-hide/div/div[@id='gridContainer']/ul

${lead_time_details_view_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/lead_time_details_view_show_hide_list.text
${lead_time_Aggregated_view_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/lead_time_aggregated_view_show_hide_list.text

${NEGATIVE LEAD TIME}  xpath=//div[@id='spine']//span[contains(normalize-space(), 'NEGATIVE LEAD TIME')]
${POSITIVE LEAD TIME}  xpath=//div[@id='spine']//span[contains(normalize-space(), 'POSITIVE LEAD TIME')]
${SYSTEM LT}  xpath=//div[@id='spine']//span[text()='SYSTEM LT']
${ACTUAL LT}  xpath=//div[@id='spine']//span[text()='ACTUAL LT']
${TOTAL OPPORTUNITY}  xpath=//*[@id="spine"]//span[text()='TOTAL OPPORTUNITY']
${Total Fullfillment Risk}  xpath=//div[@id='spine']//span[text()='TOTAL FULFILLMENT RISK']
${Total Daily Opportunity}  xpath=//div[@id='spine']//span[text()='TOTAL DAILY OPPORTUNITY']
${Total Daily Fulfillment risk}  xpath=//div[@id='spine']//span[text()='TOTAL DAILY FULFILLMENT RISK']
${+Avg Days Push}  xpath=//div[@id='spine']//span[text()='+AVERAGE DAYS PUSH']
${-Avg Days Push}  xpath=//div[@id='spine']//span[text()='-AVERAGE DAYS PUSH']

${total_oppurtunity_spine}  xpath=//*[@id="spine-container"]/div/div[1]/div[1]/div/div/span[1]
${total_fullfillment_risk}  xpath=//*[@id="spine-container"]/div/div[1]/div[2]/div/div/span[1]
${total_daily_opp}  xpath=//*[@id="spine-container"]/div/div[2]/div[1]/div/div/span[1]
${total_daily_fullfillment}  xpath=//*[@id="spine-container"]/div/div[2]/div[2]/div/div/span[1]
${+ve avg days push}  xpath=//*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[1]
${-ve avg days push}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[1]
${PO_LT}  xpath=//*[@id="spine-container"]/div/div[6]/div/div/span

${total_daily_opp_spine_value}  xpath= //*[@id="spine-container"]/div/div[2]/div[1]/div/div/span[2]/render-html
${total_fullfillment_risk_spine_value}  xpath=//*[@id="spine-container"]/div/div[1]/div[2]/div/div/span[2]/render-html
${total_opp_spine_value}  xpath=//*[@id="spine-container"]/div/div[1]/div[1]/div/div/span[2]/render-html
${total_daily_fullfillment_risk_value}  xpath=//*[@id="spine-container"]/div/div[2]/div[2]/div/div/span[2]/render-html
${Actual_lt_spine_value}  xpath=//*[@id="spine-container"]/div/div[5]/div/div/span[2]/span[1]
${system_lt_spine_value}  xpath=//*[@id="spine-container"]/div/div[4]/div/div/span[2]/span[1]
${PO_LT_spine_value}  xpath=//*[@id="spine-container"]/div/div[6]/div/div/span[2]/span[1]

${+ve difference dropdown}  xpath=//div[2]/div/div/mo-lead-time/div/div/px-dropdown[2]/div/px-dropdown-text/span
${-ve lt difference}  xpath=//div[2]/div/div/mo-lead-time/div/div/px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]

${show_selected}  xpath=//div/header/mm-global-filter/mm-filter[2]/px-filter/div/div[2]/div[2]/div/span
${checkbox_unselect}  xpath=//div/header/mm-global-filter/mm-filter[2]/px-filter/div/div[2]/div[3]/div/paper-checkbox/div
${source_vendor_apply}  xpath=//*[@id='source_vendor']//button[@id='ApplyBtn']

${vendor_name_in_column}  xpath=//table/tbody/tr/td[1]/vaadin-grid-cell-content/mo-column/div
${total_opp_col}  xpath=//vaadin-grid-table/table/tbody/tr/td[2]/vaadin-grid-cell-content/mo-bar-column/div/div
${actual_lt_col}  xpath=//vaadin-grid-table/table/tbody/tr/td[5]/vaadin-grid-cell-content/mo-column/div
${system_lt_col}  xpath=//vaadin-grid-table/table/tbody/tr/td[4]/vaadin-grid-cell-content/mo-column/div
${avg_+ve_lt_col}  xpath=//vaadin-grid-table/table/tbody/tr/td[6]/vaadin-grid-cell-content/mo-bar-column/div/div
${+ve_avg_days_push_spine}  xpath=//*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
${avg_-ve_lt_col}  xpath=//vaadin-grid-table/table/tbody/tr/td[7]/vaadin-grid-cell-content/mo-bar-column/div/div
${-ve_avg_days_push_spine_value}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
${lt_difference_col}  xpath=//vaadin-grid-table/table/tbody/tr/td[8]/vaadin-grid-cell-content/mo-bar-column/div/div
${po_amount_col_hm}  xpath=//vaadin-grid-table/table/tbody/tr/td[3]/vaadin-grid-cell-content/mo-column/div
${lt difference dropdown}  xpath=//div[2]/div/div/mo-lead-time/div/div/px-dropdown[2]/div/px-dropdown-text/span
${negative_lt_differnce}  xpath=//div[2]/div/div/mo-lead-time/div/div/px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
${outlier_Apply Button}  xpath=//*[@id="outlier"]//button[@id="ApplyBtn"]
${outlier_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Outlier')]
${po_number col}  xpath==//div[@id='gridContainer']//div[contains(normalize-space(), 'PO Number')]
${plant_code_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Plant Code')]
${line_number_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Line Number')]
${material sku col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Material SKU')]
${Material Description}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Material Description')]
${Preprocessing LT}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Preprocessing LT')]
${System LT}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'System LT')]
${shipment_line_number_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Shipment Line Number')]
${crteation_date_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Creation Date')]
${release_number_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Release Number')]
${Source/Vendor_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Source/Vendor')]
${plant_business_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Plant Business')]
${Actual_lt_col_show_hide}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT')]
${actual_lt_avg_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT Avg')]
${actual_lt_std_dev_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT Std Dev')]
${actual_lt_+1_std_dev_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT +1 Std Dev')]
${actual_lt_-1_std_dev_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT -1 Std Dev')]
${actual_lt_+2_std_dev_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT +2 Std Dev')]
${actual_lt_-2_std_dev_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Actual LT -2 Std Dev')]
${buyer_purchasing group_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Buyer / Purchasing Group')]
${planner/mrp controller_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Planner / MRP Controller')]
${profit center_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Profit Center')]
${early/late receipt_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Early/Late Receipt')]
${po early/late by days_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Po Early/Late By days')]
${need by date_col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Need By Date')]
${orig. need by data _col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Orig. Need By Date')]
${current rivison number col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Current Revision Number')]
${po lt col}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'PO LT')]
${orig.po lt}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'Orig.PO LT')]
${asl lt}  xpath=//div[@id='gridContainer']//div[contains(normalize-space(), 'ASL LT')]


${lead_time_analytics_plant_data_textfile}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/lead_time_analytics_plant_data.txt
${show_selected_only}  xpath=//mm-filter/px-filter/div/div[2]/div[2]/div/span
${selected_plant_name}  xpath=//mm-filter/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span

${export_excel_btn}  xpath=//mo-lead-time/div/mo-grid/div[1]/div[2]/mo-export-excel/a
${export_excel_btn_aggregated}  xpath=//mo-grid[@id='leadTimeTableVendor']//div[@id='mos-xls-button']
${aggregated_btn}  xpath=//mo-grid-lite[@id='leadTimeTableVendor']/div/div/div/div/paper-tabs/div[@id='tabsContainer']/div/paper-tab[2]/div

${sku_name_in_column}  xpath=//table/tbody/tr/td[1]/vaadin-grid-cell-content/mo-column/div
${source/vendor_none_button}  xpath=//span[contains(@class,'px-filter') and @id='clearBtn']
${source/vendor_apply_button}  xpath=//mm-filter[3]/px-filter/div/div[2]/div[4]/button
${heatmap_row1}  xpath=//vaadin-grid-table/table/tbody/tr/td/vaadin-grid-cell-content/mo-column/div
${vendor_filter_selected_icon}  xpath=//mm-filter[3]/px-filter/div/div/button/iron-icon[2]
${vendor_filter_selected_icon2}  xpath=//mm-filter[3]/px-filter/div/div/button/iron-icon
${source/vendor_restricted_icon}  xpath=//mm-filter[3]/px-filter/div/div/button[2]/iron-icon
${heatmap_row2}  xpath=//vaadin-grid-table/table/tbody/tr[2]/td/vaadin-grid-cell-content/mo-column/div
${opportunity_dropdown}  xpath=//px-dropdown[2]/div/px-dropdown-text/span
${fullfillment_risk_dropdown}  xpath=//px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
${open_po_placement dropdown}  xpath=//mo-lead-time/div/div/px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[3]
${plant_filter_checkbox}  xpath=//mm-global-filter/mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[8]/div
${plant_show/selected}  xpath=//*[@id="plant"]//div[@id="showSelectedBtnContainer"]

${selected_plant_name}  xpath=//mm-filter/px-filter/div/div[2]/div[3]/div/paper-checkbox/div[2]/span
${outlier_grid_col_name}  xpath=//table/thead//th//span[text()='Outlier']
${outlier_col_data}  xpath=//mo-grid-lite[@id='leadTimeTableDetail']/div/div/vaadin-grid/vaadin-grid-table/table/tbody/tr/td[5]/vaadin-grid-cell-content/mo-column/div
${3rd checkbox}  //mm-filter[@id='plant']//paper-checkbox[3]
${material sku restricted icon}  //mm-filter[@id='sku']//div[@id='filterHeader']//iron-icon[@id='inactive-menu-dropdown']
${source vendor restricted icon}  //mm-filter[@id='source_vendor']//div[@id='filterHeader']//iron-icon[@id='inactive-menu-dropdown']
${outlier restricted icon}  //mm-filter[@id='outlier']//div[@id='filterHeader']//iron-icon[@id='inactive-menu-dropdown']
${lt reduction dropdown}  xpath=//mo-filter-context/mo-lead-time/div/div/px-dropdown[2]/div/px-dropdown-text/span
${spinner}  xpath=//*[@id="spinner"]
${heatmap}  xpath=//*[@id="dataTableGrid"]
${data_grid}  xpath=//*[@id="leadTimeTableDetail"]/div[2]
${trend button_lta}  xpath=//div[@id='tabsContainer']/div//div[contains(normalize-space(), 'Trends')]
${po amount dropdown}  xpath=//div[@id='lead-time-charts']/div//select[contains(normalize-space(), 'PO Amount')]
${po amount barchart}  xpath=//div[@id='ltaPoAmountChart']
${po count}   xpath=//*[@id="typeFrame"]/option[2]
${po count dropdown}  xpath=//div[@id='lead-time-charts']/div//select[contains(normalize-space(), 'PO Count')]
${po count barchart}  xpath=//*[@id="ltaPoLineChart"]
${leass than 5 days dropdown}  xpath=//px-dropdown[3]/div[1]/px-dropdown-text
${less than 12 days from dropdown}  xpath=//px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[5]
${all from dropdown}  xpath=//px-dropdown[3]/div[2]/px-dropdown-content/div/ul/li[1]

