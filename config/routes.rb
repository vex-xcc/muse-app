Rails.application.routes.draw do
  devise_for :users
  root to: 'artists#index'
  
  resources :artists, :songs
  get "bootstrap", to: "artists#bootstrap"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
