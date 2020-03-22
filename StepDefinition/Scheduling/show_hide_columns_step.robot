*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot

*** Keywords ***
User access "${link}" module
      click link  ${link}
      sleep  20s
    # wait until element is visible  ${show/hide column}  10s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

click on show/hide column in products page and user should see newly added column "scrap quantity column" and select it
     wait until element is visible  ${show/hide column}  10s
     click element  ${show/hide column}
     run keyword  scroll page to location  0  100000
     wait until element is visible  ${scrapped_quantity_col_show/hide}  10s
     sleep  3s
     mouse over  ${scrapped_quantity_col_show/hide}
     click element  ${scrapped_quantity_col_show/hide}
     click element  ${show/hide column}
     sleep  3s

user should see Ui with "Scrap Quantity column with data
     wait until element is visible  ${scrapped_quantity_grid_col}  20s
     element should be visible  ${scrapped_quantity_grid_col}
     ${text}  get text  ${scrapped_quantity_grid_col}
     log  ${text}
     should be equal  ${text}  Scrapped Quantity

user should not see "parking lot" in materiaal description in db
     connect to database  dbConfigFile=${dbfile}
     ${DB_result}  check if not exists in database  select * from public.production_ords_v where plant_business='Onshore Wind' and material_description='%Parking Lot%';
     log  ${DB_result}
     should be equal as strings  ${DB_result}  None

user enters module and scroll page down
     sleep  3s
     RUN KEYWORD  scroll page to location  0  1000000

User should see "© 2017 General Electric" changed to "© 2018 General Electric"
    ${Copyright text}  get text  //div[2]/mo-footer/footer/span/span
    log  ${Copyright text}
    should be equal  ${Copyright text}  © 2018 General Electric