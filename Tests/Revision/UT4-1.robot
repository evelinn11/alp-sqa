*** Settings ***
Documentation     UT4-1 Melakukan revisi sendback (dokumen tidak lengkap)
Resource          ../../Resources/CommonFunctionality.robot

*** Test Cases ***
UT4-1 Melakukan Revisi Sendback (Dokumen Tidak Lengkap)
    [Documentation]     Test case ini bertujuan untuk memastikan bahwa pengguna dapat melakukan revisi sendback pada dokumen yang tidak lengkap.
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
    Wait Until Element Is Visible        //button[@ifb-id='attachment_2' and @title='Remove file']    timeout=10s
    Click Button                         //button[@ifb-id='attachment_2' and @title='Remove file']
    Wait Until Element Is Not Visible    //button[@ifb-id='attachment_2' and @title='Remove file']    timeout=10s

    # Submit
    Scroll Element Into View          //*[@id="apply_form"]/div[5]/button
    Wait Until Element Is Visible     //*[@id="apply_form"]/div[5]/button
    Click Button                      //*[@id="apply_form"]/div[5]/button
    Wait Until Page Contains Element  //div[contains(text(), 'Are you sure you want to apply this program?')]
    Wait Until Element Is Visible     //*[@id="aysModal"]/div/div/div[3]/button[2]
    Click Button                      //*[@id="aysModal"]/div/div/div[3]/button[2]
    Wait Until Page Contains Element  //div[contains(text(), 'Please Check Required Attachment.')]
    
    End TestCase
