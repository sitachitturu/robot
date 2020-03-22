*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  RequestsLibrary
Library  Process
Library  Collections
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/stock_policy_dashboard_variables.robot

*** Keywords ***
User access "${link}" module
  click link   ${link}
User should click on expand filter view
    sleep  20s
    click element  ${expand_filter}
User should click on add filter button
   sleep  5s
   click element  ${add_filter}
User should click on continue button
    sleep  5s
   click element  ${continue_button}
User should click on Plant Business filter
    click element  ${plant_business}
    sleep  5s
#         click element  ${mmf_checkbox}
#         sleep  2s
#         click element  ${power_check_box}
#         sleep  5s
User should click on Apply button
     click element  ${apply_button}

##============================================================================

#User access "${link}" module
#         click link   ${link}
#         sleep  30s
#         wait until page contains  addFilterBtn  10s

User click Admin icon
         wait until element is visible  ${navigation_icon}  10s
         click element  ${navigation_icon}
         sleep  4s
         element should be visible  ${admin_in_navitemlist}  20s
         click element  ${admin_in_navitemlist}
         sleep  6s

User should see Stock Policy Dashboard page
         element should be visible  ${stock_policy_dashboard}
         ${module_name_text_in_navlist}  get text  ${stock_policy_dashboard}
         should be equal  ${module_name_text_in_navlist}  Stock Policy Dashboard
         sleep  5s

Delete All Bookmarks
        [Arguments]  ${link}
        log to console  ${Product Name unique value}
        log to console  ${Product Name unique value1}
        sleep  5s
        click element  ${Apply filter}
        wait until element is visible  clearSpan  10s
        click element  clearSpan
        run keyword and ignore error  mouse over  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]
        run keyword and ignore error  click element  //*[@id='filterSetItems']//*//div[@class='operations style-scope mo-filter-set-item']//div[@class='delete style-scope mo-filter-set-item']
        run keyword and ignore error  click element  ${Apply filter}
        run keyword and ignore error  mouse over  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value1}')]
        sleep  3s
        run keyword and ignore error  click element  //div[@id='filterSetItems']//div[contains(normalize-space(), '${Product Name unique value1}')]//div[@class='delete style-scope mo-filter-set-item']
        element should not be visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value}')]  5s
        element should not be visible  //div[@id='filterSetItemContainer']//div[contains(normalize-space(), '${Product Name unique value1}')]  5s
        sleep  5s

User click Stock policy dashboard under admin icon
         sleep  5s
         click element  ${stock policy dashboard icon}
         sleep  10s

user should see default filters "Plant Business" "Sub Business" "Plant Region" "plant"
          element should be visible  business
          element should be visible  sub_business
          element should be visible  plant
          element should be visible  region

click "Edit Filter(s)"
          run keyword  scroll page to location  10000000  0
          wait until element is visible  addFilterBtn  10s
          click button  addFilterBtn
          sleep  4s

User should see proper option labels in edit filters
         element should be visible  ${plant Business filter}
         element should be visible  ${plant sub_Business filter}
         element should be visible  ${plant Region filter}
         element should be visible  ${plant filter}
         element should be visible  ${Buyer / Purch. Group filter}
         element should be visible  ${planner/Mrp Controller filter}


User click on edit filter cancel
          wait until element is visible  continue  10s
          click element  continue

User should donut pie chart with name "TOTAL OPPORTUNITIES"
          element should be visible  ${donut pie chart}
          ${title of dont pie chart}  get text  ${pie chart title}
          log  ${title of dont pie chart}
          should be equal  ${title of dont pie chart}  TOTAL OPPORTUNITIES

User should see "Safety Stock" bar chart with View Details option and with Inventory opportunities and Fullfillment Opportunities
          element should be visible  ${safety_stock bar chart}
          element should be visible  ${view_details for ss}
          element should be visible  ${inventory opportunities lable}
          element should be visible  ${fullfillment opportunities}
          ${SS bar chart title text}  get text  ${safety stock bar chart title text}
          log  ${SS bar chart title text}
          should be equal  ${SS bar chart title text}  view details >
          ${inventory oppor.lable text}  get text  ${inventory opportunities lable}
          log  ${inventory oppor.lable text}
          should be equal  ${inventory oppor.lable text}  Decrease Safety Stock
          ${fullfillment oppo. label text}  get text  ${fullfillment opportunities}
          log  ${fullfillment oppo. label text}
          should be equal  ${fullfillment oppo. label text}  Increase Safety Stock

