# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    if current_user.keys?
      config_user_keys

      @info = Binance::Api::Account.info!
    else
      redirect_to edit_user_path(current_user), alert: "Why you trying to get in places when you ain't got no keys?"
    end
  end
end
