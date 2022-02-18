# frozen_string_literal: true

require 'rails_helper'

describe 'user sees exchange info' do
  before do
    visit root_path
  end

  it 'includes symbol information' do
    within '#BNBBTC' do
      expect(page).to have_content('BNBBTC')
      expect(page).to have_content('TRADING')
      expect(page).to have_content('ETH')
      expect(page).to have_content('BTC')
    end
  end

  it 'includes symbol order types' do
    within '#BNBBTC' do
      expect(page).to have_content('LIMIT')
      expect(page).to have_content('LIMIT_MAKER')
      expect(page).to have_content('MARKET')
    end
  end

  it 'includes symbol filters' do
    within '#BNBBTC' do
      expect(page).to have_content('PRICE_FILTER')
      expect(page).to have_content('922327.00000000')
    end
  end

  it 'includes symbol permissions' do
    within '#BNBBTC' do
      expect(page).to have_content('SPOT')
      expect(page).to have_content('MARGIN')
    end
  end
end
