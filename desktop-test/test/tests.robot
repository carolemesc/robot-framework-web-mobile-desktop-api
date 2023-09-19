*** Settings ***
Resource          ../resource/keywords.robot
Test Setup        Abra o site do Sandbox Paypal
Test Teardown     Close Browser    ALL
Suite Teardown    Close Browser    ALL

*** Test Cases ***
