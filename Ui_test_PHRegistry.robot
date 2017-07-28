*** Settings ***

Documentation	  Ruckus Wireless Monitoring Server User Interface Test
...
...               Python RobotFramework with Selenium 2 Library

Library           Selenium2Library

*** Variables ***

${Browser}        Firefox
${Searchval}      goss
${Search}         ruckus

*** Test Cases ***

TestLogin
 
    Open Browser to the Login Page
    Enter User Name
    Enter Password
    Click Login

Test Dashboard

    Title Should Be     Dashboard | Ruckus PhoneHome
    Page Should Contain     Dashboard
    Sleep   4s
    Search Page
    Test Remote page		 Remote Access	  

Logout From WMS

    Mouse Over    partial link = ${Username}
    Click Element    link = Profile
    Sleep     4s
    Mouse Over    partial link = ${Username}
    Click Element    link = Sign out
    Page Should Contain    Successfully logged out!
    [Teardown]    Close Browser


*** Keywords ***

Open Browser to the Login Page
    open browser    ${SiteUrl}    ${Browser}
    Maximize Browser Window

Enter User Name
    Input Text    username    ${Username}

Enter Password
    Input Text    password    ${Password}

Click Login
    Click Button  Sign In

Search Page

    Click Element   xpath=//div[@class="box box-warning"]/ph-tables/div[1]/span/input
    Input Text      xpath=//div[@class="box box-warning"]/ph-tables/div[1]/span/input     ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s


Test Remote page
    
    [Arguments]   ${mainmenu}   
    Mouse Over    partial link = ${mainmenu}
    Click Element   xpath=//*[@ui-sref="remote"]
    Sleep	2s
    Click Element   xpath=//div[@class="form-group has-feedback"]/input
    Input Text      xpath=//div[@class="form-group has-feedback"]/input     ${Search}
    Sleep	2s






