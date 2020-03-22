*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/Material_Transfer_variables.robot

*** Keywords ***
User access "${link}" module
      click link  ${link}
      sleep  10s

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript  window.scrollTo(${x_location},${y_location})

User should see Action column with dropdown
      element should be visible  ${action_column}
      element should be visible  //*[@id="columnValuesList"]

click on action dropdown and user should see list of actions in action dropdown
      click element  //*[@id="columnValuesList"]
      sleep  5s
      ${ui_option1_in the list}  get text  //*[@id="columnValuesList"]/Option[1]
      log  ${ui_option1_in the list}
      ${a}  convert to string  ${ui_option1_in the list}
      ${ui_option1_in the list..}=  strip string  ${a}
      log  ${ui_option1_in the list..}
      should be equal  ${ui_option1_in the list..}  Select an option

      ${ui_option2_in the list}  get text  //*[@id="columnValuesList"]/Option[2]
      log  ${ui_option2_in the list}
      ${b}  convert to string  ${ui_option2_in the list}
      ${ui_option2_in the list..}=  strip string  ${b}
      log  ${ui_option2_in the list..}
      should be equal  ${ui_option2_in the list..}  Accept - Add to Checklist

      ${ui_option3_in the list}  get text  //*[@id="columnValuesList"]/Option[3]
      log  ${ui_option3_in the list}
      ${c}  convert to string  ${ui_option3_in the list}
      ${ui_option3_in the list..}=  strip string  ${c}
      log  ${ui_option3_in the list..}
      should be equal  ${ui_option3_in the list..}  Reject - After Sales Support
      
      ${ui_option4_in the list}  get text  //*[@id="columnValuesList"]/Option[4]
      log  ${ui_option4_in the list}
      ${d}  convert to string  ${ui_option4_in the list}
      ${ui_option4_in the list..}=  strip string  ${d}
      log  ${ui_option4_in the list..}
      should be equal  ${ui_option4_in the list..}  Reject - BOM / Demand issue
      
      ${ui_option5_in the list}  get text  //*[@id="columnValuesList"]/Option[5]
      log  ${ui_option5_in the list}
      ${e}  convert to string  ${ui_option5_in the list}
      ${ui_option5_in the list..}=  strip string  ${e}
      log  ${ui_option5_in the list..}
      should be equal  ${ui_option5_in the list..}  Reject - Customer Request
      
      ${ui_option6_in the list}  get text  //*[@id="columnValuesList"]/Option[6]
      log  ${ui_option6_in the list}
      ${f}  convert to string  ${ui_option6_in the list}
      ${ui_option6_in the list..}=  strip string  ${f}
      log  ${ui_option6_in the list..}
      should be equal  ${ui_option6_in the list..}  Reject - Data Cleanliness
      
      ${ui_option7_in the list}  get text  //*[@id="columnValuesList"]/Option[7]
      log  ${ui_option7_in the list}
      ${g}  convert to string  ${ui_option7_in the list}
      ${ui_option7_in the list..}=  strip string  ${g}
      log  ${ui_option7_in the list..}
      should be equal  ${ui_option7_in the list..}  Reject - Level Loading / Strategic Inventory

      ${ui_option8_in the list}  get text  //*[@id="columnValuesList"]/Option[8]
      log  ${ui_option8_in the list}
      ${h}  convert to string  ${ui_option8_in the list}
      ${ui_option8_in the list..}=  strip string  ${h}
      log  ${ui_option8_in the list..}
      should be equal  ${ui_option8_in the list..}  Reject - Locked Waiting Change
      
      ${ui_option9_in the list}  get text  //*[@id="columnValuesList"]/Option[9]
      log  ${ui_option9_in the list}
      ${i}  convert to string  ${ui_option9_in the list}
      ${ui_option9_in the list..}=  strip string  ${i}
      log  ${ui_option9_in the list..}
      should be equal  ${ui_option9_in the list..}  Reject - NCR / Rework
      
      ${ui_option10_in the list}  get text  //*[@id="columnValuesList"]/Option[10]
      log  ${ui_option10_in the list}
      ${j}  convert to string  ${ui_option10_in the list}
      ${ui_option10_in the list..}=  strip string  ${j}
      log  ${ui_option10_in the list..}
      should be equal  ${ui_option10_in the list..}  Reject - Not MRP Planned
      
      ${ui_option11_in the list}  get text  //*[@id="columnValuesList"]/Option[11]
      log  ${ui_option11_in the list}
      ${k}  convert to string  ${ui_option11_in the list}
      ${ui_option11_in the list..}=  strip string  ${k}
      log  ${ui_option11_in the list..}
      should be equal  ${ui_option11_in the list..}  Reject - Work in Process / Production Started

