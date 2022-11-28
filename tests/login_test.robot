*** Settings ***
Library        SeleniumLibrary
Library        OperatingSystem

Resource       ../resources/config.resource

Test Setup     Open Browser    url=${WORTEN_URL}  browser=${BROWSER}
Test Teardown  Close All Browsers    

*** Variables ***
${Utilizador}              arnaldo@dottteam.testinator.com
${idUtilizador}            username
${Password}                ArnaldoCT
${idPassword}              current-password
${nome}                    Arnaldo
${nomelast}                CT
${address}                 Rua Fernão de Magalhães
${codepost}                4400-360
${city}                    Vila Nova de Gaia
${phone}                   967673021
${fiscalNumber}            258856750
${ButtonIrLogin}           class:nav-a.w-menu-private
${ButtonLogin}             //button[text()='Iniciar Sessão']
${ButtonAcceptCookies}     class:w-button-primary
${inputProduto}            id:search-input
${textProduto}             computador
${linkWorten}              https://www.worten.pt/

*** Test Cases ***
Cenário 1: Login no site da worten
    [Tags]  login
    Wait Until Element Is Visible    //button[text() = 'Aceitar Tudo']
    Click Button  //button[text() = 'Aceitar Tudo']
    Wait Until Element Is Visible    linkText=INICIAR SESSÃO
    Click Link    INICIAR SESSÃO
    Sleep   5

Cenário 3: simulação de uma compra
    Pesquisar produto
    Confirmar compra

*** Keywords ***
Pesquisar por worten
    Input Text           ${inputGoogle}        ${inputGoogleText}    
    Click Element        ${ButtonPesquisar}

Aceitar Cookies
    Click Element        ${ButtonAcceptCookies}

Entrar no Login
    Click Element        ${ButtonIrLogin}

Prencher os campos
    Sleep    10s    
    Execute Javascript     document.getElementById('${idUtilizador}').value="${Utilizador}"
    Execute Javascript     document.getElementById('${idPassword}').value="${Password}"
    Sleep    2s

Logar
    Execute Javascript        document.evaluate("${ButtonLogin}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();

Pesquisar produto
    Input text           ${inputProduto}    ${textProduto}  
    Press Keys           ${inputProduto}    ENTER 
    Sleep    4s
    Execute Javascript        document.evaluate("(//a[@href])[45]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 
    Sleep    2s
    Execute Javascript        document.evaluate("(//button[@Class])[3]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 
    Sleep    5s
    Execute Javascript        document.evaluate("(//button[@Class])[5]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 
    Input text           ${inputProduto}    ${textProduto}  
    Press Keys           ${inputProduto}    ENTER     
    Sleep    4s
    Execute Javascript        document.evaluate("(//a[@href])[45]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 
    Sleep    2s
    Execute Javascript        document.evaluate("(//button[@Class])[3]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 
    Sleep    5s
    Execute Javascript        document.evaluate("(//button[@Class])[5]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 

Confirmar compra
    Sleep    2s            
    Execute Javascript        document.evaluate("(//a[@href])[3]", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click(); 
    Click Button              id:cart-continue-btn
    