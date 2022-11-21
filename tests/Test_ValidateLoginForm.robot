*** Settings ***
Documentation   Validate the login form
Library     SeleniumLibrary

*** Test Cases ***
Validate unsuccesffull login
    Open the browser with the target URL
    Fill out the login form with the wrong credentials
#    Validate the error message displayed
#    Validate error message content

*** Keywords ***
Open the browser with the target URL
    Create Webdriver    Chrome  resources/chromedriver.exe
    Maximize Browser Window
    Go To   https://rahulshettyacademy.com/loginpagePractise/

Fill out the login form with the wrong credentials
    input text      id:username     WrongUserName
    input password  id:password     WrongPassword
    click button    id:signInBtn

Validate the error message displayed



Validate error message content