User should see "Reorder Point" bar chart with view details option
          run keyword  scroll page to location  0  4000
          element should be visible  ${Reorder point bar chart}
          element should be visible  ${view_details for rop}
          element should be visible  ${inventory opportunities lable}
          element should be visible  ${fullfillment opportunities}
          ${ROP bar chart title text}  get text  ${ROP bar chart title text}
          log  ${ROP bar chart title text}
          should be equal  ${ROP bar chart title text}  view details >
          ${inventory oppor.lable text}  get text  ${inventory opportunities lable}
          log  ${inventory oppor.lable text}
          should be equal  ${inventory oppor.lable text}  Decrease Safety Stock
          ${fullfillment oppo. label text}  get text  ${fullfillment opportunities}
          log  ${fullfillment oppo. label text}
          should be equal  ${fullfillment oppo. label text}  Increase Safety Stock

User should see "Minimum Order Quantity" bar chart with view details option
          element should be visible  ${Minium Order Qunatity bar chart}
          element should be visible  ${view_details for MOQ}
          element should be visible  ${inventory opportunities lable}
          element should be visible  ${fullfillment opportunities}
          ${MOQ bar chart title text}  get text  ${MOQ bar chart title text}
          log  ${MOQ bar chart title text}
          should be equal  ${MOQ bar chart title text}  view details >
          ${inventory oppor.lable text}  get text  ${inventory opportunities lable}
          log  ${inventory oppor.lable text}
          should be equal  ${inventory oppor.lable text}  Decrease Safety Stock
          ${fullfillment oppo. label text}  get text  ${fullfillment opportunities}
          log  ${fullfillment oppo. label text}
          should be equal  ${fullfillment oppo. label text}  Increase Safety Stock

scroll page to location
          [Arguments]    ${x_location}    ${y_location}
          Execute JavaScript    window.scrollTo(${x_location},${y_location})

User should see "ABC CLASSIFICATION" bar chart with View details option
          run keyword  scroll page to location  0  100000000
          element should be visible  ${ABC Classification bar chart}
          element should be visible  ${View details option for abc classification}
          ${abc bar chart title text}  get text  ${abc bar chart title text}
          log  ${abc bar chart title text}
          should be equal  ${abc bar chart title text}  view details >
          ${current text}  get text  ${current lable}
          log  ${current text}
          should be equal  ${current text}  Current
          ${Recommended label text}  get text  ${Recommended}
          log  ${Recommended label text}
          should be equal  ${Recommended label text}  Recommended

User should see Stock Policy Opportunities lable
          wait until element is visible  ${stock_policy_dashboard module page label}  10s
          ${page title text}  get text  ${stock_policy_dashboard module page label}
          should be equal  ${page title text}  Stock Policy Opportunities

User click on View Details in Safety stock bar chart
          mouse over  //*[@id="totalOpportunities"]/h2
          element should be visible  ${safety_stock bar chart}
          click element  ${view_details for ss}
          sleep  17s

User need to redirect to Safety stock opportunities page and User should see "Safety Stock Opportunities " Title
          element should be visible  ${safety stock oppo.title}
          ${module title text}  get text  ${safety stock oppo.title}
          log  ${module title text}
          should be equal  ${module title text}  Safety Stock Opportunities

User should see "Plant Business" "Sub business" "Plant" "Plant Region" " Material Sku" filters on default page
          element should be visible  business
          element should be visible  sub_business
          element should be visible  plant
          element should be visible  region
          element should be visible  sku
          sleep  3s

click back button to navigate opportunies page
           wait until element is visible  backButton  10s
           click element  backButton
           sleep  5s

User should see "opprtunities" and "Rejected" options and Edit filters button and clear filter button
          sleep  2s
          element should be visible  ${ss opprtunities}
          element should be visible  ${rejected}
          element should be visible  addFilterBtn
          element should be visible  clearFilterBtn

