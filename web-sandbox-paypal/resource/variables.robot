*** Settings ***

*** Variables ***
${URL}                              https://www.sandbox.paypal.com/
${BUTTON_CREATE_ACCOUNT}            id=signup-button
${CHECKBOX_FOR_ME}                  xpath=//span[contains(.,'Para mim')]
${BUTTON_FOR_ME_ACCOUNT_NEXT}       xpath=//a[contains(.,'Avançar')]
${INPUT_PHONE_NUMBER}               xpath=//input[@type='tel'][contains(@id,'phone')]
${BUTTON_PHONE_ACCOUNT_NEXT}        xpath=//button[@class='pp-cons-ylhy9c-button_base-text_button_lg-btn_full_width'][contains(@id,'submit')][contains(.,'Avançar')]
${INPUT_SMS_CODE}                   xpath=//input[@class='pp-cons-18498sj-text_input_control-text_body-no_label_text_input_control-label_placeholder_shown_and_not_focused-text_body'][contains(@id,'0')]
${INPUT_EMAIL}                      id=paypalAccountData_email
${INPUT_NAME}                       id=paypalAccountData_firstName
${INPUT_LASTNAME}                   id=paypalAccountData_lastName
