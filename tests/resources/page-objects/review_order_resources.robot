*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    String
Resource    ../../resources/common_resources.robot
Resource    ../../locators/locators.robot

*** Variables ***
${item_total}        ${EMPTY}
${tax}               ${EMPTY}
${parsed_total}      ${EMPTY}
${expected_total}    ${EMPTY}

*** Keywords ***
Place an order
    Click Element    ${ADD_TO_CART}
    Click Element    ${CART}
    Click Element    ${BTN_CHECKOUT}
    Wait Until Element Is Visible    ${CHECKOUT_TITLE}
    ${NAME}    FakerLibrary.Name
    Input Text    ${FIRST_NAME}    ${NAME}
    ${SECOND_NAME}    FakerLibrary.Last Name
    Input Text    ${LAST_NAME}    ${SECOND_NAME}
    ${ZIP_CODE}    FakerLibrary.Zipcode
    Input Text    ${POSTAL_CODE}    ${ZIP_CODE}
    Click Element    ${BTN_CONTINUE}
    Wait Until Element Is Visible    ${REVIEW_TITLE}

Review the order value
    ${item_total}=    Get Text    ${SUBTOTAL}
    ${tax}=    Get Text    ${TAX}

    ${parsed_item_total}=    Get Numeric Value    ${item_total}
    ${parsed_tax}=    Get Numeric Value    ${tax}

    ${parsed_total}=    Evaluate    ${parsed_item_total} + ${parsed_tax}
    Log    Parsed Total: ${parsed_total}

Get Numeric Value
    [Arguments]    ${text}
    ${numeric_value}=    Get Regexp Matches    ${text}    \\d+\\.\\d+
    RETURN    ${numeric_value}[0]


##
Cancel the order
    Click Element    ${BTN_CANCEL}
    Wait Until Element Is Visible    ${HOME_TITLE}
    Click Element    ${BTN_REMOVE}


##
Click on ${BTN_FINISH}
    Click Element    ${BTN_FINISH}

Check the thank you message
    Element Should Be Visible    ${MESSAGE}