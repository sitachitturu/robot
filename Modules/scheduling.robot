--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
##Listoftestcases
../Feature/CommonFeatures/login.robot
####../Feature/Scheduling/user_profile _smoke _test.robot
../Feature/Scheduling/12pack_plants.robot
../Feature/Scheduling/current_finish_date_filter.robot
../Feature/Scheduling/ideal_finish_date_filter.robot
../Feature/Scheduling/order_status_filter.robot
../Feature/Scheduling/product_hierarchy_filter.robot
../Feature/Scheduling/scheduling_module.robot
../Feature/Scheduling/Show_Hide_Column.robot
../Feature/Scheduling/storage_location_filter.robot
../Feature/Scheduling/products_projects.robot
../Feature/Scheduling/scheduling_exceptions.robot
../Feature/Scheduling/excel_scheduling.robot
../Feature/Scheduling/scheduling_scattorplots_icons.robot
../Feature/Scheduling/feedback_policy.robot
../Feature/Scheduling/filters_scheduling.robot
../Feature/Scheduling/filter_set_scheduling.robot
../Feature/CommonFeatures/logout.robot
