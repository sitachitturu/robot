*** Settings ***
Library  Selenium2Library
Resource  ../../StepDefinition/PurchaseOrders/excel_purchase_orders_step.robot
Resource  ../../StepDefinition/PurchaseOrders/final_excep_msg_calculations.robot
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../StepDefinition/PurchaseOrders/comment_purchase_order_step.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Resource  ../../StepDefinition/Common/login_steps.robot
Library   ../../Utilities/utility.py

#Suite Setup      Run Keywords  User open welcome page  User provide cridentials  User click Submit button  User should see Material Optimization
#Suite Teardown   Close browser

*** Test Cases ***
Verify cancellation values in Heatmap and excel
    Given User access "/secure/purchase-orders" module
    And User click on age classification dropdown
    And User click exception message from age classification dropdown
    And User click on value tab
    And User select cancel process from final exception message
    And user click plant filter
    And User enter plant code in search filter  0010 - Charlottesville
    And User click a value in plant filter  0010 - Charlottesville
    ${sum_from_heatmap}=  Gets cancellation total from heatmap
    And Remove old excel file   PurchaseOrders.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And Click net open value usd from show hide
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  20s
    ${sum_from_excel}=  Gets the cancellation total from excel
    Then Validate cancellation values  ${sum_from_heatmap}  ${sum_from_excel}

Verify reschedule-in in heatmap and excel
    Given User access "/secure/purchase-orders" module
    And User click on age classification dropdown
    And User click exception message from age classification dropdown
    And User click on value tab
    And User selects reschedule-in from final exception message
    And user click plant filter
    And User enter plant code in search filter  0010 - Charlottesville
    And User click a value in plant filter  0010 - Charlottesville
    ${sum_from_heatmap}=  Gets reschedule-in total from heatmap
    And Remove old excel file   PurchaseOrders.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And Click net open value usd from show hide
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  20s
    ${sum_from_excel}=  Gets the reschedule-in total from excel
    Then Validate reschedule-in total values  ${sum_from_heatmap}  ${sum_from_excel}

Verify reschedule-out in heatmap and excel
    Given User access "/secure/purchase-orders" module
    And User click on age classification dropdown
    And User click exception message from age classification dropdown
    And User click on value tab
    And User selects reschedule-out from final exception message
    And user click plant filter
    And User enter plant code in search filter  0010 - Charlottesville
    And User click a value in plant filter  0010 - Charlottesville
    ${sum_from_heatmap}=  Gets reschedule-out total from heatmap
    And Remove old excel file   PurchaseOrders.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And Click net open value usd from show hide
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  20s
    ${sum_from_excel}=  Gets reschedule-out total from excel
    Then Validate reschedule-out total values  ${sum_from_heatmap}  ${sum_from_excel}

Verify no exception in heatmap and excel
    Given User access "/secure/purchase-orders" module
    And User click on age classification dropdown
    And User click exception message from age classification dropdown
    And User click on value tab
    And User selects no exception from final exception message
    And user click plant filter
    And User enter plant code in search filter  0010 - Charlottesville
    And User click a value in plant filter  0010 - Charlottesville
    ${sum_from_heatmap}=  Gets no exception total from heatmap
    And Remove old excel file   PurchaseOrders.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And Click net open value usd from show hide
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  20s
    ${sum_from_excel}=  Gets no exception total from excel
    Then Validate no exception total values  ${sum_from_heatmap}  ${sum_from_excel}

Verify overdue in heatmap and excel
    Given User access "/secure/purchase-orders" module
    And User click on age classification dropdown
    And User click exception message from age classification dropdown
    And User click on value tab
    And User selects no exception from final exception message
    And user click plant filter
    And User enter plant code in search filter  0010 - Charlottesville
    And User click a value in plant filter  0010 - Charlottesville
    ${sum_from_heatmap}=  Gets overdue total from heatmap 
    And Remove old excel file   PurchaseOrders.xlsx
    And scroll page to location  0  10000
    And sleep  8s
    And Click net open value usd from show hide
    And User click "Export to Excel"  ${export_excel_btn}
    And sleep  20s
    ${sum_from_excel}=  Gets overdue total from excel
    Then Validate overdue total values  ${sum_from_heatmap}  ${sum_from_excel}

