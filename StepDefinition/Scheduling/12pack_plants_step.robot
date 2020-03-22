*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access "${link}" module
                    click link   ${link}
                    sleep  15s
                    wait until page contains  addFilterBtn  10s

User should able to verify "Reschedule In" and "reschedule out" exceptions by selecting plant by selecting Greenville plant 5250 from plant filter for product view
                    click element  clearFilterBtn
                    sleep  3s
                    click element  plant
                    sleep  4s
                    wait until element is visible  search-input  10s
                    input text  search-input  5250
                    click element  product-5250 - Greenville
                    wait until element is visible  ${Apply Button}  10s
                    click button  ${Apply Button}
                    click element  exp_action
                    sleep  6s
                    click element  product-Action Required
                    click element  ${exp_action_Apply Button}
                    sleep  10s
                    wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
                    ${Reschedule In_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[2]
                        log  ${Reschedule In_text}
                        should be equal  ${Reschedule In_text}  Reschedule In
                        ${Reschedule In_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[2]
                        ${Reschedule In_count}  execute javascript  var string = "${Reschedule In_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                        log  ${Reschedule In_count}
                        ${Reschedule In_count1}  Evaluate  '${Reschedule In_count}'.replace('(','')
                        ${Reschedule In_count..}  Evaluate  '${Reschedule In_count1}'.replace(')','')
                        ${Reschedule In_count1..}  Evaluate  '${Reschedule In_count..}'.replace(',','')
                        log  ${Reschedule In_count1..}
                    ${Reschedule out_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[3]
                        log  ${Reschedule out_text}
                        should be equal  ${Reschedule out_text}  Reschedule Out
                        ${Reschedule out_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[3]
                        ${Reschedule out_count}  execute javascript  var string = "${Reschedule out_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                        log  ${Reschedule out_count}
                        ${Reschedule out_count1}  Evaluate  '${Reschedule out_count}'.replace('(','')
                        ${Reschedule out_count..}  Evaluate  '${Reschedule out_count1}'.replace(')','')
                        ${Reschedule out_count1..}  Evaluate  '${Reschedule out_count..}'.replace(',','')
                        log  ${Reschedule out_count1..}
                     connect to database  dbConfigFile=${dbfile}
                     ${Reschedule in_DB_value}  QUERY  select count(*) from public.production_ords_v where plant_code = '5250' and exception_requires_action = 'Action Required' and final_exception_message = 'Reschedule in' and ((basic_finish_date_should_be is not null or basic_finish_date_should_be > current_date)) group by final_exception_message;
                         log  ${Reschedule in_DB_value}
                         ${convert}  convert to string  ${Reschedule in_DB_value}
                         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
                         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
                         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
                         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
                         ${Reschedule In_queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
                         log  ${Reschedule In_queryResults}
                         ${queryResultLength}  execute javascript  return String(${Reschedule In_queryResults}).length;
                         log  ${queryResultLength}
                         ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${Reschedule In_queryResults}};
                         log  ${queryResults3..}
                         ${reschedule_in_value}  set variable  ${queryResults3..}
                         ${conver1}  convert to string  ${reschedule_in_value}
                         log  ${conver1}
                         should be equal  ${Reschedule In_count1..}  ${conver1}
                     ${Reschedule out_DB_value}  QUERY  select count(*) from public.production_ords_v where plant_code ='5250' and exception_requires_action = 'Action Required' and final_exception_message = 'Reschedule out' and ((basic_finish_date_should_be is not null or basic_finish_date_should_be > current_date)) group by final_exception_message;
                         log  ${Reschedule out_DB_value}
                         ${convert}  convert to string  ${Reschedule out_DB_value}
                         ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
                         ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
                         ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
                         ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
                         ${Reschedule out_queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
                         log  ${Reschedule out_queryResults}
                         ${queryResultLength..}  execute javascript  return String(${Reschedule out_queryResults}).length;
                         log  ${queryResultLength..}
                         ${queryResults2..}  execute javascript  if( ${queryResultLength..} == 0){return 0}else {return ${Reschedule out_queryResults}};
                         log  ${queryResults2..}
                         ${reschedule_out_value}  set variable  ${queryResults2..}
                         ${conver2}  convert to string  ${reschedule_out_value}
                         log  ${conver2}
                         should be equal  ${Reschedule out_count1..}  ${conver2}

User should able to verify "Reschedule In" and "reschedule out" exceptions by selecting by selecting Greenville plant 5250 from plant filter for projects view
                      click element  clearFilterBtn
                      sleep  2s
                      click element  plant
                      sleep  4s
                      wait until element is visible  search-input  10s
                      input text  search-input  5250
                      click element  product-5250 - Greenville
                      wait until element is visible  ${Apply Button}  10s
                      click button  ${Apply Button}
                      click element  exp_action
                      sleep  2s
                      click element  product-Action Required
                      click element  ${exp_action_Apply Button}
                      sleep  10s
                      wait until element is visible  ${projects}  20s
                      click element  ${projects}
                      sleep  5s
                      ${Reschedule In_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/div[2]
                          log  ${Reschedule In_text}
                          should be equal  ${Reschedule In_text}  Reschedule In
                          ${Reschedule In_value_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[2]
                          ${Reschedule In_count}  execute javascript  var string = "${Reschedule In_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                          log  ${Reschedule In_count}
                          ${Reschedule In_count1}  Evaluate  '${Reschedule In_count}'.replace('(','')
                          ${Reschedule In_count..}  Evaluate  '${Reschedule In_count1}'.replace(')','')
                          ${Reschedule In_count1..}  Evaluate  '${Reschedule In_count..}'.replace(',','')
                          log  ${Reschedule In_count1..}
                      ${Reschedule out_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/div[3]
                          log  ${Reschedule out_text}
                          should be equal  ${Reschedule out_text}  Reschedule Out
                          ${Reschedule out_value_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[3]
                          ${Reschedule out_count}  execute javascript  var string = "${Reschedule out_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
                          log  ${Reschedule out_count}
                          ${Reschedule out_count1}  Evaluate  '${Reschedule out_count}'.replace('(','')
                          ${Reschedule out_count..}  Evaluate  '${Reschedule out_count1}'.replace(')','')
                          ${Reschedule out_count1..}  Evaluate  '${Reschedule out_count..}'.replace(',','')
                          log  ${Reschedule out_count1..}
                      connect to database  dbConfigFile=${dbfile}
                      ${Reschedule in_DB_value}  QUERY  select count(*) from public.project_activity_v where plant_code = '5250' and exception_requires_action = 'Action Required' and final_exception_message = 'Reschedule in' and ((basic_finish_date_should_be is not null or basic_finish_date_should_be > current_date)) group by final_exception_message;
                          log  ${Reschedule in_DB_value}
                          ${convert}  convert to string  ${Reschedule in_DB_value}
                          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
                          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
                          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
                          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
                          ${Reschedule In_queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
                          log  ${Reschedule In_queryResults}
                          ${queryResultLength}  execute javascript  return String(${Reschedule In_queryResults}).length;
                          log  ${queryResultLength}
                          ${queryResults3..}  execute javascript  if( ${queryResultLength} == 0){return 0}else {return ${Reschedule In_queryResults}};
                          log  ${queryResults3..}
                          ${reschedule_in_value}  set variable  ${queryResults3..}
                          ${conver1}  convert to string  ${reschedule_in_value}
                          log  ${conver1}
                          should be equal  ${Reschedule In_count1..}  ${conver1}
                      ${Reschedule out_DB_value}  QUERY  select count(*) from public.project_activity_v where plant_code ='5250' and exception_requires_action = 'Action Required' and final_exception_message = 'Reschedule out' and ((basic_finish_date_should_be is not null or basic_finish_date_should_be > current_date)) group by final_exception_message;
                          log  ${Reschedule out_DB_value}
                          ${convert}  convert to string  ${Reschedule out_DB_value}
                          ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
                          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
                          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
                          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
                          ${Reschedule out_queryResults}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
                          log  ${Reschedule out_queryResults}
                          ${queryResultLength..}  execute javascript  return String(${Reschedule out_queryResults}).length;
                          log  ${queryResultLength..}
                          ${queryResults2..}  execute javascript  if( ${queryResultLength..} == 0){return 0}else {return ${Reschedule out_queryResults}};
                          log  ${queryResults2..}
                          ${reschedule_out_value}  set variable  ${queryResults2..}
                          ${conver2}  convert to string  ${reschedule_out_value}
                          log  ${conver2}
                          should be equal  ${Reschedule out_count1..}  ${conver2}

uncheck selected plant from plant filter
                      click element  plant
                      click element  ${show/selected_scheduling}
                      wait until element is visible  ${paper_checkbox_plant}  30s
                      click element  ${paper_checkbox_plant}
                      wait until element is visible  ${Apply Button}  10s
                      click button  ${Apply Button}
                      sleep  5s

