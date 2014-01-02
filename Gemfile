source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', "~> 4.0.2"

gem 'mongo'
gem 'bson_ext'
gem 'mongoid', github: 'mongoid/mongoid'
gem 'devise'
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
  gem "travis"
end

group :development, :test do
  gem 'rspec-rails'
  gem "cucumber-rails", "~> 1.3.0", require: false
  gem "database_cleaner", "~> 0.9.1"
  gem "launchy", "~> 2.1.2"
  gem "simplecov"
  gem "capybara-webkit"
end

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end
