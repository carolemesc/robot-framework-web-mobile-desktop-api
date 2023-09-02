*** Settings ***
Resource    ./variables.robot
Library     Browser    timeout=00:00:20    enable_presenter_mode=True
Library     phone-generator.py
Library     FakerLibrary

*** Keywords ***
Abra o site do Sandbox Paypal
    New Browser    headless=False
    New Context    viewport={'width': 1200, 'height': 800}
    New Page       url=${URL}
    ${title}       Get Title    ==    Compras internacionais descomplicadas e muito mais | PayPal BR


Crie uma conta grátis
    Click                 ${BUTTON_CREATE_ACCOUNT}
    Check Checkbox        ${CHECKBOX_FOR_ME}
    Click                 ${BUTTON_FOR_ME_ACCOUNT_NEXT}
    ${phone_number}=      Generate Phone Number
    Fill Text             ${INPUT_PHONE_NUMBER}        ${phone_number}
    Click                 ${BUTTON_PHONE_ACCOUNT_NEXT}
    Wait For All Promises
    Get Element           //span[@dir='ltr'][contains(.,'+55 ${phone_number}')]
    Fill Text             ${INPUT_SMS_CODE}            111111
    ${email}              FakerLibrary.Email
    Set Test Variable     ${EMAIL}                     ${email}
    Fill Text             ${INPUT_EMAIL}               ${email}
    Fill Text             ${INPUT_NAME}                Nome Teste
    Fill Text             ${INPUT_LASTNAME}            Sobrenome Teste
    