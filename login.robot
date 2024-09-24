*** Settings ***
Documentation     Login Test Suite 
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:3000/admin/login
${BROWSER}        chrome
${VALID_USERNAME}    admin
${VALID_PASSWORD}    12345678
${INVALID_USERNAME}    test
${INVALID_PASSWORD}    1234

*** Test Cases ***
Valid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ถูกต้อง
    [tags]             smoke
    Open Browser       ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text         name=username      ${VALID_USERNAME}
    Input Text         name=password      ${VALID_PASSWORD}    
    Click Button       id=btnLogin    
    Handle Alert       ACCEPT    
    Sleep              2s
    Wait Until Page Contains     รายการข้อมูลลูกค้า   
    Close Browser 
        
Invalid Login Test
    [Documentation]    เข้าสู่ระบบด้วยชื่อผู้ใช้และรหัสที่ไม่ถูกต้อง
    [tags]                 
    Open Browser       ${URL}    ${BROWSER}
    Input Text         id=username      ${INVALID_USERNAME}
    Input Text         id=password      ${INVALID_PASSWORD}    
    Click Button       id=btnLogin    
    Handle Alert       ACCEPT
    Sleep              2s
    Page Should Not Contain     รายการข้อมูลลูกค้า  
    Close Browser      