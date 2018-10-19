#language: pt
#encoding: utf-8

Funcionalidade: entrar_no_sistema
  Como usuario não autenticado
  Para que eu possa ter acesso as funções de usuarios do sistema
  Eu quero poder entrar no sistema

  Cenario: ir para tela de login
    Dado que eu esteja na pagina inicial do sistema
    Quando eu clicar no link "Entrar"
    Entao devo ser redirecionado para a pagina de login do sistema

  Cenario: preencher o formulario de login com uma conta cadastrada
    Dado que eu esteja cadastrado com os seguintes dados:
      |email                   |joao@email.com|
      |userPassword            |12345678      |
      |userPasswordConfirmation|12345678      |
      |cpf                     |06062549192   |
      |name                    |Joao          |
      |surname                 |Lima          |
    E que eu nao esteja logado
    E que eu esteja na pagina de login do sistema
    Quando eu preencher o formulario com os dados:
      |email   |joao@email.com|
      |password|12345678      |
    E clicar no botão "Entrar"
    Entao devo ser redirecionado para a pagina inicial
    E ver a mensgem "Seja Bem Vindo João" na pagina

  Cenario: preencher o formulario de login com uma conta nao cadastrada
    Dado que eu nao esteja logado
    E que eu esteja na pagina de login do sistema
    Quando eu preencher o formulario com os dados:
      |email   |joao@email.com|
      |password|12345678      |
    E clicar no botão "Entrar"
    Entao devo ser redirecionado para a pagina de login do sistema
    E ver a mensgem "email ou senha invalidos" na pagina