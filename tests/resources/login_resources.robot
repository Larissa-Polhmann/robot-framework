*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/common_resources.robot

*** Keywords ***
Enter the correct username
    [Arguments]    ${username}
    Input Text    //input[contains(@id,'user-name')]    ${username}

Enter the correct password
    [Arguments]    ${password}
    Input Text    //input[@id='password']    ${password}
    Click Button    //input[@id='login-button']

Click on login
    Click Button    //input[@id='login-button']
    Wait Until Element Is Visible    //span[@class='title'][contains(.,'Products')]

##
Enter the incorrect username
    [Arguments]    ${incorrect_username}
    Input Text    //input[contains(@id,'user-name')]    ${incorrect_username}
Enter the incorrect password
    [Arguments]    ${incorrect_password}
    Input Text    //input[contains(@id,'user-name')]    ${incorrect_password}