click on action dropdown and user should see list of actions in action dropdown in purchase orders module
      click element  //*[@id="columnValuesList"]
      sleep  5s
      ${ui_option1_in the list}  get text  //*[@id="columnValuesList"]/Option[1]
      log  ${ui_option1_in the list}
      ${a}  convert to string  ${ui_option1_in the list}
      ${ui_option1_in the list..}=  strip string  ${a}
      log  ${ui_option1_in the list..}
      should be equal  ${ui_option1_in the list..}  Select an option

      ${ui_option2_in the list}  get text  //*[@id="columnValuesList"]/Option[3]
      log  ${ui_option2_in the list}
      ${b}  convert to string  ${ui_option2_in the list}
      ${ui_option2_in the list..}=  strip string  ${b}
      log  ${ui_option2_in the list..}
      should be equal  ${ui_option2_in the list..}  Pending Negotiation

      ${ui_option3_in the list}  get text  //*[@id="columnValuesList"]/Option[4]
      log  ${ui_option3_in the list}
      ${c}  convert to string  ${ui_option3_in the list}
      ${ui_option3_in the list..}=  strip string  ${c}
      log  ${ui_option3_in the list..}
      should be equal  ${ui_option3_in the list..}  Reject - Blanket PO

      ${ui_option4_in the list}  get text  //*[@id="columnValuesList"]/Option[5]
      log  ${ui_option4_in the list}
      ${d}  convert to string  ${ui_option4_in the list}
      ${ui_option4_in the list..}=  strip string  ${d}
      log  ${ui_option4_in the list..}
      should be equal  ${ui_option4_in the list..}  Reject - BOM / DWG Issue

      ${ui_option5_in the list}  get text  //*[@id="columnValuesList"]/Option[6]
      log  ${ui_option5_in the list}
      ${e}  convert to string  ${ui_option5_in the list}
      ${ui_option5_in the list..}=  strip string  ${e}
      log  ${ui_option5_in the list..}
      should be equal  ${ui_option5_in the list..}  Reject - Contractual Conflict

      ${ui_option6_in the list}  get text  //*[@id="columnValuesList"]/Option[7]
      log  ${ui_option6_in the list}
      ${f}  convert to string  ${ui_option6_in the list}
      ${ui_option6_in the list..}=  strip string  ${f}
      log  ${ui_option6_in the list..}
      should be equal  ${ui_option6_in the list..}  Reject - Data Cleanliness Issue

      ${ui_option7_in the list}  get text  //*[@id="columnValuesList"]/Option[8]
      log  ${ui_option7_in the list}
      ${g}  convert to string  ${ui_option7_in the list}
      ${ui_option7_in the list..}=  strip string  ${g}
      log  ${ui_option7_in the list..}
      should be equal  ${ui_option7_in the list..}  Reject - In Transit / Frozen Window

      ${ui_option8_in the list}  get text  //*[@id="columnValuesList"]/Option[9]
      log  ${ui_option8_in the list}
      ${h}  convert to string  ${ui_option8_in the list}
      ${ui_option8_in the list..}=  strip string  ${h}
      log  ${ui_option8_in the list..}
      should be equal  ${ui_option8_in the list..}  Reject - Negotiated Agreement

      ${ui_option9_in the list}  get text  //*[@id="columnValuesList"]/Option[10]
      log  ${ui_option9_in the list}
      ${i}  convert to string  ${ui_option9_in the list}
      ${ui_option9_in the list..}=  strip string  ${i}
      log  ${ui_option9_in the list..}
      should be equal  ${ui_option9_in the list..}  Reject - Quota Arrangement Conflict
      
      ${ui_option10_in the list}  get text  //*[@id="columnValuesList"]/Option[2]
      log  ${ui_option10_in the list}
      ${i}  convert to string  ${ui_option10_in the list}
      ${ui_option10_in the list..}=  strip string  ${i}
      log  ${ui_option10_in the list..}
      should be equal  ${ui_option10_in the list..}  Accept - Add to Checklist

