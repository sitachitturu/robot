--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/PurchaseRequisition/short_cycle.robot
../Feature/PurchaseRequisition/plant_hydro_brasil.robot
../Feature/PurchaseRequisition/purchase_req_default_heatmap_view.robot
../Feature/PurchaseRequisition/Show_hide_column_list.robot
../Feature/PurchaseRequisition/Us93008.robot
../Feature/PurchaseRequisition/material_sku.robot
../Feature/PurchaseRequisition/excel_purchase_requisition.robot
../Feature/PurchaseRequisition/filters_purchase_requisitions.robot
../Feature/PurchaseRequisition/filter_set_purchase_requisition.robot
../Feature/PurchaseRequisition/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
