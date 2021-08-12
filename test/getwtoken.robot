*** Settings ***
Library     Collections
Library     RequestsLibrary
Library     JSONLibrary

*** Variables ***
${base_url}     http://localhost:8080
${bearer_tokern}    Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJ1dEJhNXRWMkl3ZzBjcVJISWU4cl9hSDg1Q3BnUk9KbUN0Vmx5U3FSSGRjIn0.eyJleHAiOjE2Mjg3NjIwMTQsImlhdCI6MTYyODc2MTk1NCwianRpIjoiMTFmOGQ0NTctYjFlMS00MjhjLThhNzItMDA5ODcxNDM4ODM5IiwiaXNzIjoiaHR0cDovL2xvY2FsaG9zdDo4MDgwL2F1dGgvcmVhbG1zL21hc3RlciIsInN1YiI6IjhjZjZlZGIwLTdiNGUtNDI5MS1iMjc0LWNjYmExY2I2NGIyMCIsInR5cCI6IkJlYXJlciIsImF6cCI6ImFkbWluLWNsaSIsInNlc3Npb25fc3RhdGUiOiI4N2IxMzBjZi03MGE4LTQwMjQtODllMS02YmFiODhjYjI4ZmYiLCJhY3IiOiIxIiwic2NvcGUiOiJwcm9maWxlIGVtYWlsIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJhZG1pbiJ9.QP9Wveqs8vNGmjKGjr86zqRiFdAb9sQn_24s1oDm8gVQI89e-JTHjTEoZZJ5hppWbNUzhGH-LtR4ceOhYqrYD6RJnG_GNtQDUF6eXJCVETRQJOOUChwoyerl7BBHe7POXIdgJvPGjbzpq9e0GxmTXCvQYCw8eLsi6O9HX8I5nuoQk1epxFof1SznojJ0qU_daR9uofvk_k7essesVyStpdhSljqJUuyk15THY0HbpkVtBpZrogFm6sRljqgKWM8Fb5dyepcUVa7jpayTAAhDOHaYSlDOPJNfgIsCBbMToP8rYj5yAc1aEXbCfXsGHSJeW4FtLrfcOtIFK1mJOyHwsA

*** Test Cases ***
Generate Admin Token
    create session  session     ${base_url}
    ${header}=    create dictionary     Authorization=${bearer_tokern}     Content-Type=application/json
    ${response}=    get request     session    /auth/admin/realms/master/users     headers=${header}

    log to console  ${response.content}