click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in waiting for action tab for seller grid
      ${ui_option1_in the list}  get text  //*[@id="columnValuesList"]/Option[1]
      log  ${ui_option1_in the list}
      ${a}  convert to string  ${ui_option1_in the list}
      ${ui_option1_in the list..}=  strip string  ${a}
      log  ${ui_option1_in the list..}
      should be equal  ${ui_option1_in the list..}  Select an option

      ${ui_option2_in the list}  get text  //*[@id="columnValuesList"]/Option[2]
      log  ${ui_option2_in the list}
      ${b}  convert to string  ${ui_option2_in the list}
      ${ui_option2_in the list..}=  strip string  ${b}
      log  ${ui_option2_in the list..}
      should be equal  ${ui_option2_in the list..}  Accept – Ok to Sell

      ${ui_option3_in the list}  get text  //*[@id="columnValuesList"]/Option[3]
      log  ${ui_option3_in the list}
      ${c}  convert to string  ${ui_option3_in the list}
      ${ui_option3_in the list..}=  strip string  ${c}
      log  ${ui_option3_in the list..}
      should be equal  ${ui_option3_in the list..}  Accept – Ok to Buy

      ${ui_option4_in the list}  get text  //*[@id="columnValuesList"]/Option[4]
      log  ${ui_option4_in the list}
      ${d}  convert to string  ${ui_option4_in the list}
      ${ui_option4_in the list..}=  strip string  ${d}
      log  ${ui_option4_in the list..}
      should be equal  ${ui_option4_in the list..}  Accept – Agreed by both Parties

      ${ui_option5_in the list}  get text  //*[@id="columnValuesList"]/Option[5]
      log  ${ui_option5_in the list}
      ${e}  convert to string  ${ui_option5_in the list}
      ${ui_option5_in the list..}=  strip string  ${e}
      log  ${ui_option5_in the list..}
      should be equal  ${ui_option5_in the list..}  Accept – PO Placed

      ${ui_option6_in the list}  get text  //*[@id="columnValuesList"]/Option[6]
      log  ${ui_option6_in the list}
      ${f}  convert to string  ${ui_option6_in the list}
      ${ui_option6_in the list..}=  strip string  ${f}
      log  ${ui_option6_in the list..}
      should be equal  ${ui_option6_in the list..}  Reject – Contractual Obligation

      ${ui_option7_in the list}  get text  //*[@id="columnValuesList"]/Option[7]
      log  ${ui_option7_in the list}
      ${g}  convert to string  ${ui_option7_in the list}
      ${ui_option7_in the list..}=  strip string  ${g}
      log  ${ui_option7_in the list..}
      should be equal  ${ui_option7_in the list..}  Reject – Customer Request

      ${ui_option8_in the list}  get text  //*[@id="columnValuesList"]/Option[8]
      log  ${ui_option8_in the list}
      ${h}  convert to string  ${ui_option8_in the list}
      ${ui_option8_in the list..}=  strip string  ${h}
      log  ${ui_option8_in the list..}
      should be equal  ${ui_option8_in the list..}  Reject – Data Cleanliness

      ${ui_option9_in the list}  get text  //*[@id="columnValuesList"]/Option[9]
      log  ${ui_option9_in the list}
      ${i}  convert to string  ${ui_option9_in the list}
      ${ui_option9_in the list..}=  strip string  ${i}
      log  ${ui_option9_in the list..}
      should be equal  ${ui_option9_in the list..}  Reject – Expected Demand from sharing site

      ${ui_option10_in the list}  get text  //*[@id="columnValuesList"]/Option[10]
      log  ${ui_option10_in the list}
      ${i}  convert to string  ${ui_option10_in the list}
      ${ui_option10_in the list..}=  strip string  ${i}
      log  ${ui_option10_in the list..}
      should be equal  ${ui_option10_in the list..}  Reject – Logic Review

      ${ui_option11_in the list}  get text  //*[@id="columnValuesList"]/Option[11]
      log  ${ui_option11_in the list}
      ${i}  convert to string  ${ui_option11_in the list}
      ${ui_option11_in the list..}=  strip string  ${i}
      log  ${ui_option11_in the list..}
      should be equal  ${ui_option11_in the list..}  Reject – Mismatch

      ${ui_option12_in the list}  get text  //*[@id="columnValuesList"]/Option[12]
      log  ${ui_option12_in the list}
      ${i}  convert to string  ${ui_option12_in the list}
      ${ui_option12_in the list..}=  strip string  ${i}
      log  ${ui_option12_in the list..}
      should be equal  ${ui_option12_in the list..}  Reject – Not Available to Share

      ${ui_option13_in the list}  get text  //*[@id="columnValuesList"]/Option[13]
      log  ${ui_option13_in the list}
      ${i}  convert to string  ${ui_option13_in the list}
      ${ui_option13_in the list..}=  strip string  ${i}
      log  ${ui_option13_in the list..}
      should be equal  ${ui_option13_in the list..}  Reject – Time Sensitive

