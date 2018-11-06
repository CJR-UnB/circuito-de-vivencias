#language: pt
#encoding: utf-8

Funcionalidade: dashboard_acess
  Como supervisor do sistema
  Para que eu possa supervisionar as oficinas criadas
  Eu quero poder acessar uma pagina de gerenciamento de oficinas apenas para supervisores

   Cenario: logar no sistema como supervisor
    Dado que eu seja um supervisor cadastrado no siatema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
    E que eu esteja na pagina de login do sistema
    Quando eu preecher o formulario de login
    E clicar no botão "Entrar"
    Entao devo ser redirecionado para a pagina inicial do sistema
    E ver a mensagem "Joao" na pagina
    E ver botão "Area do Supervisor"

    Cenario: como supervisor do sistema logado acessar o dashboard de supervisor
     Dado que eu seja um supervisor cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
     E que eu esteja logado no sistema
     E que eu esteja na pagina inicial do sistema
     Quando eu clicar no link "Area do Supervisor"
     Entao devo ser redirecionado para pagina de dashboard do supervisor
     E ver a mensagem "Area do Supervisor" na pagina
     E ver a mensagem "Joao" na pagina

    Cenario: como usuario que não é supervisor nao devo ter acesso ao dashboard do supervisor
     Dado que eu seja um usuario cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
     E que eu esteja logado no sistema
     Quando eu tentar acessar a pagina de dashboard do supervisor
     Entao devo ser redirecionado para a pagina inicial do sistema

