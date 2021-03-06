# frozen_string_literal: true

require 'rails_helper'

describe 'user sees coins' do
  before do
    create(
      :coin,
      own_symbol: 'BTC',
      usd_symbol: 'BTCUSD',
      name: 'Bitcoin'
    )
    create(
      :coin,
      own_symbol: 'ETH',
      usd_symbol: 'ETHUSD',
      name: 'Ethereum'
    )

    sign_in create(:user)
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
    expect(page).to have_content('BTC')
    expect(page).to have_content('Bitcoin')
    expect(page).to have_content('BTCUSD')
    expect(page).to have_link('Prices', href: coin_path(Coin.first))
  end
end