click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in In Process tab
       ${in process tab txt}  get text  ${in process tab}
       log  ${in process tab txt}
       should be equal  ${in process tab txt}  In Process
      sleep  5s
      ${ui_option1_in the list}  get text  //*[@id="columnValuesList"]/Option[1]
      log  ${ui_option1_in the list}
      ${a}  convert to string  ${ui_option1_in the list}
      ${ui_option1_in the list..}=  strip string  ${a}
      log  ${ui_option1_in the list..}
      should be equal  ${ui_option1_in the list..}  Select an option

      ${ui_option2_in the list}  get text  //*[@id="columnValuesList"]/Option[2]
      log  ${ui_option2_in the list}
      ${b}  convert to string  ${ui_option2_in the list}
      ${ui_option2_in the list..}=  strip string  ${b}
      log  ${ui_option2_in the list..}
      should be equal  ${ui_option2_in the list..}  Accept – Agreed by both Parties

      ${ui_option3_in the list}  get text  //*[@id="columnValuesList"]/Option[3]
      log  ${ui_option3_in the list}
      ${c}  convert to string  ${ui_option3_in the list}
      ${ui_option3_in the list..}=  strip string  ${c}
      log  ${ui_option3_in the list..}
      should be equal  ${ui_option3_in the list..}  Accept – PO Placed

      ${ui_option4_in the list}  get text  //*[@id="columnValuesList"]/Option[4]
      log  ${ui_option4_in the list}
      ${d}  convert to string  ${ui_option4_in the list}
      ${ui_option4_in the list..}=  strip string  ${d}
      log  ${ui_option4_in the list..}
      should be equal  ${ui_option4_in the list..}  Accept – Ok to Buy

      ${ui_option5_in the list}  get text  //*[@id="columnValuesList"]/Option[5]
      log  ${ui_option5_in the list}
      ${e}  convert to string  ${ui_option5_in the list}
      ${ui_option5_in the list..}=  strip string  ${e}
      log  ${ui_option5_in the list..}
      should be equal  ${ui_option5_in the list..}  Accept – Ok to Sell

      ${ui_option6_in the list}  get text  //*[@id="columnValuesList"]/Option[6]
      log  ${ui_option6_in the list}
      ${f}  convert to string  ${ui_option6_in the list}
      ${ui_option6_in the list..}=  strip string  ${f}
      log  ${ui_option6_in the list..}
      should be equal  ${ui_option6_in the list..}  Reject – Contractual Obligation

      ${ui_option7_in the list}  get text  //*[@id="columnValuesList"]/Option[7]
      log  ${ui_option7_in the list}
      ${g}  convert to string  ${ui_option7_in the list}
      ${ui_option7_in the list..}=  strip string  ${g}
      log  ${ui_option7_in the list..}
      should be equal  ${ui_option7_in the list..}  Reject – Customer Request

      ${ui_option8_in the list}  get text  //*[@id="columnValuesList"]/Option[8]
      log  ${ui_option8_in the list}
      ${h}  convert to string  ${ui_option8_in the list}
      ${ui_option8_in the list..}=  strip string  ${h}
      log  ${ui_option8_in the list..}
      should be equal  ${ui_option8_in the list..}  Reject – Data Cleanliness

      ${ui_option9_in the list}  get text  //*[@id="columnValuesList"]/Option[9]
      log  ${ui_option9_in the list}
      ${i}  convert to string  ${ui_option9_in the list}
      ${ui_option9_in the list..}=  strip string  ${i}
      log  ${ui_option9_in the list..}
      should be equal  ${ui_option9_in the list..}  Reject – Expected Demand from sharing site

      ${ui_option10_in the list}  get text  //*[@id="columnValuesList"]/Option[10]
      log  ${ui_option10_in the list}
      ${i}  convert to string  ${ui_option10_in the list}
      ${ui_option10_in the list..}=  strip string  ${i}
      log  ${ui_option10_in the list..}
      should be equal  ${ui_option10_in the list..}  Reject – Logic Review

      ${ui_option11_in the list}  get text  //*[@id="columnValuesList"]/Option[11]
      log  ${ui_option11_in the list}
      ${i}  convert to string  ${ui_option11_in the list}
      ${ui_option11_in the list..}=  strip string  ${i}
      log  ${ui_option11_in the list..}
      should be equal  ${ui_option11_in the list..}  Reject – Mismatch

      ${ui_option12_in the list}  get text  //*[@id="columnValuesList"]/Option[12]
      log  ${ui_option12_in the list}
      ${i}  convert to string  ${ui_option12_in the list}
      ${ui_option12_in the list..}=  strip string  ${i}
      log  ${ui_option12_in the list..}
      should be equal  ${ui_option12_in the list..}  Reject – Not Available to Share

      ${ui_option13_in the list}  get text  //*[@id="columnValuesList"]/Option[13]
      log  ${ui_option13_in the list}
      ${i}  convert to string  ${ui_option13_in the list}
      ${ui_option13_in the list..}=  strip string  ${i}
      log  ${ui_option13_in the list..}
      should be equal  ${ui_option13_in the list..}  Reject – Time Sensitive

