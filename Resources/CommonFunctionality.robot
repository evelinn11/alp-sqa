*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://trial.uc.ac.id/
${COOKIENAME}    tokencis
${COOKIEVALUE}    2c7fa4d038605d7b9aa56c3cb05b90ab

*** Keywords ***
Start TestCase
    Open Browser  ${URL}   chrome
    Maximize Browser Window
    Add Cookie  ${COOKIENAME}  ${COOKIEVALUE}
    Reload Page
    Wait Until Page Contains Element  //*[@id="scrolldashboard"]/button[1]

End TestCase
    Close Browser