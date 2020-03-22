--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/Opportunitytracker/opportunity_tracker.robot
../Feature/Opportunitytracker/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
