# frozen_string_literal: true

require 'rails_helper'

describe 'user updates API keys' do
  it 'informs success' do
    user = create(:user)

    sign_in user
    visit user_root_path
    click_on user.email
    click_on 'Chaves'
    fill_in 'API Key', with: 'abc123'
    fill_in 'Secret Key', with: 'XYZ9'
    click_on 'Update User'

    expect(page).to have_css('div.alert-primary', text: 'Atualização realizada com sucesso!')
  end
end
