*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    ../../resources/common_resources.robot
Resource    ../../locators/locators.robot

*** Keywords ***
Check the A to Z sorting filter
    Wait Until Element Is Visible    ${A_TO_Z}
    
Verify if the items are sorted correctly
    Wait Until Element Is Visible    ${FIRST_ITEM_A_TO_Z}
    ${is_sorted}    home_page_resources.Are Items Sorted Alphabetically

Are Items Sorted Alphabetically
    ${item_names}    Get WebElements    ${FIRST_ITEM_A_TO_Z}
    ${is_sorted}    Set Variable    ${TRUE}
    FOR    ${index}    IN RANGE    2    ${item_names.__len__()}
        ${current_item}    Get Text    ${item_names}[${index}]
        ${previous_item}    Get Text    ${item_names}[${index - 1}]
        Run Keyword If    "${current_item}" < "${previous_item}"    Set Variable    ${is_sorted}    ${FALSE}
    END
    RETURN    ${is_sorted}


##
Click on the Z to A filter
    Select From List By Value    ${FILTER}    za

Verify if the items are in descending alphabetical order
    Wait Until Element Is Visible   ${Z_TO_A}
    ${is_sorted}    home_page_resources.Are Items Sorted Alphabetically

Items are sorted in descending alphabetical order
    ${item_names}    Get WebElements    ${Z_TO_A}
    ${is_sorted}    Set Variable    ${TRUE}
    FOR    ${index}    IN RANGE    2    ${item_names.__len__()}
        ${current_item}    Get Text    ${item_names}[${index}]
        ${previous_item}    Get Text    ${item_names}[${index - 1}]
        Run Keyword If    "${current_item}" > "${previous_item}"    Set Variable    ${is_sorted}    ${FALSE}
    END
    RETURN    ${is_sorted}

##
Select Price (low to high)
    Select From List By Value    ${FILTER}    lohi

Verify if the items are in ascending order
    ${all_prices}    Create List
    ${price_elements}    Get WebElements    ${ITEM_PRICE}
    FOR    ${el}    IN    @{price_elements}
        ${price_text}    Get Text    ${el}
        ${price_value}    Convert To Number    ${price_text.replace('$', '')}
        Append To List    ${all_prices}    ${price_value}
    END


##
Select Price (high to low)
    Select From List By Value    ${FILTER}    hilo

Verify if the items are in descending order
    ${all_prices}    Create List
    ${price_elements}    Get WebElements    ${ITEM_PRICE}
    FOR    ${el}    IN    @{price_elements}
        ${price_text}    Get Text    ${el}
        ${price_value}    Convert To Number    ${price_text.replace('$', '')}
        Append To List    ${all_prices}    ${price_value}
    END
    ${is_sorted}    Set Variable    ${TRUE}
    FOR    ${index}    IN RANGE    2    ${all_prices.__len__()}
        ${current_price}    Set Variable    ${all_prices}[${index - 1}]
        Run Keyword If    ${current_price} < ${all_prices}[${index}]    Set Variable    ${is_sorted}    ${FALSE}
    END
    Should Be True    ${is_sorted}


##
Click on a product
    Click Element    ${ADD_TO_CART}
Verify the quantity of 1 item in the cart
    Wait Until Element Is Visible    ${1_ITEM}
Go to the cart
    Click Element    ${CART}
    Wait Until Element Is Visible    ${1_ITEM_CART}