11/7/2017
212595411

*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot
*** Keywords ***
User access Purchase orders module
    click element   ${Purchase Orders Icon}

User select plant 0010
    wait until element is visible  plant  10s
    click element  plant
    wait until element is visible  ${plant filter check box}  60s
    click element  ${plant filter check box}
    click element  xpath=//*[@id='plant']//button[@id='ApplyBtn']

User click Value button
    click element  //paper-tab[@role='tab']//div[contains(normalize-space(), 'Value ($)')]
User select Plant view
    click element  //div[@id='dropcell']//span[contains(normalize-space(), 'Buyer')]
    click element  //ul[@id='list']//li[contains(normalize-space(), 'Plant')]
sum off all iteams in column 60+ Days Old should be equal to number in Total
    sleep  20s

    ${60+raw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(1) div:nth(1)").text();
       ${convert}  replace string  ${60+raw}  ,  ${EMPTY}
       ${60+}  replace string  ${convert}  $  ${EMPTY}
    log  ${60+}
    ${overall60+raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(1) div").text();
    ${text4..}  execute javascript  var string = "${overall60+raw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overall60+}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overall60+}
    should be equal  ${overall60+}  ${60+}

sum off all iteams in column 30+ Days Old should be equal to number in Total
    ${30+raw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(2) div:nth(1)").text();
       ${convert}  replace string  ${30+raw}  ,  ${EMPTY}
       ${30+}  replace string  ${convert}  $  ${EMPTY}
    log  ${30+}
    ${overall30+raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(2) div").text();
    ${text4..}  execute javascript  var string = "${overall30+raw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overall30+}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overall30+}
    should be equal  ${overall30+}  ${30+}

sum off all iteams in column <30 Days Old should be equal to number in Total
    ${<30raw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(3) div:nth(1)").text();
       ${convert}  replace string  ${<30raw}  ,  ${EMPTY}
       ${<30}  replace string  ${convert}  $  ${EMPTY}
    log  ${<30}
    ${overall<30raw}=  execute javascript  return $("#footer tr:nth(0) td:nth(3) div").text();
    ${text4..}  execute javascript  var string = "${overall<30raw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overall<30}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overall<30}
    should be equal  ${overall<30}  ${<30}

sum off all iteams in column On Hold should be equal to number in Total
    ${Onholdraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(4) div:nth(1)").text();
       ${convert}  replace string  ${Onholdraw}  ,  ${EMPTY}
       ${Onhold}  replace string  ${convert}  $  ${EMPTY}
    log  ${Onhold}
    ${overallOnhold}=  execute javascript  return $("#footer tr:nth(0) td:nth(4) div").text();
    ${text4..}  execute javascript  var string = "${overallOnhold}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallOnhold}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallOnhold}
    should be equal  ${overallOnhold}  ${Onhold}
sum off all iteams in column Future should be equal to number in Total
    ${Futureraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(5) div:nth(1)").text();
       ${convert}  replace string  ${Futureraw}  ,  ${EMPTY}
       ${Future}  replace string  ${convert}  $  ${EMPTY}
    log  ${Future}
    ${overallFuture}=  execute javascript  return $("#footer tr:nth(0) td:nth(5) div").text();
    ${text4..}  execute javascript  var string = "${overallFuture}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallFuture}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallFuture}
    should be equal  ${overallFuture}  ${Future}
sum off all iteams in column Total should be equal to number in Total
    ${TOTALraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(6) div:nth(1)").text();
       ${convert}  replace string  ${TOTALraw}  ,  ${EMPTY}
       ${TOTAL}  replace string  ${convert}  $  ${EMPTY}
    log  ${TOTAL}
    ${overallTOTAL}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${text4..}  execute javascript  var string = "${overallTOTAL}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallTOTAL}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallTOTAL}
    should be equal  ${overallTOTAL}  ${TOTAL}

User select Exeption Message view
    click element  ${Button Age Classification}
    sleep  4s
    click element  ${Exception Message}
    sleep  10s
    wait until element is visible  //vaadin-grid[@id='dataTableGrid']//span[contains(normalize-space(), 'Cancellation')]  20s

sum off all iteams in column Cancellation should be equal to number in Overall
     ${cancellationraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(2) div:nth(1)").text();
       ${convert}  replace string  ${cancellationraw}  ,  ${EMPTY}
       ${cancellation}  replace string  ${convert}  $  ${EMPTY}
    log  ${cancellation}
    ${overallCANCraw}=  execute javascript  return $("#footer tr:nth(0) td:nth(2) div").text();
    ${text4..}  execute javascript  var string = "${overallCANCraw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallCANC}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallCANC}
    should be equal  ${overallCANC}  ${cancellation}

sum off all iteams in column Reschedule In should be equal to number in Overall
     ${RescheduleInraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(3) div:nth(1)").text();
       ${convert}  replace string  ${RescheduleInraw}  ,  ${EMPTY}
       ${RescheduleIn}  replace string  ${convert}  $  ${EMPTY}
    log   ${RescheduleIn}
    ${overallRINraw}=  execute javascript  return $("#footer tr:nth(0) td:nth(3) div").text();
    ${text4..}  execute javascript  var string = "${overallRINraw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallRIN}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallRIN}
    should be equal  ${overallRIN}  ${RescheduleIn}

sum off all iteams in column Reschedule Out should be equal to number in Overall
     ${RescheduleOutraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(4) div:nth(1)").text();
       ${convert}  replace string  ${RescheduleOutraw}  ,  ${EMPTY}
       ${RescheduleOut}  replace string  ${convert}  $  ${EMPTY}
    log   ${RescheduleOut}
    ${overallROraw}=  execute javascript  return $("#footer tr:nth(0) td:nth(4) div").text();
    ${text4..}  execute javascript  var string = "${overallROraw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallRO}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallRO}
    should be equal  ${overallRO}  ${RescheduleOut}

sum off all iteams in column No Exception should be equal to number in Overall
     ${NoExceptionraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(5) div:nth(1)").text();
       ${convert}  replace string  ${NoExceptionraw}  ,  ${EMPTY}
       ${NoException}  replace string  ${convert}  $  ${EMPTY}
    log   ${NoException}
    ${overallNEraw}=  execute javascript  return $("#footer tr:nth(0) td:nth(5) div").text();
    ${text4..}  execute javascript  var string = "${overallNEraw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallNE}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallNE}
    should be equal  ${overallNE}  ${NoException}

sum off all iteams in column Other Exceptions should be equal to number in Overall
     ${OtherExceptionsraw}=  execute javascript  return $("#purchaseOrdsHeatMap tr:nth(1) td:nth(6) div:nth(1)").text();
       ${convert}  replace string  ${OtherExceptionsraw}  ,  ${EMPTY}
       ${OtherExceptions}  replace string  ${convert}  $  ${EMPTY}
    log   ${OtherExceptions}
    ${overallOEraw}=  execute javascript  return $("#footer tr:nth(0) td:nth(6) div").text();
    ${text4..}  execute javascript  var string = "${overallOEraw}"; var returnStr = string.split(" ",1); return returnStr;
    log  ${text4..}
       ${convert}  convert to string  ${text4..}
       ${aa}  replace string   ${convert}  [  ${EMPTY}
       ${bb}  replace string   ${aa}  ]  ${EMPTY}
       ${cc}  replace string using regexp  ${bb}  \[a-zA-Z]|\,  ${EMPTY}
       ${dd}  replace string  ${cc}  $  ${EMPTY}
       ${overallOE}  replace string using regexp  ${dd}  \'|\,  ${EMPTY}
    log  ${overallOE}
    should be equal  ${overallOE}  ${OtherExceptions}


User should see heatmap columns in order "${col.1}" col. "${col.2}" col. "${col.3}" col. "${col.4}" col. "${col.5}" col. "${col.6}" col. "${col.7}" col.
         element should be visible  //*[@id='content']/div/span[text()='${col.1}']
         element should be visible  //*[@id='content']/div/span[text()='${col.2}']
         element should be visible  //*[@id='content']/div/span[text()='${col.3}']
         element should be visible  //*[@id='content']/div/span[text()='${col.4}']
         element should be visible  //*[@id='content']/div/span[text()='${col.5}']
         element should be visible  //*[@id='content']/div/span[text()='${col.6}']
         element should be visible  //*[@id='content']/div/span[text()='${col.7}']

Swith view to value($) view also
       wait until element is visible  ${value_tab}  10s
       click element  ${value_tab}
       sleep  6s
