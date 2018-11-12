# This is the steps file referred to dashboard_acess feature
# Place your code relative to that feature here

Dado("que eu seja um supervisor cadastrado no sistema com os dados:") do |table|
    @array = []
    table.rows_hash.each do |field, value|
        @array << value
    end
    user = User.create(name: @array[0], surname: @array[1], cpf: @array[2], email: @array[3], password: @array[4])
    user.turnIntoSupervisor()
    user.save()
end

Quando("eu preecher o formulario de login") do
    fill_in :email, with: @array[3]
    fill_in :password, with: @array[4]
end

Entao("devo ser redirecionado para a pagina inicial do sistema") do
    assert_current_path(root_path)
end

Entao("devo ver um botão {string} na pagina") do |string|
    find_link(string)
end

Dado("que eu esteja logado no sistema") do
    visit(new_user_session_path)
    fill_in :email, with: @array[3]
    fill_in :password, with: @array[4]
    click_button("Entrar")
end

Entao("devo ser redirecionado para pagina de dashboard do supervisor") do
    assert_current_path(supervisorDashboard_home_path)
end

Quando("eu tentar acessar a pagina de dashboard do supervisor") do
    visit(supervisorDashboard_home_path)
end

Dado("que eu seja um usuario cadastrado no sistema com os dados:") do |table|
    @array = []
    table.rows_hash.each do |field, value|
        @array << value
    end
    User.create(name: @array[0], surname: @array[1], cpf: @array[2], email: @array[3], password: @array[4])
end

