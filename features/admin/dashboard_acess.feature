#language: pt
#encoding: utf-8

Funcionalidade: dashboard_acess
  Como Admin do sistema
  Para que eu gerenciar os usuarios e o cms do sistema
  Eu quero poder acessar o dasboard de Admin

  Cenario: tentar acessar o dashboard de admin estando logado como admin
    Dado que eu esteja cadastrado como um admin do sistema
    E que eu esteja na pagina inicial do sistema
    Quando eu clicar no link "Area de Admin"
    Entao devo estar na pagina de dashboard do admin

  Cenario: tentar acessar o dashboard de admin estando logado como um usuario comum
    Dado que eu esteja cadastrado com os seguintes dados:
      |email                   |joao@email.com|
      |userPassword            |12345678      |
      |userPasswordConfirmation|12345678      |
      |cpf                     |06062549192   |
      |name                    |João          |
      |surname                 |Lima          |
    E que eu esteja na pagina inicial do sistema
    Quando eu tentar acessar a pagina do dahboard do admin
    Entao devo ser redirecionado para a pagina inicial