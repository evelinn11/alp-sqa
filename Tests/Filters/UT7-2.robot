*** Settings ***
Documentation     UT7-2 Tambah Filter Country = Nama Negara
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT7-2 Tambah Filter Country = Nama Negara
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
    
    # Tambah baris filter baru
    Click Button                      id=filter
    Wait Until Element Is Visible     xpath=(//div[contains(@class, 'filter-item')]//select[contains(@class, '_category')])[last()]    timeout=5s
    
    # Pilih kategori Country
    Select From List By Value         xpath=(//div[contains(@class, 'filter-item')]//select[contains(@class, '_category')])[last()]    ma.country_name
    Sleep                             1s
    
    # Masukkan nama negara "Malaysia" ke baris filter terakhir
    Execute Javascript                var inputs = document.querySelectorAll('.filter-item:not(.filter-item-special) input._value'); inputs[inputs.length - 1].value = 'Malaysia'; inputs[inputs.length - 1].dispatchEvent(new Event('change'));
    
    # Klik tombol Search
    Click Button                      id=search
    Sleep                             2s

    # Verifikasi bahwa hanya program Malaysia yang ditampilkan
    Wait Until Page Contains          Malaysia    timeout=10s
    Scroll Element Into View          //b[contains(text(), 'INTI Little Explorer Camp 2026, Malaysia')]
    Wait Until Element Is Visible     //b[contains(text(), 'INTI Little Explorer Camp 2026, Malaysia')]
    Element Should Be Visible         //b[contains(text(), 'INTI Little Explorer Camp 2026, Malaysia')]
    
    # Pastikan program dari negara lain TIDAK ditampilkan
    Element Should Not Be Visible         //b[contains(text(), 'Woosong University Korea Exchange Program Fall 2026/2027')]
    Element Should Not Be Visible         //b[contains(text(), 'Shih Chien Asia University Summer Program 2026')]
    End TestCase
