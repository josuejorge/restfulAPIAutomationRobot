*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Buscar post Por ID

    Create Session    jsonplaceholder    ${BASE_URL}

    ${response}=    GET On Session
    ...    jsonplaceholder
    ...    url=/posts/1

    Status Should Be    200    ${response}

    ${json}=    Set Variable    ${response.json()}

    Should Be Equal
    ...    ${json}[id]
    ...    ${1}

    Should Contain
    ...    ${json}[title]
    ...    sunt aut facere repellat provident occaecati excepturi optio reprehenderit