# frozen_string_literal: true

class Coin < ApplicationRecord
  validates :own_symbol, presence: true, uniqueness: true

  has_many :prices, -> { order(created_at: :desc) }, dependent: :nullify, inverse_of: :coin

  def self.bitcoin
    where(own_symbol: 'BTC').first_or_create
  end
end
