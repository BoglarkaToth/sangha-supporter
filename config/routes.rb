Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, controllers: { registrations: 'users/registrations'}
  get 'dashboard/index'
  resources :payments
  resources :buddhists

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'
  get 'monthly-income-data.json' => 'dashboard#monthly_income_data'
end
