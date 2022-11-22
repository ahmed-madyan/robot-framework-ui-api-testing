*** Settings ***
Documentation                                       Reusable keyword and variables
...
...
Library                                             Collections
Library                                             RequestsLibrary

*** Variables ***
${BaseURI}                                          https://rahulshettyacademy.com/
${EndPoint_Addbook}                                 Library/Addbook.php
${HttpStatus.SC_OK}                                 200
${HttpStatus.SC_CREATED}                            201
${HttpStatus.SC_BAD_REQUEST}                        400
${HttpStatus.SC_UNAUTHORIZED}                       401
${HttpStatus.SC_FORBIDDEN}                          403
${HttpStatus.SC_NOT_FOUND}                          404
#${Response_Payload}
#${Request_Payload}

*** Keywords ***