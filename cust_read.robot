*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    ${URL}    ${BROWSER}
Suite Teardown    Close Browser

*** Variables ***
${URL}            http://127.0.0.1:8000/admin/customer
${BROWSER}        chrome

*** Test Cases ***
Read Customer - Valid
    [Documentation]    Show all fields.
    [tags]             
    Maximize Browser Window 
    Click Link         xpath=//*[@id="frmDelete1"]/div/a[1]
    Page Should Contain     รายละเอียดลูกค้า
    Sleep              5s
