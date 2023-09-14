*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     FakerLibrary

*** Keywords ***

Criar um novo pet
    [Arguments]    ${PET_NAME}    ${CATEGORY_NAME}    ${GENDER}

    Set Suite Variable    ${PET_NAME}
    Set Suite Variable    ${CATEGORY_NAME}
    Set Suite Variable    ${GENDER}

    IF    '${CATEGORY_NAME}'.lower() == 'gato'
        Set Suite Variable    ${CATEGORY_ID}    1
    ELSE IF    '${CATEGORY_NAME}'.lower() == 'cachorro'
        Set Suite Variable    ${CATEGORY_ID}    2
    ELSE IF    '${CATEGORY_NAME}'.lower() == 'coelho'
        Set Suite Variable    ${CATEGORY_ID}    3
    ELSE IF    '${CATEGORY_NAME}'.lower() == 'peixe'
        Set Suite Variable    ${CATEGORY_ID}    4
    ELSE
        Set Suite Variable    ${CATEGORY_ID}    0
    END
    

    IF    '${GENDER}'.lower() == 'femea' or 'fêmea'
        Set Suite Variable    ${TAG_ID}    1
    ELSE IF    '${GENDER}'.lower() == 'macho'
        Set Suite Variable    ${TAG_ID}    2
    ELSE
        Set Suite Variable    ${TAG_ID}    0
    END

    Log    ${PET_NAME} é um ${CATEGORY_NAME} ${GENDER}

Adicionar o pet criado a loja
    [Arguments]    ${PET_STATUS}    ${STATUS_CODE}
    
    ${pet_id}      FakerLibrary.Random Number    digits=3    fix_len=False

    ${category}    Create Dictionary
    ...            id=${CATEGORY_ID} 
    ...            name=${CATEGORY_NAME}

    ${photoUrls}   Create List    "https://images.app.goo.gl/52HJNJipk5xmfDvM9"

    ${tags}        Create Dictionary
    ...            id=${TAG_ID}
    ...            name=${GENDER}
      
    ${tag_list}    Create List    ${tags}

    ${body}        Create Dictionary
    ...            id=${pet_id}    
    ...            category=${category}
    ...            name=${PET_NAME}
    ...            photoUrls=${photoUrls}
    ...            tags=${tag_list}
    ...            status=${PET_STATUS}

    Criar sessao na Pet Store

    ${resposta}    POST On Session
    ...            alias=PetStore
    ...            url=/pet
    ...            json=${body}
    ...            expected_status=${STATUS_CODE}
    Log            ${resposta.json()}

    Set Test Variable    ${RESPOSTA}      ${resposta.json()}

Criar sessao na Pet Store
    ${headers}        Create Dictionary    accept=application/json                   Content-Type=application/json
    Create Session    alias=PetStore       url=https://petstore.swagger.io/v2    headers=${headers}