*** Variables ***
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Stock Policy Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/stock-policy-dashboard']
${Stock Policy Title}  xpath=//div[@id='topBar']//span[text()='Stock Policy Opportunities']
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul
${Plant}  xpath=//*[@id="content"]/div/span[text()='Plant']
${Safety Stock}  xpath=//*[@id="content"]/div/span[text()='Safety Stock']
${Sugested SS}  xpath=//*[@id="content"]/div/span[text()='Suggested SS']
${Difference SS}  xpath=//*[@id="content"]/div/span[text()='Difference SS']
${Order Quantity}  xpath=//*[@id="content"]/div/span[text()='Order Quantity']
${Suggested OQ}  xpath=//*[@id="content"]/div/span[text()='Suggested OQ']
${Difference OQ}  xpath=//*[@id="content"]/div/span[text()='Difference OQ']
${Reorder Point}  xpath=//*[@id="content"]/div/span[text()='Reorder Point']
${Suggested ROP}  xpath=//*[@id="content"]/div/span[text()='Suggested ROP']
${Difference ROP}  xpath=//*[@id="content"]/div/span[text()='Difference ROP']
${Standard Inventory}  xpath=//*[@id="content"]/div/span[text()='Standard Inventory']
${Suggested Standard}  xpath=//*[@id="content"]/div/span[text()='Suggested Standard']
${Difference Standard}  xpath=//*[@id="content"]/div/span[text()='Difference Standard']
${Safety Stock Value}  xpath=//*[@id="content"]/div/span[text()='Safety Stock Value']
${Suggested SS (USD)}  xpath=//*[@id="content"]/div/span[text()='Suggested SS (USD)']
${Difference SS (USD)}  xpath=//*[@id="content"]/div/span[text()='Difference SS (USD)']
${Order Quantity (USD)}  xpath=//*[@id="content"]/div/span[text()='Order Quantity (USD)']
${Suggested OQ (USD)}  xpath=//*[@id="content"]/div/span[text()='Suggested OQ (USD)']
${Difference OQ (USD)}  xpath=//*[@id="content"]/div/span[text()='Difference OQ (USD)']
${Reorder Point Value}  xpath=//*[@id="content"]/div/span[text()='Reorder Point Value']
${Suggested ROP (USD)}  xpath=//*[@id="content"]/div/span[text()='Suggested ROP (USD)']
${Difference ROP (USD)}  xpath=//*[@id="content"]/div/span[text()='Difference ROP (USD)']
${Standard Inventory Value}  xpath=//*[@id="content"]/div/span[text()='Standard Inventory Value']
${Suggested Standard (USD)}  xpath=//*[@id="content"]/div/span[text()='Suggested Standard (USD)']
${Difference Standard (USD)}  xpath=//*[@id="content"]/div/span[text()='Difference Standard (USD)']

