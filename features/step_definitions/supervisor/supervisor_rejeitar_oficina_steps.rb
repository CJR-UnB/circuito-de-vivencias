# This is the steps file referred to supervisor_rejeitar_oficina feature
# Place your code relative to that feature here
Dado("que exista um usuario com os dados:") do |table|
    @array = []
    table.rows_hash.each do |field, value|
        @array << value
    end
    @user = User.create(name: @array[0], surname: @array[1], cpf: @array[2], email: @array[3], password: @array[4])
end

Dado("que ele tenha criado uma oficina com os dados:") do |table|
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

Entao("devo ser redirecionado para uma pagina de feedbacks") do
    workshop = Workshop.find_by(author_id: @user.id)
    assert_current_path(supervisorDashboard_write_feedback_path(id: workshop.id))
end

Dado("que eu esteja na pagina de vizualizacao de dessa oficina") do
    workshop = Workshop.find_by(author_id: @user.id)
    visit(workshop_path(id: workshop.id))
end

Dado("que eu esteja na pagina de escrita de feedback da rejeicao dessa oficina") do
    workshop = Workshop.find_by(author_id: @user.id)
    visit(supervisorDashboard_write_feedback_path(id: workshop.id))
end

Quando("eu preencher os campos do formulario como os dados:") do |table|
    table.rows_hash.each do |field, value|
        fill_in field, with: value
    end
end
