*** Settings ***
Library    SeleniumLibrary

Documentation    This test suite verifies the order review process

Resource    ../resources/common_resources.robot
Resource    ../resources/page-objects/review_order_resources.robot
Resource    ../locators/locators.robot

Suite Setup     Initiate Browser
Suite Teardown  Terminate Browser


*** Test Cases ***
Review the total price and proceed with the purchase
    [Tags]    Review_order
    common_resources.Perform the login
    Place an order
    Review the order value

Cancel order
    [Tags]    Cancel_order
    Cancel the order

Complete the order
    [Tags]    Complete_order
    Place an order
    Click on ${BTN_FINISH}
    Check the thank you message
