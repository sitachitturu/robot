--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/PurchaseOrders/short_cycle.robot
../Feature/PurchaseOrders/purchase_orders_columns.robot
../Feature/PurchaseOrders/purchase_orders.robot
../Feature/PurchaseOrders/exception_requires_action_filter.robot
../Feature/PurchaseOrders/show_hide_col_list.robot
../Feature/PurchaseOrders/excel_purchase_orders.robot
../Feature/PurchaseOrders/heat_map.robot
../Feature/PurchaseOrders/sum_values_heat_map.robot
../Feature/PurchaseOrders/filters_purchase_orders.robot
../Feature/PurchaseOrders/filter_set_purchase_orders.robot
../Feature/PurchaseOrders/comments_purchase_orders.robot
../Feature/PurchaseOrders/po_actions.robot
../Feature/PurchaseOrders/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
