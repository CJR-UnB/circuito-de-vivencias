# This is the steps file referred to workshops feature
# Place your code relative to that feature here

Dado("exista uma oficina com os dados:") do |table|
  user = User.create(name: 'teste', surname: 'teste 2', cpf: '12345678901', email: 'foo@foo.com', password: '123456')
  visit(new_user_session_path)
  fill_in :email, with: 'foo@foo.com'
  fill_in :password, with: '123456'
  click_button("Entrar")
  visit(new_workshop_path)
  table.rows_hash.each do |field, value|
    if(field != 'document')
      if(field != 'categories')
        fill_in field, with: value
      else
        find('#' + field).select(value)
      end
    else
      attach_file(field, File.join(Rails.root, 'features', 'upload-files', 'valide_file.odt'))
    end
  end
  click_link_or_button("Salvar")
  visit(root_path)
  click_link_or_button("Sair")
end

Dado("eu estar na página inicial do sistema") do
  visit(root_path)
end

Quando("eu clicar no botão {string}") do |string|
  click_link(string)
end

Então("devo ver na tabela a oficina criada com os dados:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_content value
  end
end

Dado("que eu esteja na pagina de criacao de oficinas") do
  visit(new_workshop_path)
end

Quando("eu preencher os campos de oficinas com os dados:") do |table|
  table.rows_hash.each do |field, value|
    if(field != 'document')
      if(field != 'categories')
        fill_in field, with: value
      else
        find('#' + field).select(value)
      end
    else
      attach_file(field, File.join(Rails.root, 'features', 'upload-files', 'valide_file.odt'))
    end
  end
end

Então("devo ser redirecionado para a pagina index de oficinas") do
  assert_current_path(workshops_path)
end

Dado("ela tenha sido validada por um supervisor") do
  workshops = Workshop.all()
  workshops.each do |workshop|
    workshop.accept
    workshop.save
  end
end

Dado("ela nao tenha sido validada por um supervisor") do
  workshops = Workshop.all()
  workshops.each do |workshop|
    workshop.put_in_hold
    workshop.save
  end
end

Então("nao devo ver na tabela a oficina criada com os dados:") do |table|
  table.rows_hash.each do |field, value|
    expect(page).to have_no_content value
  end
end

Dado("que exista uma categoria com os dados:") do |table|
  categorie = Category.new
  table.rows_hash.each do |field, value|
    categorie[field] = value
  end
  categorie.save
end



