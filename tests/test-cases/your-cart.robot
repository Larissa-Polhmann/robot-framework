*** Settings ***
Library    SeleniumLibrary

Documentation    Test suite for verifying the functionality of the shopping cart page

Resource    ../resources/common_resources.robot
Resource    ../resources/page-objects/your_cart_resources.robot
Resource    ../locators/locators.robot

Suite Setup     Initiate Browser
Suite Teardown  Terminate Browser


*** Test Cases ***
Add one item to cart
    [Tags]    Add_one_item
    common_resources.Perform the login 
    Add an item to the cart
    Verify quantity of items added


Add two items to cart
    [Tags]    Add_two_items
    Add two items to the cart
    Confirm the quantity of 2 items added

Remove items from cart
    [Tags]    Remove_items
    Remove added items