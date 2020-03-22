8/10/2017
212613237
*** Settings ***
Library  Selenium2Library
Library  String
Library  OperatingSystem
Library  Collections
Resource  ../../Variables/plant_comparison_variables.robot
Resource  ../../Library/generic_library.robot


*** Keywords ***
User access "${link}" module
       click link   ${link}
       wait until page contains  addFilterBtn  10s

Verify All Plants Indicator Color/Value
    ${value}  get text  ${Accuracy_Value}
    log  ${value}
    ${style}=  get element attribute  ${Spine_Performance_Indicator_Style}
    ${color}  fetch from right  ${style}  background-color:${SPACE}
    ${color}  fetch from left  ${color}  ;
    Validate Performance Indicator  ${value}  ${color}  80  90