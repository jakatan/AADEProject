Rails.application.routes.draw do

  resources :officer_pages

  resources :home_pages
  resources :contact_forms
  resources :companies
  resources :alumnis
  resources :officers
  resources :positions
  resources :people
  resources :schedules
  resources :admins
  root 'home_pages#index'
end

