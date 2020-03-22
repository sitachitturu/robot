--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/CycleCounting/cycle_counting.robot
../Feature/CycleCounting/excel_cycle_counting.robot
../Feature/CycleCounting/performance_indicator_cycle_counting.robot
../Feature/CycleCounting/filter_set_cycle_counting.robot
../Feature/CycleCounting/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
