Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root "devise/sessions#new"
  end
  resources :users do
    resources :genres, only: [:show]
  end

  resources :spendings do
    collection do
      get 'lastmonth'
    end
  end
  resources :posts

end
