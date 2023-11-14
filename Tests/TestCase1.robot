*** Settings ***
Documentation       This is my first test case
Resource    ../Resources/resources.robot
*** Test Cases ***
TEST 
    Log    ${MY-VARIABLE}
    Log    ${GOOGLE-SEARCH}
    Log    ${LIST}[3]
    
    Log    ${DICTIONARY}[password]
    Log My Username
    Log My Username and My Password
    