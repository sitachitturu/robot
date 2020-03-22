1/2/2018
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  DatabaseLibrary
Library  OperatingSystem
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access "${link}" module and User should see "Settings" title
    go to   ${WELCOME.URL}${link}
    wait until element is visible  //h1[contains(normalize-space(), 'Settings')]  10s
User should see correct email and SSO
    element should be visible  user-name
    element should be visible  user-sso
User should see "My organization" title
    element should be visible  //span[contains(normalize-space(), 'My Organization')]
User should see "Select options below to indicate which data you would like to see in Material Optimization."
    element should be visible  //p[contains(normalize-space(), 'Select options below to indicate which data you would like to see in Material Optimization.')]
User should see "My Business"
    element should be visible  //label[contains(normalize-space(), 'MY BUSINESS')]
User should see "Select Business"
    element should be visible  //span[contains(normalize-space(), 'Select Business')]
User should see "My Sub-Business"
    element should be visible  //label[contains(normalize-space(), 'MY BUSINESS')]
User should see "Select Sub-business"
    element should be visible  //span[contains(normalize-space(), 'Select Sub-business')]
User should see "Save" and "Cancel" button
    element should be visible  //div[@class='button-holder style-scope mo-settings']//button[contains(normalize-space(), 'Save')]
    element should be visible  //div[@class='button-holder style-scope mo-settings']//button[contains(normalize-space(), 'Cancel')]
User click "Select Business" link
    click element  //span[contains(normalize-space(), 'Select Business')]
User should see "Which Businesses do you want to focus on?"
    wait until element is visible  //h2[contains(normalize-space(), 'Which Businesses do you want to focus on')]
User should see "Select Business" in Select Business pop up window
    element should be visible  //h3[contains(normalize-space(), 'Select Business')]
User should see search box
    element should be visible  txtinput
User should see Healthcare, MMF, O&G, Power, Renewables and Transportation business names
      ${plant_file}  get file  ../Data/all_business.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  input text  //mo-settings-item-list[@item-list-label='MY BUSINESS']//input[@id='txtinput']  ${item}
      \  sleep  1s
      \  click element  //div[@id='checkboxLabel']//span[contains(normalize-space(), '${item}')]
#    wait until element is visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Healthcare')]  10s
#    element should be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'MMF')]
#    element should be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'O&G')]
#    element should be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Power')]
#    element should be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Renewables')]
#    element should be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Transportation')]
User should see "Save" and "Cancel" button in pop-up window
    element should be visible  //div[@id='buttons']//button[contains(normalize-space(), 'Save')]
    element should be visible  //div[@id='buttons']//button[contains(normalize-space(), 'Cancel')]
User type Healthcare in search box
    input text  txtinput  Healthcare
    wait until element is visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Healthcare')]  10s
    sleep  3s
check checkbox for Healtcare
    element should be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Healthcare')]
    element should not be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'MMF')]
    element should not be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'O&G')]
    element should not be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Power')]
    element should not be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Renewables')]
    element should not be visible  //div[@id='checkboxLabel']//span[contains(normalize-space(), 'Transportation')]
    click element  //paper-checkbox[@nameid='product-Healthcare']
click Save button
    click element  //div[@id='buttons']//button[contains(normalize-space(), 'Save')]
User Should see Healthcare business selected in My business section
    wait until element is visible  //li//span[@id='product-Healthcare']  10s
    capture page screenshot


User click "Select Sub-business" link
    click element  //span[contains(normalize-space(), 'Select Sub-business')]
User should see "Which Sub-businesses do you want to focus on?"
    wait until element is visible  //h2[contains(normalize-space(), 'Which Sub-Businesses do you want to focus on?')]
User should see "Select Sub-business" in Select Sub-business pop up window
    element should be visible  //h3[contains(normalize-space(), 'Select Sub-business')]
User should see search box Select Sub-business pop up window
    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//input[@id='txtinput']
User should see "Save" and "Cancel" button Select Sub-business pop up window
    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='buttons']//button[contains(normalize-space(), 'Save')]
    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='buttons']//button[contains(normalize-space(), 'Cancel')]
