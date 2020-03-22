*** Settings ***
Library     Selenium2Library
Library     BuiltIn
Library     String
Library     Collections
Library     ../../Utilities/utility.py
Resource    ../../StepDefinition/Common/database_step.robot
Resource    ../../Variables/VariablesMasterData/material_creation_monitor_variables.robot
Resource  ../../Library/filter_library.robot

*** Keywords ***
User click on mcm button
    wait until element is visible  ${MCM button}  10s
    click element  ${MCM button}
    sleep  2s

User should see material creation monitor
    wait until element is visible  ${MCM page label}
    ${mcm label}  get text  ${MCM page label}
    log  ${mcm label}
    should be equal  ${mcm label}  Material Creation Monitor  Either Material creation monitor label is absent or incorrect. Please check!
    location should contain  material-creation-monitor

User should see proper plant sp matl statuses
    #@{Expected statuses}=  create list  01 - Blocked for procment/whse  02 - Blocked for task list/BOM  Y2 - Obsolescence (warning)  Y3 - Obsolescence (Error)  Y4 - Obsolescence (Block)  Z1 - Blocked for procment/whse  Z2 - Creation in progress  Z3 - Released  Z4 - Obsolete  Z5 - Lock Sales Orders  Z6 - PO Locked  Z7 - Obsolescence (warning)  Z8 - Release from Development  ZB - Relevant for MRP  ZC - Relevant for costing  ZD - Relevant for MRP and PIR  ZE - Extinct  ZF - Relevant for Costing(LOG)  ZG - Relevant for Costing(CO)  ZX - GIS Creation in progress  ZQ - Relevant for Quality
    @{Expected statuses}=  create list  Z2 - Creation in progress  ZB - Relevant for MRP  ZD - Relevant for MRP and PIR  ZQ - Relevant for Quality  ZF - Relevant for Costing(LOG)  ZG - Relevant for Costing(CO)
    ${len expected statuses}=  evaluate  len(@{Expected statuses})
    log to console  ${len expected statuses}
    sleep  5s
    wait until element is visible  //div[@class='matlStatusContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-column/div  10s
    @{Statuses from ui}=  get webelements  //div[@class='matlStatusContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-column/div
    ${Statuses from ui strings}  create list

    ${var}  set variable  0
    :FOR  ${var}  IN  @{Statuses from ui}
    \   ${str}=  get text  ${var}
    \   log to console  ${str}
    \   append to list  ${Statuses from ui strings}  ${str}

    ${k}  set variable  0
    :FOR  ${k}  IN  @{Expected statuses}
    \   should contain  ${Statuses from ui strings}  ${k}

User should see proper inconsistencies
    sleep  3s
    @{Expected inconsistencies}=  create list  Materials missing a Drawing Number  Individual or Collective Indicator Exists  Incorrect Material Groups  Raw Material Procurement  Planning Strategy Consistency  Missing Material Revision Level  QM Control Key Review  Standard Cost Check  Production Order Type Determination  Missing Material Design Authority  Missing Goods Receipt Processing Time
    wait until element is visible  //div[@class='mcmContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-info-column/div/span[@id='title']  10s
    @{Inconsistencies from ui}=  get webelements  //div[@class='mcmContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-info-column/div/span[@id='title']

    ${Inconsistencies from ui strings}  create list

    ${i}  set variable  0
    :FOR  ${i}  IN  @{Inconsistencies from ui}
     \  ${str}=  get text  ${i}
     \  log to console  ${str}
     \  append to list  ${Inconsistencies from ui strings}  ${str}

    ${k}  set variable  0
    :FOR  ${k}  IN  @{Expected inconsistencies}
    \   should contain  ${Inconsistencies from ui strings}  ${k}

User should see proper columns for plant sp matl status
    @{Expected columns for plant spl matl status}=  create list  Plant Sp Matl Status  Overdue  Due Today  Due Current Week  Due > 7 Days  Total  Details
    wait until element is visible  ${Plant sp matl statuses columns}  10s
    @{Columns from ui for plant spl matl status}=  get webelements  ${Plant sp matl statuses columns}
    ${Column strings from ui}  create list

    ${i}  set variable  0
    :FOR  ${i}  IN  @{Columns from ui for plant spl matl status}
    \   ${str}=  get text  ${i}
    \   log to console  ${str}
    \   append to list  ${Column strings from ui}  ${str}

    ${j}  set variable  0
    :FOR  ${j}  IN  @{Expected columns for plant spl matl status}
    \   should contain  ${Column strings from ui}   ${j}