User should see "opprtunities" and "Rejected" options and Edit filters button and clear filter button FOR moq OPPO.
          sleep  4s
          element should be visible  ${moq oppor.}
          element should be visible  ${moq_rejected}
          element should be visible  addFilterBtn
          element should be visible  clearFilterBtn

User should see "Rejected" options and Edit filters button and clear filter button
          element should be visible  addFilterBtn
          element should be visible  clearFilterBtn

User should see columns "${col1}" "${col2}" "${col3}" "${col4}" "${col5}" "${col6}" columns FOR for rop
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[1]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Plant']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[2]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material SKU']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[3]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material Desc']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[4]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Current Qty']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[5]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Recommended Qty']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[6]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Opportunity $']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[7]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Decision']

User should see columns "${col1}" "${col2}" "${col3}" "${col4}" "${col5}" "${col6}" columns FOR ss oppor.
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[1]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Plant']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[2]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material SKU']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[3]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material Desc']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[4]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Current Qty']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[5]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Recommended Qty']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[6]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Opportunity $']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[7]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Decision']

User should see columns "${col1}" "${col2}" "${col3}" "${col4}" "${col5}" "${col6}" "${col7}" "${col8}" columns FOR for moq
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[1]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Plant']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[2]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material SKU']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[3]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material Desc']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[4]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Current Qty']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[5]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Recommended Qty']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[6]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Opportunity $']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[7]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Current Lot Days']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[8]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Suggested Lot Days']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[9]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Decision']

User should see columns "PLANT" "MATERIAL SKU" "Material Desc" "CURRENT CLASSIFICATION" "RECOMMENDED CLASSIFICATION" "ANNUAL SPEND" "DECISION" columns FOR ABc
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[1]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Plant']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[2]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material SKU']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[3]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Material Desc']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[4]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Current Classification']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[5]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Recommended Classification']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[6]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Annual Spend']
          element should be visible  xpath=//mo-safety-stock-opp/div/div[2]/div[2]/div/mo-opp-rej-grid/div/mo-grid/div[2]/vaadin-grid/vaadin-grid-table/table/thead/tr/th[7]/vaadin-grid-cell-content/vaadin-grid-sorter/div[1]/div/span[text()='Decision']

click back button to navigate to SS opp. details page
          #wait until element is visible  ${back button from sku to details_ss.opp}  20s
          click element  ${back button from sku to details_ss.opp}
          sleep  16s

click back button to navigate to ROP opp. details page
          #wait until element is visible  ${back button from sku to details_ROP.opp}  20s
          click element  ${back button from sku to details_ROP.opp}
          sleep  16s

click back button to navigate to MOQ opp. details page
          #wait until element is visible  ${back button from sku to details_MOQ.opp}  20s
          click element  ${back button from sku to details_MOQ.opp}
          sleep  6s

click Back button to navigate SS Dashboard from SS oppo.
          #wait until element is visible  ${back button SS Dashboard from SS oppo.}  20s
          click element  ${back button SS Dashboard from SS oppo.}
          sleep  6s

click Back button to navigate SS Dashboard from ROP oppo.
          wait until element is visible  ${back button SS Dashboard from ROP oppo.}  20s
          click element  ${back button SS Dashboard from ROP oppo.}
          sleep  6s

click Back button to navigate SS Dashboard from MOQ oppo.
          wait until element is visible  ${back button SS Dashboard from MOQ oppo.}  20s
          click element  ${back button SS Dashboard from MOQ oppo.}
          sleep  6s

click Back button to navigate SS Dashboard from ABC Classification oppo.
          wait until element is visible  ${back button SS Dashboard from ABC oppo.}  20s
          click element  ${back button SS Dashboard from ABC oppo.}
          sleep  6s

User click on View Details in REORDER POINT bar chart
          wait until element is visible  ${Reorder point bar chart}  20s
          element should be visible  ${Reorder point bar chart}
          click element  ${view_details for rop}
          sleep  6s

