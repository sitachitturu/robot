*** Variables ***
${Page Spinner}  xpath=//div[@id='pageSpinner']
${Opportunity_Tracker_Icon}  //ul[@id='navitemlist']//a[@href="/secure/opportunity-tracker"]
${Opportunity_Tracker_Page_Title}  //div[@id='topBar']/span
${Main_Module_Tab}  //nav[@role='navigation']//button[@class='btn btn--bare btn--svg style-scope px-app-nav']
${mo_header}  //header[@role='banner']/h1
${footer}  //footer/h2
${predix_image}  //header[@role='banner']/div/img
${Plant filter}  //header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant')]
${Sub_Business_filter}  //header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Sub Business')]
${Plant_Business_filter}  //header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant Business')]
${Plant_Category_filter}  //header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant Category')]
${Plant_Region_filter}  //header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Plant Region')]
${Plant_Modules_filter}  //header[@role='banner']//button[@id='filterBtn']//span[contains(normalize-space(), 'Modules')]
${Apply_Button}  //*[@id='$']//button[@id="ApplyBtn"]
${Show_Selected}  //*[@id='$']//span[@id="showSelected"]
${Export_Excel_Button}  //div[@id='mos-xls-button']
${Edit_Filter_Button}  //button[@id='addFilterBtn']
${Edit_Filter_Options}  //*[@id='filterlist']//input[@value='$']
${Clear_Filter_Button}  //button[@id='clearFilterBtn']
