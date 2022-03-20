# frozen_string_literal: true

WebMock.stub_request(:get, /https:\/\/api\.binance\.us\/sapi\/v1\/accountSnapshot\?signature=([A-Za-z0-9]{50,75})&timestamp=([0-9]{10,15})&type=SPOT/)
  .with(
    headers: { 'X-Mbx-Apikey' => 'skeleton-key-us' }
  )
  .to_return(
    status: 200,
    body: {
      code: 200,
      msg: 'something nice and sweet',
      snapshotVos: [
        {
          data: {
            balances: [
              {
                asset: 'BTC',
                free: '0.09905021',
                locked: '0.00000000'
              },
              {
                asset: 'USDT',
                free: '1.89109409',
                locked: '0.00000000'
              }
            ],
            totalAssetOfBtc: '0.09942700'
          },
          type: 'spot',
          updateTime: 1576281599000
        }
      ]
    }.to_json,
    headers: {}
  )