User need to redirect to REORDER POINT opportunities page and User should see "Reorder Point Opportunities " Title
          element should be visible  ${ROP oppo.title}
          ${module title text}  get text  ${ROP oppo.title}
          log  ${module title text}
          should be equal  ${module title text}  Reorder Point Opportunities

User click on View Details in MINIMUM ORDER QUANTITY bar chart
          wait until element is visible  ${Minium Order Qunatity bar chart}  20s
          element should be visible  ${Minium Order Qunatity bar chart}
          click element  ${view_details for MOQ}
          sleep  20s
User click on View Details in ABC Classification bar chart
          wait until element is visible  ${ABC Classification bar chart}  20s
          element should be visible  ${ABC Classification bar chart}
          click element  ${view_details for ABC}
          sleep  20s

User need to redirect to MINIMUM ORDER QUANTITY opportunities page and User should see "Minimum Order Quantity Opportunities " Title
          element should be visible  ${MOQ oppo.title}
          ${module title text}  get text  ${MOQ oppo.title}
          log  ${module title text}
          should be equal  ${module title text}  Minimum Order Quantity Opportunities
          sleep  5s

User need to redirect to ABC Classification page and User should see "ABC Classification Opportunities " Title
          element should be visible  ${ABC oppo.title}
          ${module title text}  get text  ${ABC oppo.title}
          log  ${module title text}
          should be equal  ${module title text}  ABC Classification Opportunities
          sleep  5s

User click on one of the row in material sku column
          ${sku text from sku col.}  get text  ${sku col. row1}
          log  ${sku text from sku col.}
          set global variable  ${sku text from sku col.}
          click element  ${sku col. row1}
          sleep  13s

User click on one of the row in material sku column for rop
          sleep  10s
          ${sku text from sku col..}  get text  ${SKU COL.row1 for rop}
          log  ${sku text from sku col..}
          set global variable  ${sku text from sku col..}
          click element  ${SKU COL.row1 for rop}
          sleep  3s

User click on one of the row in material sku column for MOQ
          ${sku text from sku col...}  get text  ${sku col.row1 for MOQ}
          log  ${sku text from sku col...}
          set global variable  ${sku text from sku col...}
          click element  ${sku col.row1 for MOQ}
          sleep  3s

User should see filter got selected color
          element should be visible  ${filter got selected icon}

User should see same material sku number that user selected
          element should contain  //mo-safety-stock-opp/div/div/div[2]/mo-ms-detail/div/div/div  Material SKU ${sku text from sku col.}

User should see same material sku number that user selected for rop
         element should contain  //mo-safety-stock-opp/div/div/div[2]/mo-ms-detail/div/div/div  Material SKU ${sku text from sku col..}

User should see same material sku number that user selected for MOQ
         element should contain  //mo-safety-stock-opp/div/div/div[2]/mo-ms-detail/div/div/div  Material SKU ${sku text from sku col...}

fields "MOS CLASSIFICATION","UNIT PRICE (USD)","REORDER POINT","MINIMUM ORDER QUANTITY","ABC CLASSIFICATION","SAFETY STOCK","DESCRIPTION"
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[1]/div[text()='SPEND - FREQUENCY']
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[2]/div[text()='MOS CLASSIFICATION']
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[3]/div[text()='UNIT PRICE (USD)']
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[4]/div[text()='REORDER POINT']
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[5]/div[text()='MINIMUM ORDER QUANTITY']
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[6]/div[text()='ABC CLASSIFICATION']
          element should be visible  //mo-safety-stock-opp/div/div[1]/div[2]/mo-ms-detail/div/div[1]/div[2]/div[7]/div[text()='SAFETY STOCK']

