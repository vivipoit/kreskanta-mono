# frozen_string_literal: true

require 'rails_helper'

describe 'user sees coin prices' do
  before do
    user = User.create(
      email: 'this@email.com',
      password: 'difficult-to-guess',
      api_key: 'skeleton-key',
      api_secret_key: 'hidden-key'
    )
    coin = Coin.create(
      own_symbol: SecureRandom.alphanumeric(4),
      usd_symbol: 'BTCUSD',
      name: 'Bitcoin'
    )
    Price.create(
      coin:,
      price: 15.0000,
      price_change: 5.0,
      change_percentage: 50.0,
      change_direction: 'up'
    )

    sign_in user
    visit user_root_path
    click_on 'Coins'
    within "#col-#{coin.own_symbol}" do
      click_on 'Prices'
    end
  end

  it 'includes title' do
    expect(page).to have_css('h2', text: 'Prices')
  end

  it 'includes description' do
    expect(page).to have_css('p', text: 'Prices collected for Bitcoin')
  end

  it 'includes price information' do
    expect(page).to have_content('15.0')
    expect(page).to have_content('5.0')
    expect(page).to have_content('50.0%')
    expect(page).to have_content('up')
  end
end
