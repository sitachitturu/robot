--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/MaterialTransferOppo/excel_material_transfer.robot
../Feature/MaterialTransferOppo/Filters_mto.robot
../Feature/MaterialTransferOppo/feedback_policy.robot
../Feature/MaterialTransferOppo/show_hide_columns.robot
../Feature/CommonFeatures/logout.robot