User should see proper columns for inconsistencies
    @{Expected columns for inconsistencies}=  create list  Inconsistency Type  Overdue  Due Today  Due Current Week  Due > 7 Days  Total  Details
    wait until element is visible  ${Inconsistencies columns}  10s
    @{Columns from ui for inconsistencies}=  get webelements  ${Inconsistencies columns}
    ${Column strings from ui}  create list

    ${i}  set variable  0
    :FOR  ${i}  IN  @{Columns from ui for inconsistencies}
    \   ${str}=  get text  ${i}
    \   log to console  ${str}
    \   append to list  ${Column strings from ui}  ${str}

    ${j}  set variable  0
    :FOR  ${j}  IN  @{Expected columns for inconsistencies}
    \   should contain  ${Column strings from ui}  ${j}

User click on edit filter
    wait until element is visible  ${Edit filters}  10s
    click button  ${Edit filters}

User click on edit filter cancel
    wait until element is visible  ${Edit filter cancel button}  10s
    click button  ${Edit filter cancel button}

User should see proper option labels in edit filters
    @{Expected labels for edit filter checkboxes}=  create list  Plant  Plant Category  Plant Region  Plant Business  Plant Sp Matl Status  Material Type  Aging Bucket  MRP Controller  Purchasing Group  Production Supervisor
    @{labels from edit filter checkboxes}=  get webelements  ${Edit filters checkbox labels}
    ${Edit filters checkbox strings}  create list

    ${i}  set variable  0
    :FOR  ${i}  IN  @{labels from edit filter checkboxes}
    \   ${str}=  get text  ${i}
    \   log to console  ${str}
    \   append to list  ${Edit filters checkbox strings}    ${str}

    ${j}  set variable  0
    :FOR  ${j}  IN  @{Expected labels for edit filter checkboxes}
    \   should contain  ${Edit filters checkbox strings}  ${j}

User should see proper labels in spine
    wait until element is visible  ${Change from yesterday label spine}  10s
    ${Change from yesterday text}=  get text  ${Change from yesterday label spine}
    should contain  ${Change from yesterday text}  CHANGE FROM YESTERDAY

    wait until element is visible  ${Total label spine}  10s
    ${Total text}=  get text  ${Total label spine}
    should contain  ${Total text}    Total

    wait until element is visible  ${Overdue label spine}  10s
    ${Overdue text}=  get text  ${Overdue label spine}
    should contain  ${Overdue text}  Overdue

    wait until element is visible  ${Due Today label spine}  10s
    ${Due today text}=  get text  ${Due Today label spine}
    should contain  ${Due today text}  Due Today

    wait until element is visible  ${Due Current Week label spine}  10s
    ${Due current week text}=  get text  ${Due Current Week label spine}
    should contain  ${Due current week text}  Due Current Week

    wait until element is visible  ${Due>7 days label spine}  10s
    ${Due seven days text}=  get text  ${Due>7 days label spine}
    should contain  ${Due seven days text}  Due> 7 Days

Click random view in plant sp matl status and verify grid
    sleep  5s
    ${i}  set variable  1
    #Idea is to click each view link and check the grid title for each status. But its giving some problem on clicking subsequent view link. Willl be looking into it later.
    :FOR  ${i}  IN RANGE  1  2
    \   log to console  ${i}
    \   wait until element is visible  ${MCM page label}  10s
    \   ${j}  evaluate  str(${i})
    \   ${constructed xpath for status}  construct string with argument  ${Random Plant sp matl status }  ${j}
    \   wait until element is visible  ${constructed xpath for status}  15s
    \   ${Extracted status}  get text  ${constructed xpath for status}
    \   log to console  ${Extracted status}
    \   ${constructed xpath for view}  construct string with argument  ${Random View button status}  ${j}
    \   wait until element is visible  ${constructed xpath for view}  15s
    \   Execute JavaScript  document.evaluate( "${constructed xpath for view}" ,document, null, XPathResult.ANY_TYPE, null ).iterateNext().click()
    \   sleep  10s
    \   wait until element is visible  ${Grid title}  15s
    \   log to console  ${Extracted status}
    \   ${gride-title-text}  get text  ${Grid title}
    \   should contain  ${gride-title-text}  ${Extracted status}
    \   click element  ${back button grid}
    \   sleep  3s

