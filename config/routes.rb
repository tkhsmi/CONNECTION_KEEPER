# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins, path: 'admin7bi170', controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  authenticated :user do
    root 'users/dashboard#index', as: :authenticated_root
  end

  unauthenticated do
    root 'top#index', as: :unauthenticated_root
  end

  namespace :admins do
    get 'dashboard/index', as: :dashboard
  end

  namespace :users do
    resources :tags, except: [:show]
  end
end
