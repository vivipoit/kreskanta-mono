# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :rememberable

  encrypts :api_key, :api_secret_key

  enum account_base: { not_us: 0, us: 1 }

  def keys?
    api_key.present? && api_secret_key.present?
  end
end
