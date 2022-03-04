# frozen_string_literal: true

# Relevant docs:
# binance => https://binance-docs.github.io/apidocs/spot/en
# rest-client => https://github.com/rest-client/rest-client

require 'rest-client'

module BinanceClient
  class SignedRequest < Request
    class << self
      def execute(request_method, path, params, user)
        response = RestClient::Request.execute(
          method: request_method,
          url: signed_url(path, params, user),
          timeout: 10,
          headers: headers_with_key(user)
        )

        JSON.parse(response.body).deep_symbolize_keys
      rescue RestClient::ExceptionWithResponse => e
        Rails.logger.debug e.inspect
      end

      private

      def signed_url(path, params, user)
        query_strings = build_query_strings(params)
        signature = build_signature(user, query_strings)

        "#{base_endpoint}#{path}?#{query_strings}&signature=#{signature}"
      end

      def build_query_strings(params)
        params.merge!(timestamp: Time.now.utc.strftime('%s%3N'))

        params.map { |key, value| "#{key}=#{value}" }.join('&')
      end

      def build_signature(user, query_strings)
        OpenSSL::HMAC.hexdigest(
          OpenSSL::Digest.new('SHA256'),
          user.api_secret_key,
          query_strings
        )
      end

      def headers_with_key(user)
        headers.merge(
          'X-MBX-APIKEY' => user.api_key
        )
      end
    end
  end
end