Click random view in inconsistency type and verify grid
    sleep  5s
    ${i}  set variable  1
    :FOR  ${i}  IN RANGE  1  2
    \   log to console  ${i}
    \   ${j}  evaluate  str(${i})
    \   wait until element is visible  ${MCM page label}  10s
    \   ${constructed xpath for inconsistency}  construct string with argument  ${Random Inconsistency type}  ${j}
    \   wait until element is visible  ${constructed xpath for inconsistency}
    \   ${Extracted inconsistency}  get text  ${constructed xpath for inconsistency}
    \   log to console  ${Extracted inconsistency}
    \   ${constructed xpath for view}  construct string with argument  ${Random View button inconsistency}   ${j}
    \   wait until element is visible  ${constructed xpath for view}  15s
    \   Execute JavaScript  document.evaluate( "${constructed xpath for view}" ,document, null, XPathResult.ANY_TYPE, null ).iterateNext().click()
    \   sleep  10s
    \   wait until element is visible  ${Grid title}  15s
    \   ${gride-title-text}  get text  ${Grid title}
    \   log to console  ${gride-title-text}
    \   should contain  ${gride-title-text}  ${Extracted inconsistency}
    \   click element  ${back button grid}
    \   sleep  3s

#Incomplete
Click on view button in plant spl matl status
    ${i}  set variable  1
    ${constructed xpath for view}  construct string with argument  ${Random View button}  ${i}
    wait until element is visible  ${constructed xpath for view}  10s
    Execute JavaScript  document.evaluate( "${constructed xpath for view}" ,document, null, XPathResult.ANY_TYPE, null ).iterateNext().click()

Click show hide button
    wait until element is visible  ${Details grid show hide button}
    click button  ${Details grid show hide button}
#Incomplete

Extract overdue count from UI
    wait until element is visible  ${Over due count spine}
    ${over due count UI string}=  get text  ${Over due count spine}
    ${trimmed due count sting}=  remove commas from numerical string  ${over due count UI string}
    ${over due count UI}=  evaluate  int(${trimmed due count sting})
    [Return]  ${over due count UI}

Extract overdue count from db
    ${first val}  set variable  0.0
    ${second val}  set variable  0.0
    User should be able to connect to database
    ${query}=  set variable  select count(aging_bucket) from material_creation_trend where aging_bucket = '1.Overdue' and "material_creation_trend"."plant_sp_matl_status" IN ('Z2 - Creation in progress', 'ZB - Relevant for MRP', 'ZD - Relevant for MRP and PIR', 'ZQ - Relevant for Quality', 'ZF - Relevant for Costing(LOG)', 'ZG - Relevant for Costing(CO)') group by aging_bucket, processed_timestamp order by "material_creation_trend"."processed_timestamp" desc limit 2;
    ${queryResults}=  QUERY  ${query}
    ${first val}=  evaluate  int(round(${queryResults[0][0]}))
    ${second val}=  evaluate  int(round(${queryResults[1][0]}))
    ${Expected over due count}=  evaluate  ${first val}-${second val}
    [Return]  ${Expected over due count}

Validate Over due count
    ${Overdue count from UI}=  Extract overdue count from UI
    ${Overdue count from db}=  Extract overdue count from db
    ${abs Overdue count from db}=  evaluate  abs(${Overdue count from db})
    should be equal  ${abs Overdue count from db}  ${Overdue count from UI}

Extract Due today count from UI
    wait until element is visible  ${Due today count spine}
    ${Due today count UI string}=  get text  ${Due today count spine}
    ${trimmed due today count string}=  remove commas from numerical string  ${Due today count UI string}
    log to console  ${trimmed due today count string}
    ${Due today count UI}=  evaluate  int(${trimmed due today count string})
    log to console  ${Due today count UI}
    [Return]  ${Due today count UI}

Extract Due today count from db
    ${first val}  set variable  0.0
    ${second val}  set variable  0.0
    User should be able to connect to database
    ${query}=  set variable  select count(aging_bucket) from material_creation_trend where aging_bucket = '2.Due Today' and "material_creation_trend"."plant_sp_matl_status" IN ('Z2 - Creation in progress', 'ZB - Relevant for MRP', 'ZD - Relevant for MRP and PIR', 'ZQ - Relevant for Quality', 'ZF - Relevant for Costing(LOG)', 'ZG - Relevant for Costing(CO)') group by aging_bucket, processed_timestamp order by "material_creation_trend"."processed_timestamp" desc limit 2;
    ${queryResults}=  QUERY  ${query}
    ${first val}=  evaluate  int(round(${queryResults[0][0]}))
    log to console  ${first val}
    ${second val}=  evaluate  int(round(${queryResults[1][0]}))
    log to console  ${second val}
    ${Expected due today count}=  evaluate  ${first val}-${second val}
    log to console  ${Expected due today count}
    [Return]  ${Expected due today count}


