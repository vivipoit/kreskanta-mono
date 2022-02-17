# frozen_string_literal: true

require 'rails_helper'

describe BinanceClient do
  describe '.request_time' do
    subject { described_class.new.request_time }

    it 'should return server time' do
      expect(subject).to eq({ 'serverTime' => 1499827319559 })
    end
  end
end
