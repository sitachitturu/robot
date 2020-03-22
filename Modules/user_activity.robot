--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/UserActivity/log_user_activity.robot
../Feature/UserActivity/user_activity.robot
../Feature/Common/logout.robot
../Feature/Common/login_user2.robot
../Feature/UserActivity/no_access.robot
../Feature/CommonFeatures/logout.robot
