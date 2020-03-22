
*** Variables ***
${MMDC53}  xpath=//*[@id='MMDC53']//span[text()='view']
${MMDC39}  xpath=//*[@id='MMDC39']//span[text()='view']
${MMDC16}  xpath=//*[@id='MMDC16']//span[text()='view']
${MMDC36}  xpath=//*[@id='MMDC36']//span[text()='view']
${MMDC33}  xpath=//*[@id='MMDC33']//span[text()='view']
${MMDC15}  xpath=//*[@id='MMDC15']//span[text()='view']
${MMDC17}  xpath=//*[@id='MMDC17']//span[text()='view']
${MMDC13}  xpath=//*[@id='MMDC13']//span[text()='view']
${MMDC11}  xpath=//*[@id='MMDC11']//span[text()='view']
${MMDC32}  xpath=//*[@id='MMDC32']//span[text()='view']
${MMDC50}  xpath=//*[@id='MMDC50']//span[text()='view']
${MMDC45}  xpath=//*[@id='MMDC45']//span[text()='view']
${MMDC18}  xpath=//*[@id='MMDC18']//span[text()='view']
${MMDC52}  xpath=//*[@id='MMDC52']//span[text()='view']
${MMDC61}  xpath=//*[@id='MMDC61']//span[text()='view']
${MMDC54}  xpath=//*[@id='MMDC54']//span[text()='view']
${MMDC51}  xpath=//*[@id='MMDC51']//span[text()='view']
${MMDC72}  xpath=//*[@id='MMDC72']//span[text()='view']
${MMDC98}  xpath=//*[@id='MMDC98']//span[text()='view']
${MMDC99}  xpath=//*[@id='MMDC99']//span[text()='view']
${MMDC101}  xpath=//*[@id='MMDC101']//span[text()='view']
${MMDC100}  xpath=//*[@id='MMDC100']//span[text()='view']
${MMDC102}  xpath=//*[@id='MMDC102']//span[text()='view']
${MMDC20}  xpath=//*[@id='MMDC20']//span[text()='view']
${MMDC21}  xpath=//*[@id='MMDC21']//span[text()='view']
${MMDC19}  xpath=//*[@id='MMDC19']//span[text()='view']
${MMDC106}  xpath=//*[@id='MMDC106']//span[text()='view']
${MMDC105}  xpath=//*[@id='MMDC105']//span[text()='view']
${MMDC104}  xpath=//*[@id='MMDC104']//span[text()='view']

${PLANT COLUMN}  xpath=//table/thead//th//span[text()='Plant Code - Name']
${Material SKU Column}  xpath=//table/thead//th//span[text()='Material Sku']
${Material Type Column}  xpath=//table/thead//th//span[text()='Material Type']
${Profit Center column}  xpath=//table/thead//th//span[text()='Profit Center']
${Mrp Controller column}  xpath=//table/thead//th//span[text()='Mrp Controller']
${Mrp Type column}   xpath=//table/thead//th//span[text()='Mrp Type']
${Message title}  xpath=//*[@id="topBar"]/span[2]
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Master Data Page Title}  xpath=//div[@id='topBar']//span[text()='Master Data']
${show/hide column}  xpath=//mo-show-hide[@id='showHideModule']//button[contains(normalize-space(), 'Show/Hide Columns')]
${show/hide column list}  xpath=//*[@id="gridContainer"]/ul

${MD_MMDC53_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc53_show_hide_col.text
${MD_MMDC39_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc39_show_hide_col.text
${MD_MMDC16_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc16_show_hide_col.text
${MD_MMDC36_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc36_show_hide_col.text
${MD_MMDC33_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc33_show_hide_col.text
${MD_MMDC15_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc15_show_hide_col.text
${MD_MMDC17_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc17_show_hide_col.text
${MD_MMDC13_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc13_show_hide_col.text
${MD_MMDC11_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc11_show_hide_col.text
${MD_MMDC32_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc32_show_hide_col.text
${MD_MMDC50_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc50_show_hide_col.text
${MD_MMDC45_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc45_show_hide_col.text
${MD_MMDC18_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc18_show_hide_col.text
${MD_MMDC52_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc52_show_hide_col.text
${MD_MMDC61_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc61_show_hide_col.text
${MD_MMDC54_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc54_show_hide_col.text
${MD_MMDC51_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc51_show_hide_col.text
${MD_MMDC72_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc72_show_hide_col.text
${MD_MMDC98_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc98_show_hide_col.text
${MD_MMDC99_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc99_show_hide_col.text
${MD_MMDC101_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc101_show_hide_col.text
${MD_MMDC100_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc100_show_hide_col.text
${MD_MMDC102_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc102_show_hide_col.text
${MD_MMDC20_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc20_show_hide_col.text
${MD_MMDC21_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc21_show_hide_col.text
${MD_MMDC19_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc19_show_hide_col.text
${MD_MMDC106_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc106_show_hide_col.text
${MD_MMDC105_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc105_show_hide_col.text
${MD_MMDC104_show/hide}  ../Data/Master_Data_Text_files/MD_mmdc104_show_hide_col.text

${Master Data Icon}  xpath=//ul[@id='navitemlist']//a[@href='/secure/master-data']

${inconsistency MMDC54}  xpath=//div[@id='grid']//mo-master-data-row[@id='MMDC54']
${MMDC54 quantity}  xpath=//mo-master-data-row[@id='MMDC54']//span[@class='style-scope mo-master-data-quantity-cell']
${mmdc16_quantity value}  xpath=//mo-master-data-row[@id='MMDC16']//span[@class='style-scope mo-master-data-quantity-cell']
${mmdc33_quantity value}  xpath=//mo-master-data-row[@id='MMDC33']//span[@class='style-scope mo-master-data-quantity-cell']
${mmdc53_quantity value}  xpath=//mo-master-data-row[@id='MMDC53']//span[@class='style-scope mo-master-data-quantity-cell']
${search input}  xpath=//*[@id='plant']//input[@id="search-input"]

${plant filter check box}  xpath=//div[@id='filterContent']//div[@id='checkboxContainer']
${MMDC54 value quantity for plant}
${MMDC54 value}
${text fileplant filter}  ../Data/All_Modules_Plant_Filter_Data_Text_Files/master-data-plant-filter-data.txt

${first_inconsistency}  xpath=//*[@id="MMDC16"]/div/div[1]/mo-master-data-priority-cell/svg/g/text
${export_excel_btn}  xpath=//*[@id="mos-xls-button"]/mo-export-excel/a

${spine_value_total}  //div[@class='right-0 style-scope mo-md-spine']//span[@class='total style-scope mo-md-spine']
${spine_arrow_total}  //div[@class='right-0 style-scope mo-md-spine']//iron-icon[@class='inc style-scope mo-md-spine x-scope iron-icon-3']@icon

${spine_value_customer_impacting}  //div[@class='right-1 style-scope mo-md-spine']//span[@class='total style-scope mo-md-spine']
${spine_arrow_customer_impacting}  //div[@class='right-1 style-scope mo-md-spine']//iron-icon[@class='inc style-scope mo-md-spine x-scope iron-icon-3']@icon

${spine_value_cost/inventory_impacting}  //div[@class='right-2 style-scope mo-md-spine']//span[@class='total style-scope mo-md-spine']
${spine_arrow_cost/inventory_impacting}  //div[@class='right-2 style-scope mo-md-spine']//iron-icon[@class='inc style-scope mo-md-spine x-scope iron-icon-3']@icon

${spine_value_data_consistency}  //div[@class='right-3 style-scope mo-md-spine']//span[@class='total style-scope mo-md-spine']
${spine_arrow_data_consistency}  //div[@class='right-3 style-scope mo-md-spine']//iron-icon[@class='inc style-scope mo-md-spine x-scope iron-icon-3']@icon

${Apply Button}  xpath=//*[@id="plant"]//button[@id="ApplyBtn"]
${row2}  xpath=//mo-master-data-grid/div/div[2]/mo-master-data-row[2]/div/div/mo-master-data-priority-cell
${mmdc53_quantity_row_value}  xpath=//mo-master-data/div/mo-master-data-grid/div/div[2]/mo-master-data-row/div/div[4]/mo-master-data-quantity-cell/span
${rowLocator}  xpath=//*[@id="items"]/tr[1]
${plant_filter_plant_checkbox}  xpath=//mm-global-filter/mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[2]/div
${Edit filters checkbox labels}  //div[@id='filterlist']/label
