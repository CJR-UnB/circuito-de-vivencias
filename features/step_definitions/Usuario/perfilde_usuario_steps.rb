# This is the steps file referred to perfilde_usuario feature
# Place your code relative to that feature here

Dado("que eu seja um usuario cadastrado no sistema:") do |table|
  @array = []
  table.rows_hash.each do |field, value|
    @array << value
  end
  User.create(name: @array[0],surname: @array[1], cpf: @array[2], email: @array[3], password: @array[4])
end

Dado("que eu esteja logado no sistema") do
  visit(new_user_session_path)
  fill_in :email, with: @array[3]
  fill_in :password, with: @array[4]
  click_button("Entrar")
end

Dado("esteja na pagina inicial do sistema") do
  visit(root_path)
end

Entao("eu devo ser redirecionado para a pagina de perfil") do
  assert_current_path(profile_path)
end

Entao("poderei ver meus dados") do
  expect(page).to have_content @array[0]
  expect(page).to have_content @array[1]
  expect(page).to have_content @array[2]
  expect(page).to have_content @array[3]
end
