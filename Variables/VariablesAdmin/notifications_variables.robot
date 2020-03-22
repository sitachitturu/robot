*** Variables ***
${Admin icon}  xpath=//ul[@id='navitemlist']/li/a[@href='/secure/notification']
${Notification icon}  xpath=(//a[@href='/secure/notification'])[2]
${Notification page label}  xpath=//span[@class='epsilon style-scope px-deck-selector']
${Notification label dropdown text}  xpath=//ul[@id='dropdown']/li/div
${Grid columns}  xpath=//div[@class='header-cell style-scope mo-grid']/span
${Create button}  xpath=//button[@class='create style-scope mo-notification-grid mo-notification']
${Outage radio button}  xpath=//input[@id='radioOutage']
${General radio button}  xpath=//input[@id='radioGeneral']
${Notification title textbox}  xpath=//input[@id='title']
${Status dropdown}  xpath=//select[@id='status']
${Notification message textbox}  xpath=//textarea[@id='message']
${Publish button}  xpath=//button[@class='btn btn--primary style-scope mo-notification-form']
${Notification creation form}  xpath=//form[@id='notificationform']






