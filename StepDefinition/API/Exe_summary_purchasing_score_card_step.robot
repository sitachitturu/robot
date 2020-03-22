*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Library  DatabaseLibrary
Library  RequestsLibrary
Library  Process
Resource  ../../Variables/VariablesCommon/common_variables.robot
Resource  ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User should see right number for On-Time PR in purchase requisitions score card for business(Health care)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getExcSummary?business=%5B%22Healthcare%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["scorevalues"]["prscore"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["prscore"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}

            go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/executive-summary
            sleep  10s
            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  2s
            click element  product-Healthcare
            click element  ${business_Apply Button}
            sleep  5s
            ${ontime_pr text from pr score card}  get text  ${value_on-time-po}
            log  ${ontime_pr text from pr score card}
            should be equal  ${apiResults}  ${ontime_pr text from pr score card}
            log to console  Value in ON-TIME PR from UI FOR Health:[${ontime_pr text from pr score card}]
            log to console  Value in ON-TIME PR from API FOR Health:[${apiResults}]

User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (Health care)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getPurchaseReqsExcSummaryData?business=%5B%22Healthcare%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["NoSource"]}
            log  ${json["avgdays"]}
            [Return]  ${resp}

            ${no-source}  get text  //*[@id="actionStat"]
            ${no-source_%}  replace string  ${no-source}  %  ${EMPTY}
            log  ${no-source_%}
            should be equal  ${no-source_%}  ${json["NoSource"]}
            log to console  Value in No Source from UI:[${no-source_%}]
            log to console  Value in No Source from API:[${json["NoSource"]}]
            ${Avg ovd days}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
            ${Avg ovd days..}  replace string  ${Avg ovd days}  days  ${EMPTY}
            log  ${Avg ovd days..}
            should be equal  ${Avg ovd days..}  ${json["avgdays"]}
            log to console  Value in AVG OVD DAYS from UI FOR Health:[${Avg ovd days..}]
            log to console  Value in AVG OVD DAYS from API FOR Health:[${json["avgdays"]}]

User should see right number for On-Time PR in purchase requisitions score card for business(MMF)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getExcSummary?business=%5B%22MMF%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["scorevalues"]["prscore"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["prscore"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}

            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  2s
            click element  product-MMF
            click element  ${business_Apply Button}
            sleep  5s
            ${ontime_pr text from pr score card}  get text  ${value_on-time-po}
            log  ${ontime_pr text from pr score card}
            should be equal  ${apiResults}  ${ontime_pr text from pr score card}
            log to console  Value in ON-TIME PR from UI FOR MMF:[${ontime_pr text from pr score card}]
            log to console  Value in ON-TIME PR from API FOR MMF:[${apiResults}]

User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (MMF)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getPurchaseReqsExcSummaryData?business=%5B%22MMF%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["NoSource"]}
            log  ${json["avgdays"]}
            [Return]  ${resp}

            ${no-source}  get text  //*[@id="actionStat"]
            ${no-source_%}  replace string  ${no-source}  %  ${EMPTY}
            log  ${no-source_%}
            should be equal  ${no-source_%}  ${json["NoSource"]}
            log to console  Value in No Source from UI:[${no-source_%}]
            log to console  Value in No Source from API:[${json["NoSource"]}]
            ${Avg ovd days}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
            ${Avg ovd days..}  replace string  ${Avg ovd days}  days  ${EMPTY}
            log  ${Avg ovd days..}
            should be equal  ${Avg ovd days..}  ${json["avgdays"]}
            log to console  Value in AVG OVD DAYS from UI FOR MMF:[${Avg ovd days..}]
            log to console  Value in AVG OVD DAYS from API FOR MMF:[${json["avgdays"]}]

