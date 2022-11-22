*** Settings ***
Documentation                                       Reusable keyword and variables
Library                                             SeleniumLibrary

*** Variables ***
${URL_Login_Page_Practice}                          https://rahulshettyacademy.com/loginpagePractise/
${UserName_Locator_ID}                              id:username
${Password_Locator_ID}                              id:password
${SignIn_Button_Locator_ID}                         id:signInBtn
${Shop_Page_Header_Locator_XPATH}                   xpath://button[@class='navbar-toggler']//preceding-sibling::a[@class='navbar-brand']
${SignIn_Error_Message_Locator_XPATH}               xpath://div[@class='alert alert-danger col-md-12']
${Valid_UserName_Input_Text}                        rahulshettyacademy
${Valid_Password_Input_Text}                        learning
${InValid_UserName_Input_Text}                      InValidUserName
${InValid_Password_Input_Text}                      InValidPassword
${URL_Angular_Practice_Shop}                        https://rahulshettyacademy.com/angularpractice/shop
${Incorrect_UserName_Password_Error_Message}        Incorrect username/password.
${Empty_UserName_Password_Error_Message}            Empty username/password.
${Actual_Shop_Page_Header_Text}
${Expected_Shop_Page_Header_Text}                   ProtoCommerce Home

*** Keywords ***
Open the browser with the target URL
    Create Webdriver                                Chrome
    Maximize Browser Window
    Go To                                           ${URL_Login_Page_Practice}

Close the browser
    Close Browser

Wait for element visibility
    [arguments]                                     ${Element_Locator}
    Wait Until Element Is Visible                   ${Element_Locator}

Wait for page contains
    [arguments]                                     ${Expected_Text}
    Wait Until Page Contains                        ${Expected_Text}

URL should be
    [arguments]                                     ${URL}
    Location Should Be                              ${URL}