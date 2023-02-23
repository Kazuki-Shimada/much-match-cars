Rails.application.routes.draw do

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
  }
  devise_for :user,skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    registrations: 'public/registrations'
  }

  namespace :admin do
    resources :reviews, only: [:index, :edit, :destroy]
    resources :users, only: [:index, :show, :update]
    resources :types, only: [:new, :edit, :index, :create, :update, :destroy] do
      collection do
        get 'selected'
      end
    end
    resources :manufacturers, only: [:index, :edit, :create, :destroy]
    resources :models, only: [:index, :edit, :create, :destroy]
  end

  scope module: :public do
    get 'users/confirm' => 'users#confirm'
    patch 'users/withdrawal' => 'users#withdrawal'
    resources :reviews, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :users, only: [:show, :index, :edit, :update]
    resources :cars, only: [:new, :show, :edit, :create, :update, :destroy]
    resources :goods, only: [:create, :destroy]
    get 'homes/about'
    get 'homes/top'
  end

  root to: "public/homes#top"
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
