# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cities
  resources :currencies
  resources :items, only: %i[show]
end
