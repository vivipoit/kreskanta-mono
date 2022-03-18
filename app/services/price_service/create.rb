# frozen_string_literal: true

module PriceService
  class Create
    def initialize(coin)
      @coin = coin
      @price = Price.new(coin:)
    end

    def execute
      price.price = fetch_binance_price

      fetch_previous_price
      handle_price_change_fields

      price.save
    end

    private

    attr_reader :coin, :price, :previous_price

    def fetch_binance_price
      Binance::Api.ticker!(type: :price, symbol: coin.usd_symbol).fetch(:price, 0).to_d
    end

    def fetch_previous_price
      @previous_price = (coin.prices.any? ? most_recent_price : Price.new).price
    end

    def most_recent_price
      coin.prices.order(created_at: :desc).first
    end

    def handle_price_change_fields
      price.price_change = price.price - previous_price

      return if previous_price.zero?

      price.change_percentage = change_percentage
      price.change_direction = change_direction
    end

    def change_percentage
      ((price.price_change / previous_price) * 100).abs
    end

    def change_direction
      price.price_change.positive? ? :up : :down
    end
  end
end
