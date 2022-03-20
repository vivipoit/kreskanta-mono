# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@email.com" }
    password         { 'difficult-to-guess' }
    api_key          { 'skeleton-key' }
    api_secret_key   { 'hidden-key' }

    trait :us do
      account_base   { 'us' }
      api_key        { 'skeleton-key-us' }
      api_secret_key { 'hidden-key-us' }
    end
  end
end
