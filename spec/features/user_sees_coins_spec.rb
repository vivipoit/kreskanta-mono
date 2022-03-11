# frozen_string_literal: true

require 'rails_helper'

describe 'user sees coins' do
  before do
    user = User.create(
      email: 'this@email.com',
      password: 'difficult-to-guess',
      api_key: 'skeleton-key',
      api_secret_key: 'hidden-key'
    )
    Coin.create(
      own_symbol: 'BTC',
      usd_symbol: 'BTCUSD',
      name: 'Bitcoin'
    )
    Coin.create(
      own_symbol: 'ETH',
      usd_symbol: 'ETHUSD',
      name: 'Ethereum'
    )

    sign_in user
    visit user_root_path
    click_on 'Coins'
  end

  it 'includes title' do
    expect(page).to have_css('h2', text: 'Coins')
  end

  it 'includes description' do
    expect(page).to have_css('p', text: "Coins that have been created in this app's database.")
  end

  it 'includes coin information' do
    expect(page).to have_content('BTC BTCUSD Bitcoin')
    expect(page).to have_content('ETH ETHUSD Ethereum')
  end
end
