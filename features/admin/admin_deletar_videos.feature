#language: pt
#encoding: utf-8

Funcionalidade: admin_deletar_videos
  Como admin do sistema
  Para que eu possa deleatar um video que foi postado
  Eu quero poder deletar um video

  Cenario: deletar um video criado
    Dado que eu esteja cadastrado como um admin do sistema
    E que exista um video criado com os dados:
      |title |Como jogar Mancala                       |
      |url   |https://www.youtube.com/embed/zYiXGWqb3YY|
    E que eu esteja na pagina de gerenciamento de videos pelo admin
    Quando eu clicar no link "Remover"
    Entao devo ser reedirecionado para a pagina de gerenciamento videos
    E não devo ver o nome do video na pagina:
      |title|Como jogar Mancala|
