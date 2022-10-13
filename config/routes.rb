Rails.application.routes.draw do

  get 'top' => 'home#top'
  root 'home#top'
  devise_for :users
  resources :users do
    resources :genres, only: [:show] do
    end
  end

  resources :spendings do
    collection do
      get 'lastmonth'
      get 'graph'
    end
  end
  resources :posts do
    resource :likes, only: [:show, :create, :destroy]
    resource :comments, only: [:create]
  end
  resources :comments, only: [:destroy]
end
