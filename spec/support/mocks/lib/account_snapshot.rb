# frozen_string_literal: true

WebMock.stub_request(:get, /https:\/\/api\.binance\.us\/sapi\/v1\/accountSnapshot\?signature=([A-Za-z0-9]{50,75})&timestamp=([0-9]{10,15})&type=SPOT/)
  .with(
    headers: { 'X-Mbx-Apikey' => 'skeleton-key-us' }
  )
  .to_return(
    status: 200,
    body: {
      account: 'What a great US snapshop!'
    }.to_json,
    headers: {}
  )

WebMock.stub_request(:get, /https:\/\/api\.binance\.com\/sapi\/v1\/accountSnapshot\?signature=([A-Za-z0-9]{50,75})&timestamp=([0-9]{10,15})&type=SPOT/)
  .with(
    headers: { 'X-Mbx-Apikey' => 'skeleton-key' }
  )
  .to_return(
    status: 200,
    body: {
      account: 'What a great non-US snapshop!'
    }.to_json,
    headers: {}
  )
