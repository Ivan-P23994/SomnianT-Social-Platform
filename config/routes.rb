# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users


  root to: 'home#index'
end
