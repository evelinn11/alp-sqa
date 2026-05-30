*** Settings ***
Documentation     UT2-2 Mahasiswa melakukan registrasi Outbound Program dengan data yang lengkap
Resource          ../../Resources/CommonFunctionality.robot
Library           OperatingSystem

*** Test Cases ***
UT2-2 Mahasiswa Melakukan Registrasi Outbound Program dengan Data yang Lengkap
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa sistem menerima registrasi Outbound Program dengan data yang lengkap.
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
    
    ${NORMALIZED_PATH}=              Normalize Path    ${CURDIR}/../../Resources/Placeholder.png

    # Upload File 1
    # Buka status "hidden" pada form upload
    Execute Javascript               document.getElementById('_form_attachment_0').classList.remove('d-none');
    Choose File                      id=_inp_attachment_0    ${NORMALIZED_PATH}
    Wait Until Element Is Visible    //a[@id='attachment_0_url' and contains(@class, 'btn-green')]    timeout=20s

    # Upload File 2
    Execute Javascript               document.getElementById('_form_attachment_1').classList.remove('d-none');
    Choose File                      id=_inp_attachment_1    ${NORMALIZED_PATH}
    Wait Until Element Is Visible    //a[@id='attachment_1_url' and contains(@class, 'btn-green')]    timeout=20s

    # Upload File 3
    Execute Javascript               document.getElementById('_form_attachment_2').classList.remove('d-none');
    Choose File                      id=_inp_attachment_2    ${NORMALIZED_PATH}
    Wait Until Element Is Visible    //a[@id='attachment_2_url' and contains(@class, 'btn-green')]    timeout=20s

    # Submit Form
    Wait Until Element Is Visible    //button[contains(text(), 'Submit') and contains(@class, 'btn-success')]    timeout=10s
    Execute Javascript               document.evaluate("//button[contains(text(), 'Submit') and contains(@class, 'btn-success')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
    # Konfirmasi
    Wait Until Element Is Visible    //div[@id='aysModal']    timeout=10s
    Wait Until Element Is Visible    xpath=//div[@id='aysModal']//div[contains(@class, 'modal-header')]/following-sibling::div/button[2]    timeout=10s
    Click Button                     xpath=//div[@id='aysModal']//div[contains(@class, 'modal-header')]/following-sibling::div/button[2]
    Wait Until Page Contains         Saved Successfully    timeout=15s
    
    End TestCase