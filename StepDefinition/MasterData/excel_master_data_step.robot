7/25/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library	 ExcelLibrary
Library  ../../Suits/excel_library.py
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  7s
       wait until page contains  addFilterBtn  10s

User Click Inconsistency
      [Arguments]  ${inconsistency}
      wait until element is visible  ${inconsistency}   10s
      click element  ${inconsistency}

User Click Inconsistency mmdc53
     click element  ${MMDC53}
     sleep  3s
User Click Inconsistency mmdc16
     click element  ${MMDC16}
     sleep  3s
open excel file for mmdc16
     [Arguments]   ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
     log  ${path}
     ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
     [Return]  ${excel_file}
     ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
     log  ${total_no.ofrows_excel}
      ${total_no.ofrows_excel..}  convert to string  ${total_no.ofrows_excel}
     click element  backButton
     sleep  5s
     ${mmdc16_quantity_value}  get text  ${mmdc16_quantity value}
     log to console  Value in quantity column row: [${mmdc16_quantity_value}]
     ${mmdc16_quantity_value..}  replace string using regexp  ${mmdc16_quantity_value}  ,  ${EMPTY}
     set global variable  ${mmdc16_quantity_value..}
     should be equal  ${total_no.ofrows_excel..}  ${mmdc16_quantity_value..}

open excel file for mmdc33
     [Arguments]   ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
     log  ${path}
     ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
     [Return]  ${excel_file}
     ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
     log  ${total_no.ofrows_excel}
     ${total_no.ofrows_excel..}  convert to string  ${total_no.ofrows_excel}
     click element  backButton
     sleep  5s
     ${mmdc33_quantity_value}  get text  ${mmdc33_quantity value}
     log to console  Value in quantity column row: [${mmdc33_quantity_value}]
     ${mmdc33_quantity_value..}  replace string using regexp  ${mmdc33_quantity_value}  ,  ${EMPTY}
     set global variable  ${mmdc33_quantity_value..}
     should be equal  ${total_no.ofrows_excel..}  ${mmdc33_quantity_value..}

open excel file for mmdc53
     [Arguments]   ${excel_file_name}
     ${status}=  run keyword and return status  log  %{HOME}
     ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
     log  ${path}
     ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
     [Return]  ${excel_file}
     ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
     log  ${total_no.ofrows_excel}
      ${total_no.ofrows_excel..}  convert to string  ${total_no.ofrows_excel}
     click element  backButton
     sleep  5s
     ${mmdc53_quantity_value}  get text  ${mmdc53_quantity value}
     log to console  Value in quantity column row: [${mmdc53_quantity_value}]
     ${mmdc53_quantity_value..}  replace string using regexp  ${mmdc53_quantity_value}  ,  ${EMPTY}
     set global variable  ${mmdc53_quantity_value..}
     should be equal  ${total_no.ofrows_excel..}  ${mmdc53_quantity_value..}
