# This is the steps file referred to usuario_ver_videos feature
# Place your code relative to that feature here
Entao("devo ser redirecionado para a pagina de videos do sistema") do
    assert_current_path(videos_path(page: 1))
end
