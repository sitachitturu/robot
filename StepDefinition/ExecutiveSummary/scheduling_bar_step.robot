*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource   ../../Variables/VariablesExecutiveSummary/executive_summary_variables.robot

*** Keywords ***
User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules
#geting values from executiove summary
    click element  ${Executive-Summary Iicon}
    sleep  20s
    wait until element does not contain  ${MoScheduling Accuracy}  --  30s
    ${executive}  get text  ${MoScheduling Accuracy}
    set global variable  ${executive}
    ${schedulingc}  get text  //div[@id='div4']//mo-block-bar[@title='Cancellations']//span[@id='expStat']
    set global variable  ${schedulingc}
    ${schedulingIn}  get text  //div[@id='div4']//mo-block-bar[@title='Reschedule In']//span[@id='expStat']
    set global variable  ${schedulingIn}
    ${schedulingOut}  get text  //div[@id='div4']//mo-block-bar[@title='Reschedule Out']//span[@id='expStat']
    set global variable  ${schedulingOut}
    ${schedulingOverdue}  get text  //div[@id='div4']//mo-block-bar[@title='Overdue']//span[@id='expStat']
    set global variable  ${schedulingOverdue}
    click element  ${scheduling icon}
    sleep  20s
    ${Accuracy}  get text  accuracy_text
    set global variable  ${Accuracy}
    ${Cancel}  get text  xpath=//*[@id='cancel_process']/following-sibling::p[1]
    set global variable  ${Cancel}
    ${RescheduleIn}  get text  xpath=//*[@id='schedule_in']/following-sibling::p[1]
    set global variable  ${RescheduleIn}
    ${RescheduleOut}  get text  xpath=//*[@id='schedule_out']/following-sibling::p[1]
    set global variable  ${RescheduleOut}
    ${Overdue}  get text  xpath=//*[@id='overdue']/following-sibling::p[1]
    set global variable  ${Overdue}
    click element  xpath=//div[@id='tabsContainer']//paper-tab[@role='tab']//div[contains(normalize-space(), 'Projects')]
    sleep  10s
    ${AccuracyProjects}  get text  //mo-metrics-plot[2]//p[@id='accuracy_text']
    set global variable  ${AccuracyProjects}
    ${CancelProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p
    set global variable  ${CancelProjects}
    ${RescheduleInProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p[2]
    set global variable  ${RescheduleInProjects}
    ${RescheduleOutProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p[3]
    set global variable  ${RescheduleOutProjects}
    ${OverdueProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p[4]
    set global variable  ${OverdueProjects}

    log to console  Value in scheduling bar: [${executive}]
    ${product_count}  execute javascript  var string = "${Accuracy}"; var returnStr = string.split(' ')[0]; return returnStr;
    ${product_count..}  replace string   ${product_count}  ,  ${EMPTY}
    log to console  ${product_count..}
    ${product_count2}  execute javascript  var string = "${Accuracy}"; var returnStr = string.split(' ')[3]; return returnStr;
    ${product_count2..}  replace string   ${product_count2}  ,  ${EMPTY}
    log to console  ${product_count2..}
    ${projects_count}  execute javascript  var string = "${AccuracyProjects}"; var returnStr = string.split(' ')[0]; return returnStr;
    ${projects_count..}  replace string   ${projects_count}  ,  ${EMPTY}
    log to console  ${projects_count..}
    ${projects_count2}  execute javascript  var string = "${AccuracyProjects}"; var returnStr = string.split(' ')[3]; return returnStr;
    ${projects_count2..}  replace string   ${projects_count2}  ,  ${EMPTY}
    log to console  ${projects_count2..}
    ${schedule_accuracy1}=  evaluate  ${product_count..}+${projects_count..}
    set global variable  ${schedule_accuracy1}
    convert to number  ${schedule_accuracy1}
    ${schedule_accuracy2}=  evaluate  ${product_count2..}+${projects_count2..}
    set global variable  ${schedule_accuracy2}
    convert to number  ${schedule_accuracy2}
    ${schedule_accuracy3}=  execute javascript  var x = `${schedule_accuracy1}`;var y = `${schedule_accuracy2}`;var z = ((x / y)*100); return z
    log to console  ${schedule_accuracy3}
    ${schedule_accuracy4}  convert to number  ${schedule_accuracy3}  1
    ${schedule_accuracy5}  convert to string  ${schedule_accuracy4}
    should be equal  ${schedule_accuracy5}  ${executive}


User should see same "Cancellations" in Executive Summary and Scheduling modules "cancel_process"
    log to console  Value in scheduling bar: [${schedulingc}]
    ${product_count}  execute javascript  var string = "${Cancel}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${product_count..}  replace string using regexp  ${product_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${product_count..}
    ${projects_count}  execute javascript  var string = "${CancelProjects}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${projects_count..}  replace string using regexp  ${projects_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${projects_count..}
    ${scheduling value}  evaluate  ${projects_count..} + ${product_count..}
    ${schedulingCA}=  execute javascript  var x = `${scheduling value}`;var y = `${schedule_accuracy2}`;var z = ((x / y)*100); return z
    ${schedulingCA1}  convert to number  ${schedulingCA}  1
    should be equal  ${schedulingCA1}%  ${schedulingc}

User should see same "Reschedule In" in Executive Summary and Scheduling modules "schedule_in"
    log to console  Value in scheduling bar: [${schedulingIn}]
    ${product_count}  execute javascript  var string = "${RescheduleIn}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${product_count..}  replace string using regexp  ${product_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${product_count..}
    ${projects_count}  execute javascript  var string = "${RescheduleInProjects}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${projects_count..}  replace string using regexp  ${projects_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${projects_count..}
    ${scheduling value}  evaluate  ${projects_count..} + ${product_count..}
    ${schedulingINN}=  execute javascript  var x = `${scheduling value}`;var y = `${schedule_accuracy2}`;var z = ((x / y)*100); return z
    ${schedulingINN1}  convert to number  ${schedulingINN}  1
    should be equal  ${schedulingINN1}%  ${schedulingIn}

User should see same "Reschedule Out" in Executive Summary and Scheduling modules "schedule_out"
    log to console  Value in scheduling bar: [${schedulingOut}]
    ${product_count}  execute javascript  var string = "${RescheduleOut}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${product_count..}  replace string using regexp  ${product_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${product_count..}
    ${projects_count}  execute javascript  var string = "${RescheduleOutProjects}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${projects_count..}  replace string using regexp  ${projects_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${projects_count..}
    ${scheduling value}  evaluate  ${projects_count..} + ${product_count..}
    ${schedulingOUTT}=  execute javascript  var x = `${scheduling value}`;var y = `${schedule_accuracy2}`;var z = ((x / y)*100); return z
    ${schedulingOUTT1}  convert to number  ${schedulingOUTT}  1
    should be equal  ${schedulingOUTT1}%  ${schedulingOut}

User should see same "Overdue" in Executive Summary and Scheduling modules "overdue"
    log to console  Value in scheduling bar: [${schedulingOverdue}]
    ${product_count}  execute javascript  var string = "${Overdue}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${product_count..}  replace string using regexp  ${product_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${product_count..}
    ${projects_count}  execute javascript  var string = "${OverdueProjects}"; var returnStr = string.split(' ')[1]; return returnStr;
    ${projects_count..}  replace string using regexp  ${projects_count}  \\(|\,|\\)  ${EMPTY}
    log to console  ${projects_count..}
    ${scheduling value}  evaluate  ${projects_count..} + ${product_count..}
    ${schedulingOVERDUEE}=  execute javascript  var x = `${scheduling value}`;var y = `${schedule_accuracy2}`;var z = ((x / y)*100); return z
    ${schedulingOVERDUEE1}  convert to number  ${schedulingOVERDUEE}  1
    should be equal  ${schedulingOVERDUEE1}%  ${schedulingOverdue}

User should see same Schedule Accuracy rate in Executive Summary and Scheduling modules for business "${text}"
#geting values from executiove summary
    wait until element does not contain  ${MoScheduling Accuracy}  --  30s
    ${executive}  get text  ${MoScheduling Accuracy}
    set global variable  ${executive}
    ${schedulingc}  get text  //div[@id='div4']//mo-block-bar[@title='Cancellations']//span[@id='expStat']
    set global variable  ${schedulingc}
    ${schedulingIn}  get text  //div[@id='div4']//mo-block-bar[@title='Reschedule In']//span[@id='expStat']
    set global variable  ${schedulingIn}
    ${schedulingOut}  get text  //div[@id='div4']//mo-block-bar[@title='Reschedule Out']//span[@id='expStat']
    set global variable  ${schedulingOut}
    ${schedulingOverdue}  get text  //div[@id='div4']//mo-block-bar[@title='Overdue']//span[@id='expStat']
    set global variable  ${schedulingOverdue}
    click element  ${scheduling icon}
    sleep  20s

    click element  addFilterBtn
    sleep  2s
    click element  ${business filter from editfilters list}
    wait until element is visible  continue  20s
    click element  continue
    click element  business
    sleep  2s
    click element  product-${text}
    click element  ${business_Apply Button}
    sleep  5s
    ${Accuracy}  get text  accuracy_text
    set global variable  ${Accuracy}
    ${Cancel}  get text  xpath=//*[@id='cancel_process']/following-sibling::p[1]
    set global variable  ${Cancel}
    ${RescheduleIn}  get text  xpath=//*[@id='schedule_in']/following-sibling::p[1]
    set global variable  ${RescheduleIn}
    ${RescheduleOut}  get text  xpath=//*[@id='schedule_out']/following-sibling::p[1]
    set global variable  ${RescheduleOut}
    ${Overdue}  get text  xpath=//*[@id='overdue']/following-sibling::p[1]
    set global variable  ${Overdue}
    click element  xpath=//div[@id='tabsContainer']//paper-tab[@role='tab']//div[contains(normalize-space(), 'Projects')]
    sleep  10s
    ${AccuracyProjects}  get text  //mo-metrics-plot[2]//p[@id='accuracy_text']
    set global variable  ${AccuracyProjects}
    ${CancelProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p
    set global variable  ${CancelProjects}
    ${RescheduleInProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p[2]
    set global variable  ${RescheduleInProjects}
    ${RescheduleOutProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p[3]
    set global variable  ${RescheduleOutProjects}
    ${OverdueProjects}  get text  //mo-metrics-plot[2]/div/div[2]/p[4]
    set global variable  ${OverdueProjects}

    log to console  Value in scheduling bar: [${executive}]
    ${product_count}  execute javascript  var string = "${Accuracy}"; var returnStr = string.split(' ')[0]; return returnStr;
    ${product_count..}  replace string   ${product_count}  ,  ${EMPTY}
    log to console  ${product_count..}
    ${product_count2}  execute javascript  var string = "${Accuracy}"; var returnStr = string.split(' ')[3]; return returnStr;
    ${product_count2..}  replace string   ${product_count2}  ,  ${EMPTY}
    log to console  ${product_count2..}
    ${projects_count}  execute javascript  var string = "${AccuracyProjects}"; var returnStr = string.split(' ')[0]; return returnStr;
    ${projects_count..}  replace string   ${projects_count}  ,  ${EMPTY}
    log to console  ${projects_count..}
    ${projects_count2}  execute javascript  var string = "${AccuracyProjects}"; var returnStr = string.split(' ')[3]; return returnStr;
    ${projects_count2..}  replace string   ${projects_count2}  ,  ${EMPTY}
    log to console  ${projects_count2..}
    ${schedule_accuracy1}=  evaluate  ${product_count..}+${projects_count..}
    set global variable  ${schedule_accuracy1}
    convert to number  ${schedule_accuracy1}
    ${schedule_accuracy2}=  evaluate  ${product_count2..}+${projects_count2..}
    set global variable  ${schedule_accuracy2}
    convert to number  ${schedule_accuracy2}
    ${schedule_accuracy3}=  execute javascript  var x = `${schedule_accuracy1}`;var y = `${schedule_accuracy2}`;var z = ((x / y)*100); return z
    log to console  ${schedule_accuracy3}
    ${schedule_accuracy4}  convert to number  ${schedule_accuracy3}  1
    ${schedule_accuracy5}  convert to string  ${schedule_accuracy4}
    should be equal  ${schedule_accuracy5}  ${executive}

User select business from business filter for "${text}"
      click element  ${Executive-Summary Iicon}
      sleep  20s
      wait until element does not contain  ${MoScheduling Accuracy}  --  30s
      click element  addFilterBtn
      sleep  2s
      click element  ${business filter from editfilters list}
      wait until element is visible  continue  20s
      click element  continue
      click element  business
      sleep  2s
      click element  product-${text}
      click element  ${business_Apply Button}
      sleep  5s

User click on clear filters button to clear the old selection
       wait until element is visible  clearFilterBtn  10s
        click element  clearFilterBtn
        sleep  5s