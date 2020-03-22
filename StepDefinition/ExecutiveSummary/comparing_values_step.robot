8/8/2017
212595411
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  DatabaseLibrary
Library  OperatingSystem
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/plant_comparison_variables.robot
*** Keywords ***
User access Executive summary and same values in spine at Executive Summary module and Plant Comparison for all plants

    click element  ${Executive-Summary Iicon}
    sleep  20s
    click element  clearFilterBtn
    connect to database  dbConfigFile=${dbfile}
    ${count}  ROW COUNT  select substring (plant_code_plant_short_name,1,4) from public.plant_lookup where active = 'TRUE' FETCH FIRST 40 ROWS ONLY
    ${queryResults}  QUERY  select substring (plant_code_plant_short_name,1,4) from public.plant_lookup where active = 'TRUE' FETCH FIRST 40 ROWS ONLY
    log to console  ${count}


    : FOR    ${INDEX}    IN RANGE    1    ${count}
    \  log to console  ${queryResults[${INDEX}][0]}
    \  wait until element does not contain  accuracyContainer  --  90s
    \  click element  plant
#    \  click element  xpath=//div[@id='filterContent']//span[@id='clearBtn']
    \  wait until element is visible  ${search input}  10s
    \  input text  ${search input}  ${queryResults[${INDEX}][0]}
    \  click element  //*[@id="searchIcon"]
    \  wait until element is visible  ${plant filter check box}  20s
    \  click element  ${plant filter check box}
    \  wait until element is visible  ApplyBtn  10s
    \  click button  ApplyBtn
    \  sleep  10s
    \  wait until element is visible  accuracy  10s
    \  ${executiveAccuracy}  get text  accuracy
    \  ${executiveOntimePR}  get text  //div[@id='purchaseReqScoreCard']//span[@id='accuracy']
    \  ${executiveOpenPO}  get text  ${On-Time-Open-PO}
    \  ${executiveScheduling}  get text  //div[@id='schedulingScoreCard']//span[@id='accuracy']
    \  ${executiveIE}  get text  //div[@id='inventoryScoreCard']//div[@id='blockContent']//span[@id='actionStat']
    \  ${executiveIE2}  get text  //mo-block-bar[@id='smi']//span[@id='actionStat']
    \  ${executive12-month SMI}  execute javascript  var string = "${executiveIE2}"; var returnStr = string.split(' ')[2]; return returnStr;
    \  ${executiveVariation to Entitlement}  execute javascript  var string = "${executiveIE}"; var returnStr = string.split(' ')[2]; return returnStr;
    \  log to console  ${executiveAccuracy} Spine
    \  log to console  ${executiveOntimePR} Purchase Requisitions
    \  log to console  ${executiveOpenPO} Purchase Orders
    \  log to console  ${executiveScheduling} Scheduling
#    \  log to console  ${executiveIE} Inventory
    \  log to console  ${executive12-month SMI} SMI
    \  log to console  ${executiveVariation to Entitlement} Variation
    \  click element  plant
    \  click element  //mm-filter[@id='plant']//span[@id='clearBtn']
    \  click button  ApplyBtn
    \  sleep  15s
    \  continue for loop if  '${executiveAccuracy}' == '--'
    \  ${executiveAccuracy1}  convert to number  ${executiveAccuracy}  1
    \  ${executiveOntimePR1}  convert to number  ${executiveOntimePR}  1
    \  ${executiveOpenPO1}  convert to number  ${executiveOpenPO}  1
    \  ${executiveScheduling1}  convert to number  ${executiveScheduling}  1
    \  ${executive12-month SMI1}  replace string  ${executive12-month SMI}  %  ${EMPTY}
    \  ${executiveVariation to Entitlement1}  replace string  ${executiveVariation to Entitlement}  %  ${EMPTY}
    \  ${executive12-month SMI2}  convert to number  ${executive12-month SMI1}  1
    \  ${executiveVariation to Entitlement2}  convert to number  ${executiveVariation to Entitlement1}  1
    \  click element  xpath=//ul[@id='navitemlist']//a[@href='/secure/plant-comparison']
    \  sleep  15s
    \  click element  clearFilterBtn
    \  click element  plant
#    \  click element  xpath=//div[@id='filterContent']//span[@id='clearBtn']
    \  wait until element is visible  ${search input}  10s
    \  input text  ${search input}  ${queryResults[${INDEX}][0]}
    \  wait until element is visible  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxContainer']  60s
    \  click element  xpath=//mm-filter[@id='plant']//div[@id='filterContent']//div[@id='checkboxContainer']
    \  wait until element is visible  //mm-filter[@id='plant']//button[@id='ApplyBtn']  10s
    \  click button  //mm-filter[@id='plant']//button[@id='ApplyBtn']
    \  sleep  10s
    \  wait until element is visible  //div[@id='accuracyContainer']//span[@id='accuracy']  10s
    \  ${plantAccuracy}  get text  accuracy
    \  ${plantOpenPO}  get text  xpath=//tr[@is='vaadin-grid-table-row']//td[@style='width: 100px; order: 40000000;']
    \  ${plantScheduling}  get text  xpath=//tr[@is='vaadin-grid-table-row']//td[@style='width: 100px; order: 30000000;']
    \  ${plantScore}  get text  xpath=//tr[@is='vaadin-grid-table-row']//td[@style='width: 100px; order: 20000000;']
    \  ${plantOntimePR}  get text  xpath=//tr[@is='vaadin-grid-table-row']//td[@style='width: 100px; order: 50000000;']
    \  ${plant12-month SMI}  get text  xpath=//tr[@is='vaadin-grid-table-row']//td[@style='width: 100px; order: 60000000;']
    \  ${plantVariation to Entitlement}  get text  xpath=//tr[@is='vaadin-grid-table-row']//td[@style='width: 100px; order: 70000000;']
    \  log to console  ${plantAccuracy}
    \  log to console  ${plantOntimePR}
    \  log to console  ${plantOpenPO}
    \  log to console  ${plantScheduling}
    \  log to console  ${plantScore}
    \  log to console  ${plant12-month SMI}
    \  log to console  ${plantVariation to Entitlement}
    \  run keyword and continue on failure  should be equal  ${plantAccuracy}%  ${executiveAccuracy}%
    \  run keyword and continue on failure  should be equal  ${plantOntimePR}  ${executiveOntimePR1}%
    \  run keyword and continue on failure  should be equal  ${plantOpenPO}  ${executiveOpenPO1}%
    \  run keyword and continue on failure  should be equal  ${plantScheduling}  ${executiveScheduling1}%
    \  run keyword and continue on failure  should be equal  ${plantScore}  ${executiveAccuracy1}%
    \  run keyword and continue on failure  should be equal  ${plant12-month SMI}  ${executive12-month SMI2}%
    \  run keyword and continue on failure  should be equal  ${plantVariation to Entitlement}  ${executiveVariation to Entitlement2}%
    \  click element  ${Executive-Summary Iicon}




