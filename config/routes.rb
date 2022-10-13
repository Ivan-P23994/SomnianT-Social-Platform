# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes
  resources :comments
  resources :posts
  devise_for :users

  get 'friendship/discover'
  get 'friendship/befriend'
  get 'friendship/befriend_discovered_user'
  get 'friendship/show'
  get 'friendship/request_response'

  post 'like_post/:id', to: 'posts#like', as: 'like_post'
  post 'like_comment/:id', to: 'comments#like', as: 'like_comment'

  resources :profile, only: [:show, :edit, :update]

  resources :search, only: :index

  root to: 'dashboard#index'
end
