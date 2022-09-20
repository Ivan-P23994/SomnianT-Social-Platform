# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :profile, only: [:show, :edit, :update]

  root to: 'dashboard#index'
end
