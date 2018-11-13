#language: pt
#encoding: utf-8

Funcionalidade: workshops
  Como usuario logado no sistema
  Para que eu possa criar uma oficina
  Eu quero acessar o formulario de criacao de oficinas


  Cenario: criar uma oficina
    Dado que eu esteja cadastrado como um admin do sistema
    E que eu esteja na pagina de criacao de oficinas
    Quando eu preencher os campos de oficinas com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
      |document|Document1|
    E clicar no botão "Salvar"
    Então devo ser redirecionado para a pagina index de oficinas
    E ver a mensagem "Workshop criado com sucesso!" na pagina

  Cenario: ver oficinas criadas e validadas por um supervisor
    Dado exista uma oficina com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
      |document|Document1|
    E que eu esteja cadastrado como um admin do sistema
    E ela tenha sido validada por um supervisor
    E eu estar na página inicial do sistema
    Quando eu clicar no botão "Ver mais oficinas"
    Então devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|

  Cenario: nao ver oficinas criadas e so que nao validadas por um supervisor
    Dado exista uma oficina com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
      |document|Document1|
    E que eu esteja cadastrado como um admin do sistema
    E ela nao tenha sido validada por um supervisor
    E eu estar na página inicial do sistema
    Quando eu clicar no botão "Oficinas"
    Então nao devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|
