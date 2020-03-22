*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library	 HttpLibrary.HTTP
Library	 RequestsLibrary
Library  ../../Suits/excel_library.py
Library  robot.utils.asserts
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Library/filter_library.robot

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  40s
       wait until page contains  addFilterBtn  10s

User Narrow Down Results
#Narrow down results to make the excel file smaller and take less time to download
    ${first_plant}=  mm-get first element from filter list  plant
    click element  plant
    wait until element is visible  ${first_plant}  20s
    click element  ${first_plant}
    click button  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//button[@id='ApplyBtn']
    sleep  3s

Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col3}""${col4}""${col2}""${col5}""${col6}""${col7}""${col8}" for other modules for "${view}" and erp "${erp_name}" for 8columns
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col2} FROM ${view} where Demand_erp_schema='${erp_name}' GROUP BY ${col1},${col3},${col4},${col2},${col5},${col6},${col7},${col8} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
           ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          set global variable  ${queryResults..}
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  Duplicate rows from database for Material Transfer: [${db_duplicate_recrds_count..}]
          log to console  Duplicate rows from database for Material Transfer "${erp_name}_${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count1.}  convert to string  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count2}  set variable  0
          run keyword and continue on failure  should be equal  ${db_duplicate_recrds_count2}  ${db_duplicate_recrds_count1.}



Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col3}""${col4}""${col2}""${col5}""${col6}""${col7}""${col8}"
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col2} FROM ${view} GROUP BY ${col1},${col3},${col4},${col2},${col5},${col6},${col7},${col8} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
          run keyword  Trimming all unnecessary brackets for output
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  Duplicate rows from database for Material Transfer: [${db_duplicate_recrds_count..}]
          log to console  Duplicate rows from database for Material Transfer "${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}

          ${queryResults2}  QUERY  select count(*) as count from ${view};
          log  ${queryResults2}
          ${convert2}  convert to string  ${queryResults2}
          log  ${convert2}
          run keyword  Trimming all unnecessary brackets for database output for total records
          ${queryResultLength1}  execute javascript  return String(${queryResults21..}).length;
          log  ${queryResultLength1}
          ${db_records_count..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults21..}};
          log  ${db_records_count..}
          set global variable  ${db_records_count..}

open excel file for modules
             [Arguments]   ${excel_file_name}
             ${status}=  run keyword and return status  log  %{HOME}
             ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
             log  ${path}
             ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
             [Return]  ${excel_file}
             sleep  15s
             ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
             log  ${total_no.ofrows_excel}
              ${total_no.ofrows_excel..}  convert to string  ${total_no.ofrows_excel}
              set global variable  ${total_no.ofrows_excel..}

open excel file for rejected grid
             [Arguments]   ${excel_file_name}
             ${status}=  run keyword and return status  log  %{HOME}
             ${path}=  set variable if  '${status}' == 'False'  %{HOMEPATH}  %{HOME}
             log  ${path}
             ${excel_file}  get excel num of rows  ${path}/Downloads/${excel_file_name}
             [Return]  ${excel_file}
             ${total_no.ofrows_excel}  evaluate  ${excel_file}-1
             log  ${total_no.ofrows_excel}
              ${total_no.ofrows_rejected excel..}  convert to string  ${total_no.ofrows_excel}
              set global variable  ${total_no.ofrows_rejected excel..}

User click "Export to Excel" for transfer opportunities grid
             [Arguments]  ${export_excel_btn for opp}
             wait until element is visible  ${export_excel_btn for opp}   10s
             click element  ${export_excel_btn for opp}
             sleep  2s
             click element  ${export all button for selling}
             click element  //*[@id="sellingOpp"]//*[@id="mos-xls-button"]//*[@id="newXlsExport"]/div[2]/div/a
             sleep  10s

check and compare duplicate records in db with excel
             ${result}  evaluate  ${total_no.ofrows_excel..}-${db_duplicate_recrds_count..}
             log  ${result}
             run keyword and continue on failure  should be equal  ${sum of oppor+reject}  ${result}

User click "Export to Excel" for transfer selling rejected grid
             [Arguments]  ${export to excel for rejected for seller}
             wait until element is visible  ${rejected tab for seller}  10s
             click element  ${rejected tab for seller}
             sleep  15s
             run keyword and ignore error  click element  ${export to excel for rejected for seller}
             sleep  15s

Trimming all unnecessary brackets for output
          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          set global variable  ${queryResults..}

