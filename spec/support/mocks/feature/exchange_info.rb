# frozen_string_literal: true

WebMock.stub_request(:get, 'https://api.binance.com/api/v3/exchangeInfo?symbols=%5B%22BTCUSDT%22%5D')
  .to_return(
    status: 200,
    body: {
      timezone: 'UTC',
      serverTime: 1_645_116_438_405,
      rateLimits: [
        {
          rateLimitType: 'REQUEST_WEIGHT',
          interval: 'MINUTE'
        }
      ],
      exchangeFilters: [],
      symbols: [
        {
          symbol: 'BTCUSDT',
          status: 'TRADING',
          baseAsset: 'BTC',
          quoteAsset: 'USDT',
          orderTypes: ['LIMIT', 'LIMIT_MAKER', 'MARKET'],
          filters: [
            {
              filterType: 'PERCENT_PRICE',
              multiplierUp: '5',
            },
            {
              filterType: 'ICEBERG_PARTS',
              limit: '10',
            }
          ],
          permissions: ['SPOT', 'MARGIN']
        }
      ]
    }.to_json,
    headers: {}
  )
