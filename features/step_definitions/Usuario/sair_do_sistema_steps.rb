# frozen_string_literal: true

# This is the steps file referred to sair_do_sistema feature
# Place your code relative to that feature here
Entao('nao devo ver a mensagem de {string}') do |string|
  expect(page).to have_no_content(string)
end
