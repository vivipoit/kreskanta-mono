# frozen_string_literal: true

require 'rails_helper'

describe BinanceClient do
  describe '.request_time' do
    subject(:request_time) { described_class.new.request_time }

    it 'returns server time' do
      expect(request_time).to eq({ 'serverTime' => 1_499_827_319_559 })
    end
  end
end
