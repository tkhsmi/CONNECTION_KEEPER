# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

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
end
