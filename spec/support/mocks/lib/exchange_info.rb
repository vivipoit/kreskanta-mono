# frozen_string_literal: true

RSpec.configure do |config|
  config.before do
    stub_request(:get, 'https://api.binance.com/api/v3/exchangeInfo')
      .to_return(
        status: 200,
        body:
        {
          timezone: 'UTC',
          serverTime: 1_645_116_438_405,
          rateLimits: [],
          exchangeFilters: [],
          symbols: ['ALL THE SYMBOLS']
        }.to_json,
        headers: {}
      )
  end

  config.before do
    stub_request(:get, 'https://api.binance.com/api/v3/exchangeInfo?symbols=%5B%22BTCUSDT%22,%22VETBUSD%22%5D')
      .to_return(
        status: 200,
        body:
        {
          timezone: 'UTC',
          serverTime: 1_645_116_438_405,
          rateLimits: [],
          exchangeFilters: [],
          symbols: ['SPECIFIED SYMBOLS']
        }.to_json,
        headers: {}
      )
  end
end
