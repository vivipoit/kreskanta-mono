# frozen_string_literal: true

WebMock.stub_request(:get, 'https://api.binance.com/some/api/path')
  .to_return(
    status: 200,
    body: {
      hurray: 'Success at some API path!'
    }.to_json,
    headers: {}
  )
