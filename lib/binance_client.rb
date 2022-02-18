# frozen_string_literal: true

# Relevant docs:
# binance => https://binance-docs.github.io/apidocs/spot/en
# rest-client => https://github.com/rest-client/rest-client

require 'rest-client'

class BinanceClient
  def server_time
    make_request(:get, '/api/v3/time')
  end

  def exchange_info(*symbols)
    path = '/api/v3/exchangeInfo'
    path += "?symbols=#{symbols.to_json}" if symbols.any?


    make_request(:get, path)
  end

  private

  def make_request(request_method, path)
    response = RestClient::Request.execute(
      method: request_method,
      url: "#{base_endpoint}#{path}",
      timeout: 10,
      headers:
    )

    JSON.parse(response.body).deep_symbolize_keys
  rescue RestClient::ExceptionWithResponse => e
    Rails.logger.debug e.inspect
  end

  def base_endpoint
    'https://api.binance.com'
  end

  def headers
    {
      content_type: :json,
      accept: :json
    }
  end
end
