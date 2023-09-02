*** Settings ***
Resource          ../resource/keywords.robot
Suite Setup       Abra o site do Sandbox Paypal
Suite Teardown    Close Browser    ALL

*** Test Cases ***

Crie uma conta no Sandbox Paypal na WEB
    Crie uma conta grátis
    

# Acesse uma conta previamente criada no Pinteres WEB
    # Faça login com a conta previamente criada
    # Crie um cartão de crédito na aplicação
