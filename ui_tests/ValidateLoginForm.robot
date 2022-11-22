*** Settings ***
Documentation                                       Validate the login form
...
...                                                 Keywords are imported from the resource file
...
Resource                                            Resources.robot
Library                                             SeleniumLibrary
Test Setup                                          Open the browser with the target URL
Test Teardown                                       Close the browser

*** Test Cases ***
1- Validate succesffull login with the valid credentials
    Fill out the login form                         ${Valid_UserName_Input_Text}        ${Valid_Password_Input_Text}
    Wait for page contains                          ${Expected_Shop_Page_Header_Text}
    URL should be                                   ${URL_Angular_Practice_Shop}
    Validate shop page header

2- Validate unsuccesffull login with InValid credentials
    Fill out the login form                         ${InValid_UserName_Input_Text}      ${InValid_Password_Input_Text}
    Wait for element visibility                     ${SignIn_Error_Message_Locator_XPATH}
    Validate Incorrect error message content

3- Validate unsuccesffull login with empty credentials
    Fill out the login form with empty credentials
    Wait for element visibility                     ${SignIn_Error_Message_Locator_XPATH}
    Validate Empty error message content

*** Keywords ***
Fill out the login form
    [Arguments]                                     ${UserName}                                             ${Password}
    Clear Element Text                              ${UserName_Locator_ID}
    Clear Element Text                              ${Password_Locator_ID}
    Input Text                                      ${UserName_Locator_ID}                                  ${UserName}
    Input Password                                  ${Password_Locator_ID}                                  ${Password}
    Click Button                                    ${SignIn_Button_Locator_ID}

Fill out the login form with empty credentials
    Click Button                                    ${SignIn_Button_Locator_ID}

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

Validate shop page header
    ${Actual_Shop_Page_Header_Text}=    Get Text    ${Shop_Page_Header_Locator_XPATH}
    Should Be Equal As Strings                      ${Actual_Shop_Page_Header_Text}                         ${Expected_Shop_Page_Header_Text}
    Element Text Should Be                          ${Shop_Page_Header_Locator_XPATH}                       ${Expected_Shop_Page_Header_Text}