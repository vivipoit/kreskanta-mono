# frozen_string_literal: true

require 'rails_helper'

describe 'user sees account snapshot' do
  context 'when there are keys' do
    before do
      user = User.create(
        email: "#{SecureRandom.alphanumeric(4)}@email.com",
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

    it 'includes status' do
      expect(page).to have_content('200')
    end

    it 'includes msg' do
      expect(page).to have_content('something nice and sweet')
    end

    it 'includes snapshotVos' do
      expect(page).to have_content('balances')
      expect(page).to have_content('{:asset=>"USDT", :free=>"1.89109409", :locked=>"0.00000000"}')
      expect(page).to have_content(':type=>"spot", :updateTime=>1576281599000')
    end
  end

  context 'when there are no keys' do
    before do
      user = User.create(
        email: "#{SecureRandom.alphanumeric(4)}@email.com",
        password: 'difficult-to-guess'
      )

      sign_in user
      visit account_snapshots_path
    end

    it 'includes warning' do
      expect(page).to have_content("Why you trying to get in places when you ain't got no keys?")
    end
  end
end
