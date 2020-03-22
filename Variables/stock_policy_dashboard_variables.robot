*** Variables ***
${safety_stock bar chart}  xpath=//mo-stock-policy-dashboard/section[2]/mo-bar-chart
${view_details for ss}  xpath=//mo-stock-policy-dashboard/section[2]/h2/a
${safety stock oppo.title}  xpath=//mo-filter-context/mo-tool-bar/div/paper-toolbar/div/span
${export button}  xpath=//*[@id="mos-xls-button"]
${ss opprtunities}  xpath=//mo-stock-policy-dashboard/mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[1]/div[3]/paper-tabs/div/div/paper-tab[1]/div
${rop_opp}  xpath=//mo-stock-policy-dashboard/mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[1]/div[3]/paper-tabs/div/div/paper-tab[1]/div
${moq oppor.}  xpath=//mo-stock-policy-dashboard/mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[1]/div[3]/paper-tabs/div/div/paper-tab[1]/div
${rejected}  xpath=//mo-stock-policy-dashboard/mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid-lite-tabs/div[1]/div[2]/paper-tabs/div/div/paper-tab[2]/div
${back button from sku to details_ss.opp}  xpath=//*[@id="backskuButton"]
${back button from sku to details_ROP.opp}  xpath=//*[@id="backskuButton"]
${back button from sku to details_MOQ.opp}  xpath=//*[@id="backskuButton"]