Trimming all unnecessary brackets for database output for total records
           ${queryResults20}  replace string using regexp  ${convert2}  \\(|\,  ${EMPTY}
          ${queryResults2.}  replace string using regexp  ${queryResults20}  \\)|\,  ${EMPTY}
          ${queryResults2..}  replace string using regexp  ${queryResults2.}  \\[|\,  ${EMPTY}
          ${queryResults2...}  replace string using regexp  ${queryResults2..}  \\]|\,  ${EMPTY}
          ${queryResults21..}  replace string using regexp  ${queryResults2...}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults21..}
          set global variable  ${queryResults21..}

sum the oppoortunities excel records and rejected excel records
            ${sum of oppor+reject}  evaluate  ${total_no.ofrows_rejected excel..}+${total_no.ofrows_excel..}
            log  ${sum of oppor+reject}
            set global variable  ${sum of oppor+reject}
            should be equal  ${sum of oppor+reject}  ${db_records_count..}

Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col3}""${col4}""${col2}""${col5}" for other modules for business "${business}"
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col3},${col4},${col2},${col5} FROM ${view} where plant_business = '${business}' GROUP BY ${col1},${col3},${col4},${col2},${col5} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
          set global variable  ${convert}
          run keyword  Trimming all unnecessary brackets for output
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${db_duplicate_recrds_count..}
          log to console  Duplicate rows from database for business "${business}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}

          ${queryResults2}  QUERY  select count(*) as count from ${view} where plant_business = '${business}' ;
          log  ${queryResults2}
          ${convert2}  convert to string  ${queryResults2}
          log  ${convert2}
          set global variable  ${convert2}
          run keyword  Trimming all unnecessary brackets for database output for total records
          ${queryResultLength1}  execute javascript  return String(${queryResults21..}).length;
          log  ${queryResultLength1}
          ${db_records_count..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults21..}};
          log  ${db_records_count..}
          set global variable  ${db_records_count..}

User click "Export to Excel" for modules
         [Arguments]  ${Export to Excel}
         run keyword and ignore error  click element  ${Export to Excel}
         sleep  270s

select "${business}" business from business filter
         wait until element is visible  addFilterBtn  10s
         click element  addFilterBtn
         click element  ${plant Business filter}
         wait until element is visible  continue  10s
         click element  continue
         click element  business
         wait until element is visible  product-${business}  20s
         click element  product-${business}
         click element  ${business_Apply_Button}
         wait until element is not visible  spinner  30s

check and compare duplicate records in db with excel for other modules
         ${result}  evaluate  ${total_no.ofrows_excel..}-${db_duplicate_recrds_count..}
         log  ${result}
         run keyword and continue on failure  should be equal  ${db_records_count..}  ${result}


click on clear filter button
       wait until element is visible  clearFilterBtn  10s
       click element  clearFilterBtn
       wait until element is not visible  spinner  40s

User click "Export to Excel" for projects
      [Arguments]  ${excel_button}
       wait until element is visible  ${projects}  20s
       click element  ${projects}
       sleep  6s
       click element  ${excel_button}
       sleep  20s
