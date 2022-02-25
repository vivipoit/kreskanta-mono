# frozen_string_literal: true

require 'rails_helper'

describe 'person sees sign in form' do
  before do
    visit new_user_session_path
  end

  it 'includes title' do
    expect(page).to have_css('h2', text: 'Who is you?')
  end

  it 'includes e-mail field' do
    expect(page).to have_field('user_email')
  end

  it 'includes password field' do
    expect(page).to have_field('user_password')
  end

  it 'includes submit button' do
    expect(page).to have_button('Entrar')
  end
end
