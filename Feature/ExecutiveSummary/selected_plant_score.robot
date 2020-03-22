*** Settings ***
Library           Selenium2Library
Resource         ../../StepDefinition/ExecutiveSummary/selected_plant_score_step.robot
*** Test Cases ***
Plant Score calculation for default page
    Given User click Executive Summary icon
#    And User click on plant filter and select plant "ulc"
    When User can see Selected Plant Score at Executive Summary page
    And User access Purchase orders
#    And User click on plant filter and select plant "ulc"
    And User calculate ON Time PO value
    And User access Purchase orders
#    And User click on plant filter and select plant "ulc"
    And User calculate Short cycle value
    And User access Purchase orders
#    And User click on plant filter and select plant "ulc"
    And User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal
#
Verify spine plant score by selecting plant which contains only ,pr,po and short cycle po value
    Given User click Executive Summary icon
    When User click on plant filter and select plant 0020 and click apply
    And User can see Selected Plant Score at Executive Summary page
    And verify spine calculations if cancellation,reschedule in,reschedule out is "null(--)" with only short cycle,pr,po
    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal
#
#plant score calculation for plants 7000,2490,5251 and 5250 greenville
#    Given User click Executive Summary icon
#    And select plants 7000,2490,5251 and 5250 greenville
#    When User can see Selected Plant Score at Executive Summary page
#    And User access Purchase orders
#    And select plants 7000,2490,5251 and 5250 greenville
#    And User calculate ON Time PO value
#    And User access Purchase orders
#    And select plants 7000,2490,5251 and 5250 greenville
#    And User calculate Short cycle value
#    And User access Purchase orders
#    And select plants 7000,2490,5251 and 5250 greenville
#    And User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
#    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal

Verify plant score by selecting plant which displays only short cycle value,remaing all are zero
   Given User click Executive Summary icon
   When User click on plant filter and select plant 0020 and click apply
   And User can see Selected Plant Score at Executive Summary page
   And verify spine calculations if cancellation,reschedule in,reschedule out,PR,PO,SCHEDULING is "0" with only short cycle has value
   Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal

Plant score Plant Busines filter
    Given User click Executive Summary icon
    And select first business from Plant Business filter
    When User can see Selected Plant Score at Executive Summary page
    And User access Purchase orders
    And select first business from Plant Business filter
    And User calculate ON Time PO value
    And User access Purchase orders
    And select first business from Plant Business filter
    And User calculate Short cycle value
    And User access Purchase orders
    And select first business from Plant Business filter
    And User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal

Plant score Plant Category filter
    Given User click Executive Summary icon
    And select first category from Plant Category filter
    When User can see Selected Plant Score at Executive Summary page
    And User access Purchase orders
    And select first category from Plant Category filter
    And User calculate ON Time PO value
    And User access Purchase orders
    And select first category from Plant Category filter
    And User calculate Short cycle value
    And User access Purchase orders
    And select first category from Plant Category filter
    And User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal

Plant score Plant Region filter
    Given User click Executive Summary icon
    And select first region from Plant Region filter
    When User can see Selected Plant Score at Executive Summary page
    And User access Purchase orders
    And select first region from Plant Region filter
    And User calculate ON Time PO value
    And User access Purchase orders
    And select first region from Plant Region filter
    And User calculate Short cycle value
    And User access Purchase orders
    And select first region from Plant Region filter
    And User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal

Plant score Sub Business filter
    Given User click Executive Summary icon
    And select first sub-business from Sub-Business filter
    When User can see Selected Plant Score at Executive Summary page
    And User access Purchase orders
    And select first sub-business from Sub-Business filter
    And User calculate ON Time PO value
    And User access Purchase orders
    And select first sub-business from Sub-Business filter
    And User calculate Short cycle value
    And User access Purchase orders
    And select first sub-business from Sub-Business filter
    And User calculate Plant Score from "Cancellation/total", "Reschedule In/total", "Reschedule Out/total", "Other Exceptions"
    Then selected Plant Score at Executive Summary page and Plant Score calculated from Purchase orders page should be equal
#
#Plant Score calculation for default page with db queries
#     Given User click Executive Summary icon
#     And Verify the numbers in total plant score in ui by taking values from plant comparison trending
