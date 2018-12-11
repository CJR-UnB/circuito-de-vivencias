# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile += %w[vendor/fontawesome-free/css/all.min.css]
Rails.application.config.assets.precompile += %w[css/agency.min.css]
Rails.application.config.assets.precompile += %w( vendor/bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w[js/jqBootstrapValidation.js]
Rails.application.config.assets.precompile += %w[js/contact_me.js]
Rails.application.config.assets.precompile += %w[js/agency.min.js]
Rails.application.config.assets.precompile += %w[vendor/jquery-easing/jquery.easing.min.js]
Rails.application.config.assets.precompile += %w[login.scss]
Rails.application.config.assets.precompile += %w( *.jpg *.png)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# Precompile das imagens do template do admin
Rails.application.config.assets.precompile += %w[css/scrolling-nav.css]
Rails.application.config.assets.precompile += %w[https://www.criarenquete.com.br/user.js]
Rails.application.config.assets.precompile += %w[vendor/jquery/jquery.min.js]
Rails.application.config.assets.precompile += %w[js/scrolling-nav.js]
Rails.application.config.assets.precompile += %w( vendor/bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( vendor/bootstrap/js/bootstrap.bundle.min.js )