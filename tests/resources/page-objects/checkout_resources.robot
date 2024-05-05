*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../locators/locators.robot

*** Keywords ***
Fill in the first name
    Click Element    ${ADD_TO_CART}
    Click Element    ${CART}
    Click Element    ${BTN_CHECKOUT}
    Wait Until Element Is Visible    ${CHECKOUT_TITLE}
    ${NAME}    FakerLibrary.Name
    Input Text    ${FIRST_NAME}    ${NAME}

Fill in the last name
    ${SECOND_NAME}    FakerLibrary.Last Name
    Input Text    ${LAST_NAME}    ${SECOND_NAME}

Fill in the zip code
    ${ZIP_CODE}    FakerLibrary.Zipcode
    Input Text    ${POSTAL_CODE}    ${ZIP_CODE}

Continue with the purchase
    Click Element    ${BTN_CONTINUE}
    Wait Until Element Is Visible    ${REVIEW_TITLE}


##
Click the button to cancel order
    Click Element    ${BTN_CANCEL}

Verify the redirection to the home page
    Wait Until Element Is Visible    ${HOME_TITLE}


##
Go to checkout
    Click Element    ${CART}
    Click Element    ${BTN_CHECKOUT}

Click to continue
    Click Element    ${BTN_CONTINUE}
Validate the message ${FIRST_NAME_ERROR}
    Element Should Be Visible    ${FIRST_NAME_ERROR}


##
Fill in the name
    Click Element    ${BTN_CANCEL}
    Click Element    ${BTN_CHECKOUT}
    ${NAME}    FakerLibrary.Name
    Input Text    ${FIRST_NAME}    ${NAME}

Delete the last name
    Wait Until Element Is Visible    ${LAST_NAME}
    Clear Element Text    ${LAST_NAME}

Check the message ${LAST_NAME_ERROR}
    Element Should Be Visible    ${LAST_NAME_ERROR}


##
Verify the message ${POSTAL_CODE_ERROR}
    Element Should Be Visible    ${POSTAL_CODE_ERROR}