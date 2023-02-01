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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
