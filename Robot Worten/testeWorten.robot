* Settings *
Library  SeleniumLibrary
Library  OperatingSystem
* Variables *

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
${inputGoogle}             class:gLFyf
${inputGoogleText}         Worten
${ButtonPesquisar}         class:FPdoLc
${ButtonCookiesGoogle}     class:sy4vM
${linkGoogle}              https://www.google.pt/
${linkWorten}              https://www.worten.pt/

* Keywords *
Abrir Worten
    Open Browser         ${linkWorten}        chrome

Abrir google
    Open Browser         ${linkGoogle}        chrome
    Click Element        ${ButtonCookiesGoogle}
Pesquisar por worten
    Input Text           ${inputGoogle}        ${inputGoogleText}    
    Click Element        ${ButtonPesquisar}
Fechar Chrome
    Close Browser
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
    
* Test Cases *

Cenário 1: Acessando o site da worten
    Abrir Worten
    Fechar Chrome
Cenário 2: Entrar na worten e fazer login
    Abrir google
    Pesquisar por worten
    Aceitar Cookies
    Entrar no login
    Prencher os campos
    Logar
Cenário 3: simulação de uma compra
    Pesquisar produto
    Confirmar compra