${Value ($)}  xpath=//paper-tab/div[contains(.,'Value ($)')]
${Quantity (#)}  xpath=//paper-tab/div[contains(.,'Quantity (#)')]

${column Plant}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Plant')]
${column Safety Stock}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Safety Stock')]
${column Sugested SS}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested SS')]
${column Difference SS}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference SS')]
${column Order Quantity}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Order Quantity')]
${column Suggested OQ}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested OQ')]
${column Difference OQ}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference OQ')]
${column Reorder Point}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Reorder Point')]
${column Suggested ROP}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested ROP')]
${column Difference ROP}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference ROP')]
${column Standard Inventory}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Standard Inventory')]
${column Suggested Standard}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested Standard')]
${column Difference Standard}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference Standard')]
${column Safety Stock Value}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Safety Stock Value')]
${column Suggested SS (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested SS (USD)')]
${column Difference SS (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference SS (USD)')]
${column Order Quantity (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Order Quantity (USD)')]
${column Suggested OQ (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested OQ (USD)')]
${column Difference OQ (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference OQ (USD)')]
${column Reorder Point Value}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Reorder Point Value')]
${column Suggested ROP (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested ROP (USD)')]
${column Difference ROP (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference ROP (USD)')]
${column Standard Inventory Value}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Standard Inventory Value')]
${column Suggested Standard (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Suggested Standard (USD)')]
${column Difference Standard (USD)}  xpath=//thead[@class='vaadin-grid style-scope vaadin-grid-header']//span[contains(text(),'Difference Standard (USD)')]


${tree map title toltip}  xpath=//div[contains(@class,'mo-stock-policy') and @id='tooltip-title']//span[contains(text(),' SIZE AND COLOR')]
${tool tip message for title}  xpath=//div[contains(@class,'mo-stock-policy') and @id='tooltip-message']
${tol tip equation for title}  xpath=//div[contains(@class,'mo-stock-policy') and @id='tooltip-eq']

${ELEMENT SOURSE}  xpath=//*[@id="treemap"]/div/div/svg[2]/g[1]/g[4]
${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${Material SKU Title}  xpath=//span[contains(@class,'mo-stock-policy') and @id='tree-title']
${purchasing group title}  xpath=//span[contains(@class,'mo-stock-policy') and @id='tree-title']
${queryResults}
${i icon message}  xpath=//span[contains(@class,'mo-stock-policy') and //*[@id="tooltip-title"]/span]
${i icon message..}  xpath=//span[contains(@class,'mo-stock-policy') and //*[@id="tooltip-message"]]

${cuurent_col_abc}  xpath=//*[@id="abcTable"]/div[last()]/vaadin-grid/vaadin-grid-table/table/thead/tr[1]/th[1]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span
${suugested_col_abc}  xpath=//*[@id="abcTable"]/div[last()]/vaadin-grid/vaadin-grid-table/table/thead/tr[1]/th[2]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span
${no_of_changes_col_abc}  xpath=//*[@id="abcTable"]/div[last()]/vaadin-grid/vaadin-grid-table/table/thead/tr[1]/th[3]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span

${value_icon}  xpath=//div[2]/div/div/mo-stock-policy/div/div[4]/mo-data-table/div/paper-tabs/div/div/paper-tab[2]/div
${plant_title}  xpath=//*[@id="tabtitle"]

${suggested_standard_spine}  xpath=//*[@id="spine-container"]/div/div[2]/div[2]/div/div/span[2]/render-html
${suggested_standard_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[24]/vaadin-grid-cell-content/mo-column/div

${plant_checkbox}  xpath=//div/div[2]/div[3]/div[2]/paper-checkbox[4]/div
${current_safety_stock}  xpath=//*[@id="spine-container"]/div/div[3]/div[1]/div/div/span[2]/render-html
${current_safety_stock_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[14]/vaadin-grid-cell-content/mo-column/div

${suggested_safety_stock_spine}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[2]/render-html
${suggested_safety_stock_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[15]/vaadin-grid-cell-content/mo-column/div

${current_order_quantity_spine}  xpath=//*[@id="spine-container"]/div/div[4]/div[1]/div/div/span[2]/render-html
${current_order_quantity_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[17]/vaadin-grid-cell-content/mo-column/div

${suggested_order_quantity_spine}  xpath=//*[@id="spine-container"]/div/div[4]/div[2]/div/div/span[2]/render-html
${suggested_order_quantity_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[18]/vaadin-grid-cell-content/mo-column/div

${standard_inventory_spine}  xpath=//*[@id="spine-container"]/div/div[2]/div[1]/div/div/span[2]/render-html
${standard_inventory_grid}  xpath=//vaadin-grid-table/table/tbody/tr/td[23]/vaadin-grid-cell-content/mo-column/div

${total_opportunity_spine}  xpath=//*[@id="spine-container"]/div/div[1]/div/div/span[2]/span[1]
${sugessted_ss_inc/decrease}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[1]/px-spine-tooltip/div/span/span
${sugessted_ss_decrease_value}  xpath=//*[@id="spine-container"]/div/div[3]/div[2]/div/div/span[1]/px-spine-tooltip/div/div/div[2]/div/div[2]/div[2]

${export_excel_btn}  xpath=//*[@id="mos-xls-button"]/a
${Stock_Policy_show/hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_show_hide_list.txt
${Stock_Policy_MatSKU_show_hide_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/stock_policy_material_sku_show_hide_list.txt

${Total_Opportunity_Value}  xpath=//span[@class='spine-large-number style-scope px-spine']//span[@class='spine-value style-scope px-spine']
${business_Apply Button}  xpath=//*[@id="business"]//button[@id="ApplyBtn"]
${show/hide}  xpath=//mo-stock-policy/div/div[4]/mo-grid/div/div[3]/mo-show-hide/div/button
${ss_view_details}  xpath=//section[@class='dashboard-section style-scope mo-stock-policy-dashboard'][2]/h2/a
${rop_view_details}  xpath=//section[@class='dashboard-section style-scope mo-stock-policy-dashboard'][3]/h2/a
${moq_view_details}  xpath=//section[@class='dashboard-section style-scope mo-stock-policy-dashboard'][4]/h2/a
${aBC_view_details}  XPATH=//section[@class='dashboard-section style-scope mo-stock-policy-dashboard'][5]/h2/a

#=====================================================================================================================
##polymer 3 variables

${show/hide col. ui}
${rejected tab..}
${back button SS Dashboard from SS oppo...}
${rejected tab.. for rop}
${back button SS Dashboard from rop oppo...}
${view_details for MOQ..}
${view_details for ss}
${view_details for rop..}
${rejected tab.. for moq}
${back button SS Dashboard from MOQ oppo...}
${view_details for ABC...}
${rejected tab.. for abc}
${back button SS Dashboard from ABC oppo...}
${expand button}
${month view}
${month option from dropdown}
${month view in rop}
${month view in MOQ}
${reset button}
${application name}
