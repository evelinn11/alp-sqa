*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://trial.uc.ac.id/
${COOKIENAME}    tokencis
${COOKIEVALUE}    bc95940ddf2bdec6448e185651dbd0f0

*** Keywords ***
Start TestCase
    ${chrome_options}=    Set Variable    add_argument("--disable-notifications")
    Open Browser  ${URL}   chrome  options=${chrome_options}
    Maximize Browser Window
    Add Cookie  ${COOKIENAME}  ${COOKIEVALUE}
    Reload Page
    Wait Until Page Contains Element  //*[@id="scrolldashboard"]/button[1]

End TestCase
    Close Browser