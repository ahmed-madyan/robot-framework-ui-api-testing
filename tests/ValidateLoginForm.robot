*** Settings ***
Documentation                                       Validate the login form
Library                                             SeleniumLibrary
Resource                                            Resources.robot
Test Setup                                          Open the browser with the target URL
Test Teardown                                       Close the browser

*** Variables ***
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

*** Test Cases ***
1- Validate succesffull login with the valid credentials
    Fill out the login form with the valid credentials
    Wait Until Page Contains ProtoCommerce Home
    Validate the user navigated to the shop page
    Validate shop page header

2- Validate unsuccesffull login with InValid credentials
    Fill out the login form with InValid credentials
    Validate the error message displayed
    Validate Incorrect error message content

3- Validate unsuccesffull login with empty credentials
    Fill out the login form with the empty credentials
    Validate the error message displayed
    Validate Empty error message content

*** Keywords ***
Fill out the login form with the valid credentials
    Clear Element Text                              ${UserName_Locator_ID}
    Clear Element Text                              ${Password_Locator_ID}
    Input Text                                      ${UserName_Locator_ID}                                  ${Valid_UserName_Input_Text}
    Input Password                                  ${Password_Locator_ID}                                  ${Valid_Password_Input_Text}
    Click Button                                    ${SignIn_Button_Locator_ID}

Fill out the login form with InValid credentials
    Clear Element Text                              ${UserName_Locator_ID}
    Clear Element Text                              ${Password_Locator_ID}
    Input Text                                      ${UserName_Locator_ID}                                  ${InValid_UserName_Input_Text}
    Input Password                                  ${Password_Locator_ID}                                  ${InValid_Password_Input_Text}
    Click Button                                    ${SignIn_Button_Locator_ID}

Fill out the login form with the empty credentials
    Click Button                                    ${SignIn_Button_Locator_ID}

Validate the error message displayed
    Wait Until Element Is Visible                   ${SignIn_Error_Message_Locator_XPATH}

Validate Incorrect error message content
    Element Should Contain                          ${SignIn_Error_Message_Locator_XPATH}                   Incorrect
    ${IncorrectMessageText}=     Get Text           ${SignIn_Error_Message_Locator_XPATH}
    Should Be Equal As Strings                      ${IncorrectMessageText}                                 ${Incorrect_UserName_Password_Error_Message}
    Element Text Should Be                          ${SignIn_Error_Message_Locator_XPATH}                   ${Incorrect_UserName_Password_Error_Message}

Validate Empty error message content
    Element Should Contain                          ${SignIn_Error_Message_Locator_XPATH}                   Empty
    ${EmptyMessageText}=     Get Text               ${SignIn_Error_Message_Locator_XPATH}
    Should Be Equal As Strings                      ${EmptyMessageText}                                     ${Empty_UserName_Password_Error_Message}
    Element Text Should Be                          ${SignIn_Error_Message_Locator_XPATH}                   ${Empty_UserName_Password_Error_Message}

Validate the user navigated to the shop page
    Location Should Be                              ${URL_Angular_Practice_Shop}

Wait Until Page Contains ProtoCommerce Home
    Wait Until Page Contains                        ${Expected_Shop_Page_Header_Text}

Validate shop page header
    ${Actual_Shop_Page_Header_Text}=    Get Text    ${Shop_Page_Header_Locator_XPATH}
    Should Be Equal As Strings                      ${Actual_Shop_Page_Header_Text}                         ${Expected_Shop_Page_Header_Text}
    Element Text Should Be                          ${Shop_Page_Header_Locator_XPATH}                       ${Expected_Shop_Page_Header_Text}