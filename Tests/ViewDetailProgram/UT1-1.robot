*** Settings ***
Documentation     UT1-1 Melihat detail program yang terdaftar
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT1-1 Melihat Detail Program yang Terdaftar
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat melihat detail program yang terdaftar dengan benar.
    Start TestCase

    # Buka sidebar menu
    Wait Until Element Is Visible    //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]
    Click Button                     //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]

    # Buka My Activity
    Wait Until Element Is Visible     //a[contains(text(), 'My Activity')]
    Click Element                     //a[contains(text(), 'My Activity')]

    # Buka Student International
    Wait Until Page Contains Element  //a[contains(text(), 'Student International')]
    Scroll Element Into View          //a[contains(text(), 'Student International')]
    Wait Until Element Is Visible     //a[contains(text(), 'Student International')]
    Click Element                     //a[contains(text(), 'Student International')]
    
    # Buka Outbound Program
    Wait Until Page Contains Element  //a[contains(text(), 'Outbound Program')]
    Scroll Element Into View          //a[contains(text(), 'Outbound Program')]
    Wait Until Element Is Visible     //a[contains(text(), 'Outbound Program')]
    Click Element                     //a[contains(text(), 'Outbound Program')]

    # Buka detail program
    Wait Until Page Contains Element  //span[contains(text(), 'Student Outbound Program List')]
    Scroll Element Into View          //a[contains(@href, 'https://trial.uc.ac.id/student_outbound/form_apply/019ddcbe-b722-70b2-a848-0d49e0d98398/')]
    Wait Until Element Is Visible     //a[contains(@href, 'https://trial.uc.ac.id/student_outbound/form_apply/019ddcbe-b722-70b2-a848-0d49e0d98398/')]
    Click Element                     //a[contains(@href, 'https://trial.uc.ac.id/student_outbound/form_apply/019ddcbe-b722-70b2-a848-0d49e0d98398/')]

    Wait Until Page Contains Element  //span[contains(text(), 'Student Outbound New Program')]
    End TestCase
