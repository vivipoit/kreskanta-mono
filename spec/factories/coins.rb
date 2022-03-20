# frozen_string_literal: true

FactoryBot.define do
  factory :coin do
    sequence(:own_symbol) { |n| "BTC#{n}" }
    usd_symbol            { 'BTCUSD' }
    name                  { 'Bitcoin' }
  end
end
