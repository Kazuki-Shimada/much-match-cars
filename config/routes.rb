Rails.application.routes.draw do

  namespace :public do

  end
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
  end

  scope module: :public do
    resources :reviews, only: [:new, :index, :edit, :create, :update, :destroy]
    get 'homes/about'
  end
  
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
