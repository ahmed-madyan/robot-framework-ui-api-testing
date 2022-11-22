*** Settings ***
Documentation                                       Api Addbook Validations
...
...                                                 Keywords are imported from the resource file
Resource                                            Resources_API.robot
Library                                             Collections
Library                                             RequestsLibrary

*** Test Cases ***
1- Validate API respond with success message that book added successfully
    Create Dictionary for the Request Payload
    Invoke Endpoint Addbook With Valid Payload
    Status Should Be HttpStatus.SC_OK
    Response Payload Should Contain Message and ID Keys
    Response Payload Should Contain The Expected Success Message
#    Validate Book Name Saved

*** Keywords ***
Create Dictionary for the Request Payload
    &{Request_Payload}=         Create Dictionary           name=${book_name}        isbn=${book_isbn}     aisle=${book_aisle}         author=${book_rahulshetty}
    Set Global Variable         ${Request_Payload}

Invoke Endpoint Addbook With Valid Payload
    ${Response_Payload}=        POST                        ${BaseURI}${EndPoint_Addbook}       json=${Request_Payload}     expected_status=${HttpStatus.SC_OK}
    Set Global Variable         ${Response_Payload}

Status Should Be HttpStatus.SC_OK
    Status Should Be            ${HttpStatus.SC_OK}         ${Response_Payload}

Response Payload Should Contain Message and ID Keys
    Dictionary Should Contain Key           ${Response_Payload.json()}                 Msg
    Dictionary Should Contain Key           ${Response_Payload.json()}                 ID
    ${Book_ID}=                             Get From Dictionary             ${Response_Payload.json()}              ID
    Set Global Variable                     ${Book_ID}

Response Payload Should Contain The Expected Success Message
    Should Be Equal As Strings              ${Response_Payload.json()}[Msg]         ${Expected_Success_Message}
    Log                                     ${Response_Payload.json()}[Msg]
    Log                                     ${Expected_Success_Message}

Validate Book Name Saved
