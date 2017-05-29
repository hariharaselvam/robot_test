*** Settings ***

Documentation	  Ruckus Wireless Monitoring Server User Interface Test
...
...               Python RobotFramework with Selenium 2 Library

Library           Selenium2Library


*** Variables ***

${Browser}        Firefox
${searchtext}     ryan

*** Test Cases ***

TestLogin
    Open Browser to the Login Page
    Enter User Name
    Enter Password
    Click Login

Test Dashboard
    Title Should Be       Dashboard | Ruckus WMS
    Page Should Contain       Dashboard
    Page Should Contain       Throughput
    Page Should Contain       Client Sessions
    Page Should Contain       Geo Distribution of Controllers
    Page Should Contain       Controllers by Country
    Page Should Contain       Access Points
    Page Should Contain       Controllers
    Page Should Contain       Events
    Click home button

Test Admin page

   Test Users page		 Administration	     Users      Accounts
   Test List pages		 Administration	    Tenants    tenants    Tenants
   Test List page		 Administration	    Controller Authorization	controllerauthorization	  Controller Authorization
   Test Datamanagement page      Administration    Data Management   Agent Management
   Test wmscluster page   	 Administration     WMS Cluster       Node Management


Test Manage pages

    Test List pageDB	Manage	   Dashboards  	    manage	    Dashboards
    Test List pageCLS	Manage	   Clusters	       clusters	   Clusters
    Test List pageZN	Manage	  Zones	           zone	          Zones
    Test List paging	Manage	  Controllers	     controller	   Controllers
    Test List access	Manage	  Access Points	     accesspoints	  Access Points
    Test List page	    Manage	  Client Devices	    uedevices      Client Devices
    Test List client	Manage	  Client Sessions    uesessions	   Client Sessions

Test Report pages

    Test List page	        Reporting      Alarms	 alarms	    Alarms
    Test List eventgraph    Reporting      Events	 events     Events


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
    Click Element   xpath=//div[@id='tpgraph']/div/wms-charts/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='csgraph']/div/wms-charts/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='worldpie']/div/wms-charts/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='osgraph']/div/wms-charts/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Element   xpath=//div[@id='apgraph']/div/wms-charts/div[1]/div/a/button
    Sleep      4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep     2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        5s
    Select From List    xpath=//select[@ng-model='graphtype']   Trend
    Sleep        4s
    Select From List    xpath=//select[@ng-model='graphtype']    Anomalies
    Sleep        4s


Test Users page
    [Arguments]  ${mainmenu}   ${text}  ${item}
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='accounts']
    Sleep	2s
    Page Should Contain    ${item}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"admin")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"asmtest")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//table/tbody/tr[5]/td[1]/a/span[contains(text(),"hari")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"isp2")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//table/tbody/tr[7]/td[1]/a/span[contains(text(),"rgoss")]
    Sleep	5s
    Click Element   xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Testing")]
    Sleep	5s

    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element    xpath=//*[@ui-sref='groups']
    Sleep	2s
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Test Group")]
    Sleep	5s
    Click Element    link = Permissions
    Sleep	3s
    Click Element    xpath=//li[@class="active"]/a
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Another Group")]
    Sleep	5s
    Click Element    link = Permissions
    Sleep	2s


Test List pages
    [Arguments]	 ${mainmenu}	${submenu}    ${link}	${text}
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
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='datalake']
    Sleep	2s
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element    xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        5s
    Select From List    xpath=//select[@ng-model='chart_type']    content
    Sleep        4s
    Select From List    xpath=//select[@ng-model='chart_type']    time
    Sleep        4s
    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-charts/div[1]/div/a/button
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
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"wmsapi")]
    Sleep	5s
    Click Element    link = Thresholds
    Sleep	2s
    Click Element    link = Networks
    Sleep	2s
    Click Element    link = Memory
    Sleep	2s
    Click Element    link = Alarms
    Sleep	2s
    Click Element    link = Data Management
    Sleep	2s
    Click Element    link = Disk
    Sleep	2s
    Click Element    link = CPU
    Sleep	3s
    Mouse Over    partial link = ${mainmenu}
    Mouse Over    partial link = ${text}
    Click Element   xpath=//*[@ui-sref='settings']
    Sleep	2s
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
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Controller Graphs")]
    Sleep	5s
    Page Should Contain       Dashboard Information
    Page Should Contain       Controllers State
    Page Should Contain       Controller State
    Page Should Contain       anomaly
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
    Sleep	2s

    Click Element    xpath=//table/tbody/tr[3]/td[2]/a/span/span
    Sleep	5s
    Page Should Contain      Cluster Information
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Zones
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Data Management
    Sleep      3s
    Mouse Over        xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Events
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Client Sessions
    Sleep        4s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='controller']/i
    Sleep        2s
    Click Element   xpath=//*[@id='controller']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='zone']/i
    Sleep        2s
    Click Element   xpath=//*[@id='zone']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clevents']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s
    Click Element     xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep        2s

    Click Element    xpath=//table/tbody/tr[4]/td[2]/a/span
    Sleep	3s
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Zones
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Data Management
    Sleep      3s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Events
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Client Sessions
    Sleep        4s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='controller']/i
    Sleep        2s
    Click Element   xpath=//*[@id='controller']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='zone']/i
    Sleep        2s
    Click Element   xpath=//*[@id='zone']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clevents']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s
    Click Element     xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep        2s

    Click Element    xpath=//table/tbody/tr[5]/td[2]/a/span
    Sleep	3s
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Zones
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Data Management
    Sleep      3s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Events
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Client Sessions
    Sleep        4s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='controller']/i
    Sleep        2s
    Click Element   xpath=//*[@id='controller']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='zone']/i
    Sleep        2s
    Click Element   xpath=//*[@id='zone']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clevents']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s



