*** Settings ***
Library  Selenium2Library
Library  String
Library  Collections
Library  OperatingSystem
Resource  ../../Variables/VariablesPurchaseOrders/Purchase_Orders_variables.robot

*** Keywords ***
User click Purchase Orders icon
       click element  ${Purchase Orders Icon}
       sleep  10s

User should see "${title}"
        xpath should match x times  (//div[@id='topBar'])/span[text()='${title}']  1

User select plant business from plant business
        wait until element is visible  addFilterBtn  20s
        click element  addFilterBtn
        wait until element is visible  ${business_filter}  10s
        click element  ${business_filter}
        click element  continue
        wait until element is visible  business  10s
        click element  business
        sleep  2s
        click element  //mm-filter[@id='business']//paper-checkbox[1]
        click element  ${business_apply_button}
        sleep  3s
user see heatmap with sorting icon and able to do sorting for the Exception message columns for buyer
         wait until element is visible  ${ageclassification_dropdown}   20s
         click element  ${ageclassification_dropdown}
         wait until element is visible  ${exception_message}  20s
         click element  ${exception_message}
         sleep  10s
         ${cancellation_icon}  double click element  ${cancellation_col}
              sleep  10s
              ${column_acending}  get text  ${cancellation_asc}
              log  ${column_acending}
              click element  ${cancellation_col}
              sleep  10s
              ${column_decending}  get text  ${cancellation_desc}
              log  ${column_decending}
              ${column_decending..}  replace string  ${column_decending}  ,  ${EMPTY}
              log  ${column_decending..}
              ${output1}  run keyword and continue on failure  evaluate  ${column_acending} > ${column_decending..}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  10s
              ${column1_acending}  get text  ${reschedule_asc}
              log  ${column1_acending}
              click element  ${reschedule_in_col}
              sleep  10s
              ${column1_decending}  get text  ${reschedule_in_desc}
              log  ${column1_decending}
              ${column1_decending..}  replace string   ${column1_decending}  ,  ${EMPTY}
              log  ${column1_decending..}
              ${output2}  run keyword and continue on failure  evaluate  ${column1_acending}<${column1_decending..}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  10s
              ${column2_acending}  get text  ${resc.out_asc}
              log  ${column2_acending}
              click element  ${reschedule_out_col}
              sleep  10s
              ${column2_decending}  get text  ${resch.out_desc}
              log  ${column2_decending}
              ${column2_decending..}  replace string   ${column2_decending}  ,  ${EMPTY}
              log  ${column2_decending..}
              ${output3}  run keyword and continue on failure  evaluate  ${column1_acending}>${column2_decending..}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  10s
              ${column3_acending}  get text  ${other_excep_asc}
              log  ${column3_acending}
              click element  ${other_exceptions_col}
              sleep  10s
              ${column3_decending}  get text  ${other_excep_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string   ${column3_decending}  ,  ${EMPTY}
              log  ${column3_decending..}
              ${output4}  run keyword and continue on failure  evaluate  ${column1_acending}<${column3_decending..}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for vendor
          wait until element is visible  ${buyer_dropdown}  20s
          click element  ${buyer_dropdown}
          sleep  2s
          click element  ${vendor_from_buyer_dropdown}
          sleep  10s
         ${cancellation_icon}  click element  ${cancellation_col}
              sleep  10s
              ${column_acending}  get text  ${cancellation_asc}
              log  ${column_acending}
              click element  ${cancellation_col}
              sleep  10s
              ${column_decending}  get text  ${cancellation_desc}
              log  ${column_decending}
              ${column_decending..}  replace string   ${column_decending}  ,  ${EMPTY}
              log  ${column_decending..}
              ${output1}  evaluate  ${column_acending}>${column_decending..}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  10s
              ${column1_acending}  get text  ${reschedule_asc}
              log  ${column1_acending}
              click element  ${reschedule_in_col}
              sleep  10s
              ${column1_decending}  get text  ${reschedule_in_desc}
              log  ${column1_decending}
              ${column1_decending..}  replace string   ${column1_decending}  ,  ${EMPTY}
              log  ${column1_decending..}
              ${output2}  evaluate  ${column1_acending}<${column1_decending..}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  10s
              ${column2_acending}  get text  ${resc.out_asc}
              log  ${column2_acending}
              click element  ${reschedule_out_col}
              sleep  10s
              ${column2_decending}  get text  ${resch.out_desc}
              log  ${column2_decending}
              ${column2_decending..}  replace string   ${column2_decending}  ,  ${EMPTY}
              log  ${column2_decending..}
              ${output3}  evaluate  ${column1_acending}>${column2_decending..}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  10s
              ${column3_acending}  get text  ${other_excep_asc}
              log  ${column3_acending}
              click element  ${other_exceptions_col}
              sleep  10s
              ${column3_decending}  get text  ${other_excep_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string   ${column3_decending}  ,  ${EMPTY}
              log  ${column3_decending..}
              ${output4}  evaluate  ${column1_acending}>${column3_decending..}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for planner
          wait until element is visible  ${buyer_dropdown}  20s
          click element  ${buyer_dropdown}
          sleep  2s
          click element  ${planner_from_buyer_dropdown}
          sleep  10s
         ${cancellation_icon}  click element  ${cancellation_col}
              sleep  15s
              ${column_acending}  get text  ${cancellation_asc}
              log  ${column_acending}
              click element  ${cancellation_col}
              sleep  38s
              ${column_decending}  get text  ${cancellation_desc}
              log  ${column_decending}
              ${column_decending..}  replace string   ${column_decending}  ,  ${EMPTY}
              log  ${column_decending..}
              ${output1}  evaluate  ${column_acending}>${column_decending..}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  10s
              ${column1_acending}  get text  ${reschedule_asc}
              log  ${column1_acending}
              click element  ${reschedule_in_col}
              sleep  10s
              ${column1_decending}  get text  ${reschedule_in_desc}
              log  ${column1_decending}
              ${column1_decending..}  replace string   ${column1_decending}  ,  ${EMPTY}
              log  ${column1_decending..}
              ${output2}  evaluate  ${column1_acending}<${column1_decending..}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  10s
              ${column2_acending}  get text  ${resc.out_asc}
              log  ${column2_acending}
              click element  ${reschedule_out_col}
              sleep  10s
              ${column2_decending}  get text  ${resch.out_desc}
              log  ${column2_decending}
              ${column2_decending..}  replace string   ${column2_decending}  ,  ${EMPTY}
              log  ${column2_decending..}
              ${output3}  evaluate  ${column1_acending}>${column2_decending..}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  10s
              ${column3_acending}  get text  ${other_excep_asc}
              log  ${column3_acending}
              click element  ${other_exceptions_col}
              sleep  10s
              ${column3_decending}  get text  ${other_excep_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string   ${column3_decending}  ,  ${EMPTY}
              log  ${column3_decending..}
              ${output4}  evaluate  ${column1_acending}>${column3_decending..}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for Material
          wait until element is visible  ${buyer_dropdown}  20s
          click element  ${buyer_dropdown}
          sleep  2s
          click element  ${material_from_buyer_dropdown}
          sleep  15s
         ${cancellation_icon}  click element  ${cancellation_col}
              sleep  15s
              ${column_acending}  get text  ${cancellation_asc}
              log  ${column_acending}
              click element  ${cancellation_col}
              sleep  15s
              ${column_decending}  get text  ${cancellation_desc}
              log  ${column_decending}
              ${column_decending..}  replace string  ${column_decending}  ,  ${EMPTY}
              log  ${column_decending..}
              ${output1}  evaluate  ${column_acending}>${column_decending..}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  15s
              ${column1_acending}  get text  ${reschedule_asc}
              log  ${column1_acending}
              click element  ${reschedule_in_col}
              sleep  15s
              ${column1_decending}  get text  ${reschedule_in_desc}
              log  ${column1_decending}
              ${column1_decending..}  replace string   ${column1_decending}  ,  ${EMPTY}
              log  ${column1_decending..}
              ${output2}  evaluate  ${column1_acending}<${column1_decending..}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  15s
              ${column2_acending}  get text  ${resc.out_asc}
              log  ${column2_acending}
              click element  ${reschedule_out_col}
              sleep  15s
              ${column2_decending}  get text  ${resch.out_desc}
              log  ${column2_decending}
              ${column2_decending..}  replace string   ${column2_decending}  ,  ${EMPTY}
              log  ${column2_decending..}
              ${output3}  evaluate  ${column1_acending}>${column2_decending..}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  15s
              ${column3_acending}  get text  ${other_excep_asc}
              log  ${column3_acending}
              click element  ${other_exceptions_col}
              sleep  15s
              ${column3_decending}  get text  ${other_excep_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string   ${column3_decending}  ,  ${EMPTY}
              log  ${column3_decending..}
              ${output4}  evaluate  ${column1_acending}>${column3_decending..}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for buyer for value view
              click element  ${ageclassification_dropdown}
              wait until element is visible  ${exception_message}  20s
              click element  ${exception_message}
              sleep  15s
              wait until element is visible  ${value_tab}  20s
              click element  ${value_tab}
              sleep  10s
          ${cancellation_icon}  click element  ${cancellation_col}
              sleep  15s
              ${column1_acending}  get text  ${cancellation_asc}
              log  ${column1_acending}
              ${column1_acending.}  replace string  ${column1_acending}  ,  ${EMPTY}
              ${column1_acending...}  replace string  ${column1_acending.}  $  ${EMPTY}
              click element  ${cancellation_col}
              sleep  15s
              ${column1_decending}  get text  ${cancellation_desc}
              log  ${column1_decending}
              ${column1_decending.}  replace string  ${column1_decending}  ,  ${EMPTY}
              ${column1_decending...}  replace string  ${column1_decending.}  $  ${EMPTY}
              log  ${column1_decending...}
              ${output1}  evaluate  ${column1_acending...}>${column1_decending...}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  15s
              ${column2_acending}  get text  ${reschedule_asc}
              log  ${column2_acending}
              ${column2_acending.}  replace string  ${column2_acending}  ,  ${EMPTY}
              ${column2_acending...}  replace string  ${column2_acending.}  $  ${EMPTY}
              click element  ${reschedule_in_col}
              sleep  15s
              ${column2_decending}  get text  ${reschedule_in_desc}
              log  ${column2_decending}
              ${column2_decending.}  replace string  ${column2_decending}  ,  ${EMPTY}
              ${column2_decending....}  replace string  ${column2_decending.}  $  ${EMPTY}
              log  ${column2_decending....}
              ${output2}  evaluate  ${column2_acending...}>${column2_decending....}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  15s
              ${column3_acending}  get text  ${resc.out_asc}
              log  ${column3_acending}
              ${column3_acending.}  replace string  ${column3_acending}  ,  ${EMPTY}
              ${column3_acending...}  replace string  ${column3_acending.}  $  ${EMPTY}
              click element  ${reschedule_out_col}
              sleep  15s
              ${column3_decending}  get text  ${resch.out_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string  ${column3_decending}  ,  ${EMPTY}
              ${column3_decending....}  replace string  ${column3_decending..}  $  ${EMPTY}
              log  ${column3_decending....}
              ${output3}  evaluate  ${column3_acending...}>${column3_decending....}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  15s
              ${column4_acending}  get text  ${other_excep_asc}
              log  ${column4_acending}
              ${column4_acending.}  replace string  ${column4_acending}  ,  ${EMPTY}
              ${column4_acending...}  replace string  ${column4_acending.}  $  ${EMPTY}
              click element  ${other_exceptions_col}
              sleep  15s
              ${column4_decending}  get text  ${other_excep_desc}
              log  ${column4_decending}
              ${column4_decending..}  replace string  ${column4_decending}  ,  ${EMPTY}
              ${column4_decending....}  replace string  ${column4_decending..}  $  ${EMPTY}
              log  ${column4_decending....}
              ${output4}  evaluate  ${column4_acending...}<${column4_decending....}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for vendor for value view
               wait until element is visible  ${buyer_dropdown}  20s
               click element  ${buyer_dropdown}
               sleep  2s
               click element  ${vendor_from_buyer_dropdown}
               sleep  10s
          ${cancellation_icon}  click element  ${cancellation_col}
              sleep  10s
              ${column1_acending}  get text  ${cancellation_asc}
              log  ${column1_acending}
              ${column1_acending.}  replace string  ${column1_acending}  ,  ${EMPTY}
              ${column1_acending...}  replace string  ${column1_acending.}  $  ${EMPTY}
              click element  ${cancellation_col}
              sleep  10s
              ${column1_decending}  get text  ${cancellation_desc}
              log  ${column1_decending}
              ${column1_decending.}  replace string  ${column1_decending}  ,  ${EMPTY}
              ${column1_decending...}  replace string  ${column1_decending.}  $  ${EMPTY}
              log  ${column1_decending...}
              ${output1}  evaluate  ${column1_acending...}>${column1_decending...}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  10s
              ${column2_acending}  get text  ${reschedule_asc}
              log  ${column2_acending}
              ${column2_acending.}  replace string  ${column2_acending}  ,  ${EMPTY}
              ${column2_acending...}  replace string  ${column2_acending.}  $  ${EMPTY}
              click element  ${reschedule_in_col}
              sleep  10s
              ${column2_decending}  get text  ${reschedule_in_desc}
              log  ${column2_decending}
              ${column2_decending.}  replace string  ${column2_decending}  ,  ${EMPTY}
              ${column2_decending....}  replace string  ${column2_decending.}  $  ${EMPTY}
              log  ${column2_decending....}
              ${output2}  evaluate  ${column2_acending...}>${column2_decending....}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  10s
              ${column3_acending}  get text  ${resc.out_asc}
              log  ${column3_acending}
              ${column3_acending.}  replace string  ${column3_acending}  ,  ${EMPTY}
              ${column3_acending...}  replace string  ${column3_acending.}  $  ${EMPTY}
              click element  ${reschedule_out_col}
              sleep  10s
              ${column3_decending}  get text  ${resch.out_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string  ${column3_decending}  ,  ${EMPTY}
              ${column3_decending....}  replace string  ${column3_decending..}  $  ${EMPTY}
              log  ${column3_decending....}
              ${output3}  evaluate  ${column3_acending...}>${column3_decending....}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  10s
              ${column4_acending}  get text  ${other_excep_asc}
              log  ${column4_acending}
              ${column4_acending.}  replace string  ${column4_acending}  ,  ${EMPTY}
              ${column4_acending...}  replace string  ${column4_acending.}  $  ${EMPTY}
              click element  ${other_exceptions_col}
              sleep  10s
              ${column4_decending}  get text  ${other_excep_desc}
              log  ${column4_decending}
              ${column4_decending..}  replace string  ${column4_decending}  ,  ${EMPTY}
              ${column4_decending....}  replace string  ${column4_decending..}  $  ${EMPTY}
              log  ${column4_decending....}
              ${output4}  evaluate  ${column4_acending...}<${column4_decending....}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for planner for value view
         wait until element is visible  ${buyer_dropdown}  20s
               click element  ${buyer_dropdown}
               sleep  2s
               click element  ${planner_from_buyer_dropdown}
               sleep  10s
          ${cancellation_icon}  click element  ${cancellation_col}
              sleep  10s
              ${column1_acending}  get text  ${cancellation_asc}
              log  ${column1_acending}
              ${column1_acending.}  replace string  ${column1_acending}  ,  ${EMPTY}
              ${column1_acending...}  replace string  ${column1_acending.}  $  ${EMPTY}
              click element  ${cancellation_col}
              sleep  10s
              ${column1_decending}  get text  ${cancellation_desc}
              log  ${column1_decending}
              ${column1_decending.}  replace string  ${column1_decending}  ,  ${EMPTY}
              ${column1_decending...}  replace string  ${column1_decending.}  $  ${EMPTY}
              log  ${column1_decending...}
              ${output1}  evaluate  ${column1_acending...}>${column1_decending...}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  10s
              ${column2_acending}  get text  ${reschedule_asc}
              log  ${column2_acending}
              ${column2_acending.}  replace string  ${column2_acending}  ,  ${EMPTY}
              ${column2_acending...}  replace string  ${column2_acending.}  $  ${EMPTY}
              click element  ${reschedule_in_col}
              sleep  10s
              ${column2_decending}  get text  ${reschedule_in_desc}
              log  ${column2_decending}
              ${column2_decending.}  replace string  ${column2_decending}  ,  ${EMPTY}
              ${column2_decending....}  replace string  ${column2_decending.}  $  ${EMPTY}
              log  ${column2_decending....}
              ${output2}  evaluate  ${column2_acending...}>${column2_decending....}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  10s
              ${column3_acending}  get text  ${resc.out_asc}
              log  ${column3_acending}
              ${column3_acending.}  replace string  ${column3_acending}  ,  ${EMPTY}
              ${column3_acending...}  replace string  ${column3_acending.}  $  ${EMPTY}
              click element  ${reschedule_out_col}
              sleep  10s
              ${column3_decending}  get text  ${resch.out_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string  ${column3_decending}  ,  ${EMPTY}
              ${column3_decending....}  replace string  ${column3_decending..}  $  ${EMPTY}
              log  ${column3_decending....}
              ${output3}  evaluate  ${column3_acending...}>${column3_decending....}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  10s
              ${column4_acending}  get text  ${other_excep_asc}
              log  ${column4_acending}
              ${column4_acending.}  replace string  ${column4_acending}  ,  ${EMPTY}
              ${column4_acending...}  replace string  ${column4_acending.}  $  ${EMPTY}
              click element  ${other_exceptions_col}
              sleep  10s
              ${column4_decending}  get text  ${other_excep_desc}
              log  ${column4_decending}
              ${column4_decending..}  replace string  ${column4_decending}  ,  ${EMPTY}
              ${column4_decending....}  replace string  ${column4_decending..}  $  ${EMPTY}
              log  ${column4_decending....}
              ${output4}  evaluate  ${column4_acending...}<${column4_decending....}

user see heatmap with sorting icon and able to do sorting for the Exception message columns for Material for value view
         wait until element is visible  ${buyer_dropdown}  20s
               click element  ${buyer_dropdown}
               sleep  2s
               click element  ${material_from_buyer_dropdown}
               sleep  10s
          ${cancellation_icon}  click element  ${cancellation_col}
              sleep  15s
              ${column1_acending}  get text  ${cancellation_asc}
              log  ${column1_acending}
              ${column1_acending.}  replace string  ${column1_acending}  ,  ${EMPTY}
              ${column1_acending...}  replace string  ${column1_acending.}  $  ${EMPTY}
              click element  ${cancellation_col}
              sleep  15s
              ${column1_decending}  get text  ${cancellation_desc}
              log  ${column1_decending}
              ${column1_decending.}  replace string  ${column1_decending}  ,  ${EMPTY}
              ${column1_decending...}  replace string  ${column1_decending.}  $  ${EMPTY}
              log  ${column1_decending...}
              ${output1}  evaluate  ${column1_acending...}>${column1_decending...}
         ${Reschedule_in}  click element  ${reschedule_in_col}
              sleep  15s
              ${column2_acending}  get text  ${reschedule_asc}
              log  ${column2_acending}
              ${column2_acending.}  replace string  ${column2_acending}  ,  ${EMPTY}
              ${column2_acending...}  replace string  ${column2_acending.}  $  ${EMPTY}
              click element  ${reschedule_in_col}
              sleep  15s
              ${column2_decending}  get text  ${reschedule_in_desc}
              log  ${column2_decending}
              ${column2_decending.}  replace string  ${column2_decending}  ,  ${EMPTY}
              ${column2_decending....}  replace string  ${column2_decending.}  $  ${EMPTY}
              log  ${column2_decending....}
              ${output2}  evaluate  ${column2_acending...}>${column2_decending....}
         ${Reschedule_out}  click element  ${reschedule_out_col}
              sleep  15s
              ${column3_acending}  get text  ${resc.out_asc}
              log  ${column3_acending}
              ${column3_acending.}  replace string  ${column3_acending}  ,  ${EMPTY}
              ${column3_acending...}  replace string  ${column3_acending.}  $  ${EMPTY}
              click element  ${reschedule_out_col}
              sleep  15s
              ${column3_decending}  get text  ${resch.out_desc}
              log  ${column3_decending}
              ${column3_decending..}  replace string  ${column3_decending}  ,  ${EMPTY}
              ${column3_decending....}  replace string  ${column3_decending..}  $  ${EMPTY}
              log  ${column3_decending....}
              ${output3}  evaluate  ${column3_acending...}>${column3_decending....}
              sleep  3s
         ${other_exceptions}  click element  ${other_exceptions_col}
              sleep  15s
              ${column4_acending}  get text  ${other_excep_asc}
              log  ${column4_acending}
              ${column4_acending.}  replace string  ${column4_acending}  ,  ${EMPTY}
              ${column4_acending...}  replace string  ${column4_acending.}  $  ${EMPTY}
              click element  ${other_exceptions_col}
              sleep  15s
              ${column4_decending}  get text  ${other_excep_desc}
              log  ${column4_decending}
              ${column4_decending..}  replace string  ${column4_decending}  ,  ${EMPTY}
              ${column4_decending....}  replace string  ${column4_decending..}  $  ${EMPTY}
              log  ${column4_decending....}
              ${output4}  evaluate  ${column4_acending...}<${column4_decending....}
