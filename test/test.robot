*** Settings ***                                                                                       
Library    Collections                                                                                 
Library    RequestsLibrary                                                                             
Library    JSONLibrary

*** Variables ***
${base_url}     https://gorest.co.in/public
${user_id}      8

*** Test Cases ***                                                                                     
Get Request Test                                                                                       
    create session  get  ${base_url}
    ${response}=    GET On Session  get     /v1/users/${user_id}
    ${json_response}=   set variable    ${response.json()}
    @{id_data}=     get value from json   ${json_response}    data.id
    log to console  ${response.status_code}
    log to console  ${id_data}
    # log to console  ${response.content}

    # validation
    ${status_code}=     convert to string  ${response.status_code}
    should be equal     ${status_code}      200
    ${f_user_id}=   get from list   ${id_data}     0
    ${f_user}=      convert to string   ${f_user_id}
    should be equal     ${f_user}          ${user_id}

Get Request 2                                                                                      
    create session  get  ${base_url}
    ${response}=    GET On Session  get     /v1/users/6
    ${json_response}=   set variable    ${response.json()}
    @{id_data}=     get value from json   ${json_response}    data.id
    log to console  ${response.status_code}
    log to console  ${id_data}
    # log to console  ${response.content}

    # validation
    ${status_code}=     convert to string  ${response.status_code}
    should be equal     ${status_code}      200
    ${f_user_id}=   get from list   ${id_data}     0
    ${f_user}=      convert to string   ${f_user_id}
    should be equal     ${f_user}          6