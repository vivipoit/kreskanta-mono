# frozen_string_literal: true

class AccountsController < ApplicationController
  def index
    if current_user.keys?
      @info = BinanceClient.account_info(current_user)
    else
      redirect_to edit_user_path(current_user), alert: "Why you trying to get in places when you ain't got no keys?"
    end
  end
end
