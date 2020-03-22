*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/plant_comparison_variables.robot

*** Keywords ***
User click Scheduling icon
            click element  ${Scheduling icon}
            sleep  10s
            wait until element is visible  addFilterBtn  10s

User should see "${title}"
            wait until element is visible  addFilterBtn  20s
            #xpath should match x times  (//div[@id='topBar'])/span[text()="${title}"]  1
            element should be visible  ${Scheduling Page Title}
            ${text}  get text  ${Scheduling Page Title}
            log  ${text}
            should be equal  ${text}  Scheduling

select action required from expection requires action filter
           wait until element is visible  exp_action  10s
           click element  exp_action
           sleep  2s
           click element  product-Action Required
           click element  ${exp_action_Apply Button}
           sleep  2s

User should see rights numbers in exceptions for "Cancel process" for default view with out selecting any plant
            wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
            ${cance1_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div
            log  ${cance1_text}
            should be equal  ${cance1_text}  Cancel Process
            ${cancel_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p
            ${cancel_process_count}  execute javascript  var string = "${cancel_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${cancel_process_count}
            ${cancel_process_count1}  Evaluate  '${cancel_process_count}'.replace('(','')
            ${cancel_process_count..}  Evaluate  '${cancel_process_count1}'.replace(')','')
            ${product_cancel_process_count1..}  Evaluate  '${cancel_process_count..}'.replace(',','')
            log  ${product_cancel_process_count1..}
            click element  ${projects}
            sleep  3s
            ${cancel_value_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p
            ${cancel_process_count_projects1}  execute javascript  var string = "${cancel_value_text_projects}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${cancel_process_count_projects1}
            ${cancel_process_count11}  Evaluate  '${cancel_process_count_projects1}'.replace('(','')
            ${cancel_process_count1..}  Evaluate  '${cancel_process_count11}'.replace(')','')
            ${project_cancel_process_count11..}  Evaluate  '${cancel_process_count1..}'.replace(',','')
            log  ${project_cancel_process_count11..}
            ${sum_of_productandproject_cancel}  execute javascript  var x = `${project_cancel_process_count11..}`;var y = `${product_cancel_process_count1..}`;var z =Number(x) + Number(y); return z
            log  ${sum_of_productandproject_cancel}
            ${sum_of_productandproject_cancel..}  convert to string  ${sum_of_productandproject_cancel}
            click element  ${products_tab}
            click element  exp
            sleep  3s
            ${cancel value from final_exception message filter}  get text  //mm-filter[@id='exp']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
            ${convert}  convert to string  ${cancel value from final_exception message filter}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\,|\,  ${EMPTY}
            ${cancel_process_from filter}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${cancel_process_from filter}
            should be equal  ${sum_of_productandproject_cancel..}  ${cancel_process_from filter}
            click element  exp

User should see rights numbers in exceptions for "Reschedule In" for default view with out selecting any plant
            wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
            ${Reschedule In_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[2]
            log  ${Reschedule In_text}
            should be equal  ${Reschedule In_text}  Reschedule In
            ${Reschedule In_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[2]
            ${product_Reschedule In_count}  execute javascript  var string = "${Reschedule In_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${product_Reschedule In_count}
            ${productReschedule In_count1}  Evaluate  '${product_Reschedule In_count}'.replace('(','')
            ${productReschedule In_count..}  Evaluate  '${productReschedule In_count1}'.replace(')','')
            ${productReschedule In_count1..}  Evaluate  '${productReschedule In_count..}'.replace(',','')
            log  ${productReschedule In_count1..}
            click element  ${projects}
            sleep  3s
            ${Reschedule In_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/div[2]
            log  ${Reschedule In_text_projects}
            should be equal  ${Reschedule In_text_projects}  Reschedule In
            ${Reschedule In_value_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[2]
            ${Reschedule In_count_projects}  execute javascript  var string = "${Reschedule In_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${Reschedule In_count_projects}
            ${Reschedule In_count1}  Evaluate  '${Reschedule In_count_projects}'.replace('(','')
            ${Reschedule In_count..}  Evaluate  '${Reschedule In_count1}'.replace(')','')
            ${project_Reschedule In_count1..}  Evaluate  '${Reschedule In_count..}'.replace(',','')
            log  ${project_Reschedule In_count1..}
            ${sum_of_product+project_reschedule_in}  execute javascript  var x = `${project_Reschedule In_count1..}`;var y = `${productReschedule In_count1..}`;var z =Number(x) + Number(y); return z
            log  ${sum_of_product+project_reschedule_in}
            ${sum_of_product+project_reschedule_in..}  convert to string  ${sum_of_product+project_reschedule_in}
            click element  ${products_tab}
            sleep  10s
            click element  exp
            sleep  5s
            ${reschedule_in_value from final_exception message filter}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[4]/div[2]/span[2]
            ${convert}  convert to string  ${reschedule_in_ value from final_exception message filter}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\,|\,  ${EMPTY}
            ${reschedule_in_from filter}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${reschedule_in_from filter}
            should be equal  ${sum_of_product+project_reschedule_in..}  ${reschedule_in_from filter}
            click element  exp

User should see rights numbers in exceptions for "Reschedule Out" for default view with out selecting any plant
            wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
            ${Reschedule out_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[3]
            log  ${Reschedule out_text}
            should be equal  ${Reschedule out_text}  Reschedule Out
            ${Reschedule out_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[3]
            ${product_Reschedule out_count}  execute javascript  var string = "${Reschedule out_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${product_Reschedule out_count}
            ${productReschedule out_count1}  Evaluate  '${product_Reschedule out_count}'.replace('(','')
            ${productReschedule out_count..}  Evaluate  '${productReschedule out_count1}'.replace(')','')
            ${productReschedule out_count1..}  Evaluate  '${productReschedule out_count..}'.replace(',','')
            log  ${productReschedule out_count1..}
            click element  ${projects}
            sleep  3s
            ${Reschedule out_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/div[3]
            log  ${Reschedule out_text_projects}
            should be equal  ${Reschedule out_text_projects}  Reschedule Out
            ${Reschedule out_value_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[3]
            ${Reschedule out_count_projects}  execute javascript  var string = "${Reschedule out_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${Reschedule out_count_projects}
            ${Reschedule out_count1}  Evaluate  '${Reschedule out_count_projects}'.replace('(','')
            ${Reschedule out_count..}  Evaluate  '${Reschedule out_count1}'.replace(')','')
            ${project_Reschedule out_count1..}  Evaluate  '${Reschedule out_count..}'.replace(',','')
            log  ${project_Reschedule out_count1..}
            ${sum_of_product+project_reschedule_out}  execute javascript  var x = `${project_Reschedule out_count1..}`;var y = `${productReschedule out_count1..}`;var z =Number(x) + Number(y); return z
            log  ${sum_of_product+project_reschedule_out}
            ${sum_of_product+project_reschedule_out..}  convert to string  ${sum_of_product+project_reschedule_out}
            click element  ${products_tab}
            sleep  3s
            click element  exp
            sleep  3s
            ${reschedule_out_value from final_exception message filter}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[5]/div[2]/span[2]
            ${convert}  convert to string  ${reschedule_out_ value from final_exception message filter}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\,|\,  ${EMPTY}
            ${reschedule_out_from filter}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${reschedule_out_from filter}
            should be equal  ${sum_of_product+project_reschedule_out..}  ${reschedule_out_from filter}
            click element  exp

User should see rights numbers in exceptions for "Overdue" for default view with out selecting any plant
            wait until element is visible  //div/div[3]/mo-metrics-plot/div/div[2]   30s
            ${Overdue_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/div[4]
            log  ${Overdue_text}
            should be equal  ${Overdue_text}  Overdue
            ${Overdue_value_text}  get text  //div/div[3]/mo-metrics-plot/div/div[2]/p[4]
            ${product_Overdue_count}  execute javascript  var string = "${Overdue_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${product_Overdue_count}
            ${productOverdue_count1}  Evaluate  '${product_Overdue_count}'.replace('(','')
            ${productOverdue_count..}  Evaluate  '${productOverdue_count1}'.replace(')','')
            ${productOverdue_count1..}  Evaluate  '${productOverdue_count..}'.replace(',','')
            log  ${productOverdue_count1..}
            click element  ${projects}
            sleep  3s
            ${Overdue_text_projects}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/div[4]
            log  ${Overdue_text_projects}
            should be equal  ${Overdue_text_projects}  Overdue
            ${Overdue_value_text}  get text  //div/div[3]/mo-metrics-plot[2]/div/div[2]/p[4]
            ${Overdue_count_projects}  execute javascript  var string = "${Overdue_value_text}"; var returnStr = string.split(' ')[1]; return returnStr;
            log  ${Overdue_count_projects}
            ${Overdue_count1}  Evaluate  '${Overdue_count_projects}'.replace('(','')
            ${Overdue_count..}  Evaluate  '${Overdue_count1}'.replace(')','')
            ${project_Overdue_count1..}  Evaluate  '${Overdue_count..}'.replace(',','')
            log  ${project_Overdue_count1..}
            ${sum_of_product+project_Overdue}  execute javascript  var x = `${project_Overdue_count1..}`;var y = `${productOverdue_count1..}`;var z =Number(x) + Number(y); return z
            log  ${sum_of_product+project_Overdue}
            ${sum_of_product+project_Overdue..}  convert to string  ${sum_of_product+project_Overdue}
            click element  ${products_tab}
            sleep  3s
            click element  exp
            sleep  3s
            ${Overdue_value from final_exception message filter}  get text  //mm-filter[2]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[3]/div[2]/span[2]
            ${convert}  convert to string  ${Overdue_ value from final_exception message filter}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\,|\,  ${EMPTY}
            ${Overdue_from filter}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            log  ${Overdue_from filter}
            should be equal  ${sum_of_product+project_Overdue..}  ${Overdue_from filter}
            click element  exp