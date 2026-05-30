*** Settings ***
Documentation     UT4-2 Melakukan revisi sendback (Submit)
Resource          ../../Resources/CommonFunctionality.robot
Library           OperatingSystem

*** Test Cases ***
UT4-2 Melakukan revisi sendback (Submit)
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat melakukan revisi sendback pada dokumen yang lengkap dan berhasil submit revisi tersebut.
    Start TestCase

    # Buka sidebar menu
    Wait Until Element Is Visible     //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]
    Click Button                      //*[@id="tigerpool-header"]/div[1]/header/div/div[2]/div/div[1]/div[5]/button[1]

    # Buka My Activity
    Wait Until Element Is Visible     //a[contains(text(), 'My Activity')]
    Click Element                     //a[contains(text(), 'My Activity')]

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
    Wait Until Element Is Visible         //a[contains(@class, 'btn-secondary') and contains(., 'Show History')]    timeout=10s
    Click Element                         //a[contains(@class, 'btn-secondary') and contains(., 'Show History')]
    Wait Until Page Contains Element      //h5[contains(text(), 'History Approval')]

    # Tutup History Approval
    Wait Until Element Is Visible    //div[@id='history_modal']//button[@data-bs-dismiss='modal']    timeout=10s
    Sleep                            1s
    Execute Javascript               $('#history_modal .btn-close').trigger('click');
    Wait Until Element Is Not Visible    //div[@id='history_modal']    timeout=10s
    
    # Klik tombol Revise
    Wait Until Element Is Visible     //a[contains(@href,'https://trial.uc.ac.id/student_outbound/form_apply/019cb7d1-6c7e-7bfa-a2b6-4de7941218cf/019e4441-ab4b-75bd-8c08-03b308e6587a')]    timeout=10s
    Click Element                     //a[contains(@href,'https://trial.uc.ac.id/student_outbound/form_apply/019cb7d1-6c7e-7bfa-a2b6-4de7941218cf/019e4441-ab4b-75bd-8c08-03b308e6587a')]

    # Hapus salah satu dokumen yang sudah diupload
    Wait Until Element Is Visible        //button[@ifb-id='attachment_1' and @title='Remove file']    timeout=10s
    Click Button                         //button[@ifb-id='attachment_1' and @title='Remove file']
    Wait Until Element Is Not Visible    //button[@ifb-id='attachment_1' and @title='Remove file']    timeout=10s

    # Upload File 2
    ${NORMALIZED_PATH}=              Normalize Path    ${CURDIR}/../../Resources/Placeholder.png
    Execute Javascript               document.getElementById('_form_attachment_1').classList.remove('d-none');
    Choose File                      id=_inp_attachment_1    ${NORMALIZED_PATH}
    Wait Until Element Is Visible    //a[@id='attachment_1_url' and contains(@class, 'btn-green')]    timeout=20s

    # Submit Form
    Wait Until Element Is Visible    //button[contains(text(), 'Submit') and contains(@class, 'btn-success')]    timeout=10s
    Execute Javascript               document.evaluate("//button[contains(text(), 'Submit') and contains(@class, 'btn-success')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    
    # Konfirmasi
    Wait Until Element Is Visible    //div[@id='aysModal']    timeout=10s
    Wait Until Element Is Visible    xpath=//div[@id='aysModal']//div[contains(@class, 'modal-header')]/following-sibling::div/button[2]    timeout=10s
    Click Button                     xpath=//div[@id='aysModal']//div[contains(@class, 'modal-header')]/following-sibling::div/button[2]
    Wait Until Page Contains         Saved Successfully    timeout=15s
    
    End TestCase