User should see right number for On-Time PR in purchase requisitions score card for business(OIL&GAS)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getExcSummary?business=%5B%22O%26G%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["scorevalues"]["prscore"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["prscore"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}

            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  2s
            click element  product-O&G
            click element  ${business_Apply Button}
            sleep  5s
            ${ontime_pr text from pr score card}  get text  ${value_on-time-po}
            log  ${ontime_pr text from pr score card}
            should be equal as numbers  ${apiResults}  ${ontime_pr text from pr score card}
            log to console  Value in ON-TIME PR from UI FOR OIL&GAS:[${ontime_pr text from pr score card}]
            log to console  Value in ON-TIME PR from API FOR OIL&GAS:[${apiResults}]

User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (OIL&GAS)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getPurchaseReqsExcSummaryData?business=%5B%22O%26G%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["NoSource"]}
            log  ${json["avgdays"]}
            [Return]  ${resp}

            ${no-source}  get text  //*[@id="actionStat"]
            ${no-source_%}  replace string  ${no-source}  %  ${EMPTY}
            log  ${no-source_%}
            should be equal  ${no-source_%}  ${json["NoSource"]}
            log to console  Value in No Source from UI:[${no-source_%}]
            log to console  Value in No Source from API:[${json["NoSource"]}]
            ${Avg ovd days}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
            ${Avg ovd days..}  replace string  ${Avg ovd days}  days  ${EMPTY}
            log  ${Avg ovd days..}
            should be equal as numbers  ${Avg ovd days..}  ${json["avgdays"]}
            log to console  Value in AVG OVD DAYS from UI FOR MMF:[${Avg ovd days..}]
            log to console  Value in AVG OVD DAYS from API FOR MMF:[${json["avgdays"]}]

User should see right number for On-Time PR in purchase requisitions score card for business(POWER)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getExcSummary?business=%5B%22Power%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["scorevalues"]["prscore"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["prscore"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}

            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  2s
            click element  product-Power
            click element  ${business_Apply Button}
            sleep  5s
            ${ontime_pr text from pr score card}  get text  ${value_on-time-po}
            log  ${ontime_pr text from pr score card}
            should be equal as numbers  ${apiResults}  ${ontime_pr text from pr score card}
            log to console  Value in ON-TIME PR from UI FOR OIL&GAS:[${ontime_pr text from pr score card}]
            log to console  Value in ON-TIME PR from API FOR OIL&GAS:[${apiResults}]

User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (POWER)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getPurchaseReqsExcSummaryData?business=%5B%22Power%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["NoSource"]}
            log  ${json["avgdays"]}
            [Return]  ${resp}

            ${no-source}  get text  //*[@id="actionStat"]
            ${no-source_%}  replace string  ${no-source}  %  ${EMPTY}
            log  ${no-source_%}
            should be equal  ${no-source_%}  ${json["NoSource"]}
            log to console  Value in No Source from UI:[${no-source_%}]
            log to console  Value in No Source from API:[${json["NoSource"]}]
            ${Avg ovd days}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
            ${Avg ovd days..}  replace string  ${Avg ovd days}  days  ${EMPTY}
            log  ${Avg ovd days..}
            should be equal as numbers  ${Avg ovd days..}  ${json["avgdays"]}
            log to console  Value in AVG OVD DAYS from UI FOR MMF:[${Avg ovd days..}]
            log to console  Value in AVG OVD DAYS from API FOR MMF:[${json["avgdays"]}]

