*** Variables ***
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Consumption_Issues_Icon}  //ul[@id='navitemlist']//a[@href='/secure/consumption-issues']
${Consumption_Issues_Page_Title}  //div[@id='topBar']/span
${Main_Module_Tab}  //nav[@role='navigation']//button[@class='btn btn--bare btn--svg style-scope px-app-nav']
${mo_header}  //header[@role='banner']/h1
${footer}  //*[@id="copyright"]
#${predix_image}  //html/body/div[2]/mo-header/header/div/div[2]
${predix_image}  //*[@id="topBar"]/span
${Tab_Consumption_Issues}  //div[@id='tabsContent']/paper-tab[2]/div
${Tab_COGI}  //div[@id='tabsContent']/paper-tab/div
${Tab_Count_Consumption_Issues}  //div[@id='mos-tabs']/paper-tabs/div[@id='tabsContainer']/div/paper-tab/div
${Tab_Value_Consumption_Issues}  //div[@id='mos-tabs']/paper-tabs/div[@id='tabsContainer']/div/paper-tab[2]/div
${Tab_Count_COGI}  //mo-grid[@id='cogiHeatMap']/div/div[@id='mos-tabs']/paper-tabs/div[@id='tabsContainer']/div[@id='tabsContent']/paper-tab[1]/div
${Tab_Value_COGI}  //mo-grid[@id='cogiHeatMap']/div/div[@id='mos-tabs']/paper-tabs/div[@id='tabsContainer']/div[@id='tabsContent']/paper-tab[2]/div
${Consumption_Issues_showhide_button}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${Consumption_Issues_COGI_showhide_button}  //mo-grid[@base-url='../../secure/api/v1/dataForGrid/cogi']//button[contains(normalize-space(), 'Show/Hide Columns')]

${Plant filter}  //mm-filter[@id='plant']//button[@id='filterBtn'][1]
${Value in plant filter}  //span[contains(text(),'$')]
${Plant filter apply button}  xpath=//mm-filter[@id='plant']//button[@id='ApplyBtn']
${Selected_plant}  //tr[@style='transform: translate(0px, 0px);']//div[contains(normalize-space(), '$')]

${Edit_Filter_Button}  //button[@id='addFilterBtn']
${Edit_Filter_Options}  //*[@id='filterlist']//input[@value='$']
${Planner_MRP_Filter}  //mm-filter[@id='mrpc']//button[@id='filterBtn'][1]
${Plant_Category_Filter}   //mm-filter[@id='pcat']//button[@id='filterBtn'][1]
${Plant_Region_Filter}  //mm-filter[@id='region']//button[@id='filterBtn'][1]
${Plant_Business_Filter}  //mm-filter[@id='business']//button[@id='filterBtn'][1]
${Plant_Profit_Center_Filter}  //mm-filter[@id='profit_center']//button[@id='filterBtn'][1]
${Plant_Sub_business}  //mm-filter[@id='sub_business']//button[@id='filterBtn'][1]
${Plant_spl_material_status}  //mm-filter[@id='psms']//button[@id='filterBtn'][1]

${Apply_Button}  //*[@id='$']//button[@id="ApplyBtn"]
${Show_Selected}  //*[@id='$']//span[@id="showSelected"]
${show/hide column list}  //*[@id="gridContainer"]/ul
${show/hide column list_COGI}  //mo-grid[@base-url='../../secure/api/v1/dataForGrid/cogi']//div[@id='gridContainer']/ul
${consumption_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/Consumption_Issues_show_hide_list.txt
${PO_Show/Hide_col_COGI_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/Consumption_Issues_COGI_show_hide_list.txt

${Export_Excel_Button_Consumption_issues}  //mo-consumption-issues/mo-grid/div[1]/div[2]/mo-export-excel/a
${Export_Excel_Button_COGI}  //mo-consumption-issues/mo-grid[2]/div[1]/div[2]/mo-export-excel/a