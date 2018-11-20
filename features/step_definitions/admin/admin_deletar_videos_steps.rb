# This is the steps file referred to admin_deletar_videos feature
# Place your code relative to that feature here

Dado("que exista um video criado com os dados:") do |table|
    @video = Video.new
    table.rows_hash.each do |field, value|
        @video[field] = value
    end
    @video.save
end

Entao("não devo ver o nome do video na pagina:") do |table|
    table.rows_hash.each do |field, value|
        expect(page).to have_no_content value
    end
end

