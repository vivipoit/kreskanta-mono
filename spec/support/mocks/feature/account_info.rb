# frozen_string_literal: true

WebMock.stub_request(:get, /https:\/\/api\.binance\.us\/api\/v3\/account\?signature=([A-Za-z0-9]{50,75})&timestamp=([0-9]{10,15})/)
  .with(
    headers: { 'X-Mbx-Apikey' => 'skeleton-key' }
  )
  .to_return(
    status: 200,
    body: {
      makerCommission: 10,
      takerCommission: 10,
      buyerCommission: 0,
      sellerCommission: 0,
      canTrade: true,
      canWithdraw: true,
      canDeposit: true,
      updateTime: 1641069819891,
      accountType: 'SPOT',
      balances: [
        {
          asset: 'BTC',
          free: '0.00000000',
          locked: '0.00000000'
        },
        {
          asset: 'ETH',
          free: '0.00000000',
          locked: '0.00000000'
        },
        {
          asset: 'USD',
          free: '0.0000',
          locked: '0.0000'
        },
        {
          asset: 'XRP',
          free: '0.00000000',
          locked: '0.00000000'
        }
      ],
      permissions: ['SPOT']
    }.to_json,
    headers: {}
  )