User should see list Sub-business names
      ${plant_file}  get file  ../Data/all_subbusiness.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  input text  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//input[@id='txtinput']  ${item}
      \  sleep  1s
      \  click element  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= '${item}']
#    wait until element is visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'AC']  10s
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Assembly COE']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Assembly-Thermal COE']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Assembly-Transportation COE']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'DTS']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Drilling']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Fabrication-Machining-Assembly COE']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GPS']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GS']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GS-AIS']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GS-GA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GS-GIS']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GS-PTR']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'GS-RPC']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Gas Power Systems']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Healthcare']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Hydro']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'N/A']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Onshore']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Onshore Wind']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'PC']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'PC-PE']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'PC-RM']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Parts']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Power']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Power Services']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Power Transmission']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Pressure Control']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Production Solutions']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Steam Power Systems']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Subsea']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Transportation']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Wind']
User type Drilling in search box
    input text  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//input[@id='txtinput']  Drilling
    wait until element is visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Drilling']  10s
    sleep  3s
check checkbox for Drilling
    element should be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Drilling']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'AC']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Assembly COE']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Assembly-Transportation COE']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'DTS']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='checkboxLabel']//span[.= 'Fabrication-Machining-Assembly COE']
    click element  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//paper-checkbox[@nameid='product-Drilling']
click Save button in Select Sub-business pop up window
    click element  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//div[@id='buttons']//button[contains(normalize-space(), 'Save')]
User Should see Drilling sub-business selected in My sub-business section
    wait until element is visible  //mo-settings-item-list[@item-list-label='MY SUB-BUSINESS']//span[@id='product-Drilling']  10s
    capture page screenshot


User click "Select Plant" link
    click element  //span[contains(normalize-space(), 'Select Plant')]
User should see "Which Plants do you want to focus on?"
    wait until element is visible  //h2[contains(normalize-space(), 'Which Plants do you want to focus on?')]
User should see "Select Plant" in Select Plant pop up window
    element should be visible  //h3[contains(normalize-space(), 'Select Plant')]
User should see search box Select Plant pop up window
    element should be visible  //mo-settings-item-list[@item-list-label='MY PLANT']//input[@id='txtinput']
User should see list Plants names
      ${plant_file}  get file  ../Data/all_plants.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  input text  //mo-settings-item-list[@item-list-label='MY PLANT']//input[@id='txtinput']  ${item}
      \  sleep  1s
      \  click element  //mo-settings-item-list[@item-list-label='MY PLANT']//paper-checkbox[@nameid='product-${item}']

#    connect to database  dbConfigFile=${dbfile}
#    ${count}  ROW COUNT  SELECT CASE WHEN plant_code_plant_short_name IS NOT NULL THEN plant_code_plant_short_name ELSE 'NULL' END AS "plant_code_plant_short_name", COUNT('*') AS "item_count" FROM "plant_lookup" AS "plant_lookup" GROUP BY "plant_code_plant_short_name" ORDER BY "plant_lookup"."plant_code_plant_short_name" ASC;
#    ${queryResults}  QUERY  SELECT CASE WHEN plant_code_plant_short_name IS NOT NULL THEN plant_code_plant_short_name ELSE 'NULL' END AS "plant_code_plant_short_name", COUNT('*') AS "item_count" FROM "plant_lookup" AS "plant_lookup" GROUP BY "plant_code_plant_short_name" ORDER BY "plant_lookup"."plant_code_plant_short_name" ASC;
#    log to console  ${count}
#    : FOR    ${INDEX}    IN RANGE    1    ${count}
#    \  ${bytes} =  Encode String To Bytes     ${queryResults[${INDEX}][0]}  UTF-8
#    \  log to console  ${bytes}
#    \  input text  //mo-settings-item-list[@item-list-label='MY PLANT']//input[@id='txtinput']   ${bytes}
#    \  RUN KEYWORD AND CONTINUE ON FAILURE  WAIT UNTIL ELEMENT IS VISIBLE  //mo-settings-item-list[@item-list-label='MY PLANT']//div[@id='checkboxLabel']//span[.= '${bytes}']
User should see "Save" and "Cancel" button Select Plant pop up window
    element should be visible  //mo-settings-item-list[@item-list-label='MY PLANT']//div[@id='buttons']//button[contains(normalize-space(), 'Save')]
    element should be visible  //mo-settings-item-list[@item-list-label='MY PLANT']//div[@id='buttons']//button[contains(normalize-space(), 'Cancel')]
