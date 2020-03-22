*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot

*** Keywords ***
User access "${link}" module
      click link   ${link}
      sleep  15s
      wait until page contains  addFilterBtn  20s

User should see "Requisitions (incl. Planned)"
      wait until element is visible  ${Purchase Requisition title}  20s
      ${title}  get text  ${Purchase Requisition title}
      log  ${title}
      should be equal  ${title}  Requisitions (incl. Planned)
      [Return]  ${title}

User click on plant filter and enter plant code on search box
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  10s
    input text  search-input  c47
    double click element  ${lazy_loading_search_icon_filter}
    sleep  4s

plant filter should display blank page
     Run Keyword And Ignore Error    Should Be Empty  selectedFiltersList
     wait until element is visible  ${Apply Button}  10s
     click button  ${Apply Button}

User click on plant filter and enter plant code c81 in search box
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  10s
      input text  search-input  c81
      double click element  ${lazy_loading_search_icon_filter}
      sleep  4s

User should see c81-'ITI Instrument Transformers' plant on plant filter and select that plant and click apply
     #wait until element is visible  C81 - ITI Instrument Transformers  20s
     click element  C81 - ITI Instrument Transformers
     wait until element is visible  ${Apply Button}  10s
     click button  ${Apply Button}
     click element  plant
     wait until page contains  addFilterBtn  40s

User click on plant filter and enter plant code 2490 in search box
      wait until element is visible  plant  20s
      click element  plant
      #wait until element is visible  search-input  10s
    input text  search-input  2490
    double click element  ${lazy_loading_search_icon_filter}
    sleep  7s
      wait until element is visible  2490 - GE Wind France SAS - St. Nazaire  20s
      click element  2490 - GE Wind France SAS - St. Nazaire
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      wait until page contains  addFilterBtn  40s

User should be able to see Manufacturing in plant catagory filter
     wait until element is visible  addFilterBtn  40s
     click element  addFilterBtn
     click element  ${plant category filter}
     wait until element is visible  continue  20s
     click button  continue
     wait until element is visible  pcat  20s
     click element  pcat
     sleep  3s
     wait until element is visible  product-Manufacturing  20s
     click element  product-Manufacturing
     wait until element is visible  ${Apply button for plant category filter}  10s
     click button  ${Apply button for plant category filter}
     wait until page contains  addFilterBtn  20s

User should see "EUROPE" in plant region filter
     wait until element is visible  addFilterBtn  40s
     click element  addFilterBtn
     click element  ${plant region filter}
     wait until element is visible  continue  20s
     click button  continue
     wait until element is visible  region  20s
     click element  region
     sleep  3s
     wait until element is visible  product-EMEA  20s
     click element  product-EMEA
     wait until element is visible  ${Apply button for plant region filter}  10s
     click button  ${Apply button for plant region filter}
     wait until page contains  addFilterBtn  20s

User should see "HYDRO" in plant business filter
     wait until element is visible  addFilterBtn  40s
     click element  addFilterBtn
     click element  ${sub_business_filter}
     wait until element is visible  continue  20s
     click button  continue
     wait until element is visible  sub_business  20s
     click element  sub_business
     sleep  3s
     wait until element is visible  product-Hydro  20s
    click element  product-Hydro
     wait until element is visible  ${sub_business_apply_button}  10s
     click button  ${sub_business_apply_button}
     wait until page contains  addFilterBtn  40s

click on clear filter to unselect the filter selection
     wait until element is visible  clearFilterBtn  10s
     click element  clearFilterBtn
     sleep  2s

User click on plant filter and enter plant code 56MM in search box
     wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  10s
      input text  search-input  56mm
      double click element  ${lazy_loading_search_icon_filter}
      sleep  4s
      wait until element is visible  56MM - MMF Plant Taubate  20s
      click element  56MM - MMF Plant Taubate
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      wait until page contains  addFilterBtn  40s

User should see "LATAM" in plant region filter
     wait until element is visible  addFilterBtn  40s
     click element  addFilterBtn
     click element  ${plant region filter}
     wait until element is visible  continue  20s
     click button  continue
     wait until element is visible  region  20s
     click element  region
     sleep  3s
     wait until element is visible  product-LA  20s
     click element  product-LA
     wait until element is visible  ${Apply button for plant region filter}  10s
     click button  ${Apply button for plant region filter}
     wait until page contains  addFilterBtn  20s

User click on plant filter and enter plant code 560N in search box
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  10s
      input text  search-input  560n
      click element  ${lazy_loading_search_icon_filter}
      sleep  4s
      wait until element is visible  560N - Plant Wind Canoas  20s
      click element  560N - Plant Wind Canoas
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      wait until page contains  addFilterBtn  40s

User click on plant filter and enter plant code 5602 in search box
      wait until element is visible  plant  20s
      click element  plant
      wait until element is visible  search-input  10s
      input text  search-input  5602
      double click element  ${lazy_loading_search_icon_filter}
      sleep  4s
      wait until element is visible  5602 - Plant Wind Taubate  20s
      click element  5602 - Plant Wind Taubate
      wait until element is visible  ${Apply Button}  10s
      click button  ${Apply Button}
      wait until page contains  addFilterBtn  60s
