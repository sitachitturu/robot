--variable WELCOME.URL:https://mos-qa-uat.run.aws-usw02-pr.ice.predix.io
--variable dbfile:../Resources/db_uat.cfg
#Listoftestcases
../Feature/CommonFeatures/login.robot
../Feature/InventoryEntitlement/inv_entitlement_grid.robot
../Feature/InventoryEntitlement/show_hide_col_list.robot
../Feature/InventoryEntitlement/inv_entitlement_material_sku_treemap.robot
../Feature/InventoryEntitlement/inv_entitlement_purch_group_treemap.robot
../Feature/InventoryEntitlement/inv_entitlement_spine.robot
../Feature/InventoryEntitlement/inventory_entitlement.robot
../Feature/InventoryEntitlement/inv_entitlement_plant_treemap.robot
../Feature/InventoryEntitlement/excel_inventory_entitlement.robot
../Feature/InventoryEntitlement/filters_inventory_entitlement.robot
../Feature/InventoryEntitlement/filter_set_inventory_entitlement.robot
../Feature/InventoryEntitlement/feedback_policy.robot
../Feature/CommonFeatures/logout.robot
