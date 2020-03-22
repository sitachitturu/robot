*** Variables ***
${MCM button}   //div[@class='tab-content style-scope paper-tab']/a[@href='/secure/material-creation-monitor']
${MCM page label}  //div[@id='topBar']/span[text()='Material Creation Monitor']
${Plant sp matl statuses}  //div[@class='matlStatusContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-column/div
${Inconsistencies}  //div[@class='mcmContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-column/div
${Plant sp matl statuses columns}  //div[@class='matlStatusContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/thead/tr/th/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${Inconsistencies columns}  //div[@class='mcmContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/thead/tr/th/vaadin-grid-cell-content/vaadin-grid-sorter/div/div/span
${Edit filters}   //button[@id='addFilterBtn']
${Edit filter cancel button}  //button[@id='cancel']
${Edit filters checkbox labels}  //div[@id='filterlist']/label
${Change from yesterday label spine}  //div[@id='chgYesterday']/span
${Total label spine}  //div[@id='totalStat']/span
${Overdue label spine}  //div[@id='overdue']/span
${Due Today label spine}  //div[@id='dueToday']/span
${Due Current Week label spine}  //div[@id='dureCurrentWeek']/span
${Due>7 days label spine}  //div[@id='dueSevenDays']/span
${Random View button status}  //div[contains(@class, 'matlStatusContainer')]//tr[position()=$]//div[contains(normalize-space(), 'view') and not(child::*)]
${Random View button inconsistency}  //div[contains(@class, 'mcmContainer')]//tr[position()=$]//div[contains(normalize-space(), 'view') and not(child::*)]
${Random Plant sp matl status }  //mo-column[@class='style-scope mo-grid']/div[$]
${Grid title}  //div[@id='topBar']/span[2]
${Random Inconsistency type}  //div[@id='infoCell']/span[@id='title'][$]
${back button grid}     //span[@id='backButton']
${Details grid show hide column labels}  //ul[@class='tableGrid style-scope mo-show-hide']/li/paper-checkbox/div[2]/div
${Details grid show hide button}  //button[@class='showHideButton style-scope mo-show-hide']
${Over due count spine}  //div[@id='overdue']/div/div/div[2]/span
${Due today count spine}  //div[@id='dueToday']/div/div/div[2]/span
${Due today arrow icon}  //div[@id='dueToday']/div/div/div[2]/iron-icon
${Due current week spine}  //div[@id='dureCurrentWeek']/div/div/div[2]/span
${Due seven days spine}  //*[@id='dueSevenDays']//*//span[@class='total style-scope mo-md-spine']
${Material type filter}  xpath=//*[@id='filterlist']//input[@value='type']
${Filter continue button}  //button[@id='continue']
${Material type dropdown}  //mm-filter[@id='type']
${Material type value}  //paper-checkbox[@id='product-FHMI']
${Material type apply button}  xpath=(//button[@id='ApplyBtn'])[2]