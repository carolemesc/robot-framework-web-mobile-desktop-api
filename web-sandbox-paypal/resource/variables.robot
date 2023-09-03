*** Settings ***

*** Variables ***

#Criação de Conta
${URL}                                  https://www.sandbox.paypal.com/
${HEADLESS}                             ${false}
${BUTTON_CREATE_ACCOUNT}                id=signup-button
${CHECKBOX_FOR_ME}                      xpath=//span[contains(.,'Para mim')]
${BUTTON_FOR_ME_ACCOUNT_NEXT}           xpath=//a[contains(.,'Avançar')]
${INPUT_PHONE_NUMBER}                   xpath=//input[@type='tel'][contains(@id,'phone')]
${BUTTON_PHONE_ACCOUNT_NEXT}            xpath=//button[@class='pp-cons-ylhy9c-button_base-text_button_lg-btn_full_width'][contains(@id,'submit')][contains(.,'Avançar')]
${INPUT_SMS_CODE}                       xpath=//input[@class='pp-cons-18498sj-text_input_control-text_body-no_label_text_input_control-label_placeholder_shown_and_not_focused-text_body'][contains(@id,'0')]
${INPUT_EMAIL}                          id=paypalAccountData_email
${INPUT_NAME}                           id=paypalAccountData_firstName
${INPUT_LAST_NAME}                      id=paypalAccountData_lastName
${INPUT_MOTHER_NAME}                    id=paypalAccountData_motherFirstName
${INPUT_LAST_MOTHER_NAME}               id=paypalAccountData_motherLastName
${INPUT_BIRTH_DATE}                     id=paypalAccountData_dob
${INPUT_CPF}                            id=paypalAccountData_tax
${INPUT_CREATE_PASSWORD}                id=paypalAccountData_password
${INPUT_CONFIRM_PASSWORD}               id=paypalAccountData_confirmPassword
${BUTTON_NEXT_CREATE_ACCOUNT}           id=paypalAccountData_emailPassword
${INPUT_PROFESSION}                     id=combo_txt_paypalAccountData_occupation
${SELECT_PROF_FIRST_OPTION}             id=/paypalAccountData/occupation__busMgmtBenefitsAdmin
${INPUT_MONTHLY_INCOME}                 id=dropdownMenuButton_paypalAccountData_monthlyIncome
${SELECT_INCOM_FIFTH_OPTION}            id=smenu_item_R$1500000-R$2000000
${INPUT_STREET_ADDRESS}                 id=paypalAccountData_address1_0
${INPUT_NEIGHBORHOOD_ADDRESS}           id=paypalAccountData_address2_0
${INPUT_CITY_ADDRESS}                   id=paypalAccountData_city_0
${INPUT_STATE_ADDRESS}                  id=dropdownMenuButton_paypalAccountData_state_0
${SELECT_STATE_MG_OPTION}               id=smenu_item_MG
${INPUT_ZIP_CODE}                       id=paypalAccountData_zip_0
${CHECKBOX_AGREE}                       xpath=(//span[@data-ppui='true'][contains(.,'Confirmo que li, aceito e concordo com o Contrato de Usuário do PayPal e com a Declaração de Privacidade, e que sou maior de idade.')])[2]
${TEXT_WELCOME}                         xpath=//span[@class='inherit_stylesV2'][contains(.,'Bem-vindo ao PayPal!')]
${BUTTON_ACTIVATE_ACCOUNT_FIRT_ACESS}   xpath=//button[@class='pp-cons-ylhy9c-button_base-text_button_lg-btn_full_width'][contains(.,'Ativar conta')]
${ICON_NOTIFICATION}                    id=header-notifications
${BUTTON_LOGOUT}                        id=header-logout

#Login
${BUTTON_ENTER_ACCOUNT}                 id=ul-btn
${INPUT_EMAIL_LOGIN}                    id=email
${INPUT_PASSWORD_LOGIN}                 id=password
${BUTTON_LOGIN}                         id=btnLogin

#Dados do cartão
${BUTTON_ADD_CARD_OR_BANK}              id=bankCardLinkBankOrCard
${BUTTON_ADD_CARD}                      xpath=//span[@class='col-xs-9 transfer-list'][contains(.,'Adicione um cartãoMantenha os dados do seu cartão protegidos ao fazer compras')]
${INPUT_CARD_NUMBER}                    id=cardNumber
${DROPDOWN_CARD_TYPE}                   id=brand
${INPUT_DUE_DATE}                       id=expDate
${INPUT_CVV}                            id=verificationCode
${BUTTON_ADD_CARD_FINISH}               xpath=//button[@type='submit'][contains(.,'Adicionar cartão')]
${TEXT_ADD_CARD_DONE}                   xpath=//h2[contains(@class,'ppvx_text--heading-sm fiActionResult-header test_fiActionResult-header ')]
