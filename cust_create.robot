*** Settings ***
Documentation     Customer Creation Test Suite
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:3000/admin/customer/create
${BROWSER}        chrome

*** Test Cases ***
Create Customer - Valid
    [Documentation]    All required fields are completed.
    [tags]             smoke
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window    
    Input Text         id=firstName     มาริโอ
    Input Text         id=lastName      ใจดี
    Input Text         id=username      mario
    Input Text         id=password      1234
    Click Button       id=btnCreate        
    Handle Alert       ACCEPT
    Close Browser

# Create Customer - Blank Feilds
#     [Documentation]    Some required fields are not completed.
#     [Tags]             smoke  
#     Open Browser    ${URL}    ${BROWSER}  
#     Sleep              2s
#     Click Link         id=btnCreate
#     Input Text         id=firstName     ${EMPTY}
#     Input Text         id=lastName      ${EMPTY}    
#     Input Text         id=username      ${EMPTY}
#     Input Text         id=password      ${EMPTY}    
#     Click Button       id=submit        
#     Wait Until Element Is Visible   id=invalid-firstName
#     Wait Until Page Contains    กรุณาระบุชื่อ
#     Wait Until Element Is Visible   id=invalid-lastName
#     Wait Until Page Contains    กรุณาระบุนามสกุล
#     Wait Until Element Is Visible   id=invalid-username
#     Wait Until Page Contains    กรุณาระบุชื่อผู้ใช้
#     Wait Until Element Is Visible   id=invalid-password
#     Wait Until Page Contains    กรุณาระบุรหัผ่าน
#     Close Browser

# Create Customer - Existing Username  
#     [Documentation]    Username has been used
#     [Tags]                 
#     Sleep              2s
#     Input Text         id=username      nadech
#     Click Button       id=submit             
#     Wait Until Element Is Visible   id=invalid-username
#     Wait Until Page Contains    ชื่อผู้ใช้นี้มีอยู่แล้ว
#     Sleep              2s
#     Close Browser