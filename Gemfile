source 'https://rubygems.org'

ruby '2.1.2'

gem 'pg'
gem 'rack-timeout'
gem 'rails', '4.1.1'
gem 'recipient_interceptor'
gem 'uglifier'
gem 'unicorn'

gem 'oauth2'
gem 'force_leads', git: 'https://github.com/brodock/force-leads.git'

gem 'devise'

# view helpers
gem 'email_validator'
gem 'flutie'
gem 'simple_form'
gem 'title'

# assets
gem 'bourbon', '~> 3.2.1'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'neat', '~> 1.5.1'
gem 'sass-rails', '~> 4.0.3'

group :development do
  gem 'foreman'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'thin'
end

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.99'
  gem 'faker'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'simplecov'
end

group :test do
  gem 'capybara-webkit', '>= 1.0.0'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_12factor'
end
