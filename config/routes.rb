# frozen_string_literal: true

Rails.application.routes.draw do
  get 'admins/index'
  get 'admins/show'
  get 'currencies/my_coins'
  get 'currencies/buy'
  get 'currencies/sell'
  get 'histories/index'
  get 'profiles/index'
  get 'wallets/index'
  get 'wallets/edit'
  post 'wallets/update', as: 'money_update'
  get 'admins/edit'
  post 'admins/update', as: 'price_update'
  devise_for :users
  # get 'homes/index'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'currencies#index'
end
