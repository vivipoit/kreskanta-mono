# frozen_string_literal: true

WebMock.stub_request(:get, 'https://api.binance.com/api/v3/exchangeInfo')
  .to_return(
    status: 200,
    body:
    {
      timezone: 'UTC',
      serverTime: 1_645_116_438_405,
      rateLimits: [],
      exchangeFilters: [],
      symbols: [
        {
          symbol: 'BNBBTC',
          status: 'TRADING',
          baseAsset: 'ETH',
          quoteAsset: 'BTC',
          orderTypes: ['LIMIT', 'LIMIT_MAKER', 'MARKET'],
          filters: [
            {
              filterType: 'PRICE_FILTER',
              maxPrice: '922327.00000000',
            }
          ],
          permissions: ['SPOT', 'MARGIN']
        }
      ]
    }.to_json,
    headers: {}
  )
