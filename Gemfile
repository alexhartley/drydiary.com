source 'https://rubygems.org'
ruby '1.9.3'

gem 'rails', '4.0.0.rc1'

gem 'mongo'
gem 'bson_ext'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'devise', github: 'plataformatec/devise'
gem 'optional'
gem 'fendhal'

gem 'sass-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'
gem 'bootstrap-sass', '~> 2.3.2.0'
gem 'pagedown-bootstrap-rails'
gem 'redcarpet'

gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'newrelic_rpm'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'unicorn'

group :development do
  gem "letter_opener"
end

group :development, :test, :cucumber do
  gem 'rspec-rails'
  gem "cucumber-rails", "~> 1.3.0", require: false
  gem "database_cleaner", "~> 0.9.1"
  gem "launchy", "~> 2.1.2"
  gem "simplecov"
end

group :cucumber do
  gem "capybara-webkit"
end

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
