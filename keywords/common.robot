*** Keywords ***
Get Cookie Token
    ${session}=   Create Session   httpbin    ${URL}     verify=True
    ${data}=      Create Dictionary  username=${CLERK_USERNAME}  password=${CLERK_PASSWORD}
    ${headers}=   Create Dictionary    Content-Type    application/x-www-form-urlencoded
    ${resp}=      POST On Session  httpbin  /login     headers=${headers}  data=${data}   allow_redirects=True
    ${COOKIE_VALUE}=    Get Dictionary Values    ${session.cookies}
    ${JSESSIONID_VAL}=  Catenate     JSESSIONID=${COOKIE_VALUE}[0]
    [Return]  ${JSESSIONID_VAL}

Create a Single Working Class Hero Request
    ${COOKIE_VAL}=   Get Cookie Token
    ${JSON_FILE}=    Load Json From File    ${JSON_PATH}
    ${NAT_ID}=       Evaluate   random.randint(1,100)  random
    ${JSON_DATA}=    Update Value To Json   ${JSON_FILE}   $..natid     natid-10${NAT_ID}
    Create Session   http    ${URL}     verify=True
    ${headers}=   Create Dictionary    Content-Type    application/json   Cookie    ${COOKIE_VAL}
    ${resp}=      POST On Session  http  /clerk/add  headers=${headers}  json=${JSON_DATA}
    [Return]      ${resp.status_code}

Verify natid already exists in the database
    ${COOKIE_VAL}=   Get Cookie Token
    ${JSON_FILE}=    Load Json From File    ${JSON_PATH}
    Create Session   http    ${URL}     verify=True
    ${headers}=   Create Dictionary    Content-Type    application/json   Cookie    ${COOKIE_VAL}
    ${resp}=      POST On Session  http  /clerk/add  headers=${headers}  json=${JSON_FILE}
    ${body}=  convert to string  ${resp.content}
    Should contain    ${body}    ${NATID_RECORD_MSG}

Login To Application
    [Arguments]     ${U_NAME}     ${U_PASSWORD}
    Open Browser    ${URL}/login        chrome
    Input Text      ${USER_NAME}        ${U_NAME}
    Input Text      ${USER_PASSWORD}    ${U_PASSWORD}
    Click Element   ${SUBMIT_BTN}

Open application and upload CSV file and add Multiple Working Class Hero
    Login To Application        ${CLERK_USERNAME}     ${CLERK_PASSWORD}
    Wait Until Page Contains    ${CLERK_TEXT}         ${WAIT_FOR_20_SEC}
    Click Element   ${ADD_HERO_DROPDOWN}
    Wait Until Element is Visible   ${UPLOAD_CSV}     ${WAIT_FOR_20_SEC}
    Click Element   ${UPLOAD_CSV}
    Choose File     ${CHOOSE_FILE}   ${EXECDIR}/hero.csv
    Sleep           ${WAIT_FOR_2_SEC}
    Click Element   ${CLICK_CREATE_BTN}
    Wait Until Page Contains    ${HERO_CREATED_SUCCESSFULLY}
    Close All Browsers

Search working class hero in Governor Dashboard
    Login To Application            ${GOV_USERNAME}          ${GOV_PASSWORD}
    Wait Until Element is Visible   ${SEARCH_NATID}          ${WAIT_FOR_20_SEC}
    Input Text                      ${SEARCH_NATID}          ${NATID_VAL}
    Click Element                   ${SEARCH_BTN}
    Wait Until Element is Visible   ${SEARCH_TABLE_ID}       ${WAIT_FOR_20_SEC}
    Sleep  2s
    ${SEARCH_RESULT}=   Get Text            //th[@id="row-id"]
    Should Be Equal               ${NATID_VAL}               ${SEARCH_RESULT}
    Close All Browsers