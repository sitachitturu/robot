6/15/2017
created by :sita chitturu
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot

*** Keywords ***
User access "${link}" module
    click link   ${link}
    sleep  10s
    wait until element is visible  //*[@id="addFilterBtn"]  20s

click on plant filter and select plants and user should see total count for the plant should be equal to sum of products and projects
    wait until element is visible  plant  20s
    click element  plant
    sleep  10s
    ${plant_file}  get file  ${plant_filter_data_textfile}
    @{plant_array}  split to lines  ${plant_file}
    :FOR  ${item}  IN  @{plant_array}
     \  log  ${item}
     \  click element  product-${item}
     \  ${TempValue}  Get Text  xpath=//*[@id="product-${item}"]/*/*[@class="count style-scope px-filter"]
     \  ${plant_count}  replace string using regexp  ${TempValue}  \\(|\,  ${EMPTY}
     \  ${plant_count...}  replace string using regexp  ${plant_count}  \\)|\,  ${EMPTY}
     \  ${plant_count1...}  convert to integer  ${plant_count...}
     \  log  ${plant_count1...}
     \  wait until element is visible  ${Apply Button}  10s
     \  click button  ${Apply Button}
     \  sleep  12s
     \  ${text}  get text  ${product_accuracy}
     \  ${product_count}  execute javascript  var string = "${text}"; var returnStr = string.split(' ')[3]; return returnStr;
     \  ${product_count..}   replace string  ${product_count}  ,  ${EMPTY}
     \  log  ${product_count..}
     \  wait until element is visible  ${projects}  20s
     \  click element  ${projects}
     \  sleep  6s
     \  ${text2}  get text  ${projects_accuracy}
     \  ${project_count}  execute javascript  var string = "${text2}"; var returnStr = string.split(' ')[3]; return returnStr;
     \  ${project_count..}  replace string  ${project_count}  ,  ${EMPTY}
     \  log  ${project_count..}
     \  ${value}  evaluate  ${project_count..}+${product_count..}
     \  log  ${value}
     \  run keyword and continue on failure  should be equal  ${value}  ${plant_count1...}
     \  wait until element is visible  ${products_tab}   20s
     \  click element  ${products_tab}
     \  sleep  2s
     \  wait until element is visible  plant  20s
     \  click element  plant
     \  wait until element is visible  search-input  10s
     \  click element  product-${item}
     \  sleep  6s

User should see following column "${test1}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column
     wait until element is visible  xpath=//*[@id="content"]/div/span[text()='${test1}']  50s
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test2}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test3}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test4}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test5}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test6}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test7}']

User should see following column "${test1}" column "${test2}" column "${test3}" column "${test4}" column "${test5}" column "${test6}" column "${test7}" column "${test8}" column "${test9}" column in projects view
     wait until element is visible  xpath=//*[@id="content"]/div/span[text()='${test1}']  50s
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test2}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test3}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test4}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test5}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test6}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test7}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test8}']
     element should be visible  xpath=//*[@id="content"]/div/span[text()='${test9}']

click on projects toggle button
     wait until element is visible  ${projects}  20s
     click element  ${projects}
     sleep  5s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

select all bioprod erp plants from plant business
    wait until element is visible  addFilterBtn  20s
