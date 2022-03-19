# frozen_string_literal: true

require 'rails_helper'

describe 'rake binance:create_prices' do
  before do
    coin = Coin.create(
      own_symbol: SecureRandom.alphanumeric(4),
      usd_symbol: 'BTCUSD',
      name: 'Bitcoin'
    )
    allow(Coin).to receive(:find_by).and_return(coin)

    ticker_response = { symbol: coin.own_symbol, price: '3.2' }
    allow(Binance::Api).to receive(:ticker!).and_return(ticker_response)
  end

  it 'grabs bitcoin' do
    task.execute

    expect(Coin).to have_received(:find_by).with(own_symbol: 'BTC')
  end

  it 'creates price records' do
    expect { task.execute }.to change(Price, :count).by(1)
  end
end