click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in waiting for action tab for buyer grid
       ${ui_option1_in the list}  get text  //*[@id="columnValuesList"]/Option[1]
      log  ${ui_option1_in the list}
      ${a}  convert to string  ${ui_option1_in the list}
      ${ui_option1_in the list..}=  strip string  ${a}
      log  ${ui_option1_in the list..}
      should be equal  ${ui_option1_in the list..}  Select an option

      ${ui_option2_in the list}  get text  //*[@id="columnValuesList"]/Option[2]
      log  ${ui_option2_in the list}
      ${b}  convert to string  ${ui_option2_in the list}
      ${ui_option2_in the list..}=  strip string  ${b}
      log  ${ui_option2_in the list..}
      should be equal  ${ui_option2_in the list..}  Accept – Ok to Buy

      ${ui_option3_in the list}  get text  //*[@id="columnValuesList"]/Option[3]
      log  ${ui_option3_in the list}
      ${c}  convert to string  ${ui_option3_in the list}
      ${ui_option3_in the list..}=  strip string  ${c}
      log  ${ui_option3_in the list..}
      should be equal  ${ui_option3_in the list..}  Accept – Ok to Sell

      ${ui_option4_in the list}  get text  //*[@id="columnValuesList"]/Option[4]
      log  ${ui_option4_in the list}
      ${d}  convert to string  ${ui_option4_in the list}
      ${ui_option4_in the list..}=  strip string  ${d}
      log  ${ui_option4_in the list..}
      should be equal  ${ui_option4_in the list..}  Accept – Agreed by both Parties

      ${ui_option5_in the list}  get text  //*[@id="columnValuesList"]/Option[5]
      log  ${ui_option5_in the list}
      ${e}  convert to string  ${ui_option5_in the list}
      ${ui_option5_in the list..}=  strip string  ${e}
      log  ${ui_option5_in the list..}
      should be equal  ${ui_option5_in the list..}  Accept – PO Placed

      ${ui_option6_in the list}  get text  //*[@id="columnValuesList"]/Option[6]
      log  ${ui_option6_in the list}
      ${f}  convert to string  ${ui_option6_in the list}
      ${ui_option6_in the list..}=  strip string  ${f}
      log  ${ui_option6_in the list..}
      should be equal  ${ui_option6_in the list..}  Reject – Contractual Obligation

      ${ui_option7_in the list}  get text  //*[@id="columnValuesList"]/Option[7]
      log  ${ui_option7_in the list}
      ${g}  convert to string  ${ui_option7_in the list}
      ${ui_option7_in the list..}=  strip string  ${g}
      log  ${ui_option7_in the list..}
      should be equal  ${ui_option7_in the list..}  Reject – Customer Request

      ${ui_option8_in the list}  get text  //*[@id="columnValuesList"]/Option[8]
      log  ${ui_option8_in the list}
      ${h}  convert to string  ${ui_option8_in the list}
      ${ui_option8_in the list..}=  strip string  ${h}
      log  ${ui_option8_in the list..}
      should be equal  ${ui_option8_in the list..}  Reject – Data Cleanliness

      ${ui_option9_in the list}  get text  //*[@id="columnValuesList"]/Option[9]
      log  ${ui_option9_in the list}
      ${i}  convert to string  ${ui_option9_in the list}
      ${ui_option9_in the list..}=  strip string  ${i}
      log  ${ui_option9_in the list..}
      should be equal  ${ui_option9_in the list..}  Reject – Expected Demand from sharing site

      ${ui_option10_in the list}  get text  //*[@id="columnValuesList"]/Option[10]
      log  ${ui_option10_in the list}
      ${i}  convert to string  ${ui_option10_in the list}
      ${ui_option10_in the list..}=  strip string  ${i}
      log  ${ui_option10_in the list..}
      should be equal  ${ui_option10_in the list..}  Reject – Logic Review

      ${ui_option11_in the list}  get text  //*[@id="columnValuesList"]/Option[11]
      log  ${ui_option11_in the list}
      ${i}  convert to string  ${ui_option11_in the list}
      ${ui_option11_in the list..}=  strip string  ${i}
      log  ${ui_option11_in the list..}
      should be equal  ${ui_option11_in the list..}  Reject – Mismatch

      ${ui_option12_in the list}  get text  //*[@id="columnValuesList"]/Option[12]
      log  ${ui_option12_in the list}
      ${i}  convert to string  ${ui_option12_in the list}
      ${ui_option12_in the list..}=  strip string  ${i}
      log  ${ui_option12_in the list..}
      should be equal  ${ui_option12_in the list..}  Reject – Not Available to Share

      ${ui_option13_in the list}  get text  //*[@id="columnValuesList"]/Option[13]
      log  ${ui_option13_in the list}
      ${i}  convert to string  ${ui_option13_in the list}
      ${ui_option13_in the list..}=  strip string  ${i}
      log  ${ui_option13_in the list..}
      should be equal  ${ui_option13_in the list..}  Reject – Time Sensitive

