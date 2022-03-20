# frozen_string_literal: true

require 'rails_helper'

describe 'user signs out' do
  it 'goes to home' do
    sign_in create(:user)
    visit user_root_path
    click_on 'Sair'

    expect(page).to have_current_path(root_path, ignore_query: true)
    expect(page).not_to have_css('header.navbar')
  end
end
