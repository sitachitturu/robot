8/8/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot
Resource  ../../Library/generic_library.robot


*** Keywords ***
User access "${link}" module
       click link   ${link}
       wait until page contains  addFilterBtn  10s

Verify Purchase Requisitions Performance Indicator Color/Value
    ${percent}  get text  ${MoPr Accuracy}
    log  ${percent}
    ${style}=  get element attribute  ${PR_Performance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${percent}  ${color}  80  90


Verify Purchase Orders Performance Indicator Color/Value
    ${percent}  get text  ${MoPo Accuracy}
    log  ${percent}
    ${style}=  get element attribute  ${PO_Performance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${percent}  ${color}  80  90

Verify Scheduling Performance Indicator Color/Value
    ${percent}  get text  ${MoScheduling Accuracy}
    log  ${percent}
    ${style}=  get element attribute  ${Scheduling_Performance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${percent}  ${color}  80  90

Verify Spine Performance Indicator Color/Value
    ${percent}  get text  ${MoSpine Accuracy}
    log  ${percent}
    ${style}=  get element attribute  ${Spine_Performance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${percent}  ${color}  80  90


