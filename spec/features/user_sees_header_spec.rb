# frozen_string_literal: true

require 'rails_helper'

describe 'user sees header' do
  before do
    user = User.create(
      email: 'this@email.com',
      password: 'difficult-to-guess',
      api_key: 'skeleton-key',
      api_secret_key: 'hidden-key'
    )

    sign_in user
    visit user_root_path
  end

  it 'includes app name' do
    expect(page).to have_css('a.navbar-brand', text: 'Kreskanta Mono')
  end

  it 'includes links to pages' do
    expect(page).to have_link('Account Info', href: account_info_path)
    expect(page).to have_link('Exchange Infos', href: user_root_path)
    expect(page).to have_link('Account Snapshots', href: account_snapshots_path)
  end
end