Verify the text of the selected Accepted tab
           ${Accepted tab txt}  get text  ${Accepted tab}
       log  ${Accepted tab txt}
       should be equal  ${Accepted tab txt}  Accepted
      sleep  5s
Verify the text of the selected Rejected tab
      ${Rejected tab txt}  get text  ${Rejected tab}
       log  ${Rejected tab txt}
       should be equal  ${Rejected tab txt}  Rejected
      sleep  5s
click on action dropdown and user should see list of actions in action dropdown in Material Transfer module in Accepted Tab/rejected for seller grid
      ${ui_option1_in the list}  get text  //*[@id="columnValuesList"]/Option[1]
      log  ${ui_option1_in the list}
      ${a}  convert to string  ${ui_option1_in the list}
      ${ui_option1_in the list..}=  strip string  ${a}
      log  ${ui_option1_in the list..}
      should be equal  ${ui_option1_in the list..}  Select an option

      ${ui_option2_in the list}  get text  //*[@id="columnValuesList"]/Option[2]
      log  ${ui_option2_in the list}
      ${b}  convert to string  ${ui_option2_in the list}
      ${ui_option2_in the list..}=  strip string  ${b}
      log  ${ui_option2_in the list..}
      should be equal  ${ui_option2_in the list..}  Accept – PO Placed

      ${ui_option3_in the list}  get text  //*[@id="columnValuesList"]/Option[3]
      log  ${ui_option3_in the list}
      ${c}  convert to string  ${ui_option3_in the list}
      ${ui_option3_in the list..}=  strip string  ${c}
      log  ${ui_option3_in the list..}
      should be equal  ${ui_option3_in the list..}  Accept – Agreed by both Parties

      ${ui_option4_in the list}  get text  //*[@id="columnValuesList"]/Option[4]
      log  ${ui_option4_in the list}
      ${d}  convert to string  ${ui_option4_in the list}
      ${ui_option4_in the list..}=  strip string  ${d}
      log  ${ui_option4_in the list..}
      should be equal  ${ui_option4_in the list..}  Accept – Ok to Buy

      ${ui_option5_in the list}  get text  //*[@id="columnValuesList"]/Option[5]
      log  ${ui_option5_in the list}
      ${e}  convert to string  ${ui_option5_in the list}
      ${ui_option5_in the list..}=  strip string  ${e}
      log  ${ui_option5_in the list..}
      should be equal  ${ui_option5_in the list..}  Accept – Ok to Sell

      ${ui_option6_in the list}  get text  //*[@id="columnValuesList"]/Option[6]
      log  ${ui_option6_in the list}
      ${f}  convert to string  ${ui_option6_in the list}
      ${ui_option6_in the list..}=  strip string  ${f}
      log  ${ui_option6_in the list..}
      should be equal  ${ui_option6_in the list..}  Reject – Contractual Obligation

      ${ui_option7_in the list}  get text  //*[@id="columnValuesList"]/Option[7]
      log  ${ui_option7_in the list}
      ${g}  convert to string  ${ui_option7_in the list}
      ${ui_option7_in the list..}=  strip string  ${g}
      log  ${ui_option7_in the list..}
      should be equal  ${ui_option7_in the list..}  Reject – Customer Request

      ${ui_option8_in the list}  get text  //*[@id="columnValuesList"]/Option[8]
      log  ${ui_option8_in the list}
      ${h}  convert to string  ${ui_option8_in the list}
      ${ui_option8_in the list..}=  strip string  ${h}
      log  ${ui_option8_in the list..}
      should be equal  ${ui_option8_in the list..}  Reject – Data Cleanliness

      ${ui_option9_in the list}  get text  //*[@id="columnValuesList"]/Option[9]
      log  ${ui_option9_in the list}
      ${i}  convert to string  ${ui_option9_in the list}
      ${ui_option9_in the list..}=  strip string  ${i}
      log  ${ui_option9_in the list..}
      should be equal  ${ui_option9_in the list..}  Reject – Expected Demand from sharing site

      ${ui_option10_in the list}  get text  //*[@id="columnValuesList"]/Option[10]
      log  ${ui_option10_in the list}
      ${i}  convert to string  ${ui_option10_in the list}
      ${ui_option10_in the list..}=  strip string  ${i}
      log  ${ui_option10_in the list..}
      should be equal  ${ui_option10_in the list..}  Reject – Logic Review

      ${ui_option11_in the list}  get text  //*[@id="columnValuesList"]/Option[11]
      log  ${ui_option11_in the list}
      ${i}  convert to string  ${ui_option11_in the list}
      ${ui_option11_in the list..}=  strip string  ${i}
      log  ${ui_option11_in the list..}
      should be equal  ${ui_option11_in the list..}  Reject – Mismatch

      ${ui_option12_in the list}  get text  //*[@id="columnValuesList"]/Option[12]
      log  ${ui_option12_in the list}
      ${i}  convert to string  ${ui_option12_in the list}
      ${ui_option12_in the list..}=  strip string  ${i}
      log  ${ui_option12_in the list..}
      should be equal  ${ui_option12_in the list..}  Reject – Not Available to Share

      ${ui_option13_in the list}  get text  //*[@id="columnValuesList"]/Option[13]
      log  ${ui_option13_in the list}
      ${i}  convert to string  ${ui_option13_in the list}
      ${ui_option13_in the list..}=  strip string  ${i}
      log  ${ui_option13_in the list..}
      should be equal  ${ui_option13_in the list..}  Reject – Time Sensitive


