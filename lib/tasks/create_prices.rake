# frozen_string_literal: true

namespace :binance do
  task create_prices: :environment do
    Rails.logger.info '### price fetch task started ###'

    coin = Coin.find_by(own_symbol: 'BTC')
    PriceService::Create.new(coin).execute

    Rails.logger.info '### price fetch task completed ###'
  end
end
