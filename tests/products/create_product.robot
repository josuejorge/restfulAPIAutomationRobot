*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Criar Novo Produto

    Create Session    jsonplaceholder    ${BASE_URL}

    ${body}=    Create Dictionary    
    ...    title=foo
    ...    body=bar
    ...    userId=1


    ${response}=    POST On Session
    ...    jsonplaceholder
    ...    url=/posts
    ...    json=${body}

    Status Should Be    201    ${response}

    ${json}=    Set Variable    ${response.json()}

    Should Be Equal
    ...    ${json}[title]
    ...    foo

    Should Be Equal
    ...    ${json}[body]
    ...    bar