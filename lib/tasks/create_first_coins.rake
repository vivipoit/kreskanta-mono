# frozen_string_literal: true

namespace :initial_setup do
  task create_first_coins: :environment do
    Rails.logger.info '### initial_setup:create_first_coins started ###'
    Rails.logger.info "Coin.count => #{Coin.count}"

    [
      { own_symbol: 'BTC', usd_symbol: 'BTCUSD', name: 'Bitcoin' },
      { own_symbol: 'ETH', usd_symbol: 'ETHUSD', name: 'Ethereum' },
      { own_symbol: 'BNB', usd_symbol: 'BNBUSD', name: 'BNB' },
      { own_symbol: 'ADA', usd_symbol: 'ADAUSD', name: 'Cardano' },
      { own_symbol: 'DOGE', usd_symbol: 'DOGEUSD', name: 'Dogecoin' },
      { own_symbol: 'LTC', usd_symbol: 'LTCUSD', name: 'Litecoin' },
      { own_symbol: 'ATOM', usd_symbol: 'ATOMUSD', name: 'Cosmos' },
      { own_symbol: 'BCH', usd_symbol: 'BCHUSD', name: 'Bitcoin Cash' },
      { own_symbol: 'LINK', usd_symbol: 'LINKUSD', name: 'ChainLink' },
      { own_symbol: 'USDT', usd_symbol: 'USDTUSD', name: 'Tether' },
      { own_symbol: 'BUSD', usd_symbol: 'BUSDUSD', name: 'BUSD' },
      { own_symbol: 'REP', usd_symbol: 'REPUSD', name: 'Augur' },
      { own_symbol: 'RVN', usd_symbol: 'RVNUSD', name: 'Ravencoin' },
      { own_symbol: 'ZRX', usd_symbol: 'ZRXUSD', name: 'Ox' },
      { own_symbol: 'ONT', usd_symbol: 'ONTUSD', name: 'Ontology' }
    ].each do |new_coin|
      Coin.create(new_coin)
    end

    Rails.logger.info '### initial_setup:create_first_coins finished ###'
    Rails.logger.info "Coin.count => #{Coin.count}"
  end
end
