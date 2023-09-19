*** Settings ***
Resource    ./variables.robot
Library     Browser    timeout=00:00:20    enable_presenter_mode=True
Library     phone-generator.py
Library     cpf-generator.py
Library     FakerLibrary

*** Keywords ***