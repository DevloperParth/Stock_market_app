Rails.application.routes.draw do
  get 'currencies/buy'
  get 'currencies/sell'
  get 'profiles/index'
  get 'admins/index'
  get 'currencies/my_coins'
  devise_for :users
  # get 'homes/index'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'homes#index'
end
