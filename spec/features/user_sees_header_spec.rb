# frozen_string_literal: true

require 'rails_helper'

describe 'user sees header' do
  before do
    sign_in create(:user)
    visit user_root_path
  end

  it 'includes app name' do
    expect(page).to have_css('a.navbar-brand', text: 'Kreskanta Mono')
  end

  it 'includes links to pages' do
    expect(page).to have_link('Account Info', href: account_info_path)
    expect(page).to have_link('Exchange Info', href: user_root_path)
    expect(page).to have_link('Account Snapshot', href: account_snapshots_path)
  end
end
