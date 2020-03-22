*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Library   ../../Utilities/utility.py
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Library/filter_library.robot
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
Resource  ../../Library/generic_library.robot

*** Keywords ***

User click Purchase Orders icon
    click element  ${Purchase Orders Icon}
    sleep  10s

User should see "${title}"
    xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1

User click a value in plant filter
    [Arguments]  ${plant-name-plant-short-code}
    ${constructed xpath}  construct_string_with_argument  ${Value in plant filter}  ${plant-name-plant-short-code}
    wait until element is visible  ${constructed xpath}
    click element  ${constructed xpath}
    sleep  3s
    wait until element is visible  ApplyBtn
    click element  ApplyBtn

User click plant filter
    wait until element is visible  ${Plant filter}
    click element  ${Plant filter}
    click element  search-input
    sleep  3s

User enter plant code in search filter
    [Arguments]  ${plant_code}
    input text  search-input  ${plant_code}
    sleep  10s

Validate the Action-icon comment present
    sleep  10s
    wait until element is visible  ${Action_icon_comment}  4s

Validate the comment column in the data grid
    sleep  10s
    wait until element is visible  ${Comment_column}  4s


User should click on comment icon at first row
    sleep  30s
    wait until element is visible  ${Comment_column}
    click element  ${Comment_column}

Verify the opened modal box
    sleep  10s
    wait until element is visible  ${Modal_box_comment}

Close the Modal box
    sleep  3s
    click element  ${Close_button_Modal_box}

Verify the options present on the modal box
    sleep  1s
    wait until element is visible  ${PO_number_Modal_box}
    sleep  1s
    wait until element is visible  ${Material_sku_Modal_box}
    sleep  1s
    wait until element is visible  ${P0_line_Modal_box}
    sleep  1s
    wait until element is visible  ${Source/Vendor_Modal_box}

User should enter the comment and verify the the comment under the record
    [Arguments]  ${Comment}
    sleep  1s
    input text  ${Modal_box_comment}  ${Comment}
    sleep  5s
    click element  ${Post_comment_button}
    sleep  5s
    Page Should Contain Textfield  ${Comment}