Validate Due today count
    ${Due today count from UI}=  Extract Due today count from UI
    ${Due today count from db}=  Extract Due today count from db
    ${abs val due today count from db}=  evaluate  abs(${Due today count from db})
    should be equal  ${abs val due today count from db}  ${Due today count from UI}

Extract due current week count from UI
    wait until element is visible  ${Due current week spine}
    ${Due current week count UI string}=  get text  ${Due current week spine}
    ${trimmed due current weak count}=  remove commas from numerical string  ${Due current week count UI string}
    log to console  ${trimmed due current weak count}
    ${Due current week count UI}=  evaluate  int(${trimmed due current weak count})
    log to console  ${Due current week count UI}
    [Return]  ${Due current week count UI}

Extract due current week count from db
    ${first val}  set variable  0.0
    ${second val}  set variable  0.0
    User should be able to connect to database
    ${query}=  set variable  select count(aging_bucket) from material_creation_trend where aging_bucket = '3.Due Current Week' and "material_creation_trend"."plant_sp_matl_status" IN ('Z2 - Creation in progress', 'ZB - Relevant for MRP', 'ZD - Relevant for MRP and PIR', 'ZQ - Relevant for Quality', 'ZF - Relevant for Costing(LOG)', 'ZG - Relevant for Costing(CO)') group by aging_bucket, processed_timestamp order by "material_creation_trend"."processed_timestamp" desc limit 2;
    ${queryResults}=  QUERY  ${query}
    ${first val}=  evaluate  int(round(${queryResults[0][0]}))
    log to console  ${first val}
    ${second val}=  evaluate  int(round(${queryResults[1][0]}))
    log to console  ${second val}
    ${Expected current week count}=  evaluate  ${first val}-${second val}
    log to console  ${Expected current week count}
    [Return]  ${Expected current week count}


Validate Due current week count
    ${Due current week count from UI}=  Extract due current week count from UI
    ${Due current week count from db}=  Extract due current week count from db
    ${abs due current week count from db}=  evaluate  abs(${Due current week count from db})
    should be equal  ${abs due current week count from db}  ${Due current week count from UI}

Extract due seven days count from UI
    wait until element is visible  ${Due seven days spine}
    ${Due seven days count UI string}=  get text  ${Due seven days spine}
    ${trimmed due seven days count}=  remove commas from numerical string  ${Due seven days count UI string}
    log to console  ${trimmed due seven days count}
    ${Due seven days count UI}=  evaluate  int(${trimmed due seven days count})
    log to console  ${Due seven days count UI}
    [Return]  ${Due seven days count UI}

Extract due seven days count from db
    ${first val}  set variable  0.0
    ${second val}  set variable  0.0
    User should be able to connect to database
    ${query}=  set variable  select count(aging_bucket) from material_creation_trend where aging_bucket = '4.Due > 7 Days' and "material_creation_trend"."plant_sp_matl_status" IN ('Z2 - Creation in progress', 'ZB - Relevant for MRP', 'ZD - Relevant for MRP and PIR', 'ZQ - Relevant for Quality', 'ZF - Relevant for Costing(LOG)', 'ZG - Relevant for Costing(CO)') group by aging_bucket, processed_timestamp order by "material_creation_trend"."processed_timestamp" desc limit 2;
    ${queryResults}=  QUERY  ${query}
    ${first val}=  evaluate  int(round(${queryResults[0][0]}))
    log to console  ${first val}
    ${second val}=  evaluate  int(round(${queryResults[1][0]}))
    log to console  ${second val}
    ${Expected seven days count}=  evaluate  ${first val}-${second val}
    log to console  ${Expected seven days count}
    [Return]  ${Expected seven days count}


Validate Due seven days count
    ${Due seven days count from UI}=  Extract due seven days count from UI
    ${Due seven days count from db}=  Extract due seven days count from db
    ${abs due seven days count from db}=  evaluate  abs(${Due seven days count from db})
    should be equal  ${abs due seven days count from db}  ${Due seven days count from UI}

Click material type filter
    wait until element is visible  ${Material type filter}  10s
    click element  ${Material type filter}

Click a material type value in filter
    wait until element is visible  ${Material type value}  10s
    click element  ${Material type value}

Click filter continue button
    wait until element is visible  ${Filter continue button}   10s
    click element  ${Filter continue button}
    sleep  10s

Click material type dropdown
    wait until element is visible  type  10s
    click element  type

Click material type apply
    wait until element is visible  ${Material type apply button}  10s
    click element  ${Material type apply button}
    sleep  3s

