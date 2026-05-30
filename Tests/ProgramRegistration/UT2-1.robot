*** Settings ***
Documentation     UT2-1 Mahasiswa melakukan registrasi Outbound Program dengan data yang tidak lengkap
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT2-1 Mahasiswa Melakukan Registrasi Outbound Program dengan Data yang Tidak Lengkap
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa sistem menampilkan pesan error yang sesuai ketika mahasiswa mencoba melakukan registrasi Outbound Program dengan data yang tidak lengkap.
    Start TestCase

    # Buka sidebar menu
    Wait Until Element Is Visible  //button[@data-bs-target="#mainmenu-modal"]
    Click Button                   //button[@data-bs-target="#mainmenu-modal"]
    
    # Buka My Activity
    Wait Until Element Is Visible  //a[contains(text(), 'My Activity')]
    Click Element                  //a[contains(text(), 'My Activity')]

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
    
    # Submit
    Scroll Element Into View          //*[@id="apply_form"]/div[5]/button
    Wait Until Element Is Visible     //*[@id="apply_form"]/div[5]/button
    Click Button                      //*[@id="apply_form"]/div[5]/button
    Wait Until Page Contains Element  //div[contains(text(), 'Are you sure you want to apply this program?')]
    Wait Until Element Is Visible     //*[@id="aysModal"]/div/div/div[3]/button[2]
    Click Button                      //*[@id="aysModal"]/div/div/div[3]/button[2]
    Wait Until Page Contains Element  //div[contains(text(), 'Please Check Required Attachment.')]
    End TestCase