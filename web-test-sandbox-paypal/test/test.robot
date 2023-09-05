*** Settings ***
Resource          ../resource/keywords.robot
Test Setup        Abra o site do Sandbox Paypal
Test Teardown     Close Browser    ALL
Suite Teardown    Close Browser    ALL

*** Test Cases ***

Crie uma conta no Sandbox Paypal
    Crie uma conta grátis
    Valide o login automático
    

Crie a conta, acesse uma conta no Sandbox Paypal e adicione um cartão
    Crie uma conta grátis
    Faça login com a conta previamente criada
    Adicione um cartão de crédito na aplicação

Fazer login com conta existente
    Faça login    carol@yopmail.com    @123@123
