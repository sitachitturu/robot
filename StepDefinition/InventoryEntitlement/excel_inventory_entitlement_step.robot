7/25/2017
212613237

*** Settings ***
Library  Selenium2Library
Library  DatabaseLibrary
Library  String
Library  OperatingSystem
Library  Collections
Library  ../../Suits/excel_library.py

*** Keywords ***
User access "${link}" module
       click link   ${link}
       sleep  15s
       wait until page contains  addFilterBtn  10s