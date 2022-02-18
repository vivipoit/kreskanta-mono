# frozen_string_literal: true

require 'rails_helper'

feature 'user sees exchange info' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_css('h1', text: 'Kreskanta Mono')

    within '#BNBBTC' do
      expect(page).to have_content('BNBBTC')
      expect(page).to have_content('TRADING')
      expect(page).to have_content('ETH')
      expect(page).to have_content('BTC')
      expect(page).to have_content('LIMIT')
      expect(page).to have_content('LIMIT_MAKER')
      expect(page).to have_content('MARKET')
      expect(page).to have_content('PRICE_FILTER')
      expect(page).to have_content('922327.00000000')
      expect(page).to have_content('SPOT')
      expect(page).to have_content('MARGIN')
    end
  end
end