Check if filter got applied
    sleep  3s
    ${initial val}=  Extract overdue count from UI
    Click material type filter
    sleep  3s
    Click filter continue button
    sleep  5s
    Click material type dropdown
    sleep  5s
    #below, we are getting the checkbox of the first element in the Material Type dropdown, and selecting it
    ${first_element_in_material_type}  mm-get first element from filter list  type
    click element  ${first_element_in_material_type}
    sleep  3s
    Click material type apply
    sleep  3s
    ${new val}=  Extract overdue count from UI
    should not be equal  ${initial val}  ${new val}

Verify material status description
#    @{Expected status descriptions}  create list  01 - Blocked for procment/whse  02 - Blocked for task list/BOM  Y2 - Obsolescence (warning)  Y3 - Obsolescence (Error)  Y4 - Obsolescence (Block)  Z1 - Blocked for procment/whse  Z2 - Creation in progress  Z3 - Released  Z4 - Obsolete  Z5 - Lock Sales Orders  Z6 - PO Locked  Z7 - Obsolescence (warning)  Z8 - Release from Development  ZB - Relevant for MRP  ZC - Relevant for costing  ZD - Relevant for MRP and PIR  ZE - Extinct  ZF - Relevant for Costing(LOG)  ZG - Relevant for Costing(CO)  ZX - GIS Creation in progress  ZQ - Relevant for Quality
    @{Expected status descriptions}  create list  ZB - Relevant for MRP  ZD - Relevant for MRP and PIR  ZF - Relevant for Costing(LOG)  ZG - Relevant for Costing(CO)  Z2 - Creation in progress  ZQ - Relevant for Quality
    sleep  5s
    wait until element is visible  //div[@class='matlStatusContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-column/div  10s
    @{Statuses from ui}=  get webelements  //div[@class='matlStatusContainer style-scope mo-material-creation-monitor']/mo-grid/div[@class='grid-container style-scope mo-grid']/vaadin-grid[@id='dataTableGrid']/vaadin-grid-table/table/tbody[@id='items']/tr/td[1]/vaadin-grid-cell-content/mo-column/div
    ${Statuses from ui strings}  create list

    ${var}  set variable  0
    :FOR  ${var}  IN  @{Statuses from ui}
    \   ${str}=  get text  ${var}
    \   log to console  ${str}
    \   append to list  ${Statuses from ui strings}  ${str}

    ${k}  set variable  0
    :FOR  ${k}  IN  @{Expected status descriptions}
    \   should contain  ${Statuses from ui strings}  ${k}

Verify material type descriptions

    @{Expected type desc}  create list  ABF - Waste  HALB  PROD - Product group  ZBGE - GENERAL EXPENSES(Brazil)  ZDIE - SERVICES  ZFP - FINISHED PRODUCT  ZFS - FACTORY SUPPLY  ZGE - GENERAL EXPENSES(Y codes)  ZKMT - CONFIGURABLE PRODUCT  ZPCK - PACKING  ZRM - RAW MATERIAL  ZSF - SEMI FINISHED GOOD  ZSYS - SYSTEM'S SPECIFIC  ZTOL - TOOLS  ZVC - VARIANT CONFIGURATOR
#    @{Expected type desc}  create list  FHMI  PROD - Product group  ZBGE - GENERAL EXPENSES(Brazil)  ZDIE - SERVICES  ZDRW - DRAWING  ZFP - FINISHED PRODUCT  ZFS - FACTORY SUPPLY  ZGE - GENERAL EXPENSES(Y codes)  ZKMT - CONFIGURABLE PRODUCT  ZPCK - PACKING  ZPOI - PO Interface  ZRM - RAW MATERIAL  ZSF - SEMI FINISHED GOOD  ZSYS - SYSTEM'S SPECIFIC  ZTG - TRADED GOOD  ZTOL - TOOLS  ZVC - VARIANT CONFIGURATOR
    wait until element is visible  //mm-global-filter[@id='globalFilter']/mm-filter[@id='type']/px-filter/div/div[@id='filterContent']/div[3]/div[@id='availableFilterList']/paper-checkbox/div[@id='checkboxLabel']/span[1]  10s
    @{type desc from ui}=  get webelements  //mm-global-filter[@id='globalFilter']/mm-filter[@id='type']/px-filter/div/div[@id='filterContent']/div[3]/div[@id='availableFilterList']/paper-checkbox/div[@id='checkboxLabel']/span[1]
    ${type desc ui strings}  create list

    ${var}  set variable  0
    :FOR  ${var}  IN  @{type desc from ui}
    \   ${str}=  get text  ${var}
    \  log to console  ${str}
    \   append to list  ${type desc ui strings}  ${str}

    ${k}  set variable  0
    :FOR  ${k}  IN  @{Expected type desc}
    \   should contain  ${type desc ui strings}  ${k}











