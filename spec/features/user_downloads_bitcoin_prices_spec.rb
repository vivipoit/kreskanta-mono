# frozen_string_literal: true

require 'rails_helper'

describe 'user downloads bitcoin prices' do
  let(:csv) { CSV.parse(page.body).transpose }

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
    click_on 'CSV'
  end

  it 'includes headers' do
    expect(csv).to have_content('name')
    expect(csv).to have_content('price')
    expect(csv).to have_content('price_change')
    expect(csv).to have_content('change_percentage')
    expect(csv).to have_content('change_direction')
  end

  it 'includes price information' do
    expect(csv).to have_content('Bitcoin')
    expect(csv).to have_content('15.0')
    expect(csv).to have_content('5.0')
    expect(csv).to have_content('50.0')
    expect(csv).to have_content('up')
  end
end
