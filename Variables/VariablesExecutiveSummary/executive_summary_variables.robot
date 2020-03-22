*** Settings ***
Resource   ../../Variables/VariablesCommon/common_variables.robot

*** Variables ***
${Page title=Executive Summary}  //div[@id='topBar']//span[contains(normalize-space(), 'Executive Summary')]
${Page Spinner}  xpath=//div[@id='pageSpinner']
${search input}  xpath=//*[@id='plant']//input[@id="search-input"]
${Transaction Comming soon}  xpath=//div[@id='div6']//img[@src='${WELCOME.URL}/modules/mo-executive-summary/img/Transaction+Coming+Soon.png']
${MoPo Accuracy}  xpath=//span[contains(@class,'mo-purchase-order') and @id='accuracy']
${MoScheduling Accuracy}  xpath=//span[contains(@class,'mo-scheduling-summary') and @id='accuracy']
${MoPr Accuracy}  xpath=//div[@class='style-scope mo-purchase-req']//div[@id='accuracyContainer']//div[@id='accuracyRateContainer']//span[@id='accuracy']
${MoSpine Accuracy}  xpath=//div[@class='style-scope mo-es-spine']//div[@id='accuracyContainer']//span[@id='accuracy']
${scheduling scorecard}  xpath=//*[@id="div4"]//*[@id="schedulingId"]
${Trending title}  xpath=//*[@id="trend_title"]
${Plants/plant Title}  xpath=//*[@id="container"]//*[@id="title"]
${scheduling toltip}  xpath=//div[@id='tooltip']//div[@id='message']//span[contains(text(),'View Schedule Trends')]
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${tootip}  xpath=//*[@id="tooltip"]
${moscheduling accuracy trending}  xpath=//span[contains(@class,'mo-mid-bar') and @id='actionStat']
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul
${date range value}  xpath=//span[contains(@class,'mo-trending') and @id='actionStat']
${Export to Excel}  //*[@id="mos-xls-button"]/a
${trend icon}  xpath=//i[contains(@class,'mo-executive-summary') and @id='scd-trend']
${scheduling accuracy}  //*[@id="item2"]/mo-mid-bar/div/div/span

