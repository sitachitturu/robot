7/27/2017
212613237
# This library is for any keywords related to excel.
# Whether it be clicking excel button, opening, or reading excel files, This is the place for it!
# Note the "excel_library.py" file. This is for the actual python definitions for reading excel files.
# Keywords can use these definitions.
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library	 ExcelLibrary
Library  ../Suits/excel_library.py
#Resource  ../../StepDefinition/MasterData/excel_master_data_step.robot

*** Keywords ***
Verify Excel Column Headers
    [Arguments]   ${excel_file_name}  ${text_file_path}
    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    log  ${path}

    @{excel_file_headers}=  get excel row values     ${path}/Downloads/${excel_file_name}    0
    log  ${excel_file_headers}

    ${TextFileContent}  get file  ${text_file_path}
    log    ${TextFileContent}

    @{text_file_headers}=  split to lines  ${TextFileContent}
    log  ${text_file_headers}

    sort list  ${excel_file_headers}
    sort list  ${text_file_headers}
    log  ${excel_file_headers}
    log  ${text_file_headers}

    lists should be equal  ${excel_file_headers}  ${text_file_headers}

Verify Production/Work Order Column
    [Arguments]   ${excel_file_name}
    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    log  ${path}
    ${production_work_order_excel_column_index}  set variable  6
    @{excel_file_col_values}=  get excel column values  ${path}/Downloads/${excel_file_name}  Production / Work Order

    :FOR	${value}  IN  @{excel_file_col_values}
        \   ${length}=  get length  ${value}
        \   should be true  ${length} == 12

Remove old excel file
    [Arguments]   ${excel_file_name}
    #check if windows (HOMEPATH), or Mac/Linux (HOME)
    ${status}=  run keyword and return status  log  %{HOME}
    ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
    #file may or may not exist, so thats why im running keyword and returing status, otherwise the whole test suite would break and fail
    run keyword and return status  remove file  ${path}/Downloads/${excel_file_name}

User click "Export to Excel"
    [Arguments]  ${excel_button}
    #wait until element is visible  ${excel_button}  10s
    sleep  5s
    click element  ${excel_button}
    sleep  150s

open excel file
     [Arguments]   ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
     log  ${path}
     ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
     [Return]  ${excel_file}
     ${total_no.ofrows_excel..}  evaluate  ${excel_file}-1
     log  ${total_no.ofrows_excel..}
     ${total_no.ofrows_excel}  convert to string  ${total_no.ofrows_excel..}
     set global variable  ${total_no.ofrows_excel}




