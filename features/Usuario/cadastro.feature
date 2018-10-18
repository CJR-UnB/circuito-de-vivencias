#language: pt
#encoding: utf-8

Funcionalidade: Cadastro
  Como Visitante do site não cadastrado
  Para que eu possa usurfruir das funcionalidades do sistema
  Eu quero poder me cadastrar no sistema

  Cenario: Ir para pagina de cadastro
   Dado que eu esteja na pagina inicial do sistema
    Quando eu clicar no link "Cadastrar-se"
    Entao devo ser redirecionado a uma pagina de cadastro

  Cenario: Preencher o formulario de cadastro corretamente e me cadastrar
    Dado que eu esteja na pagina de cadastro de novo usuario
    Quando eu preencher o formulario com os dados:
      |email                   |joao@email.com|
      |name                    |João Gabriel  |
      |surname                 |Lima Neves    |
      |cpf                     |06062549192   |
      |userPassword            |12345678      |
      |userPasswordConfirmation|12345678      |
    E clicar no botão "Cadastrar-se"
    Entao devo ser redirecionado para a pagina de login
    E ver a mensgem "cadastro realizado com sucesso na pagina" na pagina

