*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}    https://trial.uc.ac.id/
${COOKIENAME}    tokencis
${COOKIEVALUE}    43134097f4675933c31aac3e67a8674b
${DOWNLOAD_DIR}   ${CURDIR}/Downloads

*** Keywords ***
Start TestCase
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --disable-notifications

    ${NORMALIZED_DOWNLOAD_DIR}=    Normalize Path    ${DOWNLOAD_DIR}
    Create Directory               ${NORMALIZED_DOWNLOAD_DIR}
    ${prefs}=      Create Dictionary    download.default_directory=${NORMALIZED_DOWNLOAD_DIR}    download.prompt_for_download=${FALSE}    directory_upgrade=${TRUE}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    
    Open Browser  ${URL}   chrome  options=${options}
    Maximize Browser Window
    Add Cookie  ${COOKIENAME}  ${COOKIEVALUE}
    Reload Page
    Wait Until Page Contains Element  //*[@id="scrolldashboard"]/button[1]

End TestCase
    Close Browser