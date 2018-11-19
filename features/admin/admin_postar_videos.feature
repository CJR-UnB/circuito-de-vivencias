#language: pt
#encoding: utf-8

Funcionalidade: admin_postar_videos
  Como admin do sistema
  Para que eu possa demonstrar aos usuarios do sistema as oficinas em pratica
  Eu quero poder postar videos com o youtube das oficinas

  Cenario: admin acessar a pagina de postagem
    Dado que eu esteja cadastrado como um admin do sistema
    E que eu esteja na pagina de dashboard de admin do sistema
    Quando eu clicar no link "Videos"
    Entao devo ser reedirecionado para a pagina de gerenciamento videos
  
  Cenario: admin acessar pagina de postar video
    Dado que eu esteja cadastrado como um admin do sistema
    E que eu esteja na pagina de gerenciamento de videos pelo admin
    Quando eu clicar no link "Postar video"
    Entao devo ser reedirecionado para a pagina de postar videos
  
  Cenario: admin postar um video
    Dado que eu esteja cadastrado como um admin do sistema
    E que eu esteja na pagina de postar um video
    Quando eu preencher os campos do formulario como os dados:
      |title |Como jogar Mancala                         |
      |url   |https://www.youtube.com/embed/zYiXGWqb3YY  |
    E clicar no botão "Postar"
    Entao devo ser reedirecionado para a pagina de gerenciamento videos
    E devo ver na pagina o nome do video:
      |title|Como jogar Mancala|