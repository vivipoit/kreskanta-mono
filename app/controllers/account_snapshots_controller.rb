# frozen_string_literal: true

class AccountSnapshotsController < ApplicationController
  def index
    if current_user.keys?
      @account_snapshot = BinanceClient.account_snapshot(current_user)
    else
      redirect_to edit_user_path(current_user), alert: "Why you trying to get in places when you ain't got no keys?"
    end
  end
end
