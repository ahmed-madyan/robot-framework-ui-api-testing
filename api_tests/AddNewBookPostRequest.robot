*** Settings ***
Documentation                                       Api Addbook Validations
...
...                                                 Keywords are imported from the resource file
Resource                                            Resources_API.robot
Library                                             Collections
Library                                             RequestsLibrary

*** Test Cases ***
1- Validate Success Message That Book Added Successfully When Invoke Endpoint Add Book With Valid Payload
    Create Dictionary for the Request Payload
    Invoke Endpoint Addbook With Valid Payload
    Status Should Be HttpStatus.SC_OK
    Response Payload Should Contain Message and ID Keys
    Response Payload Should Contain The Expected Successfully Added Message

2- Validate The Book Details Successfully When Invoke Endpoint Get Book With Valid Book ID
    Invoke Endpoint Get Book With Created Book ID
    Status Should Be HttpStatus.SC_OK
    Validate Book Details

3- Validate The Book Details Deleted successfully Invoke Endpoint Delete Book With Valid Book ID
    Invoke Endpoint Delete Book With Created Book ID
    Status Should Be HttpStatus.SC_OK
    Response Payload Should Contain The Expected Successfully Deleted Message

*** Keywords ***
Create Dictionary for the Request Payload
    &{Request_Payload}=         Create Dictionary           name=${book_name}        isbn=${book_isbn}     aisle=${book_aisle}         author=${book_author}
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

Response Payload Should Contain The Expected Successfully Added Message
    Should Be Equal As Strings              ${Response_Payload.json()}[Msg]         ${Expected_Successfully_Added_Message}
    Log                                     ${Response_Payload.json()}[Msg]
    Log                                     ${Expected_Successfully_Added_Message}

Invoke Endpoint Get Book With Created Book ID
    ${Response_Payload}=        GET         ${BaseURI}${EndPoint_GetBook_With_ID}       params=ID=${Book_ID}     expected_status=${HttpStatus.SC_OK}
    Set Global Variable                     ${Response_Payload}

Validate Book Details
    Should Be Equal As Strings              ${Response_Payload.json()}[0][book_name]           ${book_name}
    Should Be Equal As Strings              ${Response_Payload.json()}[0][isbn]                ${book_isbn}
    Should Be Equal As Strings              ${Response_Payload.json()}[0][aisle]               ${book_aisle}
    Should Be Equal As Strings              ${Response_Payload.json()}[0][author]              ${book_author}
    Log                                     ${Response_Payload.json()}[0][book_name]
    Log                                     ${Response_Payload.json()}[0][isbn]
    Log                                     ${Response_Payload.json()}[0][aisle]
    Log                                     ${Response_Payload.json()}[0][author]

Invoke Endpoint Delete Book With Created Book ID
    &{Request_Payload}=         Create Dictionary           ID=${Book_ID}
    Set Global Variable         ${Request_Payload}
    ${Response_Payload}=        POST         ${BaseURI}${EndPoint_DeleteBook_With_ID}       json=${Request_Payload}     expected_status=${HttpStatus.SC_OK}
    Set Global Variable         ${Response_Payload}

Response Payload Should Contain The Expected Successfully Deleted Message
    Should Be Equal As Strings              ${Response_Payload.json()}[msg]                 ${Expected_Successfully_Deleted_Message}