# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :rememberable

  encrypts :api_key, :api_secret_key
end
