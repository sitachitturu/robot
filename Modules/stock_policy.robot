--variable WELCOME.URL:https://mos-qa-uat-b.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/StockPolicy/stock_policy_dashboard.robot
#../Feature/StockPolicy/filters_stock_policy.robot
../Feature/StockPolicy/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
