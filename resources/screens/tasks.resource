*** Settings ***
Documentation        Elementos e ações da tela minhas tarefas

Library              AppiumLibrary

*** Variables ***
${nova_tarefa_input}              xpath=//*[contains(@text, "nova tarefa")]
${botao_criar_nova_tarefa}        xpath=//*[@resource-id="createTask"]


*** Keywords ***
Criar uma nova tarefa
    [Arguments]        ${nome_tarefa}

    Wait Until Element Is Visible                  ${nova_tarefa_input}     5

    Input Text       ${nova_tarefa_input}          ${nome_tarefa}
    Click Element    ${botao_criar_nova_tarefa}

Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible
    ...    xpath=//*[@resource-id="taskText"][@text="${task_name}"]
    ...    timeout=5
Remove task by name
    [Arguments]        ${task_name}

    Click Element    xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]

    ${button}    Set Variable    xpath=//android.widget.Button[@text="SIM"]

    Wait Until Element Is Visible    ${button}    5
    Click Element                    ${button}

Finish task
    [Arguments]    ${task_name}
    Click Element    xpath=//*[@text="${task_name}"]/..

Task should be done
    [Arguments]    ${task_name}
    Wait Until Element Is Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView