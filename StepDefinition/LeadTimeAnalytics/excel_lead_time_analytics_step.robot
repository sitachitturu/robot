7/25/2017
212613237

*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py
Resource  ../../Library/filter_library.robot
Resource  ../../Variables/lead_time_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  50s
       wait until page contains  addFilterBtn  10s

User Narrow Down Results
#Narrow down results to make the excel file smaller and take less time to download
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    sleep  15s
    wait until element is visible  ${first_plant}  10s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  13s

    ${first_plant}=  mm-get first element from filter list  outlier
    click element  outlier
    sleep  14s
    wait until element is visible  ${first_plant}  10s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='outlier']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  13s

User click "Aggregated"
    wait until element is visible  ${aggregated_btn}  30s
    click element  ${aggregated_btn}


User Click First Source/Vendor in Heat Map
#    ${first_vendor}=  execute javascript  return $("#heatMap table tr:nth(1) td:nth(0) div").text;
    ${vendor_name}  get text  //table/tbody/tr/td[1]/vaadin-grid-cell-content/mo-column/div
      log  ${vendor_name}
      click element  //table/tbody/tr/td[1]/vaadin-grid-cell-content/mo-column/div
      sleep  30s

Heat map record count should match number of rows in excel
    #get the record count while "LT Reduction Opportunity" is selected in the dropdown
    ${LT_record_count}=  execute javascript  return $("#heatMap table tr:nth(1) td:nth(9) div").text();
    log  ${LT_record_count}
    ${LT_record_count.}  convert to string  ${LT_record_count}
    ${LT_record_count1.}  replace string using regexp  ${LT_record_count.}  \\,|\,  ${EMPTY}

    wait until element is visible  //div[@id='dropcell']//span[contains(normalize-space(), 'LT Red')]  5s
    click element  //div[@id='dropcell']//span[contains(normalize-space(), 'LT Red')]
    wait until element is visible  //ul[@id='list']//li[contains(normalize-space(), 'Fulfillment Risk')]  5s
    click element  //ul[@id='list']//li[contains(normalize-space(), 'Fulfillment Risk')]

    #sleep to let the heat map data update with new data because we just changed the dropdown
    sleep  45s

    #get the record count while "Fulfillment Risk" is selected in the dropdown
    ${FR_record_count}=  execute javascript  return $("#heatMap table tr:nth(1) td:nth(9) div").text();
    log  ${FR_record_count}
    ${FR_record_count1}  convert to string  ${FR_record_count}
    ${FR_record_count1.}  replace string using regexp  ${FR_record_count1}  \\,|\,  ${EMPTY}

    ${FR_record_count_ResultLength}  execute javascript  return String(${FR_record_count}).length;
    log  ${FR_record_count_ResultLength}
    ${FR_record_count_Results2..}  execute javascript  if( ${FR_record_count_ResultLength} == 0){return 0}else {return ${FR_record_count}};
    log  ${FR_record_count_Results2..}

    ${total_record_count_heatmap}  evaluate  ${FR_record_count1.}+${LT_record_count1.}
    log  ${total_record_count_heatmap}


    #download the excel file
    Remove old excel file   LeadTimeDetails.xlsx
    scroll page to location  0  10000
    sleep  18s
    User click "Export to Excel"  ${export_excel_btn}
    sleep  36s

    #some processing is done here to get the path of the file. This is done in all excel scripts
    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    log  ${path}

    #get the number of rows from excel file
    ${excel_num_rows}=  get excel num of rows  ${path}/Downloads/LeadTimeDetails.xlsx


    #subtract one form the number of rows in the excel file to account for the row of column headers in the excel file
    ${excel_num_rows}  evaluate  ${excel_num_rows}-1
    log  ${excel_num_rows}

    should be equal as numbers  ${total_record_count_heatmap}  ${excel_num_rows}
