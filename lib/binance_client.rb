# frozen_string_literal: true

module BinanceClient
  class << self
    def server_time
      Request.execute(:get, '/api/v3/time')
    end

    def exchange_info(*symbols)
      path = '/api/v3/exchangeInfo'
      path += "?symbols=#{symbols.to_json}" if symbols.any?

      Request.execute(:get, path)
    end

    def account_snapshot(user)
      params = { type: 'SPOT' }

      SignedRequest.execute(:get, '/sapi/v1/accountSnapshot', params, user)
    end

    def account_info(user)
      SignedRequest.execute(:get, '/api/v3/account', {}, user)
    end
  end
end
