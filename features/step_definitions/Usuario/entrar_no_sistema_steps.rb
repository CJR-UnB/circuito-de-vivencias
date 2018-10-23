# This is the steps file referred to entrar_no_sistema feature
# Place your code relative to that feature here
Entao("devo ser redirecionado para a pagina de login do sistema") do
    assert_current_path(new_user_session_path)
end

Dado("que eu esteja na pagina de login do sistema") do
    visit(new_user_session_path)
end

Dado("que eu esteja cadastrado com os seguintes dados:") do |table|
    visit(new_user_registration_path)
    table.rows_hash.each do |field,value|
        fill_in field, with: value
    end
    click_button("Cadastrar-se")
end

Dado("que eu nao esteja logado") do
    page.driver.delete("/users/sign_out")
end
