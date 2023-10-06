*** Settings ***
Documentation            Testes de login

Resource        ../resources/base.resource

Test Setup       Iniciar sessão
Test Teardown    Encerrar sessão

*** Test Cases ***
Deve logar com sucesso
    
    Fazer login
    Wait Until Page Contains    text=Minhas tarefas    timeout=5

