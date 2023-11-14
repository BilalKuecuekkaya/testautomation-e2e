*** Settings ***
| Library | AppiumLibrary | run_on_failure=AppiumLibrary.CapturePageScreenshot
*** Variables ***
${WELCOME-TEXT}    //android.widget.TextView[@text="Welcome to PurplPro Mobile!"]
${SIGNIN-BUTTON}   //android.widget.Button[@text="Sign in"]

${ACCOUNT}        //android.widget.Button[@text='Melden Sie sich mit dem Geschäfts-, Schul- oder Unikonto "bilal.kuecuekkaya@spectralengines.com" an.']
${KENNWORT}       //android.widget.EditText
*** Test Cases ***
Open_Application    
    Open Application    http://84.162.64.55:4724/wd/hub    platformName=Android	    deviceName=RF8T90V5A7H    appPackage=com.purplepro.app   appActivity=com.purplepro.app.MainActivity     automationName=Uiautomator2   
    #Wait Until Page Contains  ${WELCOME-TEXT}
    Wait Until Page Contains Element    ${SIGNIN-BUTTON}
    Click Element    ${SIGNIN-BUTTON}
    Sleep    2
    Wait Until Page Contains    text=Konto auswählen
    Sleep    2
    Click Element    ${ACCOUNT}
    Wait Until Page Contains Element    //android.widget.TextView[@text="Kennwort eingeben"]
    Click Element    ${KENNWORT}
    Input Text        ${KENNWORT}    text=123456
    