User type 0010 in search box
    input text  //mo-settings-item-list[@item-list-label='MY PLANT']//input[@id='txtinput']  0010
    wait until element is visible  //mo-settings-item-list[@item-list-label='MY PLANT']//paper-checkbox[@nameid='product-0010 - Charlottesville']  10s
    sleep  3s
check checkbox for 0010
    click element  //mo-settings-item-list[@item-list-label='MY PLANT']//paper-checkbox[@nameid='product-0010 - Charlottesville']
click Save button in Select Plant pop up window
    click element  //mo-settings-item-list[@item-list-label='MY PLANT']//div[@id='buttons']//button[contains(normalize-space(), 'Save')]
User Should see Plant 0010 - Charlottesville selected in My Plant section
    wait until element is visible  //mo-settings-item-list[@item-list-label='MY PLANT']//span[@id='product-0010 - Charlottesville']  10s
    capture page screenshot


User click "Select Region" link
    click element  //span[contains(normalize-space(), 'Select Region')]
User should see "Which Regions do you want to focus on?"
    wait until element is visible  //h2[contains(normalize-space(), 'Which Regions do you want to focus on?')]
User should see "Select Region" in Select Region pop up window
    element should be visible  //h3[contains(normalize-space(), 'Select Region')]
User should see search box Select Region pop up window
    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//input[@id='txtinput']
User should see list Region names
      ${plant_file}  get file  ../Data/all_regions.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  input text  //mo-settings-item-list[@item-list-label='MY REGION']//input[@id='txtinput']  ${item}
      \  sleep  1s
      \  click element  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= '${item}']


#    wait until element is visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'ASIA']  10s
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'CEAP']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'CEER']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'EMEA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'INDIA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'LA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'LATAM']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'MECA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'NA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'NAM']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'OCEANIA']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'US']
#    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'WEA']
User should see "Save" and "Cancel" button Select Region pop up window
    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='buttons']//button[contains(normalize-space(), 'Save')]
    element should be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='buttons']//button[contains(normalize-space(), 'Cancel')]
User type ASIA in search box
    input text  //mo-settings-item-list[@item-list-label='MY REGION']//input[@id='txtinput']  ASIA
    wait until element is visible  //mo-settings-item-list[@item-list-label='MY REGION']//paper-checkbox[@nameid='product-ASIA']  10s
    sleep  3s
check checkbox for ASIA
    click element  //mo-settings-item-list[@item-list-label='MY REGION']//paper-checkbox[@nameid='product-ASIA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'CEAP']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'CEER']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'EMEA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'INDIA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'LA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'LATAM']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'MECA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'NA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'NAM']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'OCEANIA']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'US']
    element should not be visible  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='checkboxLabel']//span[.= 'WEA']
click Save button in Select Region pop up window
    click element  //mo-settings-item-list[@item-list-label='MY REGION']//div[@id='buttons']//button[contains(normalize-space(), 'Save')]
User Should see ASIA region selected in My Region section
    wait until element is visible  //mo-settings-item-list[@item-list-label='MY REGION']//span[@id='product-ASIA']  10s
    capture page screenshot
    sleep  10s
click Save
    click element  next-button
    sleep  10s
    capture page screenshot
remove all selections for business
      ${plant_file}  get file  ../Data/all_business.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  click element  icon-${item}
remove all selections for subbusiness
      ${plant_file}  get file  ../Data/all_subbusiness.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  click element  icon-${item}
remove all selections for plant
      ${plant_file}  get file  ../Data/all_plants.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  click element  icon-${item}
remove all selections for region
      ${plant_file}  get file  ../Data/all_regions.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log to console  ${item}
      \  click element  icon-${item}

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})











