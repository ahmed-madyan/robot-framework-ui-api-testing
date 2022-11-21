*** Settings ***
Documentation   Validate the login form
Library     SeleniumLibrary

*** Test Cases ***
1- Validate succesffull login with the valid credentials
    Open the browser with the target URL
    Fill out the login form with the valid credentials
    Wait Until Page Contains ProtoCommerce Home
    Validate the user navigated to the shop page
    Close the browser

2- Validate unsuccesffull login with the wrong credentials
    Open the browser with the target URL
    Fill out the login form with the wrong credentials
    Validate the error message displayed
    Validate Incorrect error message content
    Close the browser

3- Validate unsuccesffull login with empty credentials
    Open the browser with the target URL
    Fill out the login form with the empty credentials
    Validate the error message displayed
    Validate Empty error message content
    Close the browser

*** Keywords ***
Open the browser with the target URL
    Create Webdriver                Chrome
    Maximize Browser Window
    Go To                           https://rahulshettyacademy.com/loginpagePractise/

Fill out the login form with the valid credentials
    Clear Element Text              id:username
    Clear Element Text              id:password
    Input Text                      id:username     rahulshettyacademy
    Input Password                  id:password     learning
    Click Button                    id:signInBtn

Fill out the login form with the wrong credentials
    Clear Element Text              id:username
    Clear Element Text              id:password
    Input Text                      id:username     WrongUserName
    Input Password                  id:password     WrongPassword
    Click Button                    id:signInBtn

Fill out the login form with the empty credentials
    Click Button                    id:signInBtn

Validate the error message displayed
    Wait Until Element Is Visible   xpath://div[@class='alert alert-danger col-md-12']

Validate Incorrect error message content
    Element Should Contain          xpath://div[@class='alert alert-danger col-md-12']      Incorrect

Validate Empty error message content
    Element Should Contain          xpath://div[@class='alert alert-danger col-md-12']      Empty

Validate the user navigated to the shop page
    Location Should Be              https://rahulshettyacademy.com/angularpractice/shop

Wait Until Page Contains ProtoCommerce Home
    Wait Until Page Contains        ProtoCommerce Home

Close the browser
    Close Browser