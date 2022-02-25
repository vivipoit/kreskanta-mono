# frozen_string_literal: true

require 'rails_helper'

describe 'user signs in' do
  before do
    User.create(email: 'this@email.com', password: 'difficult-to-guess')

    visit new_user_session_path
  end

  it 'informs success' do
    fill_in 'E-mail', with: 'this@email.com'
    fill_in 'Senha', with: 'difficult-to-guess'
    click_on 'Entrar'

    expect(page).to have_css('header.navbar')
    expect(page).to have_css('div.alert-primary', text: "Yay, you're here!")
  end

  it 'informs issues' do
    fill_in 'E-mail', with: 'this@email.com'
    fill_in 'Senha', with: 'incorrect'
    click_on 'Entrar'

    expect(page).to have_css('p.text-danger', text: 'Invalid Email or password.')

    expect(page).not_to have_css('header.navbar')
  end
end
