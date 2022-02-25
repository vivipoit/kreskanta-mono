# frozen_string_literal: true

require 'rails_helper'

describe 'person sees home' do
  before do
    visit home_path
  end

  it 'includes title' do
    expect(page).to have_css('h1.title', text: 'Kreskanta Mono')
  end

  it 'includes e-mail' do
    expect(page).to have_css('p.email', text: 'vwpoit@gmail.com')
  end
end
