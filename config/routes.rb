Rails.application.routes.draw do
  get 'homes/index'
  root to: 'homes#index'
  resources :barang_keluars
  resources :barang_masuks
  resources :stoks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
