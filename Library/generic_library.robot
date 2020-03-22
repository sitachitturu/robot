7/27/2017
212613237
#This library is for any generic keyword definitions used accross all modules.
*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
*** Keywords ***

scroll page to location
      [Arguments]    ${x_location}    ${y_location}
      Execute JavaScript    window.scrollTo(${x_location},${y_location})

Validate Performance Indicator
    #Given a number (the performance value), a color (in form rgb(x,y,z)), low value of range, and high value of range,
    #this keyword will determine whether the value and color match each other accordingly.
    [Arguments]  ${performance_value}  ${color}  ${low_value}  ${high_value}
    convert to number  ${performance_value}
    convert to number  ${low_value}
    convert to number  ${high_value}

    #converting reds to one uniform red
    ${color}=  set variable if  '${color}' == 'rgb(229, 56, 56)'  rgb(231, 54, 49)  ${color}

    #Red
    run keyword if  ${performance_value} <= ${low_value}  should be equal as strings  '${color}'  'rgb(231, 54, 49)'
    #Yellow
    run keyword if  ${low_value} < ${performance_value} <= ${high_value}  should be equal as strings  '${color}'  'rgb(237, 221, 70)'
    #Green
    run keyword if  ${high_value} < ${performance_value}  should be equal as strings  '${color}'  'rgb(96, 189, 104)'

trim all unnecesary brackets
     [Arguments]  ${queryResults1..}
    ${convert}  convert to string  ${queryResults1..}
            log  ${convert}
            ${queryResults}  replace string using regexp  ${convert}  \\(|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\)|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\[|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\]|\,  ${EMPTY}
            ${queryResults}  replace string using regexp  ${queryResults}  \\'|\,  ${EMPTY}
            ${queryResults1}  replace string using regexp  ${queryResults}  \[a-zA-Z]|\,  ${EMPTY}
            [Return]  ${queryResults1}