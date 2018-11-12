# This is the steps file referred to perfilde_usuario feature
# Place your code relative to that feature here

Dado("que eu seja um usuario cadastrado no sistema:") do |table|
  @array = []
  table.rows_hash.each do |field, value|
    @array << value
  end
  User.create(name: @array[0],surname: @array[1], cpf: @array[2], email: @array[3], password: @array[4])
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

Dado("que eu tenha criado uma oficina com os dados:") do |table|
  visit(new_user_session_path)
  fill_in :email, with: @array[3]
  fill_in :password, with: @array[4]
  click_button("Entrar")
  visit(new_workshop_path)
  table.rows_hash.each do |field, value|
    if(field != 'document')
      fill_in field, with: value
    else
      attach_file(field, File.join(Rails.root, 'features', 'upload-files', 'valide_file.odt'))
    end
  end
  click_link_or_button("Salvar")
  visit(root_path)
  click_link_or_button("Sair")
end

Dado("ela tenha sido rejeitada com um feedback com os dados:") do |table|
  supervisor = User.create(name: "Supervisor", surname: "Supervisor", cpf: "11111111111", email: "supervisor@email.com", password: "12345678")
  supervisor.turnIntoSupervisor()
  supervisor.save
  @user = User.find_by(name: @array[0])
  @workshop = Workshop.find_by(author_id: @user.id)
  @workshop.reject
  @workshop.save
  feedback = Feedback.new
  table.rows_hash.each do |field, value|
    feedback[field] = value
  end
  feedback.supervisor = supervisor
  feedback.workshop = @workshop
  feedback.save
end

Dado("que eu esteja na minha pagina de perfil") do
  visit(profile_path)
end

Entao("devo ser redirecionado a pagina de oficinas rejeitadas") do
  assert_current_path(rejected_workshops_path(id: @user.id))
end

Dado("eu esteja na pagina de visualisacao de oficinas rejeitadas") do
  visit(rejected_workshops_path(id: @user.id))
end

Entao("devo ser redirecionado para a pagina de visualisacao de feedback") do
  assert_current_path(rejected_workshop_feedback_path(workshop_id: @workshop.id))
end

Entao("devo ver o feedback na pagina com os dados:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_content value
  end
end
