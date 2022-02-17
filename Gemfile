# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'importmap-rails'
gem 'jbuilder'
gem 'net-smtp', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
# gem 'rails', '~> 7.0.0'
gem 'bootsnap', require: false
gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rest-client'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 5'
  gem 'rubocop-rails', require: false
  gem 'simplecov', require: false
  gem 'webmock'
end

group :development do
  gem 'web-console'
end
