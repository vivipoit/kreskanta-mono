# frozen_string_literal: true

require 'rails_helper'

describe 'user sees account info' do
  context 'when there are keys' do
    before do
      user = User.create(
        email: "#{SecureRandom.alphanumeric(4)}@email.com",
        password: 'difficult-to-guess',
        api_key: 'skeleton-key',
        api_secret_key: 'hidden-key'
      )

      sign_in user
      visit account_info_path
    end

    it 'includes title' do
      expect(page).to have_css('h2', text: 'Account Info')
    end

    it 'includes description' do
      expect(page).to have_css('p', text: 'Binance::Api::Account.info! => Get current account information.')
    end

    it 'includes permissions' do
      expect(page).to have_content('canTrade')
      expect(page).to have_content('canWithdraw')
      expect(page).to have_content('canDeposit')
    end

    it 'includes balances' do
      expect(page).to have_content('{:asset=>"BTC", :free=>"0.00000000", :locked=>"0.00000000"}')
      expect(page).to have_content('{:asset=>"USD", :free=>"0.0000", :locked=>"0.0000"}')
    end
  end

  context 'when there are no keys' do
    before do
      user = User.create(
        email: "#{SecureRandom.alphanumeric(4)}@email.com",
        password: 'difficult-to-guess'
      )

      sign_in user
      visit account_info_path
    end

    it 'includes warning' do
      expect(page).to have_content("Why you trying to get in places when you ain't got no keys?")
    end
  end
end
