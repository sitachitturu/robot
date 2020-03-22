*** Variables ***
${mo header}  xpath=//header[@role='banner']/h1
#${predix image}  xpath=//header[@role='banner']/div/img
${predix image}  xpath=//*/img[@src="https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/modules/mo-header/img/predix_logo.png"]
${footer}  xpath=//span[@id='copyright']
${Plant Comparison Page Title}  xpath=//div[@id='topBar']/span
${Plant Comparison Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/plant-comparison']
#${Plant Comparison Icon}  xpath=//*/a/span[contains (text (), "Plant Comparison")]
${Plant filter}  xpath=//mm-filter[@id='plant']//button[@id='filterBtn'][1]
${Value in plant filter}  xpath=//paper-checkbox[@name-id='$']/div
${Plant filter apply button}  xpath=//mm-filter[@id='plant']//button[@id='ApplyBtn']
${Plant name grid}   //tbody[@id='items']/tr/td/vaadin-grid-cell-content/mo-column/a/div
${grid plant scores}   //tbody[@id='items']/tr/td[2]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${grid scheduling score}  //tbody[@id='items']/tr/td[3]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${grid Purchase orders score}  //tbody[@id='items']/tr/td[4]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${grid Requisitions score}  //tbody[@id='items']/tr/td[5]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${Plant business filter}  xpath=//mm-filter[@id='business']//button[@id='filterBtn'][1]
${Value in Business filter}  xpath=//paper-checkbox[@name-id='$']/div/div[@id='checkbox']
${Business filter apply button}   xpath=//mm-filter[@id='business']//button[@id='ApplyBtn']

${Main_Module_Tab}  //nav[@role='navigation']//button[@class='btn btn--bare btn--svg style-scope px-app-nav']

${All_Plant_Score}  //div[@id='rateContainer']//span[contains(text(),'ALL PLANTS SCORE')]

${Percent_icon}  //div[@id='topSpine']//span[@id='percent']

${Score_Opportunity_tab_Present}  //div[@class='switchTab style-scope mo-plant-comparison']//div[@id='tabsContent']

${Plant_Business_Filter}   //button[@id='filterBtn']//span[contains(text(),' Plant Business')]

${Plant_Filter}  //button[@id='filterBtn']//span[contains(text(),' Plant')]

${Edit_Filter_Button}  //button[@id='addFilterBtn']

${Edit_Filter_Options}  //*[@id='filterlist']//input[@value='$']

${Plant_Category_Filter}  //button[@id='filterBtn']//span[contains(text(),'Plant Category')]

${Plant_Region_Filter}  //button[@id='filterBtn']//span[contains(text(),'Plant Region')]

${Apply_Button}  //*[@id='$']//button[@id="ApplyBtn"]

${Show_Selected}  //*[@id='$']//span[@id="showSelected"]

${Plant_Score_Show_Hide_Button}  //div[@id='tabsContent']//div[contains(text(),'Score')]

${Plant_Opportunity_Show_Hide_Button}  //*[@id="tabsContent"]/paper-tab[2]/div

${Plant_Show_Hide_Values}  //ul[@class='tableGrid style-scope mo-show-hide']/li

${Plant_Show_hide_button}  //button[@class='showHideButton style-scope mo-show-hide']

${Plant_actual_showhide_values}  [Plant Name, Plant Score, Scheduling, Purchase Orders, Requisitions, CC Accuracy, CC On-Time, Master Data, Inventory, Trending]

${showhide_PlantName}  //div[@id='gridContainer']/ul[@class='tableGrid style-scope mo-show-hide']/li[@class='style-scope mo-show-hide'][1]

${showhide_PlantScore}  //div[@id='gridContainer']/ul[@class='tableGrid style-scope mo-show-hide']/li[@class='style-scope mo-show-hide'][2]

${Score_showhide_Scheduling}  //div[contains(text(),'Scheduling')]

${Score_showhide_PurchaseOrders}  //div[@id='gridContainer']/ul[@class='tableGrid style-scope mo-show-hide']/li[@class='style-scope mo-show-hide'][4]

${Score_showhide_Requisitions}  //div[contains(text(),'Requisitions')]

${Score_showhide_CC Accuracy}  //div[contains(text(),'CC Accuracy')]

${Score_showhide_MasterData}  //div[@id='gridContainer']/ul[@class='tableGrid style-scope mo-show-hide']/li[@class='style-scope mo-show-hide'][8]

${Score_showhide_Inventory}  //div[contains(text(),'Inventory')]

${Score_showhide_Trending}  //div[contains(text(),'Trending')]

${Opportunity_showhide_Purchase Order}  //div[contains(text(),'Purchase Order($)')]

${Opportunity_showhide_Stock Policy}  //div[contains(text(),'Stock Policy($)')]

${Opportunity_showhide_Entitlement}  //div[contains(text(),'Entitlement($)')]

${Opportunity_showhide_Total Opportunity}  //div[contains(text(),'Total Opportunity($)')]

${Opportunity_showhide_YTD Realized Opp}  //div[contains(text(),'YTD Realized Opp($)')]

${Opportunity_showhide_button}  //mo-grid[@id='grid-1']//div[@id='mos-show-hide-button']

${Score_showhide_12-month-smi}  //div[contains(text(),'12-month SMI')]

${Score_showhide_Variation_to_entitlement}  //div[contains(text(),'Variation to Entitlement')]

${Score_showhide_CC Ontime}  //div[contains(text(),'CC On-Time')]


${12-smi-smi-column}  xpath=//vaadin-grid-table/table/thead/tr/th[6]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${variation_to_entitlement_col}  xpath=//vaadin-grid-table/table/thead/tr/th[7]/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${smi_row_value}  xpath=//vaadin-grid-table/table/tbody/tr/td[6]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${plant_com_plant_filter_textfile}  ../Data/All_Mod_Show_Hide_Col_Text_Files/plant_comparision_textfile.txt
${var_to_entitlement_row_value}  xpath=//vaadin-grid-table/table/tbody/tr/td[7]/vaadin-grid-cell-content/mo-indicator-column/a/div/div

${show/selected}  //mm-filter[@id='plant']//span[@id='showSelected']
${paper_checkbox}  //mm-filter[@id='plant']//div[@id='checkboxContainer'][1]

${Accuracy_Value}  xpath=//div[@class='style-scope mo-plant-comparison-spine']//span[@id='accuracy']

${Spine_Performance_Indicator_Style}  xpath=//div[@class='style-scope mo-plant-comparison-spine']//div[@id='accuracyBarProgress']@style

${Opportunity_purchase_order_live_opp}  //div[contains(text(),'Purchase Order Live Opp($)')]
${Opportunity_purchased_order_realized_opp}  //div[contains(text(),'Purchase Order Realized Opp($)')]
${Opportunity_purchase_order_missed}  //div[contains(text(),'Purchase Order Missed Opp($)')]
${Opportunity_scheduling_live_opp}  //div[contains(text(),'Scheduling Live Opp($)')]
${Opportunity_scheduling_missed_opp}  //div[contains(text(),'Scheduling Missed Opp($)')]
${Opportunity_scheduling_realized_opp}  //div[contains(text(),'Scheduling Realized Opp($)')]
${Opportunity_total_live_opp}  //div[contains(text(),'Total Live Opp($)')]
${plant filter check box}  xpath=//div[@id='filterContent']//div[@id='checkboxContainer']

