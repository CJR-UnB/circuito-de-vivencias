# This is the steps file referred to dashboard_acess feature
# Place your code relative to that feature here
Dado("que eu esteja cadastrado como um admin do sistema") do
    admin = User.create(name: 'Admin', surname: 'Admin', cpf: '00000000000', email: 'admin@email.com', password: '12345678')
    admin.turnIntoAdmin()
    admin.save
    visit(new_user_session_path)
    fill_in :email, with: admin.email
    fill_in :password, with: '12345678'
    click_button("Entrar")
end

Entao("devo estar na pagina de dashboard do admin") do
    assert_current_path(adminDashboard_home_path)
end

Quando("eu tentar acessar a pagina do dahboard do admin") do
   visit(adminDashboard_home_path)
end

