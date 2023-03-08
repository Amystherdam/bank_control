Rails.application.routes.draw do
  resources :account_transactions, except: [:edit, :update, :destroy]
  devise_for :users
  resources :bank_accounts
  resources :bank_agencies
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "bank_agencies#index"
end
