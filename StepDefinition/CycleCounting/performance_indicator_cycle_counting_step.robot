8/9/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Resource  ../../Variables/cycle_counting_variables.robot
Resource  ../../Library/generic_library.robot


*** Keywords ***
User access "${link}" module
       click link   ${link}
       wait until page contains  addFilterBtn  10s

Verify Accuracy Performance Indicator Color/Value
    ${percent}  get text  ${Accuracy_Perfomance_Indicator_Value}
    log  ${percent}
    ${style}=  get element attribute  ${Accuracy_Perfomance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${percent}  ${color}  80  90


Verify On-Time Performance Indicator Color/Value
    ${percent}  get text  ${On_Time_Perfomance_Indicator_Value}
    log  ${percent}
    ${style}=  get element attribute  ${On_Time_Perfomance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${percent}  ${color}  80  90