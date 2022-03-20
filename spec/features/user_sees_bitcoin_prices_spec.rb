# frozen_string_literal: true

require 'rails_helper'

describe 'user sees bitcoin prices' do
  before do
    coin = create(:coin, own_symbol: 'BTC')
    create(
      :price,
      coin:,
      price: 15.0000,
      price_change: 5.0,
      change_percentage: 50.0,
      change_direction: 'up'
    )

    sign_in create(:user)
    visit user_root_path
    click_on 'Prices'
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
    expect(page).to have_css('.fa-arrow-up')
  end
end
