*** Settings ***

Documentation	  Ruckus Wireless Monitoring Server User Interface Test
...
...               Python RobotFramework with Selenium 2 Library

Library           Selenium2Library
Library           compare_webSTR.py

*** Variables ***

${Browser}        Firefox
${searchtext}     ryan
${output}         None

*** Test Cases ***

TestLogin
    
    Open Browser to the Login Page
    Enter User Name
    Enter Password
    Click Login

Test Dashboard
    
    Title Should Be    Dashboard | Ruckus WMS
    Page Should Contain     Dashboard
    Page Should Contain     Client Sessions
    Page Should Contain     Operating Systems
    Page Should Contain     Access Points
    Page Should Contain     Controllers
    Page Should Contain     Events
    Click home button

Comparing Of Two Numbers
    
    [Documentation]    compare two numbers and show the result
    ${Gtext}    ${count}     Get The Row Count
    Run Keyword If   ${Gtext} == ${count}   Log to console   passed

Test Admin page

   Test Users page		 Administration	   Users     Accounts
   Test List pages		 Administration	   Tenants   tenants   Tenants
   Test List page		 Administration	   Controller Authorization	  controllerauthorization	Controller Authorization
   Test Datamanagement page      Administration    Data Management   Agent Management  
   Test wmscluster page   	 Administration    WMS Cluster       Node Management  
   
  
Test Manage pages
    
    Test List page	        Manage	    Dashboards	       manage	        Dashboards
    Test List pageCLS	        Manage	    Clusters	       clusters         Clusters
    Test List pageZN	        Manage	    Zones	       zone	        Zones
    Test List Controller	Manage	    Controllers	       controller       Controllers  
    Test List access	        Manage	    Access Points       accesspoints     Access Points
    Test List page	        Manage	    Client Devices      uedevices        Client Devices
    Test List client	        Manage	    Client Sessions     uesessions       Client Sessions
    
Test Report pages
   
    Test List page	    Reporting    Alarms	   alarms    Alarms
    Test List eventgraph    Reporting    Events	   events    Events


Test Global pages
   
    Click search button


Logout From WMS
    
    Mouse Over    partial link = ${USERNAME}
    Click Element    link = Profile
    Sleep     4s
    Mouse Over    partial link = ${USERNAME}
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


Click home button
    Click Element   xpath=//div[@id='tpgraph']/div/wms-graphs/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='csgraph']/div/wms-graphs/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='worldpie']/div/wms-graphs/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='osgraph']/div/wms-graphs/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='apgraph']/div/wms-graphs/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        4s
    Select From List    xpath=//select[@ng-model='graphtype']   Trend
    Sleep        4s
    Select From List    xpath=//select[@ng-model='graphtype']    Anomalies
    Sleep        4s

Get The Row Count
    
    ${Gtext}        Get Text    xpath=//*[@id='temp']/div/div/section[2]/div[1]/div[3]/div/div[1]/h3
    Sleep       3s
    Log to console    ${Gtext}
    CLick Element    xpath=//div/section[2]/div[1]/div[3]/div/a
    Sleep      3s
    ${Xpath}     Set Variable     //table/tbody/tr[@ng-repeat="row in list"]
    ${count}     Get Matching Xpath Count    ${Xpath} 
    log to console       ${count}


Test Users page
    [Arguments]  ${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='accounts']
    Sleep	2s
    Page Should Contain    ${item}
    
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"admin")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"dbovis")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"ehenry")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"gpaul")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//table/tbody/tr[7]/td[1]/a/span[contains(text(),"hariharaselvam")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s


    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element    xpath=//*[@ui-sref='groups']
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Developers")]
    Sleep	5s
    Click Element    link = Permissions
    Sleep	3s
    Click Element    xpath=//li[@class="active"]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Testers")]
    Sleep	5s
    Click Element    link = Permissions
    Sleep	2s


Test List pages
    [Arguments]	   ${mainmenu}   ${submenu}    ${link}	 ${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}




Test List page
    [Arguments]	 ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s


Test Datamanagement page
    [Arguments]  ${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='agents']
    Sleep	2s
    Page Should Contain    ${item}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='datalake']
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    content
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    time
    Sleep        4s
    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-graphs/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        3s


Test Wmscluster page
    [Arguments]  ${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='nodes']
    Sleep	2s
    Page Should Contain    ${item}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='settings']
    Sleep	2s
  
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s


Test List pageDB
    [Arguments]	 ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Controller Graphs")]
    Sleep	5s
    Page Should Contain      Dashboard Information
    Page Should Contain      Controllers State 
    Page Should Contain      Controller State 
    Page Should Contain      anomaly
    Click Element    xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep       2s
    Click Element    xpath=//span[contains(text(),"list pages")]
    Sleep	5s
    Page Should Contain      Dashboard Information
    Page Should Contain      Clusters 
    Page Should Contain      Zones
    Page Should Contain      Controllers
    Page Should Contain      Client Sessions
    Page Should Contain      Client Devices
    Click Element    xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep       2s
  


Test List pageCLS
    [Arguments]	 ${mainmenu}   ${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep        2s


Test List pageZN
    [Arguments]	 ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s


Test List Controller
    [Arguments]	  ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    state
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    model
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    version
    Sleep        4s
    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-graphs/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s 


Test List access
    [Arguments]	  ${mainmenu}	 ${submenu}    ${link}	 ${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    state
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    model
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    firmware
    Sleep        4s
    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-graphs/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s


Test List client
    [Arguments]	  ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
     Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Select From List    xpath=//select[@ng-model='cls_type']    session
    Sleep        4s
    Select From List    xpath=//select[@ng-model='cls_type']    network
    Sleep        4s
    Select From List    xpath=//select[@ng-model='cls_type']    os
    Sleep        4s
    Select From List    xpath=//select[@ng-model='cls_type']    authenication
    Sleep        4s
    Select From List    xpath=//select[@ng-model='cls_type']    wifi
    Sleep        4s
    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-graphs/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s


Test List eventgraph
    [Arguments]   ${mainmenu}	 ${submenu}    ${link}	 ${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Click Element   xpath=//div[@class='box-header with-border']/span/input
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        7s
    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div/div[2]/div/wms-graphs/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s


Click search button
    Click Element   xpath=//div[@class='form-group has-feedback']/input
    Input Text    xpath=//div[@class='form-group has-feedback']/input        ${searchtext}
    Sleep        2s
    Press Key     xpath=//div[@class='form-group has-feedback']/input    \\13
    Sleep        4s






