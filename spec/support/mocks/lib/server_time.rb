# frozen_string_literal: true

WebMock.stub_request(:get, 'https://api.binance.com/api/v3/time')
  .to_return(
    status: 200,
    body: { serverTime: 1_499_827_319_559 }.to_json,
    headers: {}
  )
