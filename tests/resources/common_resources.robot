*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://www.saucedemo.com/
${YAML_FILE}    ${CURDIR}/../tests/data/credentials.yaml

*** Keywords ***
Initiate Browser
    Open Browser    ${URL}    chrome
    Disable Screenshots

Terminate Browser
    Close All Browsers

Disable Screenshots
    Set Screenshot Directory    ${TEMPDIR}

Load Credentials From YAML
    ${credentials}=    Get File    ${YAML_FILE}
    [Return]    ${credentials}

Login with Username
    [Arguments]    ${username}
    Input Text    //input[contains(@id,'user-name')]    ${username}

Login with Password
    [Arguments]    ${password}
    Input Text    //input[@id='password']    ${password}
    Click Button    //input[@id='login-button']

Login with Locked User
    [Arguments]    ${credentials}
    Input Text    //input[contains(@id,'user-name')]    ${credentials['incorrect_username']}
    Input Text    //input[@id='password']    ${credentials['incorrect_password']}
    Click Button    //input[@id='login-button']
