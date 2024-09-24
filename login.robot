*** Settings ***
Documentation     ทดสอบหน้าเข้าสู่ระบบ
Library           SeleniumLibrary
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${URL}            http://203.158.141.62/admin/login
${BROWSER}        chrome

*** Test Cases ***
กรณีเข้าสูระบบสำเร็จ
    [Documentation]    เข้าสู่ระบบสำเร็จ
    [tags]             smoke
    Maximize Browser Window
    Input Text         name=username      admin
    Input Text         name=password      1234    
    Click Button       id=btnLogin
    Sleep              3s
    Wait Until Element Is Visible   id=valid_login
    
กรณีระบุชื่อผู้ใช้หรือรหัสผ่านผิด
    [Documentation]    ชื่อหรือรหัสผ่านผิด
    [tags]                 
    Click Link         id=linkLogout
    Input Text         id=username      nomot
    Input Text         id=password      1234    
    Click Button       id=btnLogin
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div/div[6]/button[1]
    Click Button        xpath=/html/body/div[2]/div/div[6]/button[1]    