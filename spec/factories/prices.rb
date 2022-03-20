# frozen_string_literal: true

FactoryBot.define do
  factory :price do
    coin
    price             { 15.0000 }
    price_change      { 5.0 }
    change_percentage { 50.0 }
    change_direction  { 'up' }
  end
end
