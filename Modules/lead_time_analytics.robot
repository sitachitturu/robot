--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/LeadTimeAnalytics/spine_lead_time.robot
##../Feature/LeadTimeAnalytics/heat_map_lead_time.robot
../Feature/LeadTimeAnalytics/lead_time.robot
../Feature/LeadTimeAnalytics/log_user_lead_time.robot
../Feature/LeadTimeAnalytics/outliers_filter_lead_time.robot
../Feature/LeadTimeAnalytics/filters_lead_time_analytics.robot
../Feature/LeadTimeAnalytics/filter_set_lead_time_analytics.robot
../Feature/LeadTimeAnalytics/excel_lead_time_analytics.robot
../Feature/LeadTimeAnalytics/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
