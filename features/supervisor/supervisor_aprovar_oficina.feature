#language: pt
#encoding: utf-8

Funcionalidade: supervisor_aprovar_oficina
  Como supervisor do sistema
  Para que eu possa permitir a visibilidade de oficinas no sistema
  Eu quero poder validar as ofiinas do sistema

  Cenario: Ver as oficinas ainda não validada
    Dado que exista uma categoria com os dados:
      |name|Categoria 1|
    E exista uma oficina com os dados:
      |title     |Teste 1    |
      |categories|Categoria 1|
      |resume    |Resumo 1   |
      |document  |Documento 1|
    E que eu seja um supervisor cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
    E que eu esteja logado no sistema
    E que eu esteja na pagina de dashboard de supervisor
    Quando clicar no link "Oficinas"
    Então devo ver na tabela a oficina criada com os dados:
      |title     |Teste 1    |

  Cenario: Ir a pagina de Validação de uma oficina
    Dado que eu seja um supervisor cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
    E que exista uma categoria com os dados:
      |name|Categoria 1|
    E exista uma oficina com os dados:
      |title     |Teste 1    |
      |categories|Categoria 1|
      |resume    |Resumo 1   |
      |document  |Documento 1|
    E que eu esteja logado no sistema
    E que eu esteja na pagina de visualização das oficinas do supervisor
    Quando eu clicar no botão "Ver oficina"
    Entao devo se redirecionado para a pagina de visualização de oficina
    E devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|
    E devo ver um botão "Aceitar" na pagina
    E devo ver um botão "Rejeitar" na pagina

  Cenario: Aprovar uma oficina
    Dado que eu seja um supervisor cadastrado no sistema com os dados:
      |name    |Joao          |
      |surname |Lima          |
      |cpf     |00000000000   |
      |email   |joao@email.com|
      |password|12345678      |
    E que exista uma categoria com os dados:
      |name|Categoria 1|
    E exista uma oficina com os dados:
      |title     |Teste 1    |
      |categories|Categoria 1|
      |resume    |Resumo 1   |
      |document  |Documento 1|
    E que eu esteja logado no sistema
    E que eu esteja na pagina da oficina criada "Teste 1"
    Quando eu clicar no link "Aceitar"
    Entao devo ser redirecionado para a pagina de index de oficinas do supervisor
    E ver a mensagem "Aceito" na pagina
