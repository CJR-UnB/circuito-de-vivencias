#language: pt
#encoding: utf-8

Funcionalidade: supervisor_aprovar_oficina
  Como supervisor do sistema
  Para que eu possa permitir a visibilidade de oficinas no sistema
  Eu quero poder validar as ofiinas do sistema

  Cenario: Ver as oficinas ainda não validada
    Dado exista uma oficina com os dados:
      |title     |Teste 1    |
      |categories|Categoria 1|
      |resume    |Resumo 1   |
    E que eu seja um supervisor cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
    E que eu esteja logado no sistema
    E que eu esteja na pagina de dashboard de supervisor
    Quando clicar no link "Oficinas não validadas"
    Então devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|

  Cenario: Ir a pagina de Validação de uma oficina
    Dado Dado que eu seja um supervisor cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
    E E exista uma oficina com os dados:
      |title     |Teste 1    |
      |categories|Categoria 1|
      |resume    |Resumo 1   |
    E que eu esteja logado no sistema
    E que eu esteja na pagina de visualização das oficinas ainda não validadas
    Quando eu clicar no botão "Ver oficina"
    Entao devo se redirecionado para a pagina de visualização de oficina
    E devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|
    E devo ver um botão "Validar"
    E devo ver um botão "Recusar"
