# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'friendship/index'
  get 'friendship/discover'
  get 'friendship/befriend'

  resources :profile, only: [:show, :edit, :update]

  root to: 'dashboard#index'
end
