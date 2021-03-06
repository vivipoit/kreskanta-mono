# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'webmock/rspec'

require 'spec_helper'
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Dir[Rails.root.join('spec/support/config/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/methods/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/support/modules/**/*.rb')].each { |f| require f }
Dir[Rails.root.join('spec/factories/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.filter_rails_from_backtrace!

  config.include Devise::Test::IntegrationHelpers, type: :feature
  config.include TaskFormat, type: :task

  config.include FactoryBot::Syntax::Methods
end

Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}:3000"
Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
Capybara.server_port = 3000
