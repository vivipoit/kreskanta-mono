# frozen_string_literal: true

require 'rails_helper'

describe BinanceClient::Request do
  describe '.execute' do
    it 'makes simple request' do
      response = described_class.execute(:get, '/some/api/path')

      expect(response).to eq({ hurray: 'Success at some API path!' })
    end
  end
end
