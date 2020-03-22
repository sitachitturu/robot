*** Settings ***
Library  Selenium2Library
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Library   ../../Utilities/utility.py
Resource  ../../StepDefinition/DataInconsistencies/purchase_req_inconsistencies_step.robot

*** Test Cases ***
#####The following scripts will check the record count from filter and grid count using api and excel total no. of rows############
Verify inconsistencies between grid,filter and excel for business "Power" across all modules for PurchaseReqs module
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       And sleep  4s
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And sleep  4s
       Then Verify filter count and grid no. of rows from api and excel no. of rows and DB record count, heatmap count for "Power" for "PurchaseReqs" and "PurchaseReqs"
       And Filter ,excel, api,database record count should be equal

Verify inconsistencies between grid,filter and excel for business "Renewables" across all modules for PurchaseReqs module
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows and DB record count, heatmap count for "Renewables" for "PurchaseReqs" and "PurchaseReqs"
       And Filter ,excel, api,database record count should be equal

Verify inconsistencies between grid,filter and excel for business "Transportation" across all modules for PurchaseReqs module
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Transportation" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows and DB record count, heatmap count for "Transportation" for "PurchaseReqs" and "PurchaseReqs"
       And Filter ,excel, api,database record count should be equal

Verify inconsistencies between grid,filter and excel for business "MMF" across all modules for PurchaseReqs module
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows and DB record count, heatmap count for "MMF" for "PurchaseReqs" and "PurchaseReqs"
       And Filter ,excel, api,database record count should be equal

Verify inconsistencies between grid,filter and excel for business "Current" across all modules for PurchaseReqs module
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows and DB record count, heatmap count for "Current" for "PurchaseReqs" and "PurchaseReqs"
       And Filter ,excel, api,database record count should be equal

##############====================================================================================================================================================================================================================
Verify inconsistencies between grid,Heatmap and excel and db for business "Power" across all modules for purchase req. module for value
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "+5" from aging bucket filter
       And click element  ${value tab}
       And Get "5+" total value from "+5 days overdue" coulumn value from heatmap for business "Power"
       And get the total column total value for "+5 days overdue" column from hatmap for business "Power"
       And run keyword and continue on failure  Total value of "5+" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "5+ days overdue" from excel for business "Power"
       And run keyword and continue on failure  Total of "5+" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "significant_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "5+" freom excel should be equal to "sum" value from db

       And select "+5" from aging bucket filter
       And select "1-2" from aging bucket filter
       And Get "1-2" total value from "1-2 days overdue" coulumn value from heatmap for business "Power"
       And get the total column total value for "1-2 days overdue" column from hatmap for business "Power"
       And run keyword and continue on failure  Total value of "1-2 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "1-2 days overdue" from excel for business "Power"
       And run keyword and continue on failure  Total of "1-2 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "acceptable_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "1-2 days overdue" freom excel should be equal to "sum" value from db

       And select "1-2" from aging bucket filter
       And select "3-4" from aging bucket filter
       And Get "3-4" total value from "3-4 days overdue" coulumn value from heatmap for business "Power"
       And get the total column total value for "3-4 days overdue" column from hatmap for business "Power"
       And run keyword and continue on failure  Total value of "3-4 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "3-4 days overdue" from excel for business "Power"
       And run keyword and continue on failure  Total of "3-4 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "moderate_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "3-4 days overdue" freom excel should be equal to "sum" value from db

       And select "3-4" from aging bucket filter
       And select "<0" from aging bucket filter
       And Get "<0" total value from "<0 days overdue" coulumn value from heatmap for business "Power"
       And get the total column total value for "<0 days overdue" column from hatmap for business "Power"
       And run keyword and continue on failure  Total value of "<0 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "<0 days overdue" from excel for business "Power"
       And run keyword and continue on failure  Total of "<0 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "future_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "<0 days overdue" freom excel should be equal to "sum" value from db

Verify inconsistencies between grid,Heatmap and excel and db for business "Renewables" across all modules for purchase req. module for value
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Click edit filters and select Aging buckets filter
       And select "+5" from aging bucket filter
       And click element  ${value tab}
       And Get "5+" total value from "+5 days overdue" coulumn value from heatmap for business "Renewables"
       And get the total column total value for "+5 days overdue" column from hatmap for business "Renewables"
       And run keyword and continue on failure  Total value of "5+" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "5+ days overdue" from excel for business "Renewables"
       And run keyword and continue on failure  Total of "5+" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "significant_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "5+" freom excel should be equal to "sum" value from db

       And select "+5" from aging bucket filter
       And select "1-2" from aging bucket filter
       And Get "1-2" total value from "1-2 days overdue" coulumn value from heatmap for business "Renewables"
       And get the total column total value for "1-2 days overdue" column from hatmap for business "Renewables"
       And run keyword and continue on failure  Total value of "1-2 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "1-2 days overdue" from excel for business "Renewables"
       And run keyword and continue on failure  Total of "1-2 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "acceptable_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "1-2 days overdue" freom excel should be equal to "sum" value from db

       And select "1-2" from aging bucket filter
       And select "3-4" from aging bucket filter
       And Get "3-4" total value from "3-4 days overdue" coulumn value from heatmap for business "Renewables"
       And get the total column total value for "3-4 days overdue" column from hatmap for business "Renewables"
       And run keyword and continue on failure  Total value of "3-4 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "3-4 days overdue" from excel for business "Renewables"
       And run keyword and continue on failure  Total of "3-4 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "moderate_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "3-4 days overdue" freom excel should be equal to "sum" value from db

       And select "3-4" from aging bucket filter
       And select "<0" from aging bucket filter
       And Get "<0" total value from "<0 days overdue" coulumn value from heatmap for business "Renewables"
       And get the total column total value for "<0 days overdue" column from hatmap for business "Renewables"
       And run keyword and continue on failure  Total value of "<0 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "<0 days overdue" from excel for business "Renewables"
       And run keyword and continue on failure  Total of "<0 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "future_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "<0 days overdue" freom excel should be equal to "sum" value from db

