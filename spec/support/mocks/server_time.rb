# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, 'https://api.binance.com/api/v3/time')
      .to_return(
        status: 200,
        body:
          {
            'serverTime' => 1499827319559
          }.to_json,
        headers: {}
      )
  end
end
