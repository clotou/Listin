Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'about', to: 'pages#about'
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :invites, only: [:new, :create]
    patch '/invites/:id', to: 'invites#accept', as: :invite
    resources :items, only: [:new, :create, :destroy]
  end
  resources :invites, only: [:index, :destroy]
  resources :items, only: [:index, :create, :edit, :update] do
      member do
        patch :as_done
        patch :not_done
      end
    end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

