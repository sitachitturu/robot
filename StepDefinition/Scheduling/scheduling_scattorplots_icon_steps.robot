*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  OperatingSystem
Library  String
Library  Collections
Library  robot.libraries.DateTime
Resource  ../../Variables/VariablesScheduling/scheduling_module_variables.robot

*** Keywords ***
User click Scheduling icon
    click element  ${Scheduling icon}
    sleep  20s
    wait until element is visible  addFilterBtn  10s

user should see scattorplot title "PRODUCTION ORDERS"
    wait until element is visible  module_title  20s
    ${title}  get text  schedule_title
    log  module title is: [${title}]
    should be equal  ${title}  PRODUCTION ORDERS

user should see four icons when user mouse over on scattorplot
    wait until element is visible  plot  20s
    mouse over  plot
    sleep  2s
    element should be visible  //*[@id="plot"]/div/div/div[3]/div[1]/a
    element should be visible  //*[@id="plot"]/div/div/div[3]/div[2]/a
    element should be visible  //*[@id="plot"]/div/div/div[3]/div[3]/a
    element should be visible  //*[@id="plot"]/div/div/div[3]/div[4]/a

user change yesr in filters current finish and ideal finish filter and click apply
     wait until element is visible  addFilterBtn  10s
     click element  addFilterBtn
     click element  //*[@id='filterlist']//input[@value='cfd']
     click element  //*[@id='filterlist']//input[@value='ifd']
     wait until element is visible  continue  10s
     click element  continue
     click element  cfd
     sleep  2s
     double click element  //*[@placeholder="YYYY"]
#     ${original_text}  get value  //*[@placeholder="YYYY"]
#     log  ${original_text}
#     log to console  ${original_text}
#     ${original_text..}  get value  //*[@placeholder="MM"]
#     log  ${original_text..}
#     ${original_text1..}  get value  //*[@placeholder="DD"]
#     log  ${original_text1..}
#     ${avs}  Execute Javascript  var y = `${original_text}`;var z = y-1; return z
#     log  ${avs}
     click element  ${current_finish_date_apply_button}
     sleep  2s
     click element  ifd
     ${original_text}  Get Text  dtEntry
     double click element  //*[@placeholder="YYYY"]
     Execute Javascript  $("#dtEntry").val($("#dtEntry").val() + " 2010");
     click element  ${ideal_finish_date_apply_button}
     sleep  8s

user can see scattor plot and scatterplot can be refreshed to default view by clicking autoscale icon and filters need to be unselected
     element should be visible  cfd
     element should be visible  ifd
     element should be visible  //mm-global-filter/mm-filter[7]/daterange-filter/div/div/button/iron-icon
     element should be visible  //mm-global-filter/mm-filter[8]/daterange-filter/div/div/button/iron-icon
     mouse over  //*[@id="plot"]/div/div/div[3]/div[3]/a
     click element  //*[@id="plot"]/div/div/div[3]/div[3]/a
     sleep  13s
     element should not be visible  //mm-global-filter/mm-filter[7]/daterange-filter/div/div/button/iron-icon
     element should not be visible  //mm-global-filter/mm-filter[8]/daterange-filter/div/div/button/iron-icon
     capture page screenshot


