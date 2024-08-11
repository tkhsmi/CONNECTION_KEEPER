# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

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
    root 'users/people#index', as: :authenticated_root
  end

  unauthenticated do
    root 'top#index', as: :unauthenticated_root
  end

  namespace :admins do
    get 'dashboard/index', as: :dashboard
  end

  namespace :users do
    resources :groups, except: [:show]
    resources :memos
    resources :people
    resources :tags, except: [:show]
  end
end
