# frozen_string_literal: true

class Coin < ApplicationRecord
  validates :own_symbol, presence: true, uniqueness: true

  has_many :prices, -> { order(created_at: :desc) }, dependent: :nullify, inverse_of: :coin
end
