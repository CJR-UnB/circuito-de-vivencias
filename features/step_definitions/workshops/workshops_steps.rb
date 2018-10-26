# This is the steps file referred to workshops feature
# Place your code relative to that feature here

Dado("que eu esteja logado no sistema como:") do
  visit(new_user_session_path)
  fill_in :email, with: 'joao@email.com'
  fill_in :password, with: '12345678'
  click_button('Entrar')
end

Dado("exista uma oficina com os dados:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable
  pending # Write code here that turns the phrase above into concrete actions
end

Dado("eu estar na página inicial do sistema") do
  pending # Write code here that turns the phrase above into concrete actions
end

Quando("eu clicar no botão {string}") do |string|
  pending # Write code here that turns the phrase above into concrete actions
end

Então("devo ver as oficinas criadas no sistema {string},{string},{string}") do |string, string2, string3|
  pending # Write code here that turns the phrase above into concrete actions
end
