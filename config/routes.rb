Rails.application.routes.draw do
  resources :contact_forms
  resources :companies
  resources :alumnis
  resources :officers
  resources :positions
  resources :people
  root 'officers#index'
  resources :schedules
  root 'schedules#index'

