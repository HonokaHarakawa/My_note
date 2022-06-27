Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users
  resources :incomes
  resources :spendings do
    collection do
      get 'everyone'
    end
  end
  resources :genres
  resources :goals
end
