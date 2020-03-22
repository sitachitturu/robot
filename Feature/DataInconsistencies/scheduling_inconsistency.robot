*** Settings ***
Library  Selenium2Library
Resource  ../../Variables/Material_Transfer_variables.robot
Resource  ../../Variables/VariablesPurchaseRequisition/purchase_req_variables.robot
Resource  ../../Library/excel_library.robot
Resource  ../../Library/generic_library.robot
Library   ../../Utilities/utility.py
Resource  ../../StepDefinition/DataInconsistencies/scheduling_inconsistency_step.robot

*** Test Cases ***
Verify inconsistencies between grid,filter and excel for business "Power" across all modules for scheduling module
       Given User access "/secure/scheduling" module
       And click element  clearFilterBtn
       When click "Edit Filter(s)" and User check check box with "Plant Business" name and click continue
       And select business "Power" from business filter
       And select exception "Cancel process" from final exception message
       And select Action Required from exception requires action filter
       And run keyword and continue on failure  get "Cancel process" exception count for product and projects and sum of product cancel and sum project cancel for api "Cancel""process" for "Power" for schdeling
       And run keyword and continue on failure  get count for exceptions for both product and project for "Cancel process"
       And run keyword and continue on failure  Excel,api,filters, exceptions and db should be equal for cancel process
       And run keyword and continue on failure  select exception "Cancel process" from final exception message
       And run keyword and continue on failure  select exception "Overdue" from final exception message
       And run keyword and continue on failure  get "Overdue" exception count for product and projects and sum of product cancel and sum project cancel for api "Overdue" for "Power"
       And run keyword and continue on failure  get count for exceptions for both product and project for "Overdue"
       And run keyword and continue on failure  Excel,api,filters, exceptions and db should be equal for Overdue
       And run keyword and continue on failure  select exception "Overdue" from final exception message
       And run keyword and continue on failure  select exception "Reschedule in" from final exception message
#       And run keyword and continue on failure  get "Reschedule in" exception count for product and projects and sum of product cancel and sum project cancel for api "Reschedule""in" for "Power" for schdeling
#       And run keyword and continue on failure  get count for exceptions for both product and project for "Reschedule in"
#       And run keyword and continue on failure  Excel,api,filters, exceptions and db should be equal for Reschedule in
#       And run keyword and continue on failure  select exception "Reschedule in" from final exception message
#       And run keyword and continue on failure  select exception "Reschedule out" from final exception message
#       And run keyword and continue on failure  get "Reschedule out" exception count for product and projects and sum of product cancel and sum project cancel for api "Reschedule""out" for "Power" for schdeling
#       And run keyword and continue on failure  get count for exceptions for both product and project for "Reschedule_out"
#       And run keyword and continue on failure  Excel,api,filters, exceptions and db should be equal for Reschedule out

