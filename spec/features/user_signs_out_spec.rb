# frozen_string_literal: true

require 'rails_helper'

describe 'user signs out' do
  it 'goes to home' do
    user = User.create(email: 'this@email.com', password: 'difficult-to-guess')

    sign_in user
    visit root_path
    click_on 'Sair'

    expect(current_path).to eq(home_path)
    expect(page).not_to have_css('header.navbar')
  end
end
