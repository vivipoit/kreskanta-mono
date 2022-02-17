# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, 'https://api.binance.com')
      .to_return(
        status: 200,
        body: {}.to_json,
        headers: {}
      )
  end
end