Test List pageZN
    [Arguments]	 ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Element    xpath=//span[contains(text(),"Unknown")]
    Sleep	5s
    Click Element    link = Client Sessions
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Events
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s
    Click Element    xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep      2s

    Click Element    xpath=//span[contains(text(),"Home")]
    Sleep	5s
    Click Element    link = Client Sessions
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Events
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s
    Click Element    xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep      2s

    Click Element    xpath=//span[contains(text(),"Rob")]
    Sleep	5s
    Click Element    link = Client Sessions
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Events
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s
    Click Element    xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep      2s

    Click Element    xpath=//span[contains(text(),"SZ3.4 Zone1")]
    Sleep	5s
    Click Element    link = Client Sessions
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Click Element    link = Thresholds
    Sleep      3s
    Click Element    link = Events
    Sleep      3s
    Click Element    link = Alarms
    Sleep      3s
    Click Element    link = Access Points
    Sleep      3s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='znevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoints']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s


Test List paging
    [Arguments]	  ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        5s
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
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-charts/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s

    Click Element     xpath=//table[@class="table table-bordered ng-scope"]/tbody/tr[3]/td[2]/a/span
    Sleep        6s
    Click Element    xpath=//wms-tabs/ul/li[2]/a
    Sleep      3s
    Click Element    xpath=//wms-tabs/ul/li[3]/a
    Sleep      3s
    Click Element    link = Disk
    Sleep      3s
    Click Element    link = Patches
    Sleep      3s
    Click Element    link = Events
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = License
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Access Points
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Thresholds
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Memory
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Alarms
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = CPU
    Sleep        4s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='agents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='agents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='disk']/i
    Sleep        2s
    Click Element   xpath=//*[@id='disk']/i
    Sleep        2s
    Click Element   xpath=//*[@id='patches']/i
    Sleep        2s
    Click Element   xpath=//*[@id='patches']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cnevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cnevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='license']/i
    Sleep        2s
    Click Element   xpath=//*[@id='license']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='memory']/i
    Sleep        2s
    Click Element   xpath=//*[@id='memory']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cpu']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cpu']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s
    Click Element     xpath=//*[@id='temp']/div/section[1]/ol/li[2]/a
    Sleep        2s

    Click Element     xpath=//table[@class="table table-bordered ng-scope"]/tbody/tr[4]/td[2]/a/span
    Sleep        6s
    Click Element    xpath=//wms-tabs/ul/li[2]/a
    Sleep      3s
    Click Element    xpath=//wms-tabs/ul/li[3]/a
    Sleep      3s
    Click Element    link = Disk
    Sleep      3s
    Click Element    link = Patches
    Sleep      3s
    Click Element    link = Events
    Sleep      3s
    Click Element    link = Network
    Sleep      3s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = License
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Access Points
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Thresholds
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Memory
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = Alarms
    Sleep        4s
    Mouse Over       xpath=//a[@class="dropdown-toggle ng-binding"]
    Click Element    link = CPU
    Sleep        4s

    Click Element     xpath=//a[@class="lightview text-muted"]
    Sleep        3s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='clients']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='datalake']/i
    Sleep        2s
    Click Element   xpath=//*[@id='agents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='agents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='disk']/i
    Sleep        2s
    Click Element   xpath=//*[@id='disk']/i
    Sleep        2s
    Click Element   xpath=//*[@id='patches']/i
    Sleep        2s
    Click Element   xpath=//*[@id='patches']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cnevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cnevents']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='network']/i
    Sleep        2s
    Click Element   xpath=//*[@id='license']/i
    Sleep        2s
    Click Element   xpath=//*[@id='license']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='accesspoint']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alerts']/i
    Sleep        2s
    Click Element   xpath=//*[@id='memory']/i
    Sleep        2s
    Click Element   xpath=//*[@id='memory']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='alarms']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cpu']/i
    Sleep        2s
    Click Element   xpath=//*[@id='cpu']/i
    Sleep        2s
    Click Element     xpath=//div[@class="lv_button_top_close close_lightview lv_button_top_close_controls_type_relative"]
    Sleep        2s


Test List access
    [Arguments]	  ${mainmenu}	 ${submenu}    ${link}	 ${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        5s
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
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-charts/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s


Test List client
    [Arguments]	  ${mainmenu}	${submenu}    ${link}	${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
     Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        4s
    Click Button   Month
    Sleep        5s
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
    Click Element   xpath=//*[@id='temp']/div/section[2]/div[2]/div[2]/div/wms-charts/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s


Test List eventgraph
    [Arguments]   ${mainmenu}	 ${submenu}    ${link}	 ${text}
    Mouse Over    partial link = ${mainmenu}
    Click Element    link = ${submenu}
    Sleep	3s
    Page Should Contain    ${text}
    Input Text    xpath=//div[@class='box-header with-border']/span/input      ${Searchval}
    Sleep	2s
    Click Element   xpath=//div[@class='box-header with-border']/span/div/button[1]
    Sleep	2s
    Click Button   Today
    Sleep        4s
    Click Button   Week
    Sleep        5s

    Click Element   xpath=//*[@class='box-tools pull-right']/a/button
    Sleep        5s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        4s
    Click Element   xpath=//*[@id='temp']/div/section[2]/div/div[2]/div/wms-charts/div[1]/div/a/button
    Sleep        4s
    Click Element   xpath=//div[@class='lv_button_top_close close_lightview lv_button_top_close_controls_type_relative']
    Sleep        2s



Click search button

    Input Text    xpath=//div[@class='form-group has-feedback']/input        ${searchtext}
    Sleep        2s
    Press Key     xpath=//div[@class='form-group has-feedback']/input    \\13
    Sleep        4s





