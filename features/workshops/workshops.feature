#language: pt
#encoding: utf-8

Funcionalidade: workshops
  Como usuario logado no sistema
  Para que eu possa criar uma oficina
  Eu quero acessar o formulario de criacao de oficinas

  Cenario: ver oficinas criadas
    Dado que eu esteja cadastrado com os seguintes dados:
      |email                   |joao@email.com|
      |userPassword            |12345678      |
      |userPasswordConfirmation|12345678      |
      |cpf                     |06062549192   |
      |name                    |João          |
      |surname                 |Lima          |
    E que eu esteja logado no sistema como:
    E exista uma oficina com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
    E eu estar na página inicial do sistema
    Quando eu clicar no botão "Oficinas"
    Então devo ver as oficinas criadas no sistema "<title>","<categories>","<resume>"
