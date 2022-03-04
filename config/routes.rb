# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, only: :sessions, controllers: { sessions: 'user/sessions' }

  root 'exchange_infos#index'

  get 'home', to: 'home#index'

  resources :users, only: %i[edit update]
end
