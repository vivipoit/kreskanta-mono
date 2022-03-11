# frozen_string_literal: true

class Coin < ApplicationRecord
  validates :own_symbol, presence: true, uniqueness: true

  has_many :prices, dependent: :nullify
end
