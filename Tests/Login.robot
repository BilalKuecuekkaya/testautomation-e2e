*** Settings ***
Library   AppiumLibrary  
Resource    ../Resources/credentials.robot
*** Variables ***
${FIRST-SIGN-IN-BUTTON}   //android.widget.Button[@text="Sign in"]
${ENTER-USERNAME}    //android.widget.EditText[@resource-id='email']
${ENTER-PASSWORD}        //android.widget.EditText[@resource-id='password']
${SIGN-IN-BUTTON}  //android.widget.Button[@resource-id='next']
${OPEN-WITH}        //android.widget.TextView[@text="Öffnen mit"]
${App-NAME}         //android.widget.TextView[@text= "PurplPro 2 STG"]
####EULA content
${EULA}        //android.widget.TextView[@text= "License Agreement"]
${ACCEPT-BUTTON}    //android.widget.Button[@text= "Accept"]
*** Test Cases ***

Open_Application    
    Open Application    http://84.162.64.55:4724     platformName=Android	    deviceName=RF8T90V5A7H    appPackage=com.purplepro.app   appActivity=com.purplepro.app.MainActivity     automationName=Uiautomator2  
    

    Wait Until Page Contains Element    ${FIRST-SIGN-IN-BUTTON}
    Click Element    ${FIRST-SIGN-IN-BUTTON}
    Sleep    5

    #Check the "Öffnen mit" view:
    ${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${OPEN-WITH}
    Run Keyword If    ${message_visible}    Click Element    ${App-NAME}
    
    #Check login fields with sign in button
    ${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ENTER-USERNAME}
    Run Keyword If    ${message_visible}  Enter Credentials 
    

    #Check the "Öffnen mit" view:
    ${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${OPEN-WITH}
    Run Keyword If    ${message_visible}    Select App

    #Check the "EULA" view:
    ${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${EULA}
    Run Keyword If    ${message_visible}    EULA



*** Keywords ***
Select App
    Log    "Selecting app to test"
    Click Element    ${App-NAME}

Enter Credentials 
    Log    "Input and submit of credentials"
    Click Element    ${ENTER-USERNAME}
    Input Text       ${ENTER-USERNAME}    ${Username-Credential}
    Input Text       ${ENTER-PASSWORD}    ${Password-Credential}
    Click Element    ${SIGN-IN-BUTTON}
    Sleep     2
    Select App

EULA
    Log    "EULA has to be accepted"
    Click Element    ${ACCEPT-BUTTON}



Check and Download latest Build Version
    Log    "Checking of latest build"

