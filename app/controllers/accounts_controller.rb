# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    config_user_keys

    @info = Binance::Api::Account.info!
  end
end
