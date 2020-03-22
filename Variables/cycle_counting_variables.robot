*** Variables ***
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Cycle Counting Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/cycle-counting']
${export_excel_btn}  xpath=//*[@id="mos-xls-button"]/a
${export_excel_btn_on_time}  xpath=//mo-grid[@xls-link-url='../../secure/api/v1/getCycleCountingOnTimeDataXls']//div[@id='mos-xls-button']
${Accuracy_Perfomance_Indicator_Value}  xpath=//div[@class='acc-block style-scope mo-cycle-count-spine']//span[@id='acc_per']
${On_Time_Perfomance_Indicator_Value}  xpath=//div[@class='ot-block style-scope mo-cycle-count-spine']//span[@id='ot_per']
${Accuracy_Perfomance_Indicator_Style}  xpath=//div[@class='acc-block style-scope mo-cycle-count-spine']//div[@id='acc_bar']@style
${On_Time_Perfomance_Indicator_Style}  xpath=//div[@class='ot-block style-scope mo-cycle-count-spine']//div[@id='ot_bar']@style
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Cycle Counting Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/cycle-counting']
${export_excel_btn}  xpath=//*[@id="mos-xls-button"]/a
${export_excel_btn_on_time}  xpath=//mo-grid[@xls-link-url='../../secure/api/v1/getCycleCountingOnTimeDataXls']//div[@id='mos-xls-button']
${Accuracy_Perfomance_Indicator_Value}  xpath=//div[@class='acc-block style-scope mo-cycle-count-spine']//span[@id='acc_per']
${On_Time_Perfomance_Indicator_Value}  xpath=//div[@class='ot-block style-scope mo-cycle-count-spine']//span[@id='ot_per']
${Accuracy_Perfomance_Indicator_Style}  xpath=//div[@class='acc-block style-scope mo-cycle-count-spine']//div[@id='acc_bar']@style
${On_Time_Perfomance_Indicator_Style}  xpath=//div[@class='ot-block style-scope mo-cycle-count-spine']//div[@id='ot_bar']@style
${Cycle_Counting_Icon}  //ul[@id='navitemlist']/li[8]/a
${Cycle_Counting_Page_Title}  //div[@id='topBar']/span
${Main_Module_Tab}  //nav[@role='navigation']//button[@class='btn btn--bare btn--svg style-scope px-app-nav']
${mo header}  //header[@role='banner']/h1
${footer}  //*[@id="copyright"]
${predix image}  //header[@role='banner']/div/img
${Cycle_Counting_Page_Title}  //div[@id='topBar']/span
${Plant filter}  //mm-filter[@id='plant']//button[@id='filterBtn'][1]
${Value in plant filter}  //span[contains(text(),'$')]
${Plant filter apply button}  xpath=//mm-filter[@id='plant']//button[@id='ApplyBtn']
${grid plant scores}   //tbody[@id='items']/tr/td[2]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${grid scheduling score}  //tbody[@id='items']/tr/td[3]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${grid Purchase orders score}  //tbody[@id='items']/tr/td[4]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${grid Requisitions score}  //tbody[@id='items']/tr/td[5]/vaadin-grid-cell-content/mo-indicator-column/a/div/div
${date_filter_from}  //div[@id='fromFields']//input[@id='dtEntry']
${date_filter_to}  //div[@id='toFields']//input[@id='dtEntry']
${Selected_plant}  //vaadin-grid-cell-content[@id='vaadin-grid-cell-content-47']//div[contains(text(),'$')]
${Cycle_counting_Accuracy}  //div[@class='accText0 style-scope mo-cycle-count']
${Cycle_counting_Barchart}  //span[@class='title style-scope mo-bar-chart']
${Cycle_counting_showhide_button}  //button[contains(text(),'Show/Hide Columns')]
${Cycle_counting_Export_to_excel_button}  //div[@class='buttons style-scope mo-grid']//div[@id='mos-xls-button']
${Accuracy_tab}  //div[@id='tabsContainer']/div/paper-tab[1]/div
${On_time_tab}  //div[@id='tabsContainer']/div/paper-tab[2]/div
${Edit_Filter_Button}  //button[@id='addFilterBtn']
${Edit_Filter_Options}  //*[@id='filterlist']//input[@value='$']
${Plant_Category_Filter}  //button[@id='filterBtn']//span[contains(text(),'Plant Category')]
${Plant_Region_Filter}  //button[@id='filterBtn']//span[contains(text(),'Plant Region')]
${Apply_Button}  //*[@id='$']//button[@id="ApplyBtn"]
${Show_Selected}  //*[@id='$']//span[@id="showSelected"]
${Icon_date_filter_from}  //div[@id='fromFields']//iron-icon[@id='icon']
${Icon_date_filter_to}  //div[@id='toFields']//iron-icon[@id='icon']
${Contents_date_filter}  //px-datetime-presets[@id='presets']//span[contains(text(),'$']
${Button_Cancel_date}  //div[@id='rangepickerModal']//button[contains(text(),'Cancel')]
${Bar_chart_title_ON_time}  //span[contains(text(),'$')]
${Bar_graph_by_Plant_code}  //div[@id='accChart']
${Bar_graph_by_Rolling}  //div[@id='accChartRolling']
${Plant_Show_hide_button}  //mo-show-hide/div/button
${on_time_Show_hide_button}  //mo-cycle-count/div/div[3]/mo-grid[2]/div[1]/div[4]/mo-show-hide/div/button
${show/hide column list}  //mo-show-hide/div/div/ul
${accuracy_Show/Hide_col_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/cycle_counting_accuracy_show_hide_list.txt
${Show/Hide_col_On-time_list}  ../Data/All_Mod_Show_Hide_Col_Text_Files/cycle_counting_on_time_show_hide_list.txt
${ontime_tab}  xpath=//*[@id="tabsContent"]/paper-tab[2]/div