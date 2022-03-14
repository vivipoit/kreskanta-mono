# frozen_string_literal: true

namespace :binance do
  task create_prices: :environment do
    Rails.logger.info '### price fetch task started ###'

    Coin.all.each do |coin|
      PriceService::Create.new(coin).execute
    end

    Rails.logger.info '### price fetch task completed ###'
  end
end
