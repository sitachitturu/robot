--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/MasterData/inconsistencies.robot
../Feature/MasterData/quantity.robot
../Feature/MasterData/masterdata.robot
../Feature/MasterData/excel_master_data.robot
../Feature/MasterData/material_creation_monitor.robot
../Feature/MasterData/filters_master_data.robot
../Feature/MasterData/filter_set_master_data.robot
../Feature/MasterData/power_max_plants.robot
../Feature/MasterData/feedback_policy.robot
../Feature/CommonFeatures/logout.robot

