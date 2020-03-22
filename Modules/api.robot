--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/API/master_data_spine.robot
../Feature/API/receipt_opt_spine.robot
#../Feature/API/barchart_stock_policy.robot
../Feature/CommonFeatures/logout.robot
