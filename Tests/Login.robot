*** Settings ***
Library   AppiumLibrary  
Resource    ../Resources/Keywords.robot
Resource    ../Resources/credentials.robot
*** Variables ***

###Login steps
${FIRST-SIGN-IN-BUTTON}   //android.widget.Button[@text="Sign in"]
${ENTER-USERNAME}    //android.widget.EditText[@resource-id='email']
${ENTER-PASSWORD}        //android.widget.EditText[@resource-id='password']
${SIGN-IN-BUTTON}  //android.widget.Button[@resource-id='next']
${App-NAME}         //android.widget.LinearLayout[@index=0]//android.widget.TextView[@text='PurplPro 2 STG']

####EULA content    
${EULA}        //android.widget.TextView[@text= "Purpl PRO Mobile Application End-user License"]
${ACCEPT-BUTTON}    //android.widget.Button[@text= "Accept"]

##Home view
${CONNECT_DEVICE_VIA_BLUETOOTH}    //android.widget.Button[@text= "1 Connect device via Bluetooth No device detected"]

*** Keywords ***

Enter Credentials 
    Log    "Input and submit of credentials"
    Click Element    ${ENTER-USERNAME}
    Input Text       ${ENTER-USERNAME}    ${Username-Credential}
    Input Text       ${ENTER-PASSWORD}    ${Password-Credential}
    Click Element    ${SIGN-IN-BUTTON}
    Sleep     2

EULA
    Log    "EULA has to be accepted"    console=true
    Click Element    ${ACCEPT-BUTTON}

Verify Home View
    Wait Until Page Contains Element    ${CONNECT_DEVICE_VIA_BLUETOOTH}
    Click Element    ${CONNECT_DEVICE_VIA_BLUETOOTH}

*** Test Cases ***


Open_Application    
    Open Application    ${HTTP}     platformName=Android	    deviceName=${DEVICE_UDID}    appPackage=${STG_APP_PACKAGE}     appActivity=com.purplepro.app.MainActivity     automationName=Uiautomator2      
    Wait Until Page Contains Element    ${FIRST-SIGN-IN-BUTTON}
    Click Element    ${FIRST-SIGN-IN-BUTTON}
    Sleep    3
    
    #Check login fields with sign in button
    ${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ENTER-USERNAME}
    Run Keyword If    ${message_visible}  Enter Credentials 

    #Check the "EULA" view:    
    ${message_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${EULA}
    #${message_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ACCEPT-BUTTON}
    Run Keyword If    ${message_visible}    EULA
    Sleep     3

    #Verify login success
    Verify Home View


    
    





