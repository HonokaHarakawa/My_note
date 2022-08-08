Rails.application.routes.draw do
  root 'top#index'
  devise_for :users
  resources :users
  resources :incomes
  resources :likes, only: [:index]
  resources :goals do
    resources :likes, only: [:create, :destroy]
  end

  resources :spendings do
    collection do
      get 'lastmonth'
    end
  end
  resources :genres

end