fileds Plant, Last 12 Month consumption,On Hand Stock qty,supplier lead time,Last movement date,Mrp type,Mrp controller name,Dba,Rounding Value,Last 12 month frequency,Categorization,Individual collective
          element should be visible  ${Plant}
          element should be visible  ${ESTIMATED ANNUAL USAGE}
          element should be visible  ${ON HAND STOCK QTY}
          element should be visible  ${SUPPLIER LEAD TIME}
          element should be visible  ${LAST MOVEMENT DATE}
          element should be visible  ${MRP TYPE}
          element should be visible  ${MRP CONTROLLER NAME}
          element should be visible  ${buyer_name}
          element should be visible  ${ROUNDING VALUE}
          element should be visible  ${LAST 12 MONTH FREQUENCY}
          element should be visible  ${SPend_frequency}
          scroll page to location  0  100000
          element should be visible  ${INDIVIDUAL COLLECTIVE}
          element should be visible  ${FIXED VENDOR MOQ}
          element should be visible  ${fixed vendor}

SKU CONSUMPTION heading with Historic Consumption and Future Demand and Time series chart should be visible
          element should be visible  ${SKU CONSUMPTION}
          element should be visible  ${Historic Consumption}
          element should be visible  ${Future Demand}
          element should be visible  ${time series chart}

Select business "${Business}" from business filter and click apply button
          wait until element is visible  business  20s
          click element  business
          SLEEP  2s
          click element  product-${Business}
          wait until element is visible  ${business_Apply_Button}  10s
          click element  ${business_Apply_Button}
          sleep  6s

Select sub_business "${sub_business}" from sub_business filter and click apply button
          wait until element is visible  sub_business  20s
          click element  sub_business
          sleep  2s
          click element  product-${sub_business}
          wait until element is visible  ${sub_business_apply_button}  10s
          click element  ${sub_business_apply_button}
          sleep  3s

Select region "${region}" from region filter and click apply button
          wait until element is visible  region  20s
          click element  region
          sleep  2s
          click element  product-${region}
          wait until element is visible  ${region_apply_button}  10s
          click element  ${region_apply_button}
          sleep  6s

Select any plant from plant filter and click apply button
          wait until element is visible  plant  20s
          click element  plant
          sleep  2s
          click element  ${first_plant_from_plant_filter}
          wait until element is visible  ${plant_apply_button}  10s
          click element  ${plant_apply_button}
          sleep  3s

User select Buyer/Purchasing group filter and click continue button
          wait until element is visible  addFilterBtn  10s
          click element  addFilterBtn
          wait until element is visible  ${buyer/purchasing_group filter from editfilters}  10s
          click element  ${buyer/purchasing_group filter from editfilters}
          click element  continue
          sleep  3s

Select any buyer from buyer filter and click apply button
          wait until element is visible  pgroup  20s
          click element  pgroup
          sleep  6s
          click element  ${first_plant_from_buyer_filter}
          click element  ${buyer_apply_button}
          sleep  6s

User select Planner/Mrp Controller filter and click continue button
          wait until element is visible  addFilterBtn  10s
          click element  addFilterBtn
          click element  ${planner/mrp controller filter from editfilters}
          click element  continue

Select any planner from planner filter and click apply button
          wait until element is visible  mrpc  20s
          click element  mrpc
          sleep  6s
          click element  ${first_plant_from_mrpc_filter}
          click element  ${planner_apply_button}
          sleep  6s

User shoud see weekly dropdown enabled for ss barchart, rop barchart, moq barchart
          element should be visible  //mo-stock-policy-dashboard/section[2]/h2/select
          run keyword  scroll page to location  0  1400
          element should be visible  //mo-stock-policy-dashboard/section[3]/h2/select
          element should be visible  //mo-stock-policy-dashboard/section[4]/h2/select

select business "Renewables" from plant business filter and hit apply button
          wait until element is visible  business  10s
          click element  business
          click element  product-Renewables
          wait until element is visible  ${business_Apply_Button}  10s
          click element  ${business_Apply_Button}
          sleep  3s

select data which contains zero record and hit apply button
          click element  sub_business
          click element  product-Gas Power Systems
          wait until element is visible  ${sub_business_apply_button}  10s
          click element  ${sub_business_apply_button}
          sleep  2s

user should see grayed out weekly dropdown and not clickable
          element should be disabled  //mo-stock-policy-dashboard/section[2]/h2/select
          run keyword  scroll page to location  0  1400
          element should be disabled  //mo-stock-policy-dashboard/section[3]/h2/select
          element should be disabled  //mo-stock-policy-dashboard/section[4]/h2/select