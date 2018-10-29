#language: pt
#encoding: utf-8

Funcionalidade: workshops
  Como usuario logado no sistema
  Para que eu possa criar uma oficina
  Eu quero acessar o formulario de criacao de oficinas

  Cenario: ver oficinas criadas
    Dado que eu esteja cadastrado como um admin do sistema
    E exista uma oficina com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
    E eu estar na página inicial do sistema
    Quando eu clicar no botão "Oficinas"
    Então devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|