${Scheduling_trending_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/EXS_Sche_Trend_show_hide_list.text
${Purchase_Orders_trending_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/EXS_Purch_Trend_show_hide_list.text

${Executive-Summary Iicon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/executive-summary']
${purchase_orders icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/purchase-orders']
${scheduling icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/scheduling']
${purchase orders score card}  xpath=//*[@id="div2"]//*[@id="procurementId"]
${trend icon for PO}  xpath=//i[contains(@class,'mo-executive-summary') and @id='purO-trend']
${purchase orders toltip}  xpath=//div[@id='tooltip']//div[@id='message']//span[contains(text(),'View Purchase Order Trends')]
${On-time-open-PO trending}  xpath=//mo-executive-summary/div[2]/mo-trending/div/div[2]/div/div[2]/div[2]/mo-mid-bar/div/div/div/span
${On-Time-Open-PO}  xpath=//span[contains(@class,'mo-purchase-order') and @id='accuracy']
${PO-Score-Card-Show/hide-list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/PO_score_card_show_hide_list.text
${purchasing_score_card}  xpath=//*[@id="div1"]
${purchase_requisition module}  xpath=//ul[@id='navitemlist']//a[@href='/secure/purchasing']
${significantly Aged col}  xpath=//vaadin-grid-table/table/tfoot/tr/td[2]/vaadin-grid-cell-content/mo-column/div
${total_sign_aged_col}  xpath=//*[@id="purchaseHeatMap"]/div/div[3]/table/tfoot/tr/td[2]/div/span/div/span
${purchase_orders module}  xpath=//ul[@id='navitemlist']//a[@href='/secure/purchase-orders']
${heatmap_grid}  xpath=//*[@id="mainContainer"]/div/mm-purchase-orders/div/div[1]/mo-heatmap/div[2]

${30+days_total}  xpath=//table/tfoot/tr/td[3]/vaadin-grid-cell-content/mo-column/div
${<30days_total}  xpath=//table/tfoot/tr/td[4]/vaadin-grid-cell-content/mo-column/div
${future_total}  xpath=//table/tfoot/tr/td[6]/vaadin-grid-cell-content/mo-column/div

${total_total}  xpath=//div[2]/vaadin-grid/vaadin-grid-table/table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
${value_on-time-po}  xpath=//span[contains(@class,'mo-purchase-req') and @id='accuracy']
${accuracy_bar}  xapth=//*[@id="accuracyBarProgress"]//*[contains(@style, "background-color")
${no_source_Apply Button}  xpath=//*[@id="source"]//button[@id="ApplyBtn"]
${heat_map_grid_pr}  xpath=//*[@id="mainContainer"]/div/mm-purchasereqs/div/div/mo-heatmap/div[2]
${no_source}  xpath=//*[@id="product-No Source"]/*/*[@class="count style-scope px-filter"]
${column Age Bucket Value}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Net Days For Age Bucket')]
${executive_summary_plant_data}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/executive-summary-plant-filter-data.txt
${heatmap_total_col}  xpath=//table/tfoot/tr/td[6]/vaadin-grid-cell-content/mo-column/div
${purchase_order_score_card}  xpath=//*[@id="div2"]
${shortcycle_yes}  xpath=//*[@id="product-Yes"]/*/*[@class="count style-scope px-filter"]
${short_cycle_Apply Button}  xpath=//*[@id="sc"]//button[@id="ApplyBtn"]
${action_stat_po}  xpath=//span[contains(@class,'mo-small-bar') and @id='actionStat']
${exp_message}  xpath=//span[contains(@class,'mo-small-bar') and @id='actionStat']
${exception_message}  xpath=//div/px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
${cancellation_total}  xpath=//table/tfoot/tr/td[3]/vaadin-grid-cell-content/mo-column/div
${reschedulein_total}  xpath=//table/tfoot/tr/td[4]/vaadin-grid-cell-content/mo-column/div
${action_stat_po_cancellation}  xpath=//span[contains(@class,'mo-block-bar') and @id='actionStat']
${action_stat_po_reschedulein}  xpath=/html/body/div[2]/div/div/mo-executive-summary/div/div/div/div[2]/mo-purchase-order/div/div[3]/mo-block-bar[2]/div/div/span[contains(@class,'mo-block-bar') and @id='actionStat']
${action_stat_po_rescheduleout}  xpath=/html/body/div[2]/div/div/mo-executive-summary/div/div/div/div[2]/mo-purchase-order/div/div[3]/mo-block-bar[3]/div/div/span[contains(@class,'mo-block-bar') and @id='actionStat']
${rescheduleout_total}  xpath=//table/tfoot/tr/td[5]/vaadin-grid-cell-content/mo-column/div
${master_data_score_card}  xpath=//*[@id="div5"]
${master_data_module}  xpath=//ul[@id='navitemlist']//a[@href='/secure/master-data']
${quantity col_count}  xpath=/html/body/div[2]/div/div/mo-master-data/div/mo-master-data-grid/div/div[2]/mo-master-data-row/div/div[4]
${priority_cell}  xpath=/html/body/div[2]/div/div/mo-master-data/div/mo-master-data-grid/div/div[2]/mo-master-data-row/div/div/mo-master-data-priority-cell/svg/g/text

${exp_requires_action_apply}  xpath=//*[@id="exp_action"]//button[@id="ApplyBtn"]


${selected_plant_score}
${Procurement-Short Cycle}
${Procurement-On Time Reqs}
${Procurement-On Time Pos}
${Scheduling-Scheduling Accuracy}
${calculated score}

${Possible Points for Procurement-On Time Reqs}  16.2
${Possible Points for Procurement-On Time Pos}  10.8
${Possible Points for Procurement-Short Cycle}  2.7
${Possible Points for Procurement-Cancellations}  21.6
${Possible Points for Procurement-Reschedule Ins}  16.2
${Possible Points for Procurement-Reschedule Outs}  16.2
${Possible Points for Scheduling-Scheduling Accuracy}  16.2

${md_value}  //md-bar[@id='custImp']//span[@id='actionStat']
${md_cost_value}  //md-bar[@id='costImp']//span[@id='actionStat']
${md_strategy_value}  //md-bar[@id='replenish']//span[@id='actionStat']
${region_Apply Button}  xpath=//*[@id="region"]//button[@id="ApplyBtn"]

${value_tab}  xpath=//div/div/paper-tab[2]/div
${total_col_grid}  xpath=//table/tfoot/tr/td[7]/vaadin-grid-cell-content/mo-column/div
${cancellation_col}  xpath=//table/tfoot/tr/td[3]/vaadin-grid-cell-content/mo-column/div
${reschedule_in_col}  xpath=//table/tfoot/tr/td[4]/vaadin-grid-cell-content/mo-column/div
${reschedule_out_col}  xpath=//table/tfoot/tr/td[5]/vaadin-grid-cell-content/mo-column/div
${exception_require_action_filter_editfilters}  xpath=//*[@id='filterlist']//input[@value='exp_action']
${short cycle filter edit filters}  xpath=//*[@id='filterlist']//input[@value='sc']
${final exeption message filter edit filters}  xpath=//*[@id='filterlist']//input[@value='exp']
${age_classification_button}  xpath=//div/px-dropdown[2]/div/px-dropdown-text/span
${exception_message}  xpath=//div/px-dropdown[2]/div[2]/px-dropdown-content/div/ul/li[2]
${value$_tab}  //div[@id='tabsContent']//div[contains(normalize-space(), 'Value ($)')]
${exception_requires_action_filter}  xpath=//paper-checkbox[@id='product-Action Required']
${action_required}  xpath=//paper-checkbox[@id='product-Action Required']
${exp_apply_button}  xpath=//*[@id="exp_action"]//button[@id="ApplyBtn"]
${plant filter check box}  xpath=//div[@id='filterContent']//div[@id='checkboxContainer']
${executive}
${schedulingc}
${schedulingIn}
${schedulingOut}
${schedulingOverdue}
${Accuracy}
${Cancel}
${RescheduleIn}
${AccuracyProjects}
${RescheduleOut}
${Overdue}
${AccuracyProjects}
${CancelProjects}
${RescheduleInProjects}
${RescheduleOutProjects}
${OverdueProjects}
${schedule_accuracy1}
${schedule_accuracy2}
${schedule_accuracy3}
${schedule_accuracy4}

${PR_Performance_Indicator_Style}  xpath=//div[@class='style-scope mo-purchase-req']//div[@id='accuracyBarProgress']@style
${PO_Performance_Indicator_Style}  xpath=//div[@class='style-scope mo-purchase-order']//div[@id='accuracyBarProgress']@style
${Scheduling_Performance_Indicator_Style}  xpath=//div[@class='style-scope mo-scheduling-summary']//div[@id='accuracyBarProgress']@style
${Spine_Performance_Indicator_Style}  xpath=//div[@class='style-scope mo-es-spine']//div[@id='accuracyBarProgress']@style
${business_Apply Button}  xpath=//*[@id="business"]//button[@id="ApplyBtn"]
${plant_business_textfile_data}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/plant_business_executive_summary.txt
${plant_region_filter}  //*[@id='filterlist']//input[@value='region']
${sub_business_Apply Button}  xpath=//*[@id="sub_business"]//button[@id="ApplyBtn"]

${On-Time-Open-PO value}
${sumproduct}
${raw calculated score}
${Accuracy Rate value}  //mo-purchase-order[@class='style-scope mo-executive-summary']//span[@id='accuracy']
${Accuracy Rate}
${Total row}  //tfoot[@id='footer']//div[contains(normalize-space(), 'TOTAL')]
${Overall row}  //td[@is='vaadin-grid-table-footer-cell']//div[contains(normalize-space(), 'OVERALL')]
${Total_col_value}
${Total_col_count}
${Overdue_count}
${Short Cycle_count}
${Cancel process_value}
${Reschedule in_value}
${Reschedule out_value}
${Cancelaation value score card}  //mo-purchase-order[@class='style-scope mo-executive-summary']//mo-block-bar[@title='Cancellations']//span[@id='expStat']
${Reschedule In value score card}  //mo-purchase-order[@class='style-scope mo-executive-summary']//mo-block-bar[@title='Reschedule In']//span[@id='expStat']
${Reschedule Out value score card}  //mo-purchase-order[@class='style-scope mo-executive-summary']//mo-block-bar[@title='Reschedule Out']//span[@id='expStat']
${Overdue value score card}  //mo-purchase-order[@class='style-scope mo-executive-summary']//mo-block-bar[@title='Overdue']//span[@id='expStat']
${Short Cycle value score card}  //mo-purchase-order[@class='style-scope mo-executive-summary']//mo-block-bar[@title='Short Cycle']//span[@id='expStat']
${slow moving}
${total stock}
${variable..}
${variable2..}
${variable3xx}
${12-month SMI converted percentage}
${Variation Entitlement converted percentage}
${Variation Entitlementconverted}
${Variation Entitlement inventory spine}
${12-month SMIconverted}
${12-month SMI inventory spine}
${customer_value}
${strategy_value}
${search_input field in business filter}  //mm-global-filter/mm-filter[4]/px-filter/div/div[2]/div[2]/input
${selected business in show selected field}  //mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
${business filter from editfilters list}   xpath=//*[@id='filterlist']//input[@value='business']
${lazy_loading_search_icon_filter}  xpath=//*[@id="searchAction"]

