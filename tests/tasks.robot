*** Settings ***
Documentation        Suite de testes do cadastro de tarefas

Resource             ../resources/base.resource

Test Setup           Iniciar sessão
Test Teardown        Encerrar sessão

*** Test Cases ***
Deve poder cadastrar uma nova tarefa

    ${task}    Set Variable    Estudar Python
    Remove task from database    ${task} 

    Fazer login
    Criar uma nova tarefa    ${task}
    Should have task         ${task}

Deve poder remover uma tarefa indesejada
    [Tags]    remove

    ${task}    Set Variable    Comprar refrigerante
    Remove task from database    ${task}

    Fazer login
    Criar uma nova tarefa    ${task}
    Should have task         ${task}

    Remove task by name                ${task}
    Wait Until Page Does Not Contain   ${task}

Deve poder concluir uma tarefa
    [Tags]    done

    ${task}    Set Variable    Estudar XPath
    Remove task from database    ${task}

    Fazer login
    Criar uma nova tarefa    ${task}
    Should have task         ${task}

    Finish task            ${task}
    Task should be done    ${task}
