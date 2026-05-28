*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}    https://fakestoreapi.com

*** Test Cases ***
Buscar Produto Por ID

    Create Session    fakeStore    ${BASE_URL}

    ${response}=    GET On Session
    ...    fakeStore
    ...    url=/products/1

    Status Should Be    200    ${response}

    ${json}=    Set Variable    ${response.json()}

    Should Be Equal
    ...    ${json}[id]
    ...    ${1}

    Should Contain
    ...    ${json}[title]
    ...    Fjallraven