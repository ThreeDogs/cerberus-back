source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1'

gem 'devise'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'rabl'

gem 'carrierwave'
gem 'carrierwave_backgrounder'
# gem 'rmagick', '2.13.2'

# Query Customizing
gem 'activerecord-import'

# nested_form
gem 'nested_form'

# Background Worker
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim', '>= 1.3.0'
gem 'sidekiq-limit_fetch'

# Search
gem 'ransack'

# db
# gem 'mysql2'
gem 'sqlite3'
gem 'redis'

# server
gem 'thin'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :production do # heroku
	#gem 'pg'
	gem 'rails_12factor'
end

group :development, :test do
	gem 'rails-erd', github: 'paulwittmann/rails-erd', branch: 'mavericks'
	gem 'rspec-rails'
	gem 'factory_girl_rails', '~> 4.0'
	gem 'spork', '~>1.0rc'
	gem 'annotate', ">=2.6.0"
end

group :test do
	gem 'faker'
	gem 'capybara'
	gem 'launchy'
	gem 'guard-rspec'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn' 

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
