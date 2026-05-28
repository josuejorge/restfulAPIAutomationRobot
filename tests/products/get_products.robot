*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}    https://fakestoreapi.com

*** Test Cases ***
Buscar Produtos

    Create Session    fakeStore    ${BASE_URL}

    ${response}=    GET On Session
    ...    fakeStore
    ...    url=/products

    Status Should Be    200    ${response}

    ${json}=    Set Variable    ${response.json()}

    Log To Console    ${json}

    ${count}=    Get Length    ${json}

    Should Be Equal As Integers
    ...    ${count}
    ...    20