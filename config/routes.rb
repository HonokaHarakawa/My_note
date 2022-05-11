Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users
  resources :incomes
  resources :spendings
  resources :genres
end
