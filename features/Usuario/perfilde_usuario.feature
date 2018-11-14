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

  Cenario: ver quais oficinas foram rejeitadas
    Dado que eu seja um usuario cadastrado no sistema:
      |name |Thiago|
      |surname |Barros|
      |cpf |12341234567|
      |email |thiago@hotmail.com|
      |password |12345678|
    E que exista uma categoria com os dados:
      |name|Categoria 1|
    E que eu tenha criado uma oficina com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
      |document|Document1|
    E que eu esteja logado no sistema
    E ela tenha sido rejeitada com um feedback com os dados:
      |subject|oficina invalida          |
      |content|essa oficina esta invalida|
    E que eu esteja na minha pagina de perfil
    Quando eu clicar no link "Oficinas rejeitadas"
    Entao devo ser redirecionado a pagina de oficinas rejeitadas
    E devo ver na tabela a oficina criada com os dados:
      |title|Teste 1|

  Cenario: ver o feedback de uma oficina rejeitada
    Dado que eu seja um usuario cadastrado no sistema:
      |name |Thiago|
      |surname |Barros|
      |cpf |12341234567|
      |email |thiago@hotmail.com|
      |password |12345678|
    E que exista uma categoria com os dados:
      |name|Categoria 1|
    E que eu tenha criado uma oficina com os dados:
      |title|Teste 1|
      |categories|Categoria 1|
      |resume|Resumo 1|
      |document|Document1|
    E que eu esteja logado no sistema
    E ela tenha sido rejeitada com um feedback com os dados:
      |subject|oficina invalida          |
      |content|essa oficina esta invalida|
    E eu esteja na pagina de visualisacao de oficinas rejeitadas
    Quando eu clicar no link com o assunto do feedback
    Entao devo ser redirecionado para a pagina de visualisacao de feedback
    E devo ver o feedback na pagina com os dados:
      |subject|oficina invalida          |
      |content|essa oficina esta invalida|