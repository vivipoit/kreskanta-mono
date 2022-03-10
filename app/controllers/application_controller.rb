# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  def config_user_keys
    Binance::Api::Configuration.api_key = current_user.api_key
    Binance::Api::Configuration.secret_key = current_user.api_secret_key
  end
end
