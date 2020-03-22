--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/PlantComparison/plant_comparison.robot
../Feature/PlantComparison/inv_entitlement_coulumns.robot
../Feature/PlantComparison/performance_indicator_plant_comparison.robot
../Feature/PlantComparison/filters_plant_comparison.robot
../Feature/PlantComparison/filter_set_plant_comparison.robot
../Feature/PlantComparison/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
