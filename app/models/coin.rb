class Coin < ApplicationRecord
  validates :own_symbol, presence: true, uniqueness: true
end
