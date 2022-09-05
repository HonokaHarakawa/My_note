Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root "devise/sessions#new"
  end
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

end
