*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${URL}            http://127.0.0.1:8000/admin/customer
${BROWSER}        chrome

*** Test Cases ***
Update Customer - Valid
    [Documentation]    All required fields are completed.
    [tags]             
    Maximize Browser Window
    Click Link         xpath=//*[@id="frmDelete22"]/div/a[2]
    Input Text         id=firstName     ปกรเดช
    Input Text         id=lastName      พนาพงษ์
    Input Text         id=username      pakorndech
    Input Text         id=password      123456    
    Click Button       id=submit        
    Wait Until Element Is Visible   xpath=/html/body/div[2]/div/div[6]/button[1]
    Click Button        xpath=/html/body/div[2]/div/div[6]/button[1]

Update Customer - Blank Feilds
    [Documentation]    Some required fields are not completed.
    [Tags]                 
    Sleep              2s
    Click Link         xpath=//*[@id="frmDelete22"]/div/a[2]
    Input Text         id=firstName     ${EMPTY}
    Input Text         id=lastName      ${EMPTY}    
    Input Text         id=username      ${EMPTY}
    Input Text         id=password      ${EMPTY}    
    Click Button       id=submit
    Wait Until Element Is Visible   id=invalid-firstName
    Wait Until Page Contains    กรุณาระบุชื่อ
    Wait Until Element Is Visible   id=invalid-lastName
    Wait Until Page Contains    กรุณาระบุนามสกุล
    Wait Until Element Is Visible   id=invalid-username
    Wait Until Page Contains    กรุณาระบุชื่อผู้ใช้
    Wait Until Element Is Visible   id=invalid-password
    Wait Until Page Contains    กรุณาระบุรหัผ่าน

Update Customer - Existing Username  
    [Documentation]    Username has been used
    [Tags]                 
    Sleep              2s        
    Input Text         id=username      nadech
    Click Button       id=submit            
    Wait Until Element Is Visible   id=invalid-username
    Wait Until Page Contains    ชื่อผู้ใช้นี้มีอยู่แล้ว
    Sleep              2s