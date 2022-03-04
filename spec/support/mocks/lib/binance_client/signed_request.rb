# frozen_string_literal: true

WebMock.stub_request(:get, /https:\/\/api\.binance\.us\/some\/api\/signed_path\?key=value&signature=([A-Za-z0-9]{50,75})&timestamp=([0-9]{10,15})/)
  .with(
    headers: { 'X-Mbx-Apikey' => 'skeleton-key' }
  )
  .to_return(
    status: 200,
    body: {
      hurray: 'Success at a signed API path!'
    }.to_json,
    headers: {}
  )
