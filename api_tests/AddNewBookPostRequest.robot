*** Settings ***
Documentation                                       Api Addbook Validations
...
...                                                 Keywords are imported from the resource file
Resource                                            Resources.robot
Library                                             Collections
Library                                             RequestsLibrary

*** Test Cases ***
1- Validate api responded with success message that book added successfully
    Create Dictionary for the Request Payload
    Invoke the endpoint Addbook with valid payload
    Status Should Be HttpStatus.SC_OK


*** Keywords ***
Create Dictionary for the Request Payload
    &{Request_Payload}=         Create Dictionary           name=Learn Appium Automation with Java   isbn=bcd   aisle=227   author=john
    Log                         ${Request_Payload}

Invoke the endpoint Addbook with valid payload
    ${Response_Payload}=        POST                        ${BaseURI}${EndPoint_Addbook}   json=${Request_Payload}     expected_status=${HttpStatus.SC_OK}
    &{Response}=         Create Dictionary           ${Response_Payload}
    Log                         ${Response}

Status Should Be HttpStatus.SC_OK
    Status Should Be            ${HttpStatus.SC_OK}         ${Response_Payload}