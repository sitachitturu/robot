6/27/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  OperatingSystem
Library  String
Library  Collections
Resource  ../Variables/VariablesCommon/common_variables.robot
*** Keywords ***

mm-filter Item Count
         # Finds a item on a dropdown menu, and returns the count of that item as an integer converted from the format "(123,456)"
         [Arguments]  ${MenuID}  ${ItemID}
         mm-filter Open Menu  ${MenuID}
         ${TempValue}  Get Text  xpath=//*[@id="product-${ItemID}"]/*/*[@class="count style-scope px-filter"]
         ${TempString}  replace string  ${TempValue}  (  ${EMPTY}
         ${TempString}  replace string  ${TempString}  )  ${EMPTY}
         ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
         ${TempInteger}  convert to integer  ${TempString}
         [Return]  ${TempInteger}

mm-filter Item Count for other filters
         # Finds a item on a dropdown menu, and returns the count of that item as an integer converted from the format "(123,456)"
         [Arguments]  ${MenuID}  ${ItemID}
         mm-filter Open Menu  ${MenuID}
         ${TempValue}  Get Text  xpath=//*[@id="${ItemID}"]/*/*[@class="count style-scope px-filter"]
         ${TempString}  replace string  ${TempValue}  (  ${EMPTY}
         ${TempString}  replace string  ${TempString}  )  ${EMPTY}
         ${TempString}  replace string  ${TempString}  ,  ${EMPTY}
         ${TempInteger}  convert to integer  ${TempString}
         [Return]  ${TempInteger}

mm-filter Get List of Item IDs
         [Arguments]  ${MenuID}
         ${ListCount}  get matching xpath count  xpath=//*[@id="${MenuID}"]/*/*/*/*/*[@id="availableFilterList"]/*[@class="style-scope px-filter x-scope paper-checkbox-1"]
         ${iIterationCount}=     set variable  1
         # Create list of the items, and uses the previous count to iterate through them and append them to a list
         # Unsure how to create a list with no blank value at the start
         ${ListArray}=  create list  ${empty}
         :FOR	${iIterationCount}  IN RANGE    1   ${ListCount} + 1
         \  ${ListItem}=  set variable  xpath=//*[@id="${MenuID}"]/*/*/*/*/*[@id="availableFilterList"]/*[@class="style-scope px-filter x-scope paper-checkbox-1"][${iIterationCount}]
         \  ${ListItemID}=  get element attribute  ${ListItem}@id
         \  Append to List  ${ListArray}  ${ListItemID}
         \  ${iIterationCount}=  set variable  ${iIterationCount} + 1
         # Removes blank value from the start
         remove from list  ${ListArray}  0
         log  ${ListArray}
         [Return]    ${ListArray}

mm-filter Open Menu
         [Arguments]  ${MenuID}
         ${bIsClosed}  run keyword and return status  element should not be visible    xpath=//*[@id="${MenuID}"]//*[@id="allBtn"]
         Run Keyword If  ${bIsClosed} == True  Click Element   ${MenuID}
         Wait Until Element is Visible  xpath=//*[@id="${MenuID}"]//*[@id="allBtn"]

mm-filter Get List of Item Count
         [Arguments]  ${MenuID}
         ${ListArray}    mm-filter Get List of Item IDs  ${MenuID}
         ## Now we get the counts of items by iterating over the list created by "mm-filter Get List of Items  ${MenuID}"
         ${iIterationCount}=     set variable  1
         ${ListTotal}=  convert to integer  0
         # Iterates through list using GetStringToInteger to return and append the count on get dictionary items
         # Creates an expression that can be evaluated to sum all of the counts
         :FOR	${ListArray}  IN  @{ListArray}
         \  ${ListValue}=  mm-filter Item Count for other filters  ${MenuID}   ${ListArray}
         \  ${ListTotal}=  set variable  ${ListTotal} + ${ListValue}
         log  ${ListTotal}
         [Return]  ${ListTotal}

mm-filter Get Sum of Item Count in Menu
         [Arguments]     ${MenuID}
         ${ListTotal}     mm-filter Get List of Item Count  ${MenuID}
         ${ListSum}      evaluate    ${ListTotal}
         log  ${ListSum}
         [Return]    ${ListSum}


