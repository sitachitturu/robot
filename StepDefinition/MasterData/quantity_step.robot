5/26/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  DatabaseLibrary
Library  OperatingSystem
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
*** Keywords ***
User access Master Data module
    click element  ${Master Data Icon}

User should see "List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed" inconsistency
    wait until element is visible  ${inconsistency MMDC54}  10s

User see should see a Quantity number for this inconsistency
    element should be visible  ${MMDC54 quantity}
    ${MMDC54 value quantity string}  get text  ${MMDC54 quantity}
    ${MMDC54 value}  convert to integer  ${MMDC54 value quantity string}
    set global variable  ${MMDC54 value}

User select plant and should see that quantity for this inconsitency should be lover or equal to quantity for all plants view
      wait until element is visible  plant  20s
      click element  plant
      sleep  5s
      ${plant_file}  get file  ${text fileplant filter}
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log  ${item}
      \  click element  xpath=//div[@id='filterContent']//span[@id='clearBtn']
      \  wait until element is visible  ${search input}  10s
      \  input text  ${search input}  ${item}
      \  run keyword and continue on failure  wait until element is visible  ${plant filter check box}  20s
      \  run keyword and continue on failure  click element  ${plant filter check box}
      \  wait until element is visible  ApplyBtn  10s
      \  click button  ApplyBtn
      \  sleep  2s
      \  wait until element is visible  ${inconsistency MMDC54}  10s
      \  element should be visible  ${MMDC54 quantity}
      \  ${MMDC54 value quantity for plant sting}  get text  ${MMDC54 quantity}
      \  ${MMDC54 value quantity for plant}  convert to integer  ${MMDC54 value quantity for plant sting}
      \  set global variable  ${MMDC54 value quantity for plant}
      \  should be true   ${MMDC54 value quantity for plant} <= ${MMDC54 value}
      \  wait until element is visible  plant  20s
      \  run keyword and continue on failure  click element  plant
      \  sleep  3s
      \  wait until element is visible  search-input  10s
      \  run keyword and continue on failure  click element  product-${item}

get the value in quantity coulmn for inconsiistency And user click on inconsistency "Planned Delivery Time (LT) = 0 for Purchased Materials"
     ${mmdc53_quantity_value}  get text  ${mmdc53_quantity_row_value}
     log  ${mmdc53_quantity_value}
     click element  ${MMDC53}
user should see number in quantity col. for that insistency should be equal to no. of records in view page


