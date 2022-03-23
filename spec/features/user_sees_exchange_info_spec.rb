# frozen_string_literal: true

require 'rails_helper'

describe 'user sees Bitcoin exchange info' do
  before do
    sign_in create(:user)
    visit user_root_path
  end

  it 'includes symbol name' do
    expect(page).to have_css('h3', text: 'BTCUSDT')
  end

  it 'includes status badge' do
    expect(page).to have_css('span.badge.bg-success', text: 'TRADING')
  end

  it 'includes assets' do
    expect(page).to have_content('BTC | USDT')
  end

  it 'includes order types' do
    expect(page).to have_content('Order Types')
    expect(page).to have_content('LIMIT')
    expect(page).to have_content('LIMIT_MAKER')
    expect(page).to have_content('MARKET')
  end

  it 'includes permissions' do
    expect(page).to have_content('Permissions')
    expect(page).to have_content('SPOT')
    expect(page).to have_content('MARGIN')
  end

  it 'includes filters' do
    expect(page).to have_content('Filters')
    expect(page).to have_content('PERCENT_PRICE')
    expect(page).to have_content('multiplierUp: 5')
    expect(page).to have_content('ICEBERG_PARTS')
    expect(page).to have_content('limit: 10')
  end

  it 'includes rate limits' do
    expect(page).to have_content('Rate Limits')
    expect(page).to have_content('REQUEST_WEIGHT')
    expect(page).to have_content('interval: MINUTE')
  end
end
