# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, only: :sessions, controllers: { sessions: 'user/sessions' }

  authenticate :user do
    get 'exchange_infos', to: 'exchange_infos#index', as: :user_root
    get 'account_snapshots', to: 'account_snapshots#index'
    resources :users, only: %i[edit update]
    resources :coins, only: %i[index]

    get 'account_info', to: 'accounts#index'
  end

  root 'home#index'
end
