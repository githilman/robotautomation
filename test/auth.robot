*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary

*** Variables ***
${base_url}     https://staging.misteralad.in

*** Test Cases ***
Auth Test
    create session  session     ${base_url}
    ${body}=    create dictionary   email=ricky.gunawan@misteraladin.com      password=123456
    ${header}=    create dictionary    Content-Type=application/x-www-form-urlencoded
    ${response}=    post request     session     /api/activities/auth/login      headers=${header}   data=${body}
    log to console  ${response.status_code}
    log to console  ${response.content}

    #validation
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}      200