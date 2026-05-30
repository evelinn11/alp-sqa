*** Settings ***
Documentation     UT3-1 Mahasiswa melihat dan mengecek riwayat approval dari program yang sudah terdaftar
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT3-1 Melihat Riwayat Approval Program yang Terdaftar
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat melihat riwayat approval program yang terdaftar dengan benar.
    Start TestCase

    # Buka sidebar menu
    Wait Until Element Is Visible     //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]
    Click Button                      //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]

    # Buka My Activity
    Wait Until Element Is Visible     //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]
    Click Button                      //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]

    # Buka Student International
    Wait Until Page Contains Element  //a[contains(text(), 'Student International')]
    Scroll Element Into View          //a[contains(text(), 'Student International')]
    Wait Until Element Is Visible     //a[contains(text(), 'Student International')]
    Click Element                     //a[contains(text(), 'Student International')]
    
    # Buka My Outbound
    Wait Until Page Contains Element  //a[contains(text(), 'My Outbound')]
    Scroll Element Into View          //a[contains(text(), 'My Outbound')]
    Wait Until Element Is Visible     //a[contains(text(), 'My Outbound')]
    Click Element                     //a[contains(text(), 'My Outbound')]

    Wait Until Page Contains Element  //span[contains(text(), 'My Outbound Program List')]
    
    # Klik tombol Show History
    Wait Until Element Is Visible     //a[contains(@class, 'btn-secondary') and contains(., 'Show History')]    timeout=10s
    Click Element                     //a[contains(@class, 'btn-secondary') and contains(., 'Show History')]

    Wait Until Page Contains Element  //h5[contains(text(), 'History Approval')]
    End TestCase
