*** Settings ***
Documentation     UT7-1 Filter - Cek Active/Expire
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT7-1 Filter - Cek Active/Expire
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat menggunakan filter untuk melihat program yang aktif dan kadaluarsa dengan benar.
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
    Wait Until Page Contains Element  //span[contains(text(), 'Student Outbound Program List')]
    
    # Ubah filter status menjadi Expired
    Execute Javascript                $('.filter-item-special select._value').val('E').trigger('change');
    Click Button                      id=search
    Sleep                             2s

    # Verifikasi bahwa hanya program yang kadaluarsa yang ditampilkan
    Scroll Element Into View          //b[contains(text(), 'Universiti Sains Malaysia Exchange Program Fall 26/27')]
    Wait Until Page Contains Element  //b[contains(text(), 'Universiti Sains Malaysia Exchange Program Fall 26/27')]
    End TestCase