mm-select item in filter menu
        #given a menu and item, the item will in that menu will be selected (or deselected if already selected)
        [Arguments]      ${MenuID}    ${ItemID}
        wait until element is visible  ${MenuID}   10s
        click element  ${MenuID}
        wait until element is visible  xpath=//mm-filter[@id='${MenuID}']//div[@id='filterContent']//input[@id='search-input']  10s
        ${ItemID_Trimmed}=  fetch from left  ${ItemID}  )
        input text  xpath=//mm-filter[@id='${MenuID}']//div[@id='filterContent']//input[@id='search-input']  ${ItemID_Trimmed}
        wait until element is visible   product-${ItemID}  4s
        click element  product-${ItemID}
        wait until element is visible  xpath=//mm-filter[@id='${MenuID}']//div[@id='filterContent']//button[@id='ApplyBtn']  10s
        click button  xpath=//mm-filter[@id='${MenuID}']//div[@id='filterContent']//button[@id='ApplyBtn']
        sleep  3s


mm-check plant category region and business totals
     #Compares count of plant, plant category, plant region, and plant business menus given an item in plant menu
     [Arguments]      ${ItemID}  ${ItemCategory}  ${ItemRegion}  ${ItemBusiness}
     ${plant_sum}  run keyword  mm-filter Item Count  plant  ${ItemID}
     click element  plant
     log  ${plant_sum}
     ${pcat_sum}  run keyword  mm-filter Item Count  pcat  ${ItemCategory}
     click element  pcat
     log  ${pcat_sum}

     ${preg_sum}  run keyword  mm-filter Item Count  region  ${ItemRegion}
     click element  region
     log  ${preg_sum}

     ${pbus_sum}  run keyword  mm-filter Item Count  business  ${ItemBusiness}
     click element  business
     log  ${pbus_sum}

     should be equal as numbers  ${plant_sum}  ${pcat_sum}
     should be equal as numbers  ${plant_sum}  ${preg_sum}
     should be equal as numbers  ${plant_sum}  ${pbus_sum}



mm-check filter totals
     #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]      ${item}  ${filter_list}
     @{words} =	Split String	${item}  /
     ${list_length}  get length  ${filter_list}

     mm-select item in filter menu  ${filter_list[${0}]}  ${words[${0}]}
     ${plant_sum}  run keyword  mm-filter Item Count  ${filter_list[${0}]}  ${words[${0}]}
     click element  ${filter_list[${0}]}
     sleep  4s

     #For each filter, make sure the total of the item from the corresponding word matches the plant sum total
     :FOR  ${i}  IN RANGE  1  ${list_length}
     \  ${current_filter_sum}  run keyword  mm-filter Item Count  ${filter_list[${i}]}  ${words[${i}]}
     \  click element  ${filter_list[${i}]}
     \  should be equal as numbers  ${plant_sum}  ${current_filter_sum}
     mm-select item in filter menu  ${filter_list[${0}]}  ${words[${0}]}
     sleep  2s


mm-check single filter total
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]      ${filter_menu}  ${filter_option}  ${plantID}
     wait until element is not visible  ${Page Spinner}  20s
     mm-select item in filter menu  ${filter_menu}  ${filter_option}
     wait until element is not visible  ${Page Spinner}  20s
     mm-select item in filter menu  plant  ${plantID}
     wait until element is not visible  ${Page Spinner}  20s
     ${filter_sum}  run keyword  mm-filter Item Count  ${filter_menu}  ${filter_option}
     click element  ${filter_menu}
     ${plant_sum}  run keyword  mm-filter Item Count  plant  ${plantID}
     click element  plant
     should be equal as numbers  ${filter_sum}  ${plant_sum}

     mm-select item in filter menu  ${filter_menu}  ${filter_option}
     wait until element is not visible  ${Page Spinner}  20s
     mm-select item in filter menu  plant  ${plantID}
     sleep  3s


mm-verify filter total
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]      ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  5s
     ${first_element_checkbox}  mm-get first element from filter list  ${filter_id}
     click element  ${first_element_checkbox}
     sleep  4s
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     sleep  10s
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     ${plant_amount}=  run keyword and ignore error  get text  //mm-filter[@id='plant']//div[@id='availableFilterList']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     #${plant_amount..}=  run keyword and ignore error  get text  //mm-filter[1]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[1]/div[2]/span[2]
     click element  plant

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}

       ${convert}  convert to string  ${plant_amount}

     ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults...}  replace string using regexp  ${queryResults}  \\PASS|\,  ${EMPTY}
          ${queryResults...1}  replace string  ${queryResults...}  '  ${EMPTY}
          ${queryResults...2}  replace string  ${queryResults...1}  '  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults...2}  \[a-zA-Z]|\,  ${EMPTY}

     should be equal as numbers  ${queryResults..}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s

