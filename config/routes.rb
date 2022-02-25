# frozen_string_literal: true

Rails.application.routes.draw do
  root 'exchange_infos#index'

  get 'home', to: 'home#index'
end
