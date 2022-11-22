*** Settings ***
Documentation                                       Reusable keyword and variables
Library                                             SeleniumLibrary

*** Variables ***
${URL_Login_Page_Practice}                          https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
Open the browser with the target URL
    Create Webdriver                                Chrome
    Maximize Browser Window
    Go To                                           ${URL_Login_Page_Practice}

Close the browser
    Close Browser