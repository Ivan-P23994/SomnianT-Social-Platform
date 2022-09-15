# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :profile

  root to: 'home#index'
end
