# frozen_string_literal: true

require 'rails_helper'

describe 'user sees header' do
  it 'includes app name' do
    user = User.create(email: 'this@email.com', password: 'difficult-to-guess')

    sign_in user
    visit user_root_path

    expect(page).to have_css('a.navbar-brand', text: 'Kreskanta Mono')
  end
end