Verify inconsistencies between grid,Heatmap and excel and db for business "MMF" across all modules for purchase req. module for value
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Click edit filters and select Aging buckets filter
       And select "+5" from aging bucket filter
       And click element  ${value tab}
       And Get "5+" total value from "+5 days overdue" coulumn value from heatmap for business "MMF"
       And get the total column total value for "+5 days overdue" column from hatmap for business "MMF"
       And run keyword and continue on failure  Total value of "5+" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "5+ days overdue" from excel for business "MMF"
       And run keyword and continue on failure  Total of "5+" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "significant_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "5+" freom excel should be equal to "sum" value from db

       And select "+5" from aging bucket filter
       And select "1-2" from aging bucket filter
       And Get "1-2" total value from "1-2 days overdue" coulumn value from heatmap for business "MMF"
       And get the total column total value for "1-2 days overdue" column from hatmap for business "MMF"
       And run keyword and continue on failure  Total value of "1-2 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "1-2 days overdue" from excel for business "MMF"
       And run keyword and continue on failure  Total of "1-2 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "acceptable_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "1-2 days overdue" freom excel should be equal to "sum" value from db

       And select "1-2" from aging bucket filter
       And select "3-4" from aging bucket filter
       And Get "3-4" total value from "3-4 days overdue" coulumn value from heatmap for business "MMF"
       And get the total column total value for "3-4 days overdue" column from hatmap for business "MMF"
       And run keyword and continue on failure  Total value of "3-4 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "3-4 days overdue" from excel for business "MMF"
       And run keyword and continue on failure  Total of "3-4 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "moderate_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "3-4 days overdue" freom excel should be equal to "sum" value from db

       And select "3-4" from aging bucket filter
       And select "<0" from aging bucket filter
       And Get "<0" total value from "<0 days overdue" coulumn value from heatmap for business "MMF"
       And get the total column total value for "<0 days overdue" column from hatmap for business "MMF"
       And run keyword and continue on failure  Total value of "<0 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "<0 days overdue" from excel for business "MMF"
       And run keyword and continue on failure  Total of "<0 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "future_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "<0 days overdue" freom excel should be equal to "sum" value from db

Verify inconsistencies between grid,Heatmap and excel and db for business "Current" across all modules for purchase req. module for value
       Given User access "/secure/purchasing" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And Click edit filters and select Aging buckets filter
       And select "+5" from aging bucket filter
       And click element  ${value tab}
       And Get "5+" total value from "+5 days overdue" coulumn value from heatmap for business "Current"
       And get the total column total value for "+5 days overdue" column from hatmap for business "Current"
       And run keyword and continue on failure  Total value of "5+" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "5+ days overdue" from excel for business "Current"
       And run keyword and continue on failure  Total of "5+" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "significant_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "5+" freom excel should be equal to "sum" value from db

       And select "+5" from aging bucket filter
       And select "1-2" from aging bucket filter
       And Get "1-2" total value from "1-2 days overdue" coulumn value from heatmap for business "Current"
       And get the total column total value for "1-2 days overdue" column from hatmap for business "Current"
       And run keyword and continue on failure  Total value of "1-2 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "1-2 days overdue" from excel for business "Current"
       And run keyword and continue on failure  Total of "1-2 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "acceptable_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "1-2 days overdue" freom excel should be equal to "sum" value from db

       And select "1-2" from aging bucket filter
       And select "3-4" from aging bucket filter
       And Get "3-4" total value from "3-4 days overdue" coulumn value from heatmap for business "Current"
       And get the total column total value for "3-4 days overdue" column from hatmap for business "Current"
       And run keyword and continue on failure  Total value of "3-4 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "3-4 days overdue" from excel for business "Current"
       And run keyword and continue on failure  Total of "3-4 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "moderate_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "3-4 days overdue" freom excel should be equal to "sum" value from db

       And select "3-4" from aging bucket filter
       And select "<0" from aging bucket filter
       And Get "<0" total value from "<0 days overdue" coulumn value from heatmap for business "Current"
       And get the total column total value for "<0 days overdue" column from hatmap for business "Current"
       And run keyword and continue on failure  Total value of "<0 days overdue" should be equal to "total col" value
       And Remove old excel file  PurchaseReqs.xlsx
       And get sum of value(usd) column where aging is "<0 days overdue" from excel for business "Current"
       And run keyword and continue on failure  Total of "<0 days overdue" should be equal to total sum of value(usd) from excel
       And Get sum of value (usd) where Aging is "future_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_reqs_v"
       And run keyword and continue on failure  Total value of "<0 days overdue" freom excel should be equal to "sum" value from db