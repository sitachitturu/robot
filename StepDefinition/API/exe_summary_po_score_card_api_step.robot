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
User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(Health care)
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
            log  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${json["scorevalues"]["pord"]["cancel"]}
            log  ${json["scorevalues"]["pord"]["rescin"]}
            log  ${json["scorevalues"]["pord"]["rescout"]}
            log  ${json["scorevalues"]["pord"]["shortcycleper"]}
            log  ${json["scorevalues"]["pord"]["ovdper"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}
            ${api_cancellation}  convert to string  ${json["scorevalues"]["pord"]["cancel"]}
            ${api_cancellation..}  replace string using regexp  ${api_cancellation}  \\$|\,  ${EMPTY}
            ${cancellatios value_api}  execute javascript  var value = `${api_cancellation..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule in}  convert to string  ${json["scorevalues"]["pord"]["rescin"]}
            ${api_reschedule in..}  replace string using regexp  ${api_reschedule in}  \\$|\,  ${EMPTY}
            ${api_reschedule in value}  execute javascript  var value = `${api_reschedule in..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule out}  convert to string  ${json["scorevalues"]["pord"]["rescout"]}
            ${api_reschedule out..}  replace string using regexp  ${api_reschedule out}  \\$|\,  ${EMPTY}
            ${api_reschedule out value}  execute javascript  var value = `${api_reschedule out..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_short_cycle}  convert to string  ${json["scorevalues"]["pord"]["shortcycleper"]}
            ${api_short_cycle..}  replace string using regexp  ${api_short_cycle}  \\%|\,  ${EMPTY}
            ${api_short_cycle value}  execute javascript  var value = `${api_short_cycle..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_overdue}  convert to string  ${json["scorevalues"]["pord"]["ovdper"]}
            ${api_overdue..}  replace string using regexp  ${api_overdue}  \\%|\,  ${EMPTY}
            ${api_overdue value}  execute javascript  var value = `${api_overdue..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            go to  https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io/secure/executive-summary
            sleep  15s
            click element  addFilterBtn
            sleep  2s
            click element  ${business filter from editfilters list}
            wait until element is visible  continue  20s
            click element  continue
            click element  business
            sleep  30s
            click element  product-Healthcare
            click element  ${business_Apply Button}
            sleep  5s
            ${Accuracy Rate text from po score card}  get text  ${Accuracy Rate value}
            log  ${Accuracy Rate text from po score card}
            should be equal  ${apiResults}  ${Accuracy Rate text from po score card}
            log to console  Value in Accuracy Rate from UI FOR Health:[${Accuracy Rate text from po score card}]
            log to console  Value in Accuracy Rate from API FOR Health:[${apiResults}]

            ${cancellatios value from po score card}  get text  ${Cancelaation value score card}
            log  ${cancellatios value from po score card}
            ${cancellatios value from po score card.}  convert to string  ${cancellatios value from po score card}
            ${cancellatios value from po score card..}  replace string using regexp  ${cancellatios value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${cancellatios value from po score card..}
            ${cancellatios value from po score card1..}  execute javascript  var value = `${cancellatios value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${cancellatios value from po score card1..}  ${cancellatios value_api}
            log to console  Value in Cancellation from UI FOR Health:[${cancellatios value from po score card1..}]
            log to console  Value in Cancellation from API FOR Health:[${cancellatios value_api}]

            ${Reschedule in value from po score card}  get text  ${Reschedule In value score card}
            log  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card.}  convert to string  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card..}  replace string using regexp  ${Reschedule in value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule in value from po score card..}
            ${Reschedule in value from po score card1..}  execute javascript  var value = `${Reschedule in value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule in value from po score card1..}  ${api_reschedule in value}
            log to console  Value in Reschedule In from UI FOR Health:[${Reschedule in value from po score card1..}]
            log to console  Value in Reschedule In from API FOR Health:[${api_reschedule in value}]

            ${reschedule out value in po score card}  get text  ${Reschedule Out value score card}
            log  ${reschedule out value in po score card}
            ${Reschedule out value from po score card.}  convert to string  ${Reschedule out value in po score card}
            ${Reschedule out value from po score card..}  replace string using regexp  ${Reschedule out value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule out value from po score card..}
            ${Reschedule out value from po score card1..}  execute javascript  var value = `${Reschedule out value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule out value from po score card1..}  ${api_reschedule out value}
            log to console  Value in Reschedule Out from UI FOR Health:[${Reschedule out value from po score card1..}]
            log to console  Value in Reschedule Out from API FOR Health:[${api_reschedule out value}]

            ${overdue value in po score card}  get text  ${Overdue value score card}
            log  ${overdue value in po score card}
            ${overdue value from po score card.}  convert to string  ${overdue value in po score card}
            ${overdue value from po score card..}  replace string using regexp  ${overdue value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${overdue value from po score card..}
            ${overdue value from po score card1..}  execute javascript  var value = `${overdue value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${overdue value from po score card1..}  ${api_overdue value}
            log to console  Value in overdue from UI FOR Health:[${overdue value from po score card1..}]
            log to console  Value in overdue from API FOR Health:[${api_overdue value}]

            ${short cycle value in po score card}  get text  ${Short Cycle value score card}
            log  ${short cycle value in po score card}
            ${short cycle value from po score card.}  convert to string  ${short cycle value in po score card}
            ${short cycle value from po score card..}  replace string using regexp  ${short cycle value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${short cycle value from po score card..}
            ${short cycle value from po score card1..}  execute javascript  var value = `${short cycle value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${short cycle value from po score card1..}  ${api_short_cycle value}
            log to console  Value in short cycle from UI FOR Health:[${short cycle value from po score card1..}]
            log to console  Value in short cycle from API FOR Health:[${api_short_cycle value}]

clear the selected business from business filters by click clearfilterbtn
           click element  clearFilterBtn
            sleep  2s

Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(MMF)
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
            log  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${json["scorevalues"]["pord"]["cancel"]}
            log  ${json["scorevalues"]["pord"]["rescin"]}
            log  ${json["scorevalues"]["pord"]["rescout"]}
            log  ${json["scorevalues"]["pord"]["shortcycleper"]}
            log  ${json["scorevalues"]["pord"]["ovdper"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}
            ${api_cancellation}  convert to string  ${json["scorevalues"]["pord"]["cancel"]}
            ${api_cancellation..}  replace string using regexp  ${api_cancellation}  \\$|\,  ${EMPTY}
            ${cancellatios value_api}  execute javascript  var value = `${api_cancellation..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule in}  convert to string  ${json["scorevalues"]["pord"]["rescin"]}
            ${api_reschedule in..}  replace string using regexp  ${api_reschedule in}  \\$|\,  ${EMPTY}
            ${api_reschedule in value}  execute javascript  var value = `${api_reschedule in..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule out}  convert to string  ${json["scorevalues"]["pord"]["rescout"]}
            ${api_reschedule out..}  replace string using regexp  ${api_reschedule out}  \\$|\,  ${EMPTY}
            ${api_reschedule out value}  execute javascript  var value = `${api_reschedule out..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_short_cycle}  convert to string  ${json["scorevalues"]["pord"]["shortcycleper"]}
            ${api_short_cycle..}  replace string using regexp  ${api_short_cycle}  \\%|\,  ${EMPTY}
            ${api_short_cycle value}  execute javascript  var value = `${api_short_cycle..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_overdue}  convert to string  ${json["scorevalues"]["pord"]["ovdper"]}
            ${api_overdue..}  replace string using regexp  ${api_overdue}  \\%|\,  ${EMPTY}
            ${api_overdue value}  execute javascript  var value = `${api_overdue..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

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
            ${Accuracy Rate text from po score card}  get text  ${Accuracy Rate value}
            log  ${Accuracy Rate text from po score card}
            should be equal  ${apiResults}  ${Accuracy Rate text from po score card}
            log to console  Value in Accuracy Rate from UI FOR MMF:[${Accuracy Rate text from po score card}]
            log to console  Value in Accuracy Rate from API FOR MMF:[${apiResults}]

            ${cancellatios value from po score card}  get text  ${Cancelaation value score card}
            log  ${cancellatios value from po score card}
            ${cancellatios value from po score card.}  convert to string  ${cancellatios value from po score card}
            ${cancellatios value from po score card..}  replace string using regexp  ${cancellatios value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${cancellatios value from po score card..}
            ${cancellatios value from po score card1..}  execute javascript  var value = `${cancellatios value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${cancellatios value from po score card1..}  ${cancellatios value_api}
            log to console  Value in Cancellation from UI FOR MMF:[${cancellatios value from po score card1..}]
            log to console  Value in Cancellation from API FOR MMF:[${cancellatios value_api}]

            ${Reschedule in value from po score card}  get text  ${Reschedule In value score card}
            log  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card.}  convert to string  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card..}  replace string using regexp  ${Reschedule in value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule in value from po score card..}
            ${Reschedule in value from po score card1..}  execute javascript  var value = `${Reschedule in value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule in value from po score card1..}  ${api_reschedule in value}
            log to console  Value in Reschedule In from UI FOR MMF:[${Reschedule in value from po score card1..}]
            log to console  Value in Reschedule In from API FOR MMF:[${api_reschedule in value}]

            ${reschedule out value in po score card}  get text  ${Reschedule Out value score card}
            log  ${reschedule out value in po score card}
            ${Reschedule out value from po score card.}  convert to string  ${Reschedule out value in po score card}
            ${Reschedule out value from po score card..}  replace string using regexp  ${Reschedule out value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule out value from po score card..}
            ${Reschedule out value from po score card1..}  execute javascript  var value = `${Reschedule out value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule out value from po score card1..}  ${api_reschedule out value}
            log to console  Value in Reschedule Out from UI FOR MMF:[${Reschedule out value from po score card1..}]
            log to console  Value in Reschedule Out from API FOR MMF:[${api_reschedule out value}]

            ${overdue value in po score card}  get text  ${Overdue value score card}
            log  ${overdue value in po score card}
            ${overdue value from po score card.}  convert to string  ${overdue value in po score card}
            ${overdue value from po score card..}  replace string using regexp  ${overdue value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${overdue value from po score card..}
            ${overdue value from po score card1..}  execute javascript  var value = `${overdue value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${overdue value from po score card1..}  ${api_overdue value}
            log to console  Value in overdue from UI FOR MMF:[${overdue value from po score card1..}]
            log to console  Value in overdue from API FOR MMF:[${api_overdue value}]

            ${short cycle value in po score card}  get text  ${Short Cycle value score card}
            log  ${short cycle value in po score card}
            ${short cycle value from po score card.}  convert to string  ${short cycle value in po score card}
            ${short cycle value from po score card..}  replace string using regexp  ${short cycle value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${short cycle value from po score card..}
            ${short cycle value from po score card1..}  execute javascript  var value = `${short cycle value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${short cycle value from po score card1..}  ${api_short_cycle value}
            log to console  Value in short cycle from UI FOR MMF:[${short cycle value from po score card1..}]
            log to console  Value in short cycle from API FOR MMF:[${api_short_cycle value}]

User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(OIL&GAS)
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
            log  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${json["scorevalues"]["pord"]["cancel"]}
            log  ${json["scorevalues"]["pord"]["rescin"]}
            log  ${json["scorevalues"]["pord"]["rescout"]}
            log  ${json["scorevalues"]["pord"]["shortcycleper"]}
            log  ${json["scorevalues"]["pord"]["ovdper"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}
            ${api_cancellation}  convert to string  ${json["scorevalues"]["pord"]["cancel"]}
            ${api_cancellation..}  replace string using regexp  ${api_cancellation}  \\$|\,  ${EMPTY}
            ${cancellatios value_api}  execute javascript  var value = `${api_cancellation..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule in}  convert to string  ${json["scorevalues"]["pord"]["rescin"]}
            ${api_reschedule in..}  replace string using regexp  ${api_reschedule in}  \\$|\,  ${EMPTY}
            ${api_reschedule in value}  execute javascript  var value = `${api_reschedule in..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule out}  convert to string  ${json["scorevalues"]["pord"]["rescout"]}
            ${api_reschedule out..}  replace string using regexp  ${api_reschedule out}  \\$|\,  ${EMPTY}
            ${api_reschedule out value}  execute javascript  var value = `${api_reschedule out..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_short_cycle}  convert to string  ${json["scorevalues"]["pord"]["shortcycleper"]}
            ${api_short_cycle..}  replace string using regexp  ${api_short_cycle}  \\%|\,  ${EMPTY}
            ${api_short_cycle value}  execute javascript  var value = `${api_short_cycle..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_overdue}  convert to string  ${json["scorevalues"]["pord"]["ovdper"]}
            ${api_overdue..}  replace string using regexp  ${api_overdue}  \\%|\,  ${EMPTY}
            ${api_overdue value}  execute javascript  var value = `${api_overdue..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

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
            ${Accuracy Rate text from po score card}  get text  ${Accuracy Rate value}
            log  ${Accuracy Rate text from po score card}
            should be equal  ${apiResults}  ${Accuracy Rate text from po score card}
            log to console  Value in Accuracy Rate from UI FOR oil&gas:[${Accuracy Rate text from po score card}]
            log to console  Value in Accuracy Rate from API FOR oil&gas:[${apiResults}]

            ${cancellatios value from po score card}  get text  ${Cancelaation value score card}
            log  ${cancellatios value from po score card}
            ${cancellatios value from po score card.}  convert to string  ${cancellatios value from po score card}
            ${cancellatios value from po score card..}  replace string using regexp  ${cancellatios value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${cancellatios value from po score card..}
            ${cancellatios value from po score card1..}  execute javascript  var value = `${cancellatios value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${cancellatios value from po score card1..}  ${cancellatios value_api}
            log to console  Value in Cancellation from UI FOR oil&gas:[${cancellatios value from po score card1..}]
            log to console  Value in Cancellation from API FOR oil&gas:[${cancellatios value_api}]

            ${Reschedule in value from po score card}  get text  ${Reschedule In value score card}
            log  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card.}  convert to string  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card..}  replace string using regexp  ${Reschedule in value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule in value from po score card..}
            ${Reschedule in value from po score card1..}  execute javascript  var value = `${Reschedule in value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule in value from po score card1..}  ${api_reschedule in value}
            log to console  Value in Reschedule In from UI FOR oil&gas:[${Reschedule in value from po score card1..}]
            log to console  Value in Reschedule In from API FOR oil&gas:[${api_reschedule in value}]

            ${reschedule out value in po score card}  get text  ${Reschedule Out value score card}
            log  ${reschedule out value in po score card}
            ${Reschedule out value from po score card.}  convert to string  ${Reschedule out value in po score card}
            ${Reschedule out value from po score card..}  replace string using regexp  ${Reschedule out value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule out value from po score card..}
            ${Reschedule out value from po score card1..}  execute javascript  var value = `${Reschedule out value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule out value from po score card1..}  ${api_reschedule out value}
            log to console  Value in Reschedule Out from UI FOR oil&gas:[${Reschedule out value from po score card1..}]
            log to console  Value in Reschedule Out from API FOR oil&gas:[${api_reschedule out value}]

            ${overdue value in po score card}  get text  ${Overdue value score card}
            log  ${overdue value in po score card}
            ${overdue value from po score card.}  convert to string  ${overdue value in po score card}
            ${overdue value from po score card..}  replace string using regexp  ${overdue value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${overdue value from po score card..}
            ${overdue value from po score card1..}  execute javascript  var value = `${overdue value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${overdue value from po score card1..}  ${api_overdue value}
            log to console  Value in overdue from UI FOR oil&gas:[${overdue value from po score card1..}]
            log to console  Value in overdue from API FOR oil&gas:[${api_overdue value}]

            ${short cycle value in po score card}  get text  ${Short Cycle value score card}
            log  ${short cycle value in po score card}
            ${short cycle value from po score card.}  convert to string  ${short cycle value in po score card}
            ${short cycle value from po score card..}  replace string using regexp  ${short cycle value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${short cycle value from po score card..}
            ${short cycle value from po score card1..}  execute javascript  var value = `${short cycle value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${short cycle value from po score card1..}  ${api_short_cycle value}
            log to console  Value in short cycle from UI FOR oil&gas:[${short cycle value from po score card1..}]
            log to console  Value in short cycle from API FOR oil&gas:[${api_short_cycle value}]

User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(POWER)

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
            log  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${json["scorevalues"]["pord"]["cancel"]}
            log  ${json["scorevalues"]["pord"]["rescin"]}
            log  ${json["scorevalues"]["pord"]["rescout"]}
            log  ${json["scorevalues"]["pord"]["shortcycleper"]}
            log  ${json["scorevalues"]["pord"]["ovdper"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}
            ${api_cancellation}  convert to string  ${json["scorevalues"]["pord"]["cancel"]}
            ${api_cancellation..}  replace string using regexp  ${api_cancellation}  \\$|\,  ${EMPTY}
            ${cancellatios value_api}  execute javascript  var value = `${api_cancellation..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule in}  convert to string  ${json["scorevalues"]["pord"]["rescin"]}
            ${api_reschedule in..}  replace string using regexp  ${api_reschedule in}  \\$|\,  ${EMPTY}
            ${api_reschedule in value}  execute javascript  var value = `${api_reschedule in..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule out}  convert to string  ${json["scorevalues"]["pord"]["rescout"]}
            ${api_reschedule out..}  replace string using regexp  ${api_reschedule out}  \\$|\,  ${EMPTY}
            ${api_reschedule out value}  execute javascript  var value = `${api_reschedule out..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_short_cycle}  convert to string  ${json["scorevalues"]["pord"]["shortcycleper"]}
            ${api_short_cycle..}  replace string using regexp  ${api_short_cycle}  \\%|\,  ${EMPTY}
            ${api_short_cycle value}  execute javascript  var value = `${api_short_cycle..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_overdue}  convert to string  ${json["scorevalues"]["pord"]["ovdper"]}
            ${api_overdue..}  replace string using regexp  ${api_overdue}  \\%|\,  ${EMPTY}
            ${api_overdue value}  execute javascript  var value = `${api_overdue..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

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
            ${Accuracy Rate text from po score card}  get text  ${Accuracy Rate value}
            log  ${Accuracy Rate text from po score card}
            should be equal  ${apiResults}  ${Accuracy Rate text from po score card}
            log to console  Value in Accuracy Rate from UI FOR Power:[${Accuracy Rate text from po score card}]
            log to console  Value in Accuracy Rate from API FOR Power:[${apiResults}]

            ${cancellatios value from po score card}  get text  ${Cancelaation value score card}
            log  ${cancellatios value from po score card}
            ${cancellatios value from po score card.}  convert to string  ${cancellatios value from po score card}
            ${cancellatios value from po score card..}  replace string using regexp  ${cancellatios value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${cancellatios value from po score card..}
            ${cancellatios value from po score card1..}  execute javascript  var value = `${cancellatios value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${cancellatios value from po score card1..}  ${cancellatios value_api}
            log to console  Value in Cancellation from UI FOR Power:[${cancellatios value from po score card1..}]
            log to console  Value in Cancellation from API FOR Power:[${cancellatios value_api}]

            ${Reschedule in value from po score card}  get text  ${Reschedule In value score card}
            log  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card.}  convert to string  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card..}  replace string using regexp  ${Reschedule in value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule in value from po score card..}
            ${Reschedule in value from po score card1..}  execute javascript  var value = `${Reschedule in value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule in value from po score card1..}  ${api_reschedule in value}
            log to console  Value in Reschedule In from UI FOR Power:[${Reschedule in value from po score card1..}]
            log to console  Value in Reschedule In from API FOR Power:[${api_reschedule in value}]

            ${reschedule out value in po score card}  get text  ${Reschedule Out value score card}
            log  ${reschedule out value in po score card}
            ${Reschedule out value from po score card.}  convert to string  ${Reschedule out value in po score card}
            ${Reschedule out value from po score card..}  replace string using regexp  ${Reschedule out value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule out value from po score card..}
            ${Reschedule out value from po score card1..}  execute javascript  var value = `${Reschedule out value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule out value from po score card1..}  ${api_reschedule out value}
            log to console  Value in Reschedule Out from UI FOR Power:[${Reschedule out value from po score card1..}]
            log to console  Value in Reschedule Out from API FOR Power:[${api_reschedule out value}]

            ${overdue value in po score card}  get text  ${Overdue value score card}
            log  ${overdue value in po score card}
            ${overdue value from po score card.}  convert to string  ${overdue value in po score card}
            ${overdue value from po score card..}  replace string using regexp  ${overdue value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${overdue value from po score card..}
            ${overdue value from po score card1..}  execute javascript  var value = `${overdue value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${overdue value from po score card1..}  ${api_overdue value}
            log to console  Value in overdue from UI FOR Power:[${overdue value from po score card1..}]
            log to console  Value in overdue from API FOR Power:[${api_overdue value}]

            ${short cycle value in po score card}  get text  ${Short Cycle value score card}
            log  ${short cycle value in po score card}
            ${short cycle value from po score card.}  convert to string  ${short cycle value in po score card}
            ${short cycle value from po score card..}  replace string using regexp  ${short cycle value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${short cycle value from po score card..}
            ${short cycle value from po score card1..}  execute javascript  var value = `${short cycle value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${short cycle value from po score card1..}  ${api_short_cycle value}
            log to console  Value in short cycle from UI FOR Power:[${short cycle value from po score card1..}]
            log to console  Value in short cycle from API FOR Power:[${api_short_cycle value}]

User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(Renewables)

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
            log  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${json["scorevalues"]["pord"]["cancel"]}
            log  ${json["scorevalues"]["pord"]["rescin"]}
            log  ${json["scorevalues"]["pord"]["rescout"]}
            log  ${json["scorevalues"]["pord"]["shortcycleper"]}
            log  ${json["scorevalues"]["pord"]["ovdper"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}
            ${api_cancellation}  convert to string  ${json["scorevalues"]["pord"]["cancel"]}
            ${api_cancellation..}  replace string using regexp  ${api_cancellation}  \\$|\,  ${EMPTY}
            ${cancellatios value_api}  execute javascript  var value = `${api_cancellation..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule in}  convert to string  ${json["scorevalues"]["pord"]["rescin"]}
            ${api_reschedule in..}  replace string using regexp  ${api_reschedule in}  \\$|\,  ${EMPTY}
            ${api_reschedule in value}  execute javascript  var value = `${api_reschedule in..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule out}  convert to string  ${json["scorevalues"]["pord"]["rescout"]}
            ${api_reschedule out..}  replace string using regexp  ${api_reschedule out}  \\$|\,  ${EMPTY}
            ${api_reschedule out value}  execute javascript  var value = `${api_reschedule out..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_short_cycle}  convert to string  ${json["scorevalues"]["pord"]["shortcycleper"]}
            ${api_short_cycle..}  replace string using regexp  ${api_short_cycle}  \\%|\,  ${EMPTY}
            ${api_short_cycle value}  execute javascript  var value = `${api_short_cycle..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_overdue}  convert to string  ${json["scorevalues"]["pord"]["ovdper"]}
            ${api_overdue..}  replace string using regexp  ${api_overdue}  \\%|\,  ${EMPTY}
            ${api_overdue value}  execute javascript  var value = `${api_overdue..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

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
            ${Accuracy Rate text from po score card}  get text  ${Accuracy Rate value}
            log  ${Accuracy Rate text from po score card}
            should be equal  ${apiResults}  ${Accuracy Rate text from po score card}
            log to console  Value in Accuracy Rate from UI FOR Renewables:[${Accuracy Rate text from po score card}]
            log to console  Value in Accuracy Rate from API FOR Renewables:[${apiResults}]

            ${cancellatios value from po score card}  get text  ${Cancelaation value score card}
            log  ${cancellatios value from po score card}
            ${cancellatios value from po score card.}  convert to string  ${cancellatios value from po score card}
            ${cancellatios value from po score card..}  replace string using regexp  ${cancellatios value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${cancellatios value from po score card..}
            ${cancellatios value from po score card1..}  execute javascript  var value = `${cancellatios value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${cancellatios value from po score card1..}  ${cancellatios value_api}
            log to console  Value in Cancellation from UI FOR Renewables:[${cancellatios value from po score card1..}]
            log to console  Value in Cancellation from API FOR Renewables:[${cancellatios value_api}]

            ${Reschedule in value from po score card}  get text  ${Reschedule In value score card}
            log  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card.}  convert to string  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card..}  replace string using regexp  ${Reschedule in value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule in value from po score card..}
            ${Reschedule in value from po score card1..}  execute javascript  var value = `${Reschedule in value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule in value from po score card1..}  ${api_reschedule in value}
            log to console  Value in Reschedule In from UI FOR Renewables:[${Reschedule in value from po score card1..}]
            log to console  Value in Reschedule In from API FOR Renewables:[${api_reschedule in value}]

            ${reschedule out value in po score card}  get text  ${Reschedule Out value score card}
            log  ${reschedule out value in po score card}
            ${Reschedule out value from po score card.}  convert to string  ${Reschedule out value in po score card}
            ${Reschedule out value from po score card..}  replace string using regexp  ${Reschedule out value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule out value from po score card..}
            ${Reschedule out value from po score card1..}  execute javascript  var value = `${Reschedule out value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule out value from po score card1..}  ${api_reschedule out value}
            log to console  Value in Reschedule Out from UI FOR Renewables:[${Reschedule out value from po score card1..}]
            log to console  Value in Reschedule Out from API FOR Renewables:[${api_reschedule out value}]

            ${overdue value in po score card}  get text  ${Overdue value score card}
            log  ${overdue value in po score card}
            ${overdue value from po score card.}  convert to string  ${overdue value in po score card}
            ${overdue value from po score card..}  replace string using regexp  ${overdue value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${overdue value from po score card..}
            ${overdue value from po score card1..}  execute javascript  var value = `${overdue value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${overdue value from po score card1..}  ${api_overdue value}
            log to console  Value in overdue from UI FOR Renewables:[${overdue value from po score card1..}]
            log to console  Value in overdue from API FOR Renewables:[${api_overdue value}]

            ${short cycle value in po score card}  get text  ${Short Cycle value score card}
            log  ${short cycle value in po score card}
            ${short cycle value from po score card.}  convert to string  ${short cycle value in po score card}
            ${short cycle value from po score card..}  replace string using regexp  ${short cycle value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${short cycle value from po score card..}
            ${short cycle value from po score card1..}  execute javascript  var value = `${short cycle value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${short cycle value from po score card1..}  ${api_short_cycle value}
            log to console  Value in short cycle from UI FOR Renewables:[${short cycle value from po score card1..}]
            log to console  Value in short cycle from API FOR Renewables:[${api_short_cycle value}]

User should see right number for Accuracy Rate,cancellations,reschedule in, reschedule out,Overdue,Short Cycle in purchase orders score card for business(Transportation)

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
            log  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${json["scorevalues"]["pord"]["cancel"]}
            log  ${json["scorevalues"]["pord"]["rescin"]}
            log  ${json["scorevalues"]["pord"]["rescout"]}
            log  ${json["scorevalues"]["pord"]["shortcycleper"]}
            log  ${json["scorevalues"]["pord"]["ovdper"]}
            [Return]  ${resp}
            ${convert}  convert to string  ${json["scorevalues"]["pord"]["poacc"]}
            log  ${convert}
            ${apiResults}  replace string using regexp  ${convert}  \\%|\,  ${EMPTY}
            log  ${apiResults}
            ${api_cancellation}  convert to string  ${json["scorevalues"]["pord"]["cancel"]}
            ${api_cancellation..}  replace string using regexp  ${api_cancellation}  \\$|\,  ${EMPTY}
            ${cancellatios value_api}  execute javascript  var value = `${api_cancellation..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule in}  convert to string  ${json["scorevalues"]["pord"]["rescin"]}
            ${api_reschedule in..}  replace string using regexp  ${api_reschedule in}  \\$|\,  ${EMPTY}
            ${api_reschedule in value}  execute javascript  var value = `${api_reschedule in..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_reschedule out}  convert to string  ${json["scorevalues"]["pord"]["rescout"]}
            ${api_reschedule out..}  replace string using regexp  ${api_reschedule out}  \\$|\,  ${EMPTY}
            ${api_reschedule out value}  execute javascript  var value = `${api_reschedule out..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_short_cycle}  convert to string  ${json["scorevalues"]["pord"]["shortcycleper"]}
            ${api_short_cycle..}  replace string using regexp  ${api_short_cycle}  \\%|\,  ${EMPTY}
            ${api_short_cycle value}  execute javascript  var value = `${api_short_cycle..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

            ${api_overdue}  convert to string  ${json["scorevalues"]["pord"]["ovdper"]}
            ${api_overdue..}  replace string using regexp  ${api_overdue}  \\%|\,  ${EMPTY}
            ${api_overdue value}  execute javascript  var value = `${api_overdue..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;

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
            ${Accuracy Rate text from po score card}  get text  ${Accuracy Rate value}
            log  ${Accuracy Rate text from po score card}
            should be equal  ${apiResults}  ${Accuracy Rate text from po score card}
            log to console  Value in Accuracy Rate from UI FOR Transportation:[${Accuracy Rate text from po score card}]
            log to console  Value in Accuracy Rate from API FOR Transportation:[${apiResults}]

            ${cancellatios value from po score card}  get text  ${Cancelaation value score card}
            log  ${cancellatios value from po score card}
            ${cancellatios value from po score card.}  convert to string  ${cancellatios value from po score card}
            ${cancellatios value from po score card..}  replace string using regexp  ${cancellatios value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${cancellatios value from po score card..}
            ${cancellatios value from po score card1..}  execute javascript  var value = `${cancellatios value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${cancellatios value from po score card1..}  ${cancellatios value_api}
            log to console  Value in Cancellation from UI FOR Transportation:[${cancellatios value from po score card1..}]
            log to console  Value in Cancellation from API FOR Transportation:[${cancellatios value_api}]

            ${Reschedule in value from po score card}  get text  ${Reschedule In value score card}
            log  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card.}  convert to string  ${Reschedule in value from po score card}
            ${Reschedule in value from po score card..}  replace string using regexp  ${Reschedule in value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule in value from po score card..}
            ${Reschedule in value from po score card1..}  execute javascript  var value = `${Reschedule in value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule in value from po score card1..}  ${api_reschedule in value}
            log to console  Value in Reschedule In from UI FOR Transportation:[${Reschedule in value from po score card1..}]
            log to console  Value in Reschedule In from API FOR Transportation:[${api_reschedule in value}]

            ${reschedule out value in po score card}  get text  ${Reschedule Out value score card}
            log  ${reschedule out value in po score card}
            ${Reschedule out value from po score card.}  convert to string  ${Reschedule out value in po score card}
            ${Reschedule out value from po score card..}  replace string using regexp  ${Reschedule out value from po score card.}  \\$|\,  ${EMPTY}
            ${tup1}  set variable  ${Reschedule out value from po score card..}
            ${Reschedule out value from po score card1..}  execute javascript  var value = `${Reschedule out value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${Reschedule out value from po score card1..}  ${api_reschedule out value}
            log to console  Value in Reschedule Out from UI FOR Transportation:[${Reschedule out value from po score card1..}]
            log to console  Value in Reschedule Out from API FOR Transportation:[${api_reschedule out value}]

            ${overdue value in po score card}  get text  ${Overdue value score card}
            log  ${overdue value in po score card}
            ${overdue value from po score card.}  convert to string  ${overdue value in po score card}
            ${overdue value from po score card..}  replace string using regexp  ${overdue value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${overdue value from po score card..}
            ${overdue value from po score card1..}  execute javascript  var value = `${overdue value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${overdue value from po score card1..}  ${api_overdue value}
            log to console  Value in overdue from UI FOR Transportation:[${overdue value from po score card1..}]
            log to console  Value in overdue from API FOR Transportation:[${api_overdue value}]

            ${short cycle value in po score card}  get text  ${Short Cycle value score card}
            log  ${short cycle value in po score card}
            ${short cycle value from po score card.}  convert to string  ${short cycle value in po score card}
            ${short cycle value from po score card..}  replace string using regexp  ${short cycle value from po score card.}  \\%|\,  ${EMPTY}
            ${tup1}  set variable  ${short cycle value from po score card..}
            ${short cycle value from po score card1..}  execute javascript  var value = `${short cycle value from po score card..}`; if(value.includes('MM')){ value =  value.replace('MM', '');} else if(value.includes('K')){ value =  value.replace('K', '');} else if(value.includes('B')){ value = value.replace('B', '');}; if(value == '0'){return '0';} return value;
            should be equal as numbers  ${short cycle value from po score card1..}  ${api_short_cycle value}
            log to console  Value in short cycle from UI FOR Transportation:[${short cycle value from po score card1..}]
            log to console  Value in short cycle from API FOR Transportation:[${api_short_cycle value}]