--variable WELCOME.URL:https://mos-qa-uat-b.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/CommonFeatures/Show_hide_all_modules.robot
../Feature/CommonFeatures/Edit_filters_list_all_modules.robot
../Feature/CommonFeatures/Mto-Actions.robot
../Feature/CommonFeatures/default_filters_all_modules.robot
../Feature/CommonFeatures/sort_order_grid_all_modules.robot
../Feature/CommonFeatures/logout.robot


