*** Settings ***
Library    AppiumLibrary
Resource    ../Resources/Keywords.robot

*** Variables ***

###Firebase-App-Steps
${SIGN-IN-WITH-GOOOGLE}       //android.widget.Button[@resource-id='dev.firebase.appdistribution:id/signInButton']
${Text-Account}           //android.widget.TextView[@text="Konto auswählen"]
${CHOOSE-ACCOUNT-TO-LOGIN}    //android.widget.TextView[@text="bilal.kuecuekkaya@spectralengines.com"]
${Text-Apps-testen}    //android.widget.TextView[@resource-id='dev.firebase.appdistribution:id/test_apps_label']
${CHOOSE-APP-ENV}    //android.view.ViewGroup[@resource-id='dev.firebase.appdistribution:id/row' and @index='1' ]
${Download-Agreement}    //android.widget.Button[@text="JETZT AUF DIESEM GERÄT TESTEN"]
${CHECKBOX-TO-AGREE}    //android.widget.CheckBox[@resource-id='dev.firebase.appdistribution:id/consent_checkbox']
${Text-Releases}    //android.widget.TextView[@text="Releases"]
${Text-Tag}        //android.widget.TextView[@text="Neueste"]
${DOWNLAOD-BUTTON}    //android.view.ViewGroup[@resource-id='dev.firebase.appdistribution:id/download_button']
${Notification-To-Allow-App}    //android.widget.Button[@text="Zulassen"]
${INSTALL-BUTTON}    //android.widget.Button[@text="Installieren"]


*** Test Cases ***
Check and Download latest STG Build Version
    OpenApplication    ${HTTP}    platformName=Android	    deviceName=${DEVICE_UDID}    appPackage=dev.firebase.appdistribution    appActivity=dev.firebase.appdistribution.main.MainActivity    automationName=Uiautomator2
    Wait Until Page Contains Element    	${SIGN-IN-WITH-GOOOGLE}
    Click Element    ${SIGN-IN-WITH-GOOOGLE}
    Wait Until Page Contains Element    ${Text-Account}
    Click Element    ${CHOOSE-ACCOUNT-TO-LOGIN}
    Sleep    3
    Wait Until Page Contains Element       ${Text-Apps-testen}
    Click Element    ${CHOOSE-APP-ENV}
    Wait Until Page Contains Element    ${Download-Agreement}
    Click Element    ${CHECKBOX-TO-AGREE}
    Click Element    ${Download-Agreement}
    Sleep     2
    Wait Until Page Contains Element    ${Text-Releases}
    #Check label with "Neueste"
    ${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${Text-Tag}
    Run Keyword If    ${message_visible}    Click Element    ${DOWNLAOD-BUTTON}
    Wait Until Page Contains Element    ${Notification-To-Allow-App}
    Click Element    ${Notification-To-Allow-App}
    Sleep    1
    Wait Until Page Contains Element    ${INSTALL-BUTTON}
    Click Element    ${INSTALL-BUTTON}
    Sleep    10