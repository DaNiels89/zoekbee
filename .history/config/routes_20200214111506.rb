# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/index'

  resources :users, only: [:show]
  resources :companies
  resources :posts do
    resources :comments
  end

  root 'home#index'
end
