# frozen_string_literal: true

class Price < ApplicationRecord
  belongs_to :coin

  enum change_direction: { unknown: 0, down: 1, up: 10 }
end