User should see right number for On-Time PR in purchase requisitions score card for business(Renewables)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getExcSummary?business=%5B%22Renewables%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["scorevalues"]["prscore"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["prscore"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}

            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  2s
            click element  product-Renewables
            click element  ${business_Apply Button}
            sleep  5s
            ${ontime_pr text from pr score card}  get text  ${value_on-time-po}
            log  ${ontime_pr text from pr score card}
            should be equal as numbers  ${apiResults}  ${ontime_pr text from pr score card}
            log to console  Value in ON-TIME PR from UI FOR OIL&GAS:[${ontime_pr text from pr score card}]
            log to console  Value in ON-TIME PR from API FOR OIL&GAS:[${apiResults}]

User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (Renewables)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getPurchaseReqsExcSummaryData?business=%5B%22Renewables%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["NoSource"]}
            log  ${json["avgdays"]}
            [Return]  ${resp}

            ${no-source}  get text  //*[@id="actionStat"]
            ${no-source_%}  replace string  ${no-source}  %  ${EMPTY}
            log  ${no-source_%}
            should be equal  ${no-source_%}  ${json["NoSource"]}
            log to console  Value in No Source from UI:[${no-source_%}]
            log to console  Value in No Source from API:[${json["NoSource"]}]
            ${Avg ovd days}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
            ${Avg ovd days..}  replace string  ${Avg ovd days}  days  ${EMPTY}
            log  ${Avg ovd days..}
            should be equal as numbers  ${Avg ovd days..}  ${json["avgdays"]}
            log to console  Value in AVG OVD DAYS from UI FOR MMF:[${Avg ovd days..}]
            log to console  Value in AVG OVD DAYS from API FOR MMF:[${json["avgdays"]}]

User should see right number for On-Time PR in purchase requisitions score card for business(Transportation)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getExcSummary?business=%5B%22Transportation%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["scorevalues"]["prscore"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["prscore"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}

            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  2s
            click element  product-Transportation
            click element  ${business_Apply Button}
            sleep  5s
            ${ontime_pr text from pr score card}  get text  ${value_on-time-po}
            log  ${ontime_pr text from pr score card}
            should be equal as numbers  ${apiResults}  ${ontime_pr text from pr score card}
            log to console  Value in ON-TIME PR from UI FOR OIL&GAS:[${ontime_pr text from pr score card}]
            log to console  Value in ON-TIME PR from API FOR OIL&GAS:[${apiResults}]

clear the selected business from business filters by click clearfilterbtn
           click element  clearFilterBtn
            sleep  2s

User should see right number for No Source,Avg OVD Days in purchase requisitions score card for business (Transportation)
            ${token}  run  ${api_token}
            log to console  ${token}
            ${AccessToken1}  fetch from right  ${token}  {"access_token":"
            ${AccessToken}  fetch from left  ${AccessToken1}  ","token_type"
            ${AccessToken}  catenate  Bearer   ${AccessToken}
            log to console  Got Access Token: ${AccessToken}
            Create Session  MySession  ${environment_url}  #By DEfault It will run UAT ,if You want any otherenv. plz change url in common variables
            ${headers}  Create Dictionary  Authorization=${AccessToken}
            sleep  5s
            ${time1}  get time
            log  ${time1}
            ${resp}  Get Request  MySession  /secure/api/v1/getPurchaseReqsExcSummaryData?business=%5B%22Transportation%22%5D  headers=${headers}
            log to console  ${resp}
            ${time2}  get time
            log  ${time2}
            log to console  Response------ ${resp.text}
            ${json}=  evaluate  json.loads('''${resp.text}''')  json
            log  ${json}
            log  ${json["NoSource"]}
            log  ${json["avgdays"]}
            [Return]  ${resp}

            ${no-source}  get text  //*[@id="actionStat"]
            ${no-source_%}  replace string  ${no-source}  %  ${EMPTY}
            log  ${no-source_%}
            should be equal  ${no-source_%}  ${json["NoSource"]}
            log to console  Value in No Source from UI:[${no-source_%}]
            log to console  Value in No Source from API:[${json["NoSource"]}]
            ${Avg ovd days}  get text  //mo-purchase-req/div/div[2]/div/div[2]/mo-bar/div/div/div[2]/span[2]
            ${Avg ovd days..}  replace string  ${Avg ovd days}  days  ${EMPTY}
            log  ${Avg ovd days..}
            SHOULD BE EQUAL AS NUMBERS  ${Avg ovd days..}  ${json["avgdays"]}
            log to console  Value in AVG OVD DAYS from UI FOR MMF:[${Avg ovd days..}]
            log to console  Value in AVG OVD DAYS from API FOR MMF:[${json["avgdays"]}]