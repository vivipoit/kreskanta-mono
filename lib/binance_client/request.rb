# frozen_string_literal: true

# Relevant docs:
# binance => https://binance-docs.github.io/apidocs/spot/en
# rest-client => https://github.com/rest-client/rest-client

require 'rest-client'

module BinanceClient
  class Request
    class << self
      def execute(request_method, path)
        response = RestClient::Request.execute(
          method: request_method,
          url: "#{base_endpoint}#{path}",
          timeout: 10,
          headers:
        )

        JSON.parse(response.body).deep_symbolize_keys
      rescue RestClient::ExceptionWithResponse => e
        Rails.logger.debug e.inspect

        {}
      end

      private

      def base_endpoint(user = User.new)
        tld = user.us? ? 'us' : 'com'

        "https://api.binance.#{tld}"
      end

      def headers
        {
          content_type: :json,
          accept: :json
        }
      end
    end
  end
end
