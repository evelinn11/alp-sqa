*** Settings ***
Documentation     UT6-1 Melakukan cetak kegiatan yang didaftarkan dalam bentuk file Excel
Resource          ../../Resources/CommonFunctionality.robot
Library           OperatingSystem

*** Test Cases ***
UT6-1 Melakukan cetak kegiatan yang didaftarkan dalam bentuk file Excel
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat melakukan cetak kegiatan yang didaftarkan dalam bentuk file Excel.
    Start TestCase

    # Buka sidebar menu
    Wait Until Element Is Visible     //button[@data-bs-target="#mainmenu-modal"]    timeout=10s
    Click Button                      //button[@data-bs-target="#mainmenu-modal"]

    # Buka My Activity
    Wait Until Element Is Visible     //a[contains(text(), 'My Activity')]    timeout=10s
    Click Element                     //a[contains(text(), 'My Activity')]

    # Buka Student International
    Wait Until Element Is Visible     //a[contains(text(), 'Student International')]    timeout=10s
    Scroll Element Into View          //a[contains(text(), 'Student International')]
    Click Element                     //a[contains(text(), 'Student International')]
    
    # Buka My Outbound
    Wait Until Element Is Visible     //a[contains(text(), 'My Outbound')]    timeout=10s
    Scroll Element Into View          //a[contains(text(), 'My Outbound')]
    Click Element                     //a[contains(text(), 'My Outbound')]

    Wait Until Element Is Visible     //span[contains(text(), 'My Outbound Program List')]    timeout=15s
    
    # Klik tombol Excel
    Wait Until Element Is Visible     //button[contains(@class, 'buttons-excel')]    timeout=15s
    Execute Javascript                document.querySelector('.buttons-excel').click();
    
    # Verifikasi file Excel berhasil terdownload
    ${NORMALIZED_DOWNLOAD_DIR}=      Normalize Path    ${DOWNLOAD_DIR}
    Wait Until Keyword Succeeds      15x    1s    File Should Exist   ${NORMALIZED_DOWNLOAD_DIR}/*Outbound*.xlsx
    
    End TestCase