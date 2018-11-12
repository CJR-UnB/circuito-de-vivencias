#language: pt
#encoding: utf-8

Funcionalidade: supervisor_rejeitar_oficina
  Como supervisor do sistema
  Para que eu possa dar um feedback em oficinas rejeitadas
  Eu quero poder escrever uma mensagem para o usuario que criou a oficina quando ela for rejeitada

  Cenario: rejeitar uma oficina
    Dado que exista um usuario com os dados:
      |name    |Gabriel          |
      |surname |Neves            |
      |cpf     |11111111111      |
      |email   |gabriel@email.com|
      |password|12345678         |
    E que ele tenha criado uma oficina com os dados:
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
    E que eu esteja na pagina de vizualizacao de dessa oficina
    Quando eu clicar no link "Rejeitar"
    Entao devo ser redirecionado para uma pagina de feedbacks

  Cenario: enviar o feedback da oficina rejeitada
    Dado que exista um usuario com os dados:
      |name    |Gabriel          |
      |surname |Neves            |
      |cpf     |11111111111      |
      |email   |gabriel@email.com|
      |password|12345678         |
    E que ele tenha criado uma oficina com os dados:
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
    E que eu esteja na pagina de escrita de feedback da rejeicao dessa oficina
    Quando eu preencher os campos do formulario como os dados:
      |subject|oficina inadequada                              |
      |content|explicacao do porque que a oficina eh inadequada|
    E clicar no botão "Enviar"
    Entao devo ser redirecionado para a pagina de index de oficinas do supervisor
    E ver a mensagem "Rejeitado" na pagina
