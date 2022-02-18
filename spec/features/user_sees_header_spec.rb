# frozen_string_literal: true

require 'rails_helper'

describe 'user sees header' do
  it 'includes app name' do
    visit root_path

    expect(page).to have_css('a.navbar-brand', text: 'Kreskanta Mono')
  end
end
