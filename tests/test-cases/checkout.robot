*** Settings ***
Library    SeleniumLibrary

Documentation    Test suite for verifying the functionality of the checkout page

Resource    ../resources/common_resources.robot
Resource    ../resources/page-objects/checkout_resources.robot
Resource    ../locators/locators.robot

Suite Setup     Initiate Browser
Suite Teardown  Terminate Browser


*** Test Cases ***
User information
    [Tags]    User_information
    common_resources.Perform the login 
    Fill in the first name
    Fill in the last name
    Fill in the zip code
    Continue with the purchase


Cancel order
    [Tags]    Cancel_order
    Click the button to cancel order
    Verify the redirection to the home page

Proceed without entering the users first name
    [Tags]    First_name
    Go to checkout
    Fill in the last name
    Fill in the zip code
    Click to continue
    Validate the message ${FIRST_NAME_ERROR}

Proceed without entering the users last name
    [Tags]    Last_name
    Fill in the name
    Fill in the zip code
    Click to continue
    Check the message ${LAST_NAME_ERROR}

Proceed without entering the users postal code
    [Tags]    Zip_code
    Fill in the name
    Fill in the last name
    Click to continue
    Verify the message ${POSTAL_CODE_ERROR}