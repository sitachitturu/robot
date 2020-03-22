--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/ConsumptionIssues/Consumption_Issues.robot
../Feature/ConsumptionIssues/clear_filter_filter_set_option.robot
../Feature/ConsumptionIssues/feedback_policy.robot
../Feature/CommonFeatures/logout.robot