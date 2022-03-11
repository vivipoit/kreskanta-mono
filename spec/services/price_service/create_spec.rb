# frozen_string_literal: true

require 'rails_helper'

describe PriceService::Create do
  describe '.execute' do
    subject(:create_price) { described_class.new(coin).execute }

    let(:coin) do
      Coin.create(
        own_symbol: SecureRandom.alphanumeric(4),
        usd_symbol: 'ETHUSD',
        name: 'Ethereum'
      )
    end
    let(:ticker_response) do
      { symbol: 'ETHUSD', price: '5.0000' }
    end

    before do
      allow(Binance::Api).to receive(:ticker!).and_return(ticker_response)
    end

    context 'when Coin has no prices' do
      it 'creates new Price record' do
        expect { create_price }.to change(Price, :count).by(1)
      end

      it 'uses given coin and default currency' do
        create_price

        expect(Price.last.coin).to eq(coin)
        expect(Price.last.currency).to eq('USD')
      end

      it 'fills all price details correctly' do
        create_price

        expect(Price.last.price).to eq(5.0)
        expect(Price.last.price_change).to eq(5.0)
        expect(Price.last.change_percentage).to eq(0)
        expect(Price.last.change_direction).to eq('unknown')
      end
    end

    context 'when Coin has previous price that is lower' do
      before do
        Price.create(
          coin:,
          price: 4.0000,
          price_change: 4.0,
          change_percentage: 0,
          change_direction: 'unknown'
        )
      end

      it 'creates new Price record' do
        expect { create_price }.to change(Price, :count).by(1)
      end

      it 'fills all price details correctly' do
        create_price

        expect(Price.last.price).to eq(5.0)
        expect(Price.last.price_change).to eq(1.0)
        expect(Price.last.change_percentage).to eq(25.00)
        expect(Price.last.change_direction).to eq('up')
      end
    end

    context 'when Coin has previous price that is higher' do
      before do
        Price.create(
          coin:,
          price: 15.0000,
          price_change: 15.0,
          change_percentage: 0,
          change_direction: 'unknown'
        )
      end

      it 'creates new Price record' do
        expect { create_price }.to change(Price, :count).by(1)
      end

      it 'fills all price details correctly' do
        create_price

        expect(Price.last.price).to eq(5.0)
        expect(Price.last.price_change).to eq(-10.0)
        expect(Price.last.change_percentage).to eq(66.67)
        expect(Price.last.change_direction).to eq('down')
      end
    end
  end
end
