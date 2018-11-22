# This is the steps file referred to admin_postar_videos feature
# Place your code relative to that feature here
Dado("que eu esteja na pagina de dashboard de admin do sistema") do
    visit(adminDashboard_home_path)
end

Entao("devo ser reedirecionado para a pagina de gerenciamento videos") do
    assert_current_path(adminDashboard_videos_path(page: 1))
end

Dado("que eu esteja na pagina de gerenciamento de videos pelo admin") do
    visit(adminDashboard_videos_path(page: 1))
end

Entao("devo ser reedirecionado para a pagina de postar videos") do
    assert_current_path(adminDashboard_post_video_path)
end

Dado("que eu esteja na pagina de postar um video") do
    visit(adminDashboard_post_video_path)
end

Entao("devo ver na pagina o nome do video:") do |table|
    table.rows_hash.each do |field, value|
        expect(page).to have_content value
    end
end

Entao("ver o video da url {string} na pagina") do |url|
    expect(page.find('iframe')['src']).to have_content url
end

