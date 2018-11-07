# This is the steps file referred to supervisor_aprovar_oficina feature
# Place your code relative to that feature here

Dado("que eu esteja na pagina de dashboard de supervisor") do
    visit(supervisorDashboard_home_path)
end

Quando("clicar no link {string}") do |string|
    click_link(string)
end

Dado("que eu esteja na pagina de visualização das oficinas ainda não validadas") do
    pending # Write code here that turns the phrase above into concrete actions
end

Entao("devo se redirecionado para a pagina de visualização de oficina") do
    pending # Write code here that turns the phrase above into concrete actions
end

Entao("devo ver os dados da oficina") do
    pending # Write code here that turns the phrase above into concrete actions
end

Entao("devo ver um botão {string}") do |string|
    pending # Write code here that turns the phrase above into concrete actions
end

