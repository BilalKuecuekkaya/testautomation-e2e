*** Settings ***
Documentation       This is my first test case

*** Keywords ***
Log My Username
    Log        ${DICTIONARY}[username]

Log My Username and My Password
    Log        ${DICTIONARY}[username]
    Log        ${DICTIONARY}[password]

*** Variables ***

${MY-VARIABLE}    my test variable is xxx

${GOOGLE-SEARCH}    //*[@id="APjFqb"]

@{LIST}    test1  test2  test3  test4
&{DICTIONARY}    username=testuser    password=demo
