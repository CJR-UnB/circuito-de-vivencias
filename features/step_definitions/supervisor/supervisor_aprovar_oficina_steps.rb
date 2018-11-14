# This is the steps file referred to supervisor_aprovar_oficina feature
# Place your code relative to that feature here

Dado("que eu esteja na pagina de dashboard de supervisor") do
    visit(supervisorDashboard_home_path)
end

Quando("clicar no link {string}") do |string|
    click_link(string)
end

Dado("que eu esteja na pagina de visualização das oficinas do supervisor") do
    visit(supervisorDashboard_unvalidated_workshops_path)
end

Entao("devo se redirecionado para a pagina de visualização de oficina") do
    user = User.find_by(name: 'teste')
    workshop = Workshop.find_by(author_id: user.id)
    assert_current_path(workshop_path(id: workshop.id))
end

Dado("Dado que eu seja um supervisor cadastrado no sistema com os dados:") do |table|
    @array = []
    table.rows_hash.each do |field, value|
        @array << value
    end
    user = User.create(name: @array[0], surname: @array[1], cpf: @array[2], email: @array[3], password: @array[4])
    user.turnIntoSupervisor()
    user.save()
end

Dado("que eu esteja na pagina da oficina criada {string}") do |string|
    workshop = Workshop.find_by(title: string)
    visit(workshop_path(id: workshop.id))
end

Entao("devo ser redirecionado para a pagina de index de oficinas do supervisor") do
    assert_current_path(supervisorDashboard_unvalidated_workshops_path)
end



