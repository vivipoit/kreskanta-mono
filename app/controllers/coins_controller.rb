# frozen_string_literal: true

class CoinsController < ApplicationController
  def index
    @coins = Coin.all
  end

  def show
    @coin = Coin.includes(:prices).find(params[:id])
  end
end
