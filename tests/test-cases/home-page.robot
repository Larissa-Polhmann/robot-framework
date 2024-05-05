*** Settings ***
Library    SeleniumLibrary

Documentation    Test suite to verify the functionality of the e-commerce homepage.

Resource    ../resources/common_resources.robot
Resource    ../resources/page-objects/home_page_resources.robot
Resource    ../locators/locators.robot

Suite Setup     Initiate Browser
Suite Teardown  Terminate Browser


*** Test Cases ***
Sorting by Name A-Z
    [Tags]            Name_A_Z
    common_resources.Perform the login
    Check the A to Z sorting filter
    Verify if the items are sorted correctly
    Are Items Sorted Alphabetically

Sorting by Name Z-A
    [Tags]            Name_Z_A
    Click on the Z to A filter
    Verify if the items are in descending alphabetical order
    Items are sorted in descending alphabetical order

Sorting by Lowest Price
    [Tags]    Lowest_Price
    Select Price (low to high)
    Verify if the items are in ascending order

Sorting by Highest Price
    [Tags]    Highest_Price
    Select Price (high to low)
    Verify if the items are in descending order

Add to cart
    [Tags]    Add_Cart
    Click on a product
    Verify the quantity of 1 item in the cart
    Go to the cart