mm-verify filter total for lta
 #Given a list of filters and a plant rsecord, will check if the totals of each filter are the same for the given plant
     [Arguments]      ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  5s
     ${first_element_checkbox}  mm-get first element from filter list  ${filter_id}
     click element  ${first_element_checkbox}
     sleep  4s
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     sleep  10s
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     ${plant_amount}=  run keyword and ignore error  get text  //mm-filter[@id='plant']//div[@id='availableFilterList']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     ${plant_amount..}=  run keyword and ignore error  get text  //mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
     click element  plant

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}
     run keyword and ignore error  ${plant_amount}  replace string  ${plant_amount}  (  ${EMPTY}
     run keyword and ignore error  ${plant_amount}  replace string  ${plant_amount}  )  ${EMPTY}
     run keyword and ignore error  ${plant_amount}  replace string  ${plant_amount}  ,  ${EMPTY}

     should be equal as numbers  ${plant_amount}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s
mm-verify filter total for lazy loading
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]  ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  5s
     ${first_element_checkbox}  mm-get first element from filter list for lazy loading  ${filter_id}
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     sleep  4s
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='items']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     ${plant_amount}=  get text  //mm-filter[@id='plant']//div[@id='availableFilterList']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     click element  plant

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}
     ${plant_amount}  replace string  ${plant_amount}  (  ${EMPTY}
     ${plant_amount}  replace string  ${plant_amount}  )  ${EMPTY}
     ${plant_amount}  replace string  ${plant_amount}  ,  ${EMPTY}

     should be equal as numbers  ${plant_amount}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s

mm-verify filter total for lazy loading for receipt
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]  ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  5s
     ${first_element_checkbox}  mm-get first element from filter list for lazy loading  ${filter_id}
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     sleep  4s
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='items']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     ${plant_amount}=  get text  //mm-global-filter/mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[1]/div[2]/span[2]
     click element  plant

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}
     ${plant_amount}  replace string  ${plant_amount}  (  ${EMPTY}
     ${plant_amount}  replace string  ${plant_amount}  )  ${EMPTY}
     ${plant_amount}  replace string  ${plant_amount}  ,  ${EMPTY}

     should be equal as numbers  ${plant_amount}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s
mm-verify filter total for inventory
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]      ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  3s
     ${first_element_checkbox}  mm-get first element from filter list  ${filter_id}
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     sleep  2s
     #${plant_amount}=  run keyword and ignore error  get text  //mm-filter[@id='plant']//div[@id='availableFilterList']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     ${plant_amount..}=  run keyword and ignore error  get text  //mm-global-filter/mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[1]/div[2]/span[2]
     click element  plant
     ${convert}  convert to string  ${plant_amount..}
     ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults...}  replace string using regexp  ${queryResults}  \\PASS|\,  ${EMPTY}
          ${queryResults...1}  replace string  ${queryResults...}  '  ${EMPTY}
          ${queryResults...2}  replace string  ${queryResults...1}  '  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults...2}  \[a-zA-Z]|\,  ${EMPTY}

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}
#     ${plant_amount}  replace string  ${plant_amount..}  (  ${EMPTY}
#     ${plant_amount.}  replace string  ${plant_amount}  )  ${EMPTY}
#     ${plant_amount1.}  replace string  ${plant_amount.}  ,  ${EMPTY}

     should be equal as numbers  ${queryResults..}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s

mm-verify filter total for receipt
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]      ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  5s
     ${first_element_checkbox}  mm-get first element from filter list  ${filter_id}
     click element  ${first_element_checkbox}
     sleep  4s
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     sleep  10s
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='filterContent']//div[@id='checkboxLabel']//span[@class='count style-scope px-filter']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     ${plant_amount}=  run keyword and ignore error  get text  //mm-filter/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[1]/div[2]/span[2]
     #${plant_amount..}=  run keyword and ignore error  get text  //mm-filter[1]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[1]/div[2]/span[2]
     click element  plant

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}

       ${convert}  convert to string  ${plant_amount}

     ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults...}  replace string using regexp  ${queryResults}  \\PASS|\,  ${EMPTY}
          ${queryResults...1}  replace string  ${queryResults...}  '  ${EMPTY}
          ${queryResults...2}  replace string  ${queryResults...1}  '  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults...2}  \[a-zA-Z]|\,  ${EMPTY}

     should be equal as numbers  ${queryResults..}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s
