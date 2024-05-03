*** Settings ***
Library    SeleniumLibrary

Documentation    Test cases for the login page of the system.
...              This test suite verifies if users can successfully log in
...              using valid and invalid credentials.

Resource    ../resources/common_resources.robot
Resource    ../resources/login_resources.robot

Suite Setup     Initiate Browser
Suite Teardown  Terminate Browser


*** Test Cases ***
Test Case 01 - Successfully logs in
    [Documentation]    Verifies successful login with valid credentials.
    ...
    [Tags]            login
    Enter the correct username
    Enter the correct password
    Click on login


Test Case 02 - Locked out user
    [Documentation]    Verifies error message when attempting login with invalid credentials.
    [Tags]            login_error
    Enter the incorrect username
    Enter the incorrect password
    Click on login
