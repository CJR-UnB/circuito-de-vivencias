#language: pt
#encoding: utf-8

Funcionalidade: sair_do_sistema
  Como usuario autenticado
  Para que eu possa sair da minha conta cadastrada no sistema
  Eu quero poder sair da minaha conta cadastrada no sistema

  Cenario: sair do sistema quando eu estiver logado
    Dado que eu esteja cadastrado com os seguintes dados:
      |email                   |joao@email.com|
      |userPassword            |12345678      |
      |userPasswordConfirmation|12345678      |
      |cpf                     |06062549192   |
      |name                    |João          |
      |surname                 |Lima          |
    E que eu esteja na pagina inicial do sistema
    Quando eu clicar no link "Sair"
    Entao devo ser redirecionado para a pagina inicial
    E nao devo ver a mensagem de "Seja Bem Vindo João"
