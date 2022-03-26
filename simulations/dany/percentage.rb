# frozen_string_literal: true

initial_balance = 5000

usd_balance = initial_balance
btc_balance = 0

coin = Coin.find_by(own_symbol: 'BTC')
asc_prices = Price.where(coin:).order(created_at: :asc)
desc_prices = Price.where(coin:).order(created_at: :desc)

{ # rubocop:disable Metrics/BlockLength
  'asc_prices' => asc_prices,
  'desc_prices' => desc_prices,
  'asc_prices + desc_prices' => asc_prices + desc_prices,
  'desc_prices + asc_prices' => desc_prices + asc_prices
}.each do |name, prices|
  prices.each_with_index do |price, index|
    previous_price = (prices[index - 1].presence || Price.new).price

    percentage_in_decimal = price.change_percentage / 100.0

    if price.price > previous_price && usd_balance.positive?
      usd_spent = usd_balance * percentage_in_decimal
      usd_balance -= usd_spent

      btcs_bought = usd_spent / price.price
      btc_balance += btcs_bought
    end

    next unless price.price < previous_price && btc_balance.positive?

    btcs_sold = btc_balance * percentage_in_decimal
    btc_balance -= btcs_sold

    usd_received = btcs_sold * price.price
    usd_balance += usd_received
  end

  first_price = prices.first.price.round(6)
  last_price = prices.last.price.round(6)
  price_change = (last_price - first_price).round(6)
  change_percentage = ((price_change / first_price) * 100.0).round(6)

  btc_balance_in_usd = (btc_balance * last_price).round(6)

  total = (usd_balance + btc_balance_in_usd).round(6)
  change = (total - initial_balance).round(6)
  percentage = ((change / initial_balance) * 100.0).round(6)

  p "OUTCOME FOR #{name}"
  p "usd_balance => #{usd_balance.round(6)}"
  p "btc_balance => #{btc_balance.round(6)} (#{btc_balance_in_usd} USD)"
  p "INITIAL NETWORTH: #{initial_balance} USD"
  p "FINAL NETWORTH: #{total} USD"
  p "GAIN/LOSS: #{change} USD (#{percentage} %)"
  p "FIRST PRICE: #{first_price} USD"
  p "LAST PRICE: #{last_price} USD"
  p "PRICE CHANGE: #{price_change} USD (#{change_percentage} %)"
  p "| percentages | #{name} | #{usd_balance.round(6)}"\
    " | #{btc_balance.round(6)} <br/> (#{btc_balance_in_usd} USD)"\
    " | #{initial_balance} | #{total} | #{change}"\
    " | #{percentage} % | #{first_price} | #{last_price}"\
    " | #{price_change} | #{change_percentage} |"
end; nil
