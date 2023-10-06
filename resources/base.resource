
*** Settings ***
Documentation            Tudo deve comeãr neste arquivo

Library        AppiumLibrary
Library        libs/mongo.py

Resource        screens/login.resource
Resource        screens/tasks.resource

*** Keywords ***
Iniciar sessão
    Open Application    http://localhost:4723
    ...            automationName=uiautomator2
    ...            platformName=Android
    ...            deviceName=Emulator
    ...            udid=emulator-5554
    ...            autoGrantPermissions=true
    ...            app=${EXECDIR}/apps/markx.apk

    Wait Until Page Contains    text=Endereço IP da Api    timeout=10

Encerrar sessão
    Capture Page Screenshot
    Close Application
