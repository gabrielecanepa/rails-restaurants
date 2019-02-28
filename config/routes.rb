Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  # get 'restaurants', to: 'restaurants#index'
  # get 'restaurants/new', to: 'restaurants#new', as: 'new_restaurant'
  # get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'
  # post 'restaurants', to: 'restaurants#create'
  # get 'restaurants/:id/edit', to: 'restaurants#edit', as: 'edit_restaurant'
  # patch 'restaurants/:id', to: 'restaurants#update'
  # delete 'restaurants/:id', to: 'restaurants#destroy'
  resources :restaurants do
    resources :review

    # Referred to all the restaurants
    collection do
      get 'top'
    end

    # Referred to a specific restaurant
    member do
      get 'chef'
    end
  end

  namespace :admin do
    resources :restaurants, only: :index
  end
end
