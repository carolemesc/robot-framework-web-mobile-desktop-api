*** Settings ***
Resource    ./variables.robot
Library     Browser    timeout=00:00:20    enable_presenter_mode=True
Library     phone-generator.py
Library     cpf-generator.py
Library     FakerLibrary

*** Keywords ***
Abra o site do Sandbox Paypal
    New Browser    headless=${HEADLESS}
    New Context    viewport={'width': 1200, 'height': 800}    bypassCSP=True
    New Page       url=${URL}
    ${title}       Get Title    ==    Carteiras digitais, Gerenciamento de recursos e muito mais | PayPal BR

Crie uma conta gratis
    Get Element States    ${BUTTON_CREATE_ACCOUNT}         validate    value & visible
    Click                 ${BUTTON_CREATE_ACCOUNT}
    Check Checkbox        ${CHECKBOX_FOR_ME}
    Click                 ${BUTTON_FOR_ME_ACCOUNT_NEXT}
    ${phone_number}=      Generate Phone Number
    Fill Text             ${INPUT_PHONE_NUMBER}            ${phone_number}
    Click                 ${BUTTON_PHONE_ACCOUNT_NEXT}
    Fill Text             ${INPUT_SMS_CODE}                111111
    ${email}              FakerLibrary.Email
    Set Test Variable     ${EMAIL}                         ${email}
    Fill Text             ${INPUT_EMAIL}                   ${email}
    Fill Text             ${INPUT_NAME}                    Nome Teste
    Fill Text             ${INPUT_LAST_NAME}               Sobrenome Teste
    Fill Text             ${INPUT_MOTHER_NAME}             Nome Mãe
    Fill Text             ${INPUT_LAST_MOTHER_NAME}        Sobrenome Mãe
    Fill Text             ${INPUT_BIRTH_DATE}              01012000
    ${cpf}=               Generate Cpf
    Fill Text             ${INPUT_CPF}                     ${cpf}
    ${password}           FakerLibrary.Password            special_chars=False
    Set Test Variable     ${PASSWORD}                      ${password}
    Fill Text             ${INPUT_CREATE_PASSWORD}         ${password}
    Fill Text             ${INPUT_CONFIRM_PASSWORD}        ${password}
    Click                 ${BUTTON_NEXT_CREATE_ACCOUNT}
    Click                 ${INPUT_PROFESSION}
    Click                 ${SELECT_PROF_FIRST_OPTION}
    Click                 ${INPUT_MONTHLY_INCOME}
    Click                 ${SELECT_INCOM_FIFTH_OPTION}
    Fill Text             ${INPUT_STREET_ADDRESS}          Rua Teste
    Fill Text             ${INPUT_NEIGHBORHOOD_ADDRESS}    Bairro Teste
    Fill Text             ${INPUT_CITY_ADDRESS}            Cidade Teste
    Click                 ${INPUT_STATE_ADDRESS}
    Click                 ${SELECT_STATE_MG_OPTION}
    Fill Text             ${INPUT_ZIP_CODE}                36051150
    Check Checkbox        ${CHECKBOX_AGREE}
    Click                 ${BUTTON_NEXT_CREATE_ACCOUNT}

Valide o login automatico
    Get Text    ${TEXT_WELCOME}    ==    Bem-vindo ao PayPal!
    Click                      ${BUTTON_ACTIVATE_ACCOUNT_FIRT_ACESS}
    Wait For Elements State    ${ICON_NOTIFICATION}
    ${title}    Get Title    ==     PayPal: Resumo

Deslogue do login automatico
    Valide o login automatico
    Click        ${BUTTON_LOGOUT}

Faça login com a conta previamente criada
    Deslogue do login automatico
    Faça login    ${EMAIL}    ${PASSWORD}

Faça login
    [Arguments]    ${EMAIL}    ${PASSWORD}
    Sleep    2
    Click          ${BUTTON_ENTER_ACCOUNT}
    Fill Text      ${INPUT_EMAIL_LOGIN}        ${EMAIL}
    ${status}      Get Element States          ${INPUT_PASSWORD_LOGIN}

    ${hidden_found}    Evaluate    'hidden' in ${status}

    IF  ${hidden_found} == ${True}
        Click        xpath=//*[@id="btnNext"]
        Fill Text    ${INPUT_PASSWORD_LOGIN}   ${PASSWORD}
    ELSE
        Fill Text    ${INPUT_PASSWORD_LOGIN}   ${PASSWORD}
    END
    Click        ${BUTTON_LOGIN}
    ${title}     Get Title    ==     PayPal: Resumo

Adicione um cartao de credito na aplicacao
    Click                     ${BUTTON_ADD_CARD_OR_BANK}
    Click                     ${BUTTON_ADD_CARD}
    ${card_number}            FakerLibrary.Credit Card Number
    Fill Text                 ${INPUT_CARD_NUMBER}        ${card_number}
    Press Keys                ${DROPDOWN_CARD_TYPE}       ArrowDown    ArrowDown    Enter
    ${cvv}                    FakerLibrary.Credit Card Security Code
    Fill Text                 ${INPUT_CVV}                ${cvv}
    ${due_date}               FakerLibrary.Credit Card Expire
    Fill Text                 ${INPUT_DUE_DATE}           ${due_date}
    Click                     ${BUTTON_ADD_CARD_FINISH}
    Sleep    2
    Take Screenshot
    ${status_add_card_success}    Get Element States        ${TEXT_ADD_CARD_DONE}
    Log    ${status_add_card_success}
    ${loop_counter}=              Set Variable    0
    IF    'attached' in $status_add_card_success
        Take Screenshot
    ELSE
        WHILE    'attached' not in $status_add_card_success and ${loop_counter} < 10
            ${card_number}            FakerLibrary.Credit Card Number
            Fill Text                 ${INPUT_CARD_NUMBER}        ${card_number}
            Click                     ${BUTTON_ADD_CARD_FINISH}
            Sleep    2
            ${status_add_card_success}    Get Element States          ${TEXT_ADD_CARD_DONE}
            Take Screenshot
            ${loop_counter}=          Evaluate    ${loop_counter} + 1
        END
        IF    'attached' not in $status_add_card_success
            Log    não foi possível adicionar um cartao válido utilizando a Faker Library  
        END
    END

    


