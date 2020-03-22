--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/ReceiptOptamization/receipt_optomization_default_page.robot
../Feature/ReceiptOptamization/excel_receipt_optimization.robot
../Feature/ReceiptOptamization/filters_receipt_optimization.robot
../Feature/ReceiptOptamization/filter_set_receipt_optimization.robot
../Feature/ReceiptOptamization/push_days.robot
../Feature/ReceiptOptamization/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
