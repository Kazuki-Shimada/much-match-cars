Rails.application.routes.draw do

  devise_for :admins,skip: [:registrations, :passwords], controllers: {
    sessions:      'admin/sessions',
    passwords:     'admin/passwords'
  }
  devise_for :users,skip: [:passwords], controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }

  root to: "public/homes#top"

  namespace :admin do
    resources :reviews, only: [:index, :edit, :destroy]
    resources :users, only: [:index, :show]
    resources :types, only: [:new, :edit, :index, :create, :update, :destroy]
  end

  scope module: :public do
    resources :reviews, only: [:new, :index, :edit, :create, :update, :destroy]
    resources :users, only: [:show, :index, :edit]
    get 'homes/about'
    get 'homes/top'
  end


# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
