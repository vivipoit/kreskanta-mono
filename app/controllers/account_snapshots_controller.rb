# frozen_string_literal: true

class AccountSnapshotsController < ApplicationController
  def index
    @account_snapshot = BinanceClient.account_snapshot(current_user)
  end
end
