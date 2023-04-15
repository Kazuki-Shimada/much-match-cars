Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
  }
  devise_for :user,skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }

  namespace :admin do
    resources :reviews, only: [:index, :destroy, :show] do
      resources :comments, only: [:destroy]
    end
    resources :users, only: [:index, :show, :update]
    resources :manufacturers, only: [:index, :edit, :create, :destroy]
    resources :models, only: [:index, :edit, :create, :destroy]
    resources :types, only: [:new, :edit, :index, :create, :update, :destroy] do
      collection do
        get 'selected'
      end
    end
  end

  scope module: :public do
    get 'users/confirm' => 'users#confirm'
    patch 'users/withdrawal' => 'users#withdrawal'
    resources :reviews, only: [:new, :show, :create, :update, :destroy] do
      resource :goods, only: [:create, :destroy]
      resources :comments, only: [:create]
    end
    resources :users, only: [:show, :index, :edit, :update]
    resources :cars, only: [:new, :edit, :create, :update, :destroy]
    resources :models, only: [:show]
    resources :types, only: [:show] do
      collection do
        get 'selected'
      end
    end
    resources :manufacturers, only: [:show]
    get "search" => "searches#search"
    get 'homes/about'
    get 'homes/top'
  end


  root to: "public/homes#top"
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
