# frozen_string_literal: true

require 'rails_helper'

describe 'user sees account snapshot' do
  before do
    user = User.create(
      email: 'this@email.com',
      password: 'difficult-to-guess',
      api_key: 'skeleton-key',
      api_secret_key: 'hidden-key',
      account_base: 'us'
    )

    sign_in user
    visit account_snapshots_path
  end

  it 'includes title' do
    expect(page).to have_css('h2', text: 'Daily Account Snapshot')
  end

  it 'includes description' do
    expect(page).to have_css('p', text: 'described this stuff here')
  end

  it 'includes status' do
    expect(page).to have_content('200')
  end

  it 'includes msg' do
    expect(page).to have_content('something nice and sweet')
  end

  it 'includes snapshotVos' do
    expect(page).to have_content('balances')
    expect(page).to have_content('{:asset=>"BTC", :free=>"0.09905021", :locked=>"0.00000000"}')
    expect(page).to have_content('{:asset=>"USDT", :free=>"1.89109409", :locked=>"0.00000000"}')
    expect(page).to have_content(':type=>"spot", :updateTime=>1576281599000')
  end
end
