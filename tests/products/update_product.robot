*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}    https://fakestoreapi.com

*** Test Cases ***
Atualizar Produto

    Create Session    fakeStore    ${BASE_URL}

    ${body}=    Create Dictionary
    ...    title=Produto
    ...    price=9
    ...    description=Descricao
    ...    image=https://i.pravatar.cc
    ...    category=electronics

    ${response}=    PUT On Session
    ...    fakeStore
    ...    url=/products/1
    ...    json=${body}

    Status Should Be    200    ${response}

    ${json}=    Set Variable    ${response.json()}

    Should Be Equal
    ...    ${json}[title]
    ...    Produto

    Should Be Equal
    ...    ${json}[price]
    ...    9