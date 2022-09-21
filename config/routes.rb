# frozen_string_literal: true

Rails.application.routes.draw do
  get 'friendship/index'
  get 'friendship/discover'
  devise_for :users
  resources :profile, only: [:show, :edit, :update]

  root to: 'dashboard#index'
end
