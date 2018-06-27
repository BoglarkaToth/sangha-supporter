Rails.application.routes.draw do

  resources :payments
  resources :users

  root :to => 'users#index'

  get  'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  get  'get_login_url', to: 'users#get_login_url'

  get 'current_user', to: 'users#get_current_user'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
