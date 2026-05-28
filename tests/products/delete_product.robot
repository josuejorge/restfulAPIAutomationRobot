*** Settings ***
Library     RequestsLibrary

*** Variables ***
${BASE_URL}    https://fakestoreapi.com

*** Test Cases ***
Validar Sucesso em Deletar Produto

    Create Session    fakeStore    ${BASE_URL}

    ${response}=    DELETE On Session
    ...    fakeStore
    ...    url=/products/1

    Status Should Be    200    ${response}

    Log To Console    Produto deletado com sucesso

Validar erro em Deletar Produto

    Create Session    fakeStore    ${BASE_URL}

    ${response}=    DELETE On Session
    ...    fakeStore
    ...    url=/products/sdf
    ...    expected_status=any

    Status Should Be    400    ${response}

    Log To Console    product id should be provided
    