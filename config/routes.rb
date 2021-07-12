Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :invites, only: [:new, :create]
    patch '/invites/:id', to: 'invites#accept', as: :invite
    resources :items, only: [:new, :create, :destroy]
  end
  patch '/items/:id', to: 'items#done', as: :done
  resources :invites, only: [:index, :destroy]
  resources :items, only: [:edit] do
    resources :status, only: [:new, :create]
    member do
      get :done
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
