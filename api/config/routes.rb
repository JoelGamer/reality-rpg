Rails.application.routes.draw do
  resources :cities
  resources :currencies
  resources :items, only: %i[show]
end
