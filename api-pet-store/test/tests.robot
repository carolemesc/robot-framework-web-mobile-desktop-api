*** Settings ***
Resource          ../resource/keywords.robot

*** Test Cases ***

Adicionar um novo pet a loja
    Criar um novo pet    PET_NAME=Kate    CATEGORY_NAME=Gato        GENDER=Fêmea
    #Adicionar o pet criado a loja         PET_STATUS=available      STATUS_CODE=200