${back button SS Dashboard from SS oppo.}  xpath=//mo-safety-stock-opp[1]/div/div[2]/div
${back button SS Dashboard from ROP oppo.}  xpath=//mo-safety-stock-opp/div/div[2]/div
${back button SS Dashboard from MOQ oppo.}  xpath=//mo-safety-stock-opp/div/div[2]/div
${back button SS Dashboard from ABC oppo.}  xpath=//mo-safety-stock-opp/div/div[2]/div
${donut pie chart}  xpath=//*[@id="totalOpportunities"]
${pie chart title}  xpath=//mo-stock-policy-dashboard/section/h2
${inventory opportunities lable}  xpath=//mo-stock-policy-dashboard/section[2]/mo-bar-chart/mo-legend/div/div/label
${fullfillment opportunities}  xpath=//mo-stock-policy-dashboard/section[2]/mo-bar-chart/mo-legend/div/div[2]/label
${Reorder point bar chart}  xpath=//mo-stock-policy-dashboard/section[3]/mo-bar-chart
${view_details for rop}  xpath=//mo-stock-policy-dashboard/section[3]/h2/a
${Minium Order Qunatity bar chart}  xpath=//mo-stock-policy-dashboard/section[4]/mo-bar-chart
${ABC Classification bar chart}  xpath=//mo-stock-policy-dashboard/section[5]/mo-multi-series
${View details option for abc classification}  //mo-stock-policy-dashboard/section[5]/h2/a
${view_details for MOQ}  xpath=//mo-stock-policy-dashboard/section[4]/h2/a
${view_details for ABC}  xpath=//mo-stock-policy-dashboard/section[5]/h2/a
${safety stock bar chart title text}  xpath=//*[@id="ssdashboard"]/mo-stock-policy-dashboard/section[2]/h2/a
${abc bar chart title text}  xpath=//*[@id="ssdashboard"]/mo-stock-policy-dashboard/section[5]/h2/a
${current lable}  xpath=//mo-stock-policy-dashboard/section[5]/mo-multi-series/mo-legend/div/div/label
${Recommended}  xpath=//mo-stock-policy-dashboard/section[5]/mo-multi-series/mo-legend/div/div[2]/label
${ROP bar chart title text}  xpath=//*[@id="ssdashboard"]/mo-stock-policy-dashboard/section[3]/h2/a
${MOQ bar chart title text}  xpath=//*[@id="ssdashboard"]/mo-stock-policy-dashboard/section[4]/h2/a
${ROP oppo.title}  xpath=//mo-filter-context/mo-tool-bar/div/paper-toolbar/div/span
${MOQ oppo.title}  xpath=//mo-filter-context/mo-tool-bar/div/paper-toolbar/div/span
${ABC oppo.title}  xpath=//mo-filter-context/mo-tool-bar/div/paper-toolbar/div/span
${sku text from sku col.}
${sku text from sku col..}
${sku text from sku col...}
${sku title after sku selected}  xpath=//mo-safety-stock-opp/div/div/div[2]/mo-ms-detail/div/div/div
${recommendation tooltip}  xpath=//*[@id="id_5"]
${Plant}  xpath=//*[@id="detailBody"]/div[2]/div/div[1]//div[contains(normalize-space(), 'PLANT')]
${ESTIMATED ANNUAL USAGE}  xpath=//*[@id="detailBody"]/div[2]/div/div[2]//div[contains(normalize-space(), 'ESTIMATED ANNUAL USAGE')]
${ON HAND STOCK QTY}  xpath=//*[@id="detailBody"]/div[2]/div/div[3]//div[contains(normalize-space(), 'ON HAND STOCK QTY')]
${SUPPLIER LEAD TIME}  xpath=//*[@id="detailBody"]/div[2]/div/div[4]//div[contains(normalize-space(), 'SUPPLIER LEAD TIME')]
${LAST MOVEMENT DATE}  xpath=//*[@id="detailBody"]/div[2]/div/div[5]//div[contains(normalize-space(), 'LAST MOVEMENT DATE')]
${MRP TYPE}  xpath=//*[@id="detailBody"]/div[2]/div/div[6]//div[contains(normalize-space(), 'MRP TYPE')]
${MRP CONTROLLER NAME}  xpath=//*[@id="detailBody"]/div[2]/div/div[7]//div[contains(normalize-space(), 'MRP CONTROLLER NAME')]
${buyer_name}  xpath=//*[@id="detailBody"]/div[2]/div/div[8]//div[contains(normalize-space(), 'BUYER NAME')]
${ROUNDING VALUE}  xpath=//*[@id="detailBody"]/div[2]/div/div[9]//div[contains(normalize-space(), 'ROUNDING VALUE')]
${LAST 12 MONTH FREQUENCY}  xpath=//*[@id="detailBody"]/div[2]/div/div[10]//div[contains(normalize-space(), 'LAST 12 MONTH FREQUENCY')]
${SPend_frequency}  xpath=//*[@id="topSpine"]/div[2]/div[1]//div[contains(normalize-space(), 'SPEND - FREQUENCY')]
${FIXED VENDOR}  xpath=//mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[2]/div/div[13]/div[contains(normalize-space(), 'FIXED VENDOR')]
${fixed vendor MOQ}  xpath=//mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[2]/div/div[12]/div[contains(normalize-space(), 'FIXED VENDOR MOQ')]
${INDIVIDUAL COLLECTIVE}  xpath=//mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[2]/div/div[11]/div[contains(normalize-space(), 'INDIVIDUAL COLLECTIVE')]
${SKU CONSUMPTION}  xpath=//*[@id="detailBody"]//p[contains(normalize-space(), 'SKU CONSUMPTION')]
${Historic Consumption}  xpath=//*[@id="regWithoutMenu"]//span[contains(normalize-space(), 'Historic Consumption')]
${Future Demand}  xpath=//*[@id="regWithoutMenu"]//span[contains(normalize-space(), 'Future Demand')]
${time series chart}  xpath=//*[@id="chartSVG"]
${sku col. row1}  xpath=//mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr/td[2]/vaadin-grid-cell-content/mo-view-column/div
${SKU COL.row1 for rop}  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[2]/td[2]/vaadin-grid-cell-content/mo-view-column/div
${sku col.row1 for MOQ}  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/tbody/tr[2]/td[2]/vaadin-grid-cell-content/mo-view-column/div
${business_Apply_Button}  xpath=//*[@id="business"]//button[@id="ApplyBtn"]
${sub_business_apply_button}  xpath=//*[@id="sub_business"]//button[@id="ApplyBtn"]
${region_apply_button}  xpath=//*[@id="region"]//button[@id="ApplyBtn"]
${first_plant_from_plant_filter}  xpath=//mm-global-filter/mm-filter[4]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
${plant_apply_button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${buyer/purchasing_group filter from editfilters}  xpath=//*[@id='filterlist']//input[@value='pgroup']
${planner/mrp controller filter from editfilters}  xpath=//*[@id='filterlist']//input[@value='mrpc']
${first_plant_from_buyer_filter}  xpath=//mm-global-filter/mm-filter[5]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox/div[2]/span
${first_plant_from_mrpc_filter}  xpath=//mm-global-filter/mm-filter[5]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div[2]/span
${planner_apply_button}  xpath=//*[@id="mrpc"]//button[@id="ApplyBtn"]
${buyer_apply_button}  xpath=//*[@id="pgroup"]//button[@id="ApplyBtn"]
${filter got selected icon}  xpath=//px-filter/div/div/button/iron-icon[2]
${plant Business filter}  xpath=//*[@id='filterlist']//input[@value='business']
${plant sub_Business filter}  xpath=//*[@id='filterlist']//input[@value='sub_business']
${plant Region filter}  xpath=//*[@id='filterlist']//input[@value='region']
${plant filter}  xpath=//*[@id='filterlist']//input[@value='plant']
${Buyer / Purch. Group filter}  xpath=//*[@id='filterlist']//input[@value='pgroup']
${planner/Mrp Controller filter}  xpath=//*[@id='filterlist']//input[@value='mrpc']