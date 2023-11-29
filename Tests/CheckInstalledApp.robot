*** Settings ***
Library    AppiumLibrary
Resource    ../Resources/Keywords.robot
*** Variables ***


*** Test Cases ***

Check existing TST-APP and uninstall
    Open Application    ${HTTP}    platformName=Android	    deviceName=${DEVICE_UDID}        automationName=Uiautomator2  
    ${app_installed}=    Run Keyword And Return Status    Open Application    ${HTTP}   platformName=Android    deviceName=${DEVICE_UDID}    appPackage=${TST_APP_PACKAGE}  
    Run Keyword If    ${app_installed}    Remove Application    ${TST_APP_PACKAGE}
    Remove Application    ${TST_APP_PACKAGE}
    