# frozen_string_literal: true

require 'rails_helper'

describe BinanceClient do
  describe '.server_time' do
    subject(:server_time) { described_class.new.server_time }

    it 'returns server time' do
      expect(server_time).to eq({ serverTime: 1_499_827_319_559 })
    end
  end

  describe '.exchange_info' do
    let(:expected_rules_and_symbols) do
      {
        timezone: 'UTC',
        serverTime: 1_645_116_438_405,
        rateLimits: [],
        exchangeFilters: [],
        symbols: []
      }
    end

    it 'returns all rules and symbols' do
      expected_rules_and_symbols[:symbols] = ['ALL THE SYMBOLS']

      rules_and_symbols = described_class.new.exchange_info

      expect(rules_and_symbols).to eq(expected_rules_and_symbols)
    end

    it 'returns specified symbol only' do
      expected_rules_and_symbols[:symbols] = ['SPECIFIED SYMBOLS']

      rules_and_symbols = described_class.new.exchange_info('BTCUSDT', 'VETBUSD')

      expect(rules_and_symbols).to eq(expected_rules_and_symbols)
    end
  end
end
