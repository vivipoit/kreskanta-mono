# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.order = :random

  config.before(:suite) do
    Rails.application.load_tasks
  end

  config.around(:each, :webmock_free) do |example|
    WebMock.disable!
    example.run
    WebMock.enable!
  end

  config.before do |example|
    load_mocks(example.metadata[:type])
  end
end
