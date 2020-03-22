*** Settings ***
Library  Selenium2Library
Library  Collections
Library  OperatingSystem
Library  String
Resource  ../../Variables/VariablesMasterData/masterdata_variables.robot

*** Keywords ***
User click Master Data icon
        click element  ${Master Data Icon}
        sleep  3s
select power max plants one by one from plant filter and hit apply button
      wait until element is visible  plant  20s
      click element  plant
      sleep  5s
      ${plant_file}  get file  ../Data/All_Modules_Plant_Filter_Data_Text_Files/power_max_plants_list.txt
      @{plant_array}  split to lines  ${plant_file}
      :FOR  ${item}  IN  @{plant_array}
      \  log  ${item}
      \  run keyword and continue on failure  click element  product-${item}
      \  wait until element is visible  ${Apply Button}  10s
      \  click button  ${Apply Button}
      \  sleep  5s
      \  run keyword and continue on failure  user should see selected plants belongs to "MMDC16,MMDC36,MMDC11,MMDC17,MMDC45" inconsistencies with spefied prioritys
      \  wait until element is visible  plant  20s
      \  click element  plant
      \  sleep  3s
      \  wait until element is visible  search-input  10s
      \  run keyword and continue on failure  click element  product-${item}

user should see selected plants belongs to "MMDC16,MMDC36,MMDC11,MMDC17,MMDC45" inconsistencies with spefied prioritys
      ${name_of_inconsistency}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row/div/div[2]/mo-master-data-info-cell/span
      log  ${name_of_inconsistency}
      ${my_list}  create list  Missing BOM and/or Routing  Conflicting Ind./Col. Indicator and Safety Stock  Missing MRP Controller  Missing Purchasing Group  Stor. Loc. for EP ‘Non Relevant’ for MRP  List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed  In-House Prod. Time = 0  Planned Delivery Time (LT) = 0 for Purchased Materials  Materials Missing a Profit Center Assignment
      list should contain value  ${my_list}  ${name_of_inconsistency}
      ${value1}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row/div/div[3]/mo-master-data-change-cell/span
      ${value}  set variable if  '${value1}' == 'no change'  0  ${value1}
      log  ${value}
      ${priority}  get text  //*[@class='priority2 style-scope mo-master-data-priority-cell']
      log  ${priority}
      ${row2_priority}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row[2]/div/div/mo-master-data-priority-cell
      log  ${row2_priority}
      ${value}  set variable if  '${row2_priority}' == '-'  0  ${row2_priority}
      log  ${value}
      run keyword if  ${value} > 0  user should see selected plants belongs to "MMDC16,MMDC36,MMDC11,MMDC17,MMDC45" inconsistencies with spefied prioritys for 2nd row

user should see selected plants belongs to "MMDC16,MMDC36,MMDC11,MMDC17,MMDC45" inconsistencies with spefied prioritys for 2nd row
      ${name_of_inconsistency}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row[2]/div/div[2]/mo-master-data-info-cell/span
      log  ${name_of_inconsistency}
      ${my_list}  create list  Missing BOM and/or Routing  Conflicting Ind./Col. Indicator and Safety Stock  Missing MRP Controller  Missing Purchasing Group  Stor. Loc. for EP ‘Non Relevant’ for MRP  List of Phantom Materials with a Safety Stock or Reorder Point. These type of parts should never be stocked as they cannot be consumed  In-House Prod. Time = 0  Planned Delivery Time (LT) = 0 for Purchased Materials  Materials Missing a Profit Center Assignment  Inconsistent Purchasing Info Record and Material Master Lead Times for Purchased Materials  Purchased to Stock materials with no Source List  Missing Source List Flag MM  Items missing a Lead Time  Inconsistent Purchasing Info Record and Material Master Order Quantities for Purchased Materials

      list should contain value  ${my_list}  ${name_of_inconsistency}
      ${value1}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row[2]/div/div[3]/mo-master-data-change-cell/span
      ${value}  set variable if  '${value1}' == 'no change'  0  ${value1}
      log  ${value}
      ${priority}  get text  //mo-master-data-grid/div/div[2]/mo-master-data-row[2]/div/div/mo-master-data-priority-cell
      log  ${priority}
