*** Settings ***
Resource            ${EXECDIR}${/}resources${/}resources.robot

*** Test Cases ***
Add of Single Working class hero using Api
   [Tags]  positive_cases
   ${RESP_MSG}=  Create a Single Working Class Hero Request
   Should Be Equal As Strings     ${RESP_MSG}      ${SUCCESS_RESPONSE_CODE}

Check natid Existing records in the Database
    Verify natid already exists in the database

Addition of working class hero using csv file from UI
    Open application and upload CSV file and add Multiple Working Class Hero