#
#Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col3}""${col4}""${col2}""${col5}" for other modules for business "${business}" and erp_schema "${erp_name}" for "${view}"
#    connect to database  dbConfigFile=${dbfile}
#          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1}, ${col2} FROM ${view} where plant_business = '${business}' GROUP BY ${col1},${col3},${col4},${col2},${col5} HAVING count(*)>1) as count
#          log  ${queryResults1..}
#          ${convert}  convert to string  ${queryResults1..}
#          log  ${convert}
#          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
#          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
#          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
#          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
#          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
#          log  ${queryResults..}
#          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
#          log  ${queryResultLength}
#          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
#          log  ${db_duplicate_recrds_count..}
#          log to console  Duplicate rows from database for business "${business}": [${db_duplicate_recrds_count..}]
#          set global variable  ${db_duplicate_recrds_count..}
#
#          ${queryResults2}  QUERY  select count(*) as count from ${view} where plant_business = '${business}' ;
#          log  ${queryResults2}
#          ${convert2}  convert to string  ${queryResults2}
#          log  ${convert2}
#          ${queryResults20}  replace string using regexp  ${convert2}  \\(|\,  ${EMPTY}
#          ${queryResults2.}  replace string using regexp  ${queryResults20}  \\)|\,  ${EMPTY}
#          ${queryResults2..}  replace string using regexp  ${queryResults2.}  \\[|\,  ${EMPTY}
#          ${queryResults2...}  replace string using regexp  ${queryResults2..}  \\]|\,  ${EMPTY}
#          ${queryResults21..}  replace string using regexp  ${queryResults2...}  \[a-zA-Z]|\,  ${EMPTY}
#          log  ${queryResults21..}
#          ${queryResultLength1}  execute javascript  return String(${queryResults21..}).length;
#          log  ${queryResultLength1}
#          ${db_records_count..}  execute javascript  if( ${queryResultLength1} == 0){return 0}else {return ${queryResults21..}};
#          log  ${db_records_count..}
#          set global variable  ${db_records_count..}

Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col2}""${col3}""${col4}""${col5}" for other modules for erp_schema "${erp_name}" for "${view}" for 5columns
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col3},${col4},${col2},${col5} FROM ${view} where erp_schema='${erp_name}' GROUP BY ${col1},${col3},${col4},${col2},${col5} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          set global variable  ${queryResults..}
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${db_duplicate_recrds_count..}
          log to console  Duplicate rows from database for business "${erp_name}_${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count1.}  convert to string  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count2}  set variable  0
          run keyword and continue on failure  should be equal  ${db_duplicate_recrds_count2}  ${db_duplicate_recrds_count1.}

Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col3}""${col2}""${col4}" for other modules for erp_schema "${erp_name}" for "${view}" col.
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col3},${col2},${col4} FROM ${view} where erp_schema='${erp_name}' GROUP BY ${col1},${col3},${col2},${col4} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          set global variable  ${queryResults..}
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${db_duplicate_recrds_count..}
          log to console  Duplicate rows from database for business "${erp_name}_${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count1.}  convert to string  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count2}  set variable  0
          run keyword and continue on failure  should be equal  ${db_duplicate_recrds_count2}  ${db_duplicate_recrds_count1.}

Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col3}""${col2}" for other modules for erp_schema "${erp_name}" for "${view}" for 3columns
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col3},${col2} FROM ${view} where erp_schema='${erp_name}' GROUP BY ${col1},${col3},${col2} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
          run keyword  Trimming all unnecessary brackets for output
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${db_duplicate_recrds_count..}
          log to console  Duplicate rows from database for business "${erp_name}_${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count1.}  convert to string  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count2}  set variable  0
          run keyword and continue on failure  should be equal  ${db_duplicate_recrds_count2}  ${db_duplicate_recrds_count1.}


Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col2}""${col3}""${col4}""${col5}""${col6}" for other modules for erp "${erp_name}" for "${view}" for 6columns
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col2},${col3},${col4},${col5},${col6} FROM ${view} where erp_schema='${erp_name}' GROUP BY ${col1},${col2},${col3},${col4},${col5},${col6} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
           ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          set global variable  ${queryResults..}
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${db_duplicate_recrds_count..}
          log to console  Duplicate rows from database for business "${erp_name}_${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count1.}  convert to string  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count2}  set variable  0
          run keyword and continue on failure  should be equal  ${db_duplicate_recrds_count2}  ${db_duplicate_recrds_count1.}


Run db query to get no. of duplicate records for "${view}" and unique columns "${col1}""${col2}""${col3}""${col4}" for other modules for erp "${erp_name}" for "${view}" for 4columns
    connect to database  dbConfigFile=${dbfile}
          ${queryResults1..}  QUERY  SELECT count(*) from (select ${col1},${col3},${col2},${col4} FROM ${view} where erp_schema='${erp_name}' GROUP BY ${col1},${col3},${col2},${col4} HAVING count(*)>1) as count
          log  ${queryResults1..}
          ${convert}  convert to string  ${queryResults1..}
          log  ${convert}
           ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
          log  ${queryResults..}
          set global variable  ${queryResults..}
          ${queryResultLength}  execute javascript  return String(${queryResults..}).length;
          log  ${queryResultLength}
          ${db_duplicate_recrds_count..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${queryResults..}};
          log  ${db_duplicate_recrds_count..}
          log to console  Duplicate rows from database for business "${erp_name}_${view}": [${db_duplicate_recrds_count..}]
          set global variable  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count1.}  convert to string  ${db_duplicate_recrds_count..}
          ${db_duplicate_recrds_count2}  set variable  0
          run keyword and continue on failure  should be equal  ${db_duplicate_recrds_count2}  ${db_duplicate_recrds_count1.}
