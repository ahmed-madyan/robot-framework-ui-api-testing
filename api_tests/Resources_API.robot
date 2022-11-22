*** Settings ***
Documentation                                       Reusable keyword and variables
...
...
Library                                             Collections
Library                                             RequestsLibrary

*** Variables ***
${BaseURI}                                          https://rahulshettyacademy.com/
${EndPoint_Addbook}                                 Library/Addbook.php
${EndPoint_GetBook_With_ID}                         Library/GetBook.php
${EndPoint_DeleteBook_With_ID}                      Library/DeleteBook.php
${HttpStatus.SC_OK}                                 200
${HttpStatus.SC_CREATED}                            201
${HttpStatus.SC_BAD_REQUEST}                        400
${HttpStatus.SC_UNAUTHORIZED}                       401
${HttpStatus.SC_FORBIDDEN}                          403
${HttpStatus.SC_NOT_FOUND}                          404
${book_name}                                        RobotFramework
${book_isbn}                                        123
${book_aisle}                                       123
${book_author}                                      AhmedMadyan
${Book_ID}
${Expected_Successfully_Added_Message}              successfully added
${Expected_Successfully_Deleted_Message}            book is successfully deleted
${Request_Payload}
${Response_Payload}