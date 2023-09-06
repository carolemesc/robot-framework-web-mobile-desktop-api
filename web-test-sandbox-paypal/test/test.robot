*** Settings ***
Resource          ../resource/keywords.robot
Test Setup        Abra o site do Sandbox Paypal
Test Teardown     Close Browser    ALL
Suite Teardown    Close Browser    ALL

*** Test Cases ***

Crie uma conta no Sandbox Paypal
    Crie uma conta gratis
    Valide o login automatico
    

Crie a conta, acesse uma conta no Sandbox Paypal e adicione um cartao
    Crie uma conta gratis
    Faça login com a conta previamente criada
    Adicione um cartao de credito na aplicacao

Fazer login com conta existente
    Faça login    carol@yopmail.com    @123@123
