# frozen_string_literal: true

class ExchangeInfosController < ApplicationController
  def index
    @exchange_infos = BinanceClient.new.exchange_info
  end
end
