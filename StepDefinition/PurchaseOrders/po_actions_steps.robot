*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot

*** Keywords ***
Expected po action options
    @{expected po actions}  create list  Select an option  Accept Action  BOM / DWG Issue  Contractual Conflict  Data Cleanliness Issue  In Transit / Frozen Window  Negotiated Agreement  Pending Negotiation  Quota Arrangement Conflict
    [Return]  @{expected po actions}

Actual po action options from UI
    wait until element is visible  ${po_actions_dropdown_options}
    @{po actions from UI}  create list
    @{po act}=  get webelements  ${po_actions_dropdown_options}
    :for  ${i}  in  @{po act}
    \  ${txt}=  get text  ${i}
    \  append to list  ${po actions from UI}  ${txt}
    [Return]  ${po actions from UI}

User click on first po action dropdown
    sleep  20s
    wait until element is visible  ${po_actions_dropdown}
    click element  ${po_actions_dropdown}

Validate po actions
    ${expected po actions}=  Expected po action options
    User click on first po action dropdown
    ${actual po actions}=  Actual po action options from UI
    list should contain sub list  ${actual po actions}  ${expected po actions}


