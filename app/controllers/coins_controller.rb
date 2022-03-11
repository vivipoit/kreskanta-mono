# frozen_string_literal: true

class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end
end
