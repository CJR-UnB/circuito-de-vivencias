# This is the steps file referred to cadastro feature
# Place your code relative to that feature here

Dado("que eu esteja na pagina inicial do sistema") do
    visit(root_path)
end

Quando("eu clicar no link {string}") do |string|
    click_link(string)
end

Entao("devo ser redirecionado para a pagina de cadastro") do
    assert_current_path(new_user_registration_path)
end

Dado("que eu esteja na pagina de cadastro de novo usuario") do
    visit(new_user_registration_path)
end

Quando("eu preencher o formulario com os dados:") do |table|
    table.rows_hash.each do |field,value|
        fill_in field, with: value
    end
end

Quando("clicar no botão {string}") do |string|
    click_button(string)
end

Entao("devo ser redirecionado para a pagina inicial") do
    assert_current_path(root_path)
end

Entao("ver a mensgem {string} na pagina") do |string|
    expect(page).to have_content string
end

