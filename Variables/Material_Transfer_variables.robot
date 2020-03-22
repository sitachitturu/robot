*** Variables ***
${plant Business filter}  xpath=//*[@id='filterlist']//input[@value='business']
${Buyer filter}  xpath=//*[@id='filterlist']//input[@value='buyer']
${plant_Apply_Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${ordertype_apply_button}  xpath=//*[@id="order_type"]//button[@id="ApplyBtn"]
${buyer_apply_button}  xpath=//*[@id="buyer"]//button[@id="ApplyBtn"]
${export_excel_btn for buying opp}  xpath=//*[@id="buyingOpp"]//*[@id="mos-xls-button"]
${export all for buyer grid}  xpath=//*[@id="buyingOpp"]//*[@id="newXlsExport"]/div[2]/label[2]
${export button for buyer excel}  xpath=//*[@id="buyingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
${export_excel_btn for selling opp}  xpath=//*[@id="sellingOpp"]//*[@id="mos-xls-button"]
${export all for seller grid}  xpath=//*[@id="sellingOpp"]//*[@id="newXlsExport"]/div[2]/label[2]
${export button for seller excel}  xpath=//*[@id="sellingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
${UI_Value_for_buying opp.}  xpath=//*[@id="legendValue__Buying Opportunities"]
${UI_Value_for_selling opp.}  xpath=//*[@id="legendValue__Selling Opportunities"]
${UI_Value for opp....}
${Total Opportunity for buy sum from excel}
${Total Opportunity for buy sum from excel..}
${Total Opportunity for selling sum from excel}
${Total Opportunity for selling sum from excel2..}
${UI_Value for selling opp....}
${rejected tab for buying}  xpath=//*[@id="tabsContent"]/paper-tab[5]/div
${rejected tab for seller}  xpath=//mo-material-transfer/div/div[2]/div/div[1]/div[2]/mo-grid-lite[1]/div[2]/span[2]/div/div/paper-tabs/div/div/paper-tab[5]/div
${export to excel for rejected for buyer}  xpath=//mo-filter-context/mo-material-transfer/div/div/div/div[@id='buyingOpp']/div/mo-grid-lite[2]/div/div/a
${export to excel for rejected for seller}  xpath=//mo-material-transfer/div/div[2]/div[2]/div[1]/div/mo-grid-lite[2]/div[2]//div[@id="mos-xls-button"]
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="mos-show-hide-container"]/div[@id="gridContainer"]/ul
${MT_OPPO._show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/material_transfer_opportunities_showhide_list.txt
${MT_OPPO.buyer _show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/material_transfer_buying_grid_oppo_show_hide_list.txt
${MT_rejected.buyer _show/hide_col}  ../Data/All_Mod_Show_Hide_Col_Text_Files/material_transfer_buying_grid_rejected_showhide_list.txt
${show/hide column for rejectedfor seller/buyer}  xpath=//mo-grid-lite[@id='materialTransferSellingRejectTable']/div /span/div/div/paper-tabs/div/div/paper-tab[5]/div
${show/hide column for rejectedfor buyer}  xpath=//mo-grid-lite[@id='materialTransferBuyingRejectTable']/div/div/div/div/paper-tabs/div/div/paper-tab[5]/div
${show/hide column list for rejected for buyer ui}  xpath=//mo-grid-lite[@id='materialTransferBuyingRejectTable']/div/div/div/mo-show-hide/div/div[@id='gridContainer']/ul
${show/hide column list for rejected for seller ui}  xpath=//mo-grid-lite[@id='materialTransferSellingRejectTable']/div//div/mo-show-hide/div/div[@id='gridContainer']/ul
${show/hide column list for rejected for seller}  ../Data/All_Mod_Show_Hide_Col_Text_Files/material_transfer_rejected_showhide_seller_list.txt
${show/hide column for buying grid}  xpath=//mo-grid-lite[@id='materialTransferBuyingAcceptTable']/div /div/mo-show-hide[@id='showHideModule']/div/button
${export all button for selling}  xpath=//*[@id="sellingOpp"]//*[@id="mos-xls-button"]//*[@id="all"]
${total_no.ofrows_excel..}
${db_duplicate_recrds_count..}
${db_records_count..}
${total_no.ofrows_rejected_excel..}
${sum of oppor+reject}
${total_no.ofrows_excel for opportunities..}
${export all button from excel}  xpath=//mo-material-transfer/div/div[2]/div[2]/div[2]/div/mo-grid-lite/div[2]/div[1]/mo-export-excel/div[2]/label[2]
${export_button_inside_export to excel}  xpath=//*[@id="buyingOpp"]//*[@id="newXlsExport"]/div[2]/div/a
${in process tab}  xpath=//*[@id="tabsContent"]/paper-tab[2]/div
${Accepted tab}  xpath=//*[@id="tabsContent"]/paper-tab[3]/div
${Rejected tab}  xpath=//*[@id="tabsContent"]/paper-tab[5]/div
${decision dropdown in buying grid}  xpath=//mo-grid-lite[@id='materialTransferBuyingAcceptTable']//select[@id="columnValuesList"]
${in process tab in buyer grid}  xpath=//mo-grid-lite[@id='materialTransferBuyingAcceptTable']//*[@id="tabsContent"]/paper-tab[2]/div
${buyer grid column value list}  xpath=//mo-grid-lite[@id='materialTransferBuyingAcceptTable']//*[@id="columnValuesList"]
###====================================================================================================================================================
${waiting for action count_number}
${waiting for action value_number1..}
${IN PROCESS count_number}
${IN PROCESS value_number1..}
${ACCEPTED count_number}
${ACCEPTED value_number1..}
${EXECUTED count_number}
${EXECUTED value_number1..}
${REJECTED count_number}
${REJECTED value_number1..}
${waiting for action count_number_buyer}
${waiting for action value_number1_buyer..}
${Total Opportunity for buying sum from excel2..}
${IN PROCESS count_number_buyer}
${IN PROCESS value_number1_buyer..}
${ACCEPTED count_number_buyer}
${ACCEPTED value_number1_buyer..}
${EXECUTED count_number_buyer}
${EXECUTED value_number1_buyer..}
${EXECUTED count_number_buyer}
${EXECUTED value_number1_buyer..}
${REJECTED count_number_buyer}
${REJECTED value_number1_buyer1..}