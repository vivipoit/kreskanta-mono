# frozen_string_literal: true

WebMock.stub_request(:any, 'https://api.binance.com')
  .to_return(
    status: 200,
    body: {}.to_json,
    headers: {}
  )
