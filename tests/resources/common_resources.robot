*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource    ../locators/locators.robot

*** Variables ***
${URL}    https://www.saucedemo.com/

*** Keywords ***
Initiate Browser
    Open Browser    ${URL}    chrome
    Disable Screenshots

Terminate Browser
    Close All Browsers

Disable Screenshots
    Set Screenshot Directory    ${TEMPDIR}

Perform the login
    Input Text    ${USERNAME}    standard_user
    Input Text    ${PASSWORD}    secret_sauce
    Click Button    ${BTN_LOGIN}
    Wait Until Element Is Visible    //span[@class='title'][contains(.,'Products')]