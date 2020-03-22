*** Settings ***
Library  Selenium2Library
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Library   ../../Utilities/utility.py
Resource  ../../StepDefinition/DataInconsistencies/All_modules_excel_grid_filter_inconsistencies_step.robot
Resource  ../../StepDefinition/PurchaseOrders/final_excep_msg_calculations.robot
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot

*** Test Cases ***
#####The following scripts will check the record count from filter and grid count using api and excel total no. of rows############
Verify inconsistencies between grid,filter and excel for business "Power" across all modules for purchase orders module
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "Power" for "PurchaseOrders" and "PurchaseOrder"

Verify inconsistencies between grid,filter and excel for business "Renewables" across all modules for purchase orders module
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "Renewables" for "PurchaseOrders" and "PurchaseOrder"

Verify inconsistencies between grid,filter and excel for business "Transportation" across all modules for purchase orders module
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Transportation" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "Transportation" for "PurchaseOrders" and "PurchaseOrder"

Verify inconsistencies between grid,filter and excel for business "MMF" across all modules for purchase orders module
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "MMF" for "PurchaseOrders" and "PurchaseOrder"

Verify inconsistencies between grid,filter and excel for business "Healthcare" across all modules for purchase orders module
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Healthcare" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "Healthcare" for "PurchaseOrders" and "PurchaseOrder"

Verify inconsistencies between grid,filter and excel for business "Current" across all modules for purchase orders module
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       Then Verify filter count and grid no. of rows from api and excel no. of rows for selected business for "Current" for "PurchaseOrders" and "PurchaseOrder"


