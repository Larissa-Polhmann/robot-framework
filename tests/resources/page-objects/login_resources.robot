*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../locators/locators.robot

*** Keywords ***
Enter the correct username
    Input Text    ${USERNAME}    standard_user

Enter the correct password
    Input Text    ${PASSWORD}    secret_sauce

Click on login
    Click Button    ${BTN_LOGIN}
    Wait Until Element Is Visible    //span[@class='title'][contains(.,'Products')]

##
Enter the incorrect username
    Click Element    ${MENU}
    Wait Until Element Is Visible    ${LOGOUT}
    Click Element    ${LOGOUT}
    Input Text    ${USERNAME}    locked_out_user

Click on login and check the message ${MESSAGE_LOCKED_USER}
    Click Button    ${BTN_LOGIN}
    Wait Until Element Is Visible    ${MESSAGE_LOCKED_USER}