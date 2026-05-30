*** Settings ***
Documentation     UT7-3 Melakukan pencarian dari beberapa filter
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT7-3 Melakukan pencarian dari beberapa filter
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat menggunakan filter untuk melakukan pencarian dari beberapa filter.
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
    
    # FILTER 1: Country = Malaysia
    Click Button                      id=filter
    Select From List By Value         xpath=(//select[contains(@class, '_category')])[last()]    ma.country_name
    Select From List By Value         xpath=(//select[contains(@class, '_operator')])[last()]    LIKE
    Execute Javascript                var inputs = document.querySelectorAll('input._value'); inputs[inputs.length - 1].value = 'Malaysia'; inputs[inputs.length - 1].dispatchEvent(new Event('change'));

    # FILTER 2: Start Registration Date
    Click Button                      id=filter
    Select From List By Value         xpath=(//select[contains(@class, '_category')])[last()]    CAST(msp.registration_start_date AS DATE)
    Execute Javascript                var inputs = document.querySelectorAll('input._value'); inputs[inputs.length - 1].value = '2026-04-30'; inputs[inputs.length - 1].dispatchEvent(new Event('change'));

    # --- FILTER 3: End Registration Date
    Click Button                      id=filter
    Select From List By Value         xpath=(//select[contains(@class, '_category')])[last()]    CAST(msp.registration_end_date AS DATE)
    Execute Javascript                var inputs = document.querySelectorAll('input._value'); inputs[inputs.length - 1].value = '2026-08-27'; inputs[inputs.length - 1].dispatchEvent(new Event('change'));

    # --- FILTER 4: Start Program Date 
    Click Button                      id=filter
    Select From List By Value         xpath=(//select[contains(@class, '_category')])[last()]    msp.program_start_date
    Execute Javascript                var inputs = document.querySelectorAll('input._value'); inputs[inputs.length - 1].value = '2026-09-03'; inputs[inputs.length - 1].dispatchEvent(new Event('change'));

    # --- FILTER 5: End Program Date 
    Click Button                      id=filter
    Select From List By Value         xpath=(//select[contains(@class, '_category')])[last()]    msp.program_end_date
    Execute Javascript                var inputs = document.querySelectorAll('input._value'); inputs[inputs.length - 1].value = '2026-09-09'; inputs[inputs.length - 1].dispatchEvent(new Event('change'));

    # --- FILTER 6: Program Type 
    Click Button                      id=filter
    Select From List By Value         xpath=(//select[contains(@class, '_category')])[last()]    category
    Select From List By Value         xpath=(//select[contains(@class, '_value')])[last()]       IP
    
    # Klik tombol Search
    Click Button                      id=search
    Sleep                             3s

    # Verifikasi bahwa hanya program Malaysia yang ditampilkan
    Wait Until Page Contains          Malaysia    timeout=10s
    Scroll Element Into View          //b[contains(text(), 'GLOBAL ENTERPRISE EXPERIENCE: EXPLORING BUSINESS OPPORTUNITY IN MALAYSIA - Immersion by SEGi University Malaysia')]
    Wait Until Element Is Visible     //b[contains(text(), 'GLOBAL ENTERPRISE EXPERIENCE: EXPLORING BUSINESS OPPORTUNITY IN MALAYSIA - Immersion by SEGi University Malaysia')]
    Element Should Be Visible         //b[contains(text(), 'GLOBAL ENTERPRISE EXPERIENCE: EXPLORING BUSINESS OPPORTUNITY IN MALAYSIA - Immersion by SEGi University Malaysia')]
    
    # Pastikan program lain tidak ditampilkan
    Element Should Not Be Visible         //b[contains(text(), 'Woosong University Korea Exchange Program Fall 2026/2027')]
    Element Should Not Be Visible         //b[contains(text(), 'Shih Chien Asia University Summer Program 2026')]
    End TestCase
