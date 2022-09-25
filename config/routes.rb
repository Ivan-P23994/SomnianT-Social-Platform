# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :posts
  devise_for :users

  get 'friendship/discover'
  get 'friendship/befriend'
  get 'friendship/show'
  get 'friendship/request_response'

  resources :profile, only: [:show, :edit, :update]

  root to: 'dashboard#index'
end
