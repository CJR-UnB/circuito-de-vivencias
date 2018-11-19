#language: pt
#encoding: utf-8

Funcionalidade: usuario_ver_videos
  Como usuario autenticado no sistema
  Para que eu ver como uma oficina funciona na pratica
  Eu quero ver videos de oficinas em pratica

  Cenario: acessar pagina de videos
    Dado que eu seja um usuario cadastrado no sistema:
      |name |Thiago|
      |surname |Barros|
      |cpf |12341234567|
      |email |thiago@hotmail.com|
      |password |12345678|
    E que eu esteja logado no sistema
    E que exista um video criado com os dados:
      |title |Como jogar Mancala                       |
      |url   |https://www.youtube.com/embed/zYiXGWqb3YY|
    E que eu esteja na pagina inicial do sistema
    Quando eu clicar no link "Ver mais videos"
    Entao devo ser redirecionado para a pagina de videos do sistema
    E devo ver na pagina o nome do video:
      |title|Como jogar Mancala|

