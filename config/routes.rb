Rails.application.routes.draw do
  resources :contact_forms
  resources :companies
  resources :alumnis
  resources :officers
  resources :positions
  resources :people
  resources :schedules
  root 'home_pages#index'
end
