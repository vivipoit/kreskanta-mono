# frozen_string_literal: true

class ExchangeInfosController < ApplicationController
  def index
    @exchange_infos = BinanceClient.exchange_info
  end
end
