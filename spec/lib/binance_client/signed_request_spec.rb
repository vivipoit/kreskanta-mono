# frozen_string_literal: true

require 'rails_helper'

describe BinanceClient::SignedRequest do
  describe '.execute' do
    it 'makes signed request' do
      params = { key: 'value' }
      user = create(:user)

      response = described_class.execute(:get, '/some/api/signed_path', params, user)

      expect(response).to eq({ hurray: 'Success at a signed API path!' })
    end
  end
end