###=============================================================================================================================================================================
### The following scripts to see value inconsistency between heatmap and excel and grid ######
Verify inconsistencies between grid,Heatmap and excel for business "Power" across all modules for purchase orders module for exception message(value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "Power"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "Power"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "Power"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "Power"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "Power"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between Heatmapvalues,grid column sum(using db) and excel

Verify inconsistencies between grid,Heatmap and excel for business "Renewables" across all modules for purchase orders module for exception message(value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "Renewables"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "Renewables"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "Renewables"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "Renewables"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "Renewables"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
      And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between Heatmapvalues,grid column sum(using db) and excel

Verify inconsistencies between grid,Heatmap and excel for business "Transportation" across all modules for purchase orders module for exception message(value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Transportation" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "Transportation"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "Transportation" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "Transportation"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "Transportation" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "Transportation"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "Transportation" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "Transportation"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "Transportation" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "Transportation"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "Transportation" and view "public.purchase_ords_v"
       And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between Heatmapvalues,grid column sum(using db) and excel
#
Verify inconsistencies between grid,Heatmap and excel for business "MMF" across all modules for purchase orders module for exception message(value)
      Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "MMF"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "MMF"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "MMF"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "MMF"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "MMF"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
#       And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between Heatmapvalues,grid column sum(using db) and excel

Verify inconsistencies between grid,Heatmap and excel for business "Healthcare" across all modules for purchase orders module for exception message(value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Healthcare" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "Healthcare"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "Healthcare" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "Healthcare"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "Healthcare" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "Healthcare"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "Healthcare" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "Healthcare"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "Healthcare" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "Healthcare"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "Healthcare" and view "public.purchase_ords_v"
       And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between Heatmapvalues,grid column sum(using db) and excel

Verify inconsistencies between grid,Heatmap and excel for business "Current" across all modules for purchase orders module for exception message(Value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "Current"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "Current"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "Current"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "Current"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "Current"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between HeatmapValues,grid column sum(using db) and excel

Verify inconsistencies between grid,Heatmap and excel for business "O&G" across all modules for purchase orders module for exception message(Value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "O&G" from business filter
       And Select Exception message from age classification dropdown and click value tab
       And Click edit filters and select final exception message filter
       And Click net open value usd from show hide
       Then Get Exception message value for cancellation for selected business for "O&G" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from excel for business "O&G"
       And Get sum of net open value (usd) where exception meassage is "Cancel process" from Database query(as grid is getting data from databse) for business "O&G" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule in for selected business for "O&G" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from excel for business "O&G"
       And Get sum of net open value (usd) where exception meassage is "Reschedule in" from Database query(as grid is getting data from databse) for business "O&G" and view "public.purchase_ords_v"
       Then Get Exception message value for Reschedule Out for selected business for "O&G" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get sum of net open value (usd) where exception meassage is "Reschedule out" from excel for business "O&G"
       And get sum of net open value (usd) where exception meassage is "Reschedule out" from Database query(as grid is getting data from databse) for business "O&G" and view "public.purchase_ords_v"
       Then Get Exception message value for Overdue for selected business for "O&G" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "Overdue" from excel for business "O&G"
       And get sum of net open value (usd) where exception meassage is "Overdue" from Database query(as grid is getting data from databse) for business "O&G" and view "public.purchase_ords_v"
       Then Get Exception message value for No Exception for selected business for "O&G" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get sum of net open value (usd) where exception meassage is "No Exception" from excel for business "O&G"
       And get sum of net open value (usd) where exception meassage is "No Exception" from Database query(as grid is getting data from databse) for business "O&G" and view "public.purchase_ords_v"
       And compare values of exception message"cancel process""reschedule in""reschedule out""overdue""no exception" in between HeatmapValues,grid column sum(using db) and excel
#
######=====================================================================================================================================================================================================#####################
Verify inconsistencies between grid,Heatmap and excel for business "Power" across all modules for purchase orders module for exception message(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And click element  ${Button Age Classification}
       And wait until element is visible  ${Exception Message}  10s
       And click element  ${Exception Message}
       And Click edit filters and select final exception message filter
       Then Get Exception message count for cancellation for selected business for "Power" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Cancel process" from excel for business "Power" for "PurchaseOrders"
       And Get count for exception meassage for api "Cancel""process" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Cancel process" from Database query for business "Power" and view "public.purchase_ords_v"
       And Get count for exception meassage "Cancel process" from final exception meassage filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for cancel process
       Then Get Exception message count for Reschedule in for selected business for "Power" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule in" from excel for business "Power" for "PurchaseOrders"
       And Get count for exception meassage for api "Reschedule""in" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule in" from Database query for business "Power" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule in" from final exception meassage filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule in
       Then Get Exception message count for Reschedule Out for selected business for "Power" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule Out" from excel for business "Power" for "PurchaseOrders"
       And Get count for exception meassage for api "Reschedule""out" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule out" from Database query for business "Power" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule Out" from final exception meassage filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule out
       Then Get Exception message count for Overdue for selected business for "Power" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Overdue" from final exception meassage filter for business "Power"
       And Get count for exception meassage "Overdue" from excel for business "Power" for "PurchaseOrders"
       And Get count for exception meassage for api "Overdue" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder" for "PurchaseOrders"
       And Get count for exception meassage "Overdue" from Database query for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for overdue
       Then Get Exception message count for No Exception for selected business for "Power" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "No Exception" from excel for business "Power" for "PurchaseOrders"
       And Get count for exception meassage for api "No""Exception" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "No Exception" from Database query for business "Power" and view "public.purchase_ords_v"
       And Get count for exception meassage "No Exception" from final exception meassage filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for no exception

Verify inconsistencies between grid,Heatmap and excel for business "Renewables" across all modules for purchase orders module for exception message(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And click element  ${Button Age Classification}
       And wait until element is visible  ${Exception Message}  10s
       And click element  ${Exception Message}
       And Click edit filters and select final exception message filter
       Then run keyword and continue on failure  Get Exception message count for cancellation for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And run keyword and continue on failure  Get count for exception meassage "Cancel process" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Cancel""process" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for exception meassage "Cancel process" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for exception meassage "Cancel process" from final exception meassage filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for cancel process
       Then run keyword and continue on failure  Get Exception message count for Reschedule in for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And run keyword and continue on failure  Get count for exception meassage "Reschedule in" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""in" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for exception meassage "Reschedule in" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for exception meassage "Reschedule in" from final exception meassage filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule in
       Then run keyword and continue on failure  Get Exception message count for Reschedule Out for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And run keyword and continue on failure  Get count for exception meassage "Reschedule Out" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""out" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for exception meassage "Reschedule out" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for exception meassage "Reschedule Out" from final exception meassage filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule out
       Then run keyword and continue on failure  Get Exception message count for Overdue for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And run keyword and continue on failure  Get count for exception meassage "Overdue" from final exception meassage filter for business "Renewables"
       And run keyword and continue on failure  Get count for exception meassage "Overdue" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Overdue" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage "Overdue" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for overdue
       Then run keyword and continue on failure  Get Exception message count for No Exception for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And run keyword and continue on failure  Get count for exception meassage "No Exception" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "No""Exception" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for exception meassage "No Exception" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for exception meassage "No Exception" from final exception meassage filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for no exception

Verify inconsistencies between grid,Heatmap and excel for business "MMF" across all modules for purchase orders module for exception message(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And click element  ${Button Age Classification}
       And wait until element is visible  ${Exception Message}  10s
       And click element  ${Exception Message}
       And Click edit filters and select final exception message filter
       Then Get Exception message count for cancellation for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Cancel process" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Cancel""process" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Cancel process" from Database query for business "MMF" and view "public.purchase_ords_v"
       And Get count for exception meassage "Cancel process" from final exception meassage filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for cancel process
       Then Get Exception message count for Reschedule in for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule in" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""in" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule in" from Database query for business "MMF" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule in" from final exception meassage filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule in
       Then Get Exception message count for Reschedule Out for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule Out" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""out" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule out" from Database query for business "MMF" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule Out" from final exception meassage filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule out
       Then Get Exception message count for Overdue for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Overdue" from final exception meassage filter for business "MMF"
       And Get count for exception meassage "Overdue" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Overdue" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder" for "PurchaseOrders"
       And Get count for exception meassage "Overdue" from Database query for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for overdue
       Then Get Exception message count for No Exception for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "No Exception" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "No""Exception" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "No Exception" from Database query for business "MMF" and view "public.purchase_ords_v"
       And Get count for exception meassage "No Exception" from final exception meassage filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for no exception
#
Verify inconsistencies between grid,Heatmap and excel for business "Transportation" across all modules for purchase orders module for exception message(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Transportation" from business filter
       And click element  ${Button Age Classification}
       And wait until element is visible  ${Exception Message}  10s
       And click element  ${Exception Message}
       And Click edit filters and select final exception message filter
       Then Get Exception message count for cancellation for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Cancel process" from excel for business "Transportation" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Cancel""process" from api for business "Transportation" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Cancel process" from Database query for business "Transportation" and view "public.purchase_ords_v"
       And Get count for exception meassage "Cancel process" from final exception meassage filter for business "Transportation"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for cancel process
       Then Get Exception message count for Reschedule in for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule in" from excel for business "Transportation" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""in" from api for business "Transportation" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule in" from Database query for business "Transportation" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule in" from final exception meassage filter for business "Transportation"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule in
       Then Get Exception message count for Reschedule Out for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule Out" from excel for business "Transportation" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""out" from api for business "Transportation" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule out" from Database query for business "Transportation" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule Out" from final exception meassage filter for business "Transportation"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule out
       Then Get Exception message count for Overdue for selected business for "Transportation" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Overdue" from final exception meassage filter for business "Transportation"
       And Get count for exception meassage "Overdue" from excel for business "Transportation" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Overdue" from api for business "Transportation" for "PurchaseOrders" and "PurchaseOrder" for "PurchaseOrders"
       And Get count for exception meassage "Overdue" from Database query for business "Transportation" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for overdue
       Then Get Exception message count for No Exception for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "No Exception" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "No""Exception" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "No Exception" from Database query for business "MMF" and view "public.purchase_ords_v"
       And Get count for exception meassage "No Exception" from final exception meassage filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for no exception
#
Verify inconsistencies between grid,Heatmap and excel for business "Healthcare" across all modules for purchase orders module for exception message(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Healthcare" from business filter
       And click element  ${Button Age Classification}
       And wait until element is visible  ${Exception Message}  10s
       And click element  ${Exception Message}
       And Click edit filters and select final exception message filter
       Then Get Exception message count for cancellation for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Cancel process" from excel for business "Healthcare" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Cancel""process" from api for business "Healthcare" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Cancel process" from Database query for business "Healthcare" and view "public.purchase_ords_v"
       And Get count for exception meassage "Cancel process" from final exception meassage filter for business "Healthcare"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for cancel process
       Then Get Exception message count for Reschedule in for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule in" from excel for business "Healthcare" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""in" from api for business "Healthcare" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule in" from Database query for business "Healthcare" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule in" from final exception meassage filter for business "Healthcare"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule in
       Then Get Exception message count for Reschedule Out for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Reschedule Out" from excel for business "Healthcare" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Reschedule""out" from api for business "Healthcare" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "Reschedule out" from Database query for business "Healthcare" and view "public.purchase_ords_v"
       And Get count for exception meassage "Reschedule Out" from final exception meassage filter for business "Healthcare"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for reschedule out
       Then Get Exception message count for Overdue for selected business for "Healthcare" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "Overdue" from final exception meassage filter for business "Healthcare"
       And Get count for exception meassage "Overdue" from excel for business "Healthcare" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "Overdue" from api for business "Healthcare" for "PurchaseOrders" and "PurchaseOrder" for "PurchaseOrders"
       And Get count for exception meassage "Overdue" from Database query for business "Healthcare" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for overdue
       Then Get Exception message count for No Exception for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Get count for exception meassage "No Exception" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for exception meassage for api "No""Exception" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for exception meassage "No Exception" from Database query for business "MMF" and view "public.purchase_ords_v"
       And Get count for exception meassage "No Exception" from final exception meassage filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for no exception
#
###================================================================================================================================================================================================================================
Verify inconsistencies between grid,Heatmap and excel for business "Power" across all modules for purchase orders module for Age classification(Value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And click element  ${value tab}
       And Click edit filters and select Aging buckets filter
       And Click net open value usd from show hide
       And select "60+" from aging bucket filter
       Then Get Age classification value for 60+ old for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "60+days" from excel for business "Power"
       And Get sum of net open value (usd) where Age classification is "over_sixty_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "60+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then Get Age classification value for 30+ old for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "30+days" from excel for business "Power"
       And Get sum of net open value (usd) where Age classification is "over_thirty_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "30+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then Get Age classification value for <30days old for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "<30days" from excel for business "Power"
       And get sum of net open value (usd) where Age classification is "under_thirty_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "<30days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then Get Age classification value for Future for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "Future" from excel for business "Power"
       And get sum of net open value (usd) where Age classification is "future_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "future" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then Get Age classification value for On Hold for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "On Hold" from excel for business "Power"
       And get sum of net open value (usd) where Age classification is "on_hold_value" from Database query(as grid is getting data from databse) for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "On Hold" in between Heatmapvalues,grid column sum(using db) and excel
       
Verify inconsistencies between grid,Heatmap and excel for business "Renewables" across all modules for purchase orders module for Age classification(Value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And click element  ${value tab}
       And Click edit filters and select Aging buckets filter
       And Click net open value usd from show hide
       And select "60+" from aging bucket filter
       Then Get Age classification value for 60+ old for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "60+days" from excel for business "Renewables"
       And Get sum of net open value (usd) where Age classification is "over_sixty_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "60+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then Get Age classification value for 30+ old for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "30+days" from excel for business "Renewables"
       And Get sum of net open value (usd) where Age classification is "over_thirty_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "30+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then Get Age classification value for <30days old for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "<30days" from excel for business "Renewables"
       And get sum of net open value (usd) where Age classification is "under_thirty_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "<30days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then Get Age classification value for Future for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "Future" from excel for business "Renewables"
       And get sum of net open value (usd) where Age classification is "future_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "future" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then Get Age classification value for On Hold for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "On Hold" from excel for business "Renewables"
       And get sum of net open value (usd) where Age classification is "on_hold_value" from Database query(as grid is getting data from databse) for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "On Hold" in between Heatmapvalues,grid column sum(using db) and excel

Verify inconsistencies between grid,Heatmap and excel for business "MMF" across all modules for purchase orders module for Age classification(Value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And click element  ${value tab}
       And Click edit filters and select Aging buckets filter
       And Click net open value usd from show hide
       And select "60+" from aging bucket filter
       Then Get Age classification value for 60+ old for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "60+days" from excel for business "MMF"
       And Get sum of net open value (usd) where Age classification is "over_sixty_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "60+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then Get Age classification value for 30+ old for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "30+days" from excel for business "MMF"
       And Get sum of net open value (usd) where Age classification is "over_thirty_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "30+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then Get Age classification value for <30days old for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "<30days" from excel for business "MMF"
       And get sum of net open value (usd) where Age classification is "under_thirty_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "<30days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then Get Age classification value for Future for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "Future" from excel for business "MMF"
       And get sum of net open value (usd) where Age classification is "future_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "future" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then Get Age classification value for On Hold for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "On Hold" from excel for business "MMF"
       And get sum of net open value (usd) where Age classification is "on_hold_value" from Database query(as grid is getting data from databse) for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "On Hold" in between Heatmapvalues,grid column sum(using db) and excel
       

Verify inconsistencies between grid,Heatmap and excel for business "Current" across all modules for purchase orders module for Age classification(Value)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And click element  ${value tab}
       And Click edit filters and select Aging buckets filter
       And Click net open value usd from show hide
       And select "60+" from aging bucket filter
       Then Get Age classification value for 60+ old for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "60+days" from excel for business "Current"
       And Get sum of net open value (usd) where Age classification is "over_sixty_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "60+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then Get Age classification value for 30+ old for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "30+days" from excel for business "Current"
       And Get sum of net open value (usd) where Age classification is "over_thirty_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "30+days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then Get Age classification value for <30days old for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And get sum of Net open usd value(usd) column where age classification is "<30days" from excel for business "Current"
       And get sum of net open value (usd) where Age classification is "under_thirty_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "<30days" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then Get Age classification value for Future for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "Future" from excel for business "Current"
       And get sum of net open value (usd) where Age classification is "future_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "future" in between Heatmapvalues,grid column sum(using db) and excel
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Current" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then Get Age classification value for On Hold for selected business for "Current" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  get sum of Net open usd value(usd) column where age classification is "On Hold" from excel for business "Current"
       And get sum of net open value (usd) where Age classification is "on_hold_value" from Database query(as grid is getting data from databse) for business "Current" and view "public.purchase_ords_v"
       And run keyword and continue on failure  compare values of age classification value for "On Hold" in between Heatmapvalues,grid column sum(using db) and excel
       


##################==========================================================================================================================================================================================
Verify inconsistencies between grid,Heatmap and excel for business "Power" across all modules for purchase orders module for Age_Classification(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "60+" from aging bucket filter
       Then run keyword and continue on failure  Get Age classification value for 60+ old for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "60+" from excel for business "Power" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "60" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "over_thirty_count" from Database query for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "60+" from aging bucket filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for 60+ days
       And click element  clearFilterBtn
           When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then run keyword and continue on failure  Get Age classification value for 30+ old for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "30+" from excel for business "Power" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "30" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "over_thirty_count" from Database query for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "30+" from aging bucket filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for 30+ days
       And click element  clearFilterBtn
       when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then run keyword and continue on failure  Get Age classification value for <30days old for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And Get count for exception meassage "<30" from excel for business "Power" for "PurchaseOrders"
       And Get count for Age_Classification for api <30 from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And Get count for Age_Classification "under_thirty_count" from Database query for business "Power" and view "public.purchase_ords_v"
       And Get count for Age_Classification "<30" from aging bucket filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for <30 days
       And click element  clearFilterBtn
       when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then run keyword and continue on failure  Get Age classification value for Future for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "Future" from excel for business "Power" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "Future" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "future_count" from Database query for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "Future" from aging bucket filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for Future days
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then run keyword and continue on failure  Get Age classification value for Future for selected business for "Power" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "On Hold" from excel for business "Power" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "On""Hold" from api for business "Power" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "on_hold_count" from Database query for business "Power" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "On Hold" from aging bucket filter for business "Power"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for On Hold days

Verify inconsistencies between grid,Heatmap and excel for business "Renewables" across all modules for purchase orders module for Age_Classification(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Renewables" from business filter
       And Click edit filters and select Aging buckets filter
       And select "60+" from aging bucket filter
       Then Get Age classification value for 60+ old for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "60+" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "60" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "over_sixty_count" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "60+" from aging bucket filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for 60+ days
       And click element  clearFilterBtn
          when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then Get Age classification value for 30+ old for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "30+" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "30" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "over_thirty_count" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "30+" from aging bucket filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for 30+ days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then Get Age classification value for <30days old for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "<30" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api <30 from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "under_thirty_value" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "<30" from aging bucket filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for <30 days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then Get Age classification value for Future for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "Future" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "Future" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "future_count" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "Future" from aging bucket filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for Future days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then Get Age classification value for Future for selected business for "Renewables" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "On Hold" from excel for business "Renewables" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "On""Hold" from api for business "Renewables" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "on_hold_count" from Database query for business "Renewables" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "On Hold" from aging bucket filter for business "Renewables"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for On Hold days


Verify inconsistencies between grid,Heatmap and excel for business "MMF" across all modules for purchase orders module for Age_Classification(count)
       Given User access "/secure/purchase-orders" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "MMF" from business filter
       And Click edit filters and select Aging buckets filter
       And select "60+" from aging bucket filter
       Then Get Age classification value for 60+ old for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "60+" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "60" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "over_sixty_count" from Database query for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "60+" from aging bucket filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for 60+ days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "30+" from aging bucket filter
       Then Get Age classification value for 30+ old for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "30+" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "30" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "over_thirty_count" from Database query for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "30+" from aging bucket filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for 30+ days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "<30" from aging bucket filter
       Then Get Age classification value for <30days old for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "<30" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api <30 from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "under_thirty_value" from Database query for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "<30" from aging bucket filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for <30 days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "Future" from aging bucket filter
       Then Get Age classification value for Future for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "Future" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "Future" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "future_count" from Database query for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "Future" from aging bucket filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for Future days
       And click element  clearFilterBtn
           when click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And Click edit filters and select Aging buckets filter
       And select "On Hold" from aging bucket filter
       Then run keyword and continue on failure  Get Age classification value for Future for selected business for "MMF" for "PurchaseOrders" from heatmap
       And Remove old excel file  PurchaseOrders.xlsx
       And run keyword and continue on failure  Get count for exception meassage "On Hold" from excel for business "MMF" for "PurchaseOrders"
       And run keyword and continue on failure  Get count for Age_Classification for api "On""Hold" from api for business "MMF" for "PurchaseOrders" and "PurchaseOrder"
       And run keyword and continue on failure  Get count for Age_Classification "on_hold_count" from Database query for business "MMF" and view "public.purchase_ords_v"
       And run keyword and continue on failure  Get count for Age_Classification "On Hold" from aging bucket filter for business "MMF"
       And run keyword and continue on failure  Grid and excel and filter and database count should match and equal for On Hold days




                