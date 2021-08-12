*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary

*** Variables ***
${base_url}     http://localhost:8080

*** Test Cases ***
Generate Admin Token
    create session  session     ${base_url}
    ${body}=    create dictionary   grant_type=password     client_id=admin-cli     username=admin    password=admin123
    ${header}=    create dictionary    Content-Type=application/x-www-form-urlencoded
    ${response}=    post request     session     /auth/realms/master/protocol/openid-connect/token      headers=${header}   data=${body}
    ${accessToken}=    evaluate    $response.json().get("access_token")
    log to console  ${response.content}
    log to console  ${response.status_code}
    log to console  ${access_token}

    #validation
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}      200