mm-verify filter total for lazy loading for inventory
 #Given a list of filters and a plant record, will check if the totals of each filter are the same for the given plant
     [Arguments]  ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     click element  ${filter_id}
     sleep  5s
     ${first_element_checkbox}  mm-get first element from filter list for lazy loading  ${filter_id}
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']
     sleep  3s

     #Assume the first plant is already selected"
     click element  ${filter_id}
     sleep  4s
     ${menu_amount}=  get text  //mm-filter[@id='${filter_id}']//div[@id='items']//div[@id='checkboxLabel']//span[@class='count px-filter style-scope px-lazy-load']
     click element  ${filter_id}
     sleep  10s
     click element  plant
     ${plant_amount..}=  run keyword and ignore error  get text  //mm-global-filter/mm-filter[1]/px-filter/div/div[2]/div[3]/div[2]/paper-checkbox[1]/div[2]/span[2]
     click element  plant
     ${convert}  convert to string  ${plant_amount..}
     ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
          ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
          ${queryResults...}  replace string using regexp  ${queryResults}  \\PASS|\,  ${EMPTY}
          ${queryResults...1}  replace string  ${queryResults...}  '  ${EMPTY}
          ${queryResults...2}  replace string  ${queryResults...1}  '  ${EMPTY}
          ${queryResults..}  replace string using regexp  ${queryResults...2}  \[a-zA-Z]|\,  ${EMPTY}

     ${menu_amount}  replace string  ${menu_amount}  (  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  )  ${EMPTY}
     ${menu_amount}  replace string  ${menu_amount}  ,  ${EMPTY}
#     ${plant_amount}  replace string  ${plant_amount}  (  ${EMPTY}
#     ${plant_amount}  replace string  ${plant_amount}  )  ${EMPTY}
#     ${plant_amount}  replace string  ${plant_amount}  ,  ${EMPTY}

     should be equal as numbers  ${queryResults..}  ${menu_amount}

     click element  ${filter_id}
     wait until element is visible  ${first_element_checkbox}  30s
     click element  ${first_element_checkbox}
     click button  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//button[@id='ApplyBtn']

     sleep  10s
mm-get first element from filter list
 #Given the id of the filter, returns a reference to the first checkbox in the list
     [Arguments]      ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     wait until element is visible  ${filter_id}  20s
     click element  ${filter_id}
     ${first_element_check_box}=  set variable  xpath=//mm-filter[@id='${filter_id}']//div[@id='filterContent']//div[@id='checkboxContainer']
     click element  ${filter_id}
     [Return]    ${first_element_check_box}

mm-get first element from filter list for lazy loading
     [Arguments]      ${filter_id}
     wait until element is not visible  ${Page Spinner}  20s
     wait until element is visible  ${filter_id}  20s
     click element  ${filter_id}
     ${first_element_check_box}=  set variable  xpath=//mm-filter[@id='${filter_id}']//div[@id='items']//div[@id='checkboxContainer']
     click element  ${filter_id}
     [Return]    ${first_element_check_box}

mm-get elements from filter
   #returns a list of the text of all elements in the specified filter
   [Arguments]  ${filter_id}
   click element  ${filter_id}
   ${filter_count}  get matching xpath count  //mm-filter[@id='${filter_id}']//*//paper-checkbox[@class='style-scope px-filter x-scope paper-checkbox-1']
   @{list}  Create List  ${EMPTY}

   :FOR    ${i}  IN RANGE     1    ${filter_count}+1
         \  ${value}  get text  //mm-filter[@id='${filter_id}']//*//paper-checkbox[@class='style-scope px-filter x-scope paper-checkbox-1'][${i}]
         \  ${value}  fetch from right  ${value}  '
         \  ${value}  fetch from left  ${value}  \n
         \  Append To List  ${list}  ${value}
   [Return]    @{list}