#language: pt
#encoding: utf-8

Funcionalidade: perfilde_usuario
  Como Usuario autenticado no sistema
  Para que eu possa ver minhas informações pessoais
  Eu quero poder acessar minha página de perfil

  Cenario: acessar pagina de perfil
    Dado que eu seja um usuario cadastrado no sistema:
      |name |Thiago|
      |surname |Barros|
      |cpf |12341234567|
      |email |thiago@hotmail.com|
      |password |12345678|
    E que eu esteja logado no sistema
    E esteja na pagina inicial do sistema
    Quando eu clicar no link "Perfil"
    Entao eu devo ser redirecionado para a pagina de perfil
    E poderei ver meus dados
