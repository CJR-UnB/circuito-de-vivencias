# This is the steps file referred to workshops feature
# Place your code relative to that feature here

Dado("exista uma oficina com os dados:") do |table|
  workshop = Workshop.new()
  user = User.create(name: 'teste', surname: 'teste 2', cpf: '12345678901', email: 'foo@foo.com', password: '123456')
  table.rows_hash.each do |field, value|
    workshop[field] = value
  end
  workshop.author_id = user.id
  workshop.editor_id = user.id
  workshop.save
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
