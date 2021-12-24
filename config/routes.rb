Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get '/users/sign_out' => 'users/sessions#destroy'
  end
  resources :home
  get 'homes/index'
  root to: 'home#index'
  resources :barang_keluars
  resources :barang_masuks
  resources :stoks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
