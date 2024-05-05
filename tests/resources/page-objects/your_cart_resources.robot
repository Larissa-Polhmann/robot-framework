*** Settings ***
Library    SeleniumLibrary
Resource    ../../resources/common_resources.robot
Resource    ../../locators/locators.robot

*** Keywords ***
Add an item to the cart
    Click Element    ${ADD_TO_CART}
    Wait Until Element Is Visible    ${1_ITEM}
    Click Element    ${CART}

Verify quantity of items added
    Wait Until Element Is Visible    ${CART_TITLE}
    Element Should Be Visible    ${1_ITEM_CART}


##
Add two items to the cart
    Click Element    ${CONTINUE_SHOPPING}
    Click Element    ${ADD_SECOND_ITEM}
    Element Should Be Visible    ${2_ITEMS}
    Click Element    ${CART}

Confirm the quantity of 2 items added
    ${item_count}    Get WebElements    ${CART_LIST}
    Length Should Be    ${item_count}    2


##
Remove added items
    Click Element    ${REMOVE_SECOND_ITEM}
    Click Element    ${REMOVE_FIRST_ITEM}
    ${item_count}    Get WebElements    ${CART_LIST}
    Length Should Be    ${item_count}    0
