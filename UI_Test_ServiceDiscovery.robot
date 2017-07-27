*** Settings ***

Documentation	  Ruckus Wireless Monitoring Server User Interface Test
...
...               Python RobotFramework with Selenium 2 Library

Library           Selenium2Library

*** Variables ***

${Browser}        Firefox
${Searchval}      goss


*** Test Cases ***

TestLogin
 
    Open Browser to the Login Page
    Enter User Name
    Enter Password
    Click Login

Test Dashboard

    Title Should Be     Dashboard | WMS Discovery | Ruckus | Brocade
    Page Should Contain     Service Discovery 
    Sleep   4s
    Search Page


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

    Click Element   xpath=//div[@class="box box-warning"]/wms-tables/div[1]/span/input
    Input Text      xpath=//div[@class="box box-warning"]/wms-tables/div[1]/span/input     ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s






