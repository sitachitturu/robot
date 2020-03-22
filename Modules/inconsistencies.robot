--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/DataInconsistencies/All_modules_excel_grid_filter_inconsistencies.robot
../Feature/DataInconsistencies/purchase_req_inconsistencies.robot
../Feature/DataInconsistencies/scheduling_inconsistency.robot
../Feature/CommonFeatures/logout.robot