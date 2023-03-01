Rails.application.routes.draw do
  get 'admins/index'
  devise_for :users
  # get 'homes/index'
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'